package com.example.sensorswitch;

import android.app.NotificationManager;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;
import android.util.Log;
import android.view.MenuItem;
import android.view.View;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.appcompat.app.ActionBar;
import androidx.appcompat.app.AppCompatActivity;
import androidx.fragment.app.FragmentManager;
import androidx.localbroadcastmanager.content.LocalBroadcastManager;

import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.android.material.bottomnavigation.BottomNavigationView;
import com.google.firebase.messaging.FirebaseMessaging;
import com.msg.Msg;


import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.Socket;

import static com.example.sensorswitch.BuildConfig.*;

public class MainActivity extends AppCompatActivity {
    BottomNavigationView bottomNavigationView;
    ActionBar actionBar;
    Fragment1 fragment1;
    Fragment2 fragment2;
    Fragment3 fragment3;
    FragmentManager fragmentManager;

    TextView tx_data;

    int port;
    String address;
    String id;
    Socket socket;
    MainActivity.Sender sender;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        actionBar = getSupportActionBar();
        actionBar.hide();

        fragment1 = new Fragment1();
//        fragment2 = new Fragment2(this);  // this : fragment에 현재 메인액티비티 전달
//        fragment3 = new Fragment3();

        fragmentManager = getSupportFragmentManager();
        fragmentManager.beginTransaction().replace(R.id.frameLayout, fragment1).commit();

        bottomNavigationView = findViewById(R.id.bottom_nav);
        bottomNavigationView.setOnNavigationItemSelectedListener(new BottomNavigationView.OnNavigationItemSelectedListener() {
            @Override
            public boolean onNavigationItemSelected(@NonNull MenuItem item) {
                switch(item.getItemId()) {
                    // fragment view가 전환될 때 새로 fragment를 생성하지 않고 이전의 fragment를 재사용함
                    // > 화면 전환 되어도 이전의 화면의 정보 유지 가능
                    // > 다른 화면에 있더라도 TCP/IP 리시버에서 수행하는 setText 누적 기록 가능
                    case R.id.tab1:
                        if(fragment1 == null) {
                            fragment1 = new Fragment1();
                            fragmentManager.beginTransaction().add(R.id.frameLayout, fragment1).commit();
                        }

                        if(fragment1 != null) fragmentManager.beginTransaction().show(fragment1).commit();
                        if(fragment2 != null) fragmentManager.beginTransaction().hide(fragment2).commit();
                        if(fragment3 != null) fragmentManager.beginTransaction().hide(fragment3).commit();

                        Toast.makeText(MainActivity.this, "tab1", Toast.LENGTH_SHORT).show();
                        return true;
                    case R.id.tab2:
                        if(fragment2 == null) {
                            fragment2 = new Fragment2();
                            fragmentManager.beginTransaction().add(R.id.frameLayout, fragment2).commit();
                        }

                        if(fragment1 != null) fragmentManager.beginTransaction().hide(fragment1).commit();
                        if(fragment2 != null) fragmentManager.beginTransaction().show(fragment2).commit();
                        if(fragment3 != null) fragmentManager.beginTransaction().hide(fragment3).commit();

                        Toast.makeText(MainActivity.this, "tab2", Toast.LENGTH_SHORT).show();
                        return true;
                    case R.id.tab3:
                        if(fragment3 == null) {
                            fragment3 = new Fragment3();
                            fragmentManager.beginTransaction().add(R.id.frameLayout, fragment3).commit();
                        }

                        if(fragment1 != null) fragmentManager.beginTransaction().hide(fragment1).commit();
                        if(fragment2 != null) fragmentManager.beginTransaction().hide(fragment2).commit();
                        if(fragment3 != null) fragmentManager.beginTransaction().show(fragment3).commit();

                        Toast.makeText(MainActivity.this, "tab3", Toast.LENGTH_SHORT).show();
                        return true;
                }
                return false;
            }
        });

        port = tcpipPort;       // git 로컬폴더의 my.properties 에 저장된 값 할당
        address = tcpipIp;      // BuildConfig.tcpipPort
        id = "mobileApp";
        new Thread(con).start();

        tx_data = findViewById(R.id.tx_data);
    }


    // onCreate에서 실행했던 con 쓰레드: connect() 함수를 실행한다.
    Runnable con = new Runnable() {
        @Override
        public void run() {
            try {
                connect();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    };

    // 서버와 연결하는 connect() 함수
    private void connect() throws IOException {
        try {
            socket = new Socket(address, port);
        } catch (Exception e) {
            while (true) {      // 연결 실패 시 2초 후 재시도
                try {
                    Thread.sleep(2000);
                    socket = new Socket(address, port);
                    break;
                } catch (Exception e1) {
                    System.out.println("Retry ...");
                }
            }
        }
        // 연결 성공
        Log.d("[연결성공]","----------"+socket);
        System.out.println("Connected Server: " + address);
        new MainActivity.Receiver(socket).start();      // Receiver 쓰레드 실행
        sender = new MainActivity.Sender(socket);   // sender 쓰레드 생성
        sayHello();
    }

    // 서버 최초 연결 시 Server에 first Type 메시지 전
    private void sayHello() {
        Log.d("[TAG]","---------최초 연결 성공시 Server에 메시지 전송-----------");
        Msg msg = new Msg(id, "first","iamAndroid");                                             // Hand Shake : iamAndroid : Server>Server.java
        // Msg 객체의 msg 변수 선언 (메시지) ex: 님이 참가하셨습니다.
        sender.setMsg(msg);                                                                             // sender 쓰레드에 메시지 내용 저장
        new Thread(sender).start();                                                                     // 메시지 내용에 대해 sender 쓰레드 실행.

    }

    // Sender 쓰레드
    class Sender implements Runnable {
        // 변수 선언
        Socket socket;                                                                                  // 소켓
        ObjectOutputStream oo;                                                                          // 아웃풋스티림
        Msg msg;                                                                                        // 메시지

        // Sender에 소켓을 담은 생성자
        public Sender (Socket socket) throws IOException {
            Log.d("[sender]","----------------센더 도달--------------");
            this.socket = socket;                                                                       // 소켓 삽입
            oo = new ObjectOutputStream(socket.getOutputStream());                                      // 소켓에서 아웃풋스트림을 가져와 oo에 저장
        }

        // 메시지 내용을 저장
        public void setMsg(Msg msg) {
            this.msg = msg;
        }

        @Override
        public void run() {
            if(oo != null) {
                try {
                    oo.writeObject(msg);
                } catch (IOException e) {
                    // 서버가 죽어 있을 때
                    // 더 이상의 메세지가 날라가지 않을 때 에러가 난다.
                    e.printStackTrace();
//                    try {
//                        if(socket != null) {
//                            socket.close();
//
//                    }catch(Exception e1){
//                        e1.printStackTrace();
//                    }
//
//                    try {
//                        // 다시 서버와 연결 시도
//                        System.out.println("Retry ...");
//                        Thread.sleep(2000);
//                        connect();
//                    } catch (Exception e1) {
//                        e1.printStackTrace();
//                    }
                } // end try
            }
        }
    }

    // Receiver 쓰레드
    class Receiver extends Thread {
        ObjectInputStream oi;
        public Receiver(Socket socket) throws IOException {
            oi = new ObjectInputStream(socket.getInputStream());
        }

        @Override
        public void run() {
            while(oi != null) {
                Msg msg = null;                                                                         // Msg 객체인 변수 msg 초기화
                try {
                    msg = (Msg) oi.readObject();                                                        // oi 안의 메시지 내용을 읽어서 msg에 대입
                    Msg finalMsg = msg;                                                                 // Msg 객체인 변수 finalMsg에 msg 대입
                    runOnUiThread(new Runnable() {
                        @Override
                        public void run() {
                            Log.d(String.valueOf(finalMsg), String.valueOf(finalMsg));
                            System.out.println(finalMsg);
                            if(fragment2 != null){
                                fragment2 = (Fragment2) fragmentManager.findFragmentById(R.id.frameLayout);
                                String tx = fragment2.getText();
                                fragment2.setText(finalMsg.toString() +"\n"+ tx);
                            }

//                            tx_data.setText("[ID]" + finalMsg.getId()
//                                    + " [TYPE]" + finalMsg.getType()
//                                    + " [MSG]" + finalMsg.getMsg() +"\n"+tx);                           // 메시지를 보낸 ID와 메시지 내용을 담은 내용을 추가로 담는다
                        }                                                                               // 우리 눈에는 데이터가 계속해서 추가되는 것으롭 보인다.
                    });
                    Log.d(msg.getId() + msg.getMsg()," 이 로그는 Receiver에서 실행되었습니다.");
                } catch(Exception e) {
                    //e.printStackTrace();
                    break;
                }
            } // end while
            try {
                if(oi != null) {
                    oi.close();
                }
                if(socket != null) {
                    socket.close();
                }
            } catch(Exception e) {
            }
        }
    }

}