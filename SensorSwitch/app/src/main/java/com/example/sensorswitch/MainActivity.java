package com.example.sensorswitch;

import android.app.NotificationManager;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.localbroadcastmanager.content.LocalBroadcastManager;

import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.firebase.messaging.FirebaseMessaging;
import com.msg.Msg;


import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.Socket;
import java.util.HashMap;
import java.util.Set;

public class MainActivity extends AppCompatActivity {

    TextView tx_data;

    // 멤버 변수
    int port;           // 포트
    String address;     // IP 주소
    String id;          // ID
    Socket socket;      // 소켓
    Sender sender;      // Sender 쓰레드

    NotificationManager manager;        // 푸시알림 매니저
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        tx_data = findViewById(R.id.tx_data);

        // Topic 메시지 "aaa"라는 주제를 구독 및 구독 성공여부 확인하는 Task를 반환
        FirebaseMessaging.getInstance().subscribeToTopic("osh").addOnCompleteListener(new OnCompleteListener<Void>() {
            @Override
            public void onComplete(@NonNull Task<Void> task) {      // 성공했다면
                String msg = "FCM Complete ...";                    // "FCM 성공"
                if(! task.isSuccessful()){                          // 실패했다면
                    msg = "FCM Fail";                               // "FCM 실패"
                }
                Log.d("[TAG]:", msg);
            }
        });

        // 멤버변수에 값 선언
        port = 5253;
        address = "192.168.0.6";
        id = "[osh_switch]";


        // "con" 이라는 쓰레드 시작
        new Thread(con).start();
        LocalBroadcastManager lbm = LocalBroadcastManager.getInstance(this);
        lbm.registerReceiver(receiver, new IntentFilter("notification"));
    }

    public BroadcastReceiver receiver = new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, Intent intent) {
            if(intent != null) {
                String title = intent.getStringExtra("title");
                String control = intent.getStringExtra("control");
                String data = intent.getStringExtra("data");
                Toast.makeText(MainActivity.this,
                        title + " " + control + " " + data, Toast.LENGTH_SHORT).show();
                tx_data.setText(title + " " + control + " " + data);
            }
        }
    };

    // 앱 나갈 때 (뒤로가기 버튼을 눌렀을 때 처리하는 버튼)
    @Override
    public void onBackPressed() {
        super.onBackPressed();
        try{
            Msg msg = new Msg(null, id, "q");       // "q" 라는 메시지를 담아
            sender.setMsg(msg);                                                // 메시지 전송
            new Thread(sender).start();                       // sender 쓰레드 시작
            if(socket != null){
                socket.close();                               // 메시지 보내고 소켓 닫음
            }
            finish();                                         // 액티비티 종료
//            onDestroy();                                      // 필요 없는 리소스 해제, 액티비티 참조 정리
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    // onCreate에서 실행했던 con 쓰레드: connect() 함수를 실행한다.
    Runnable con = new Runnable() {

        @Override
        public void run() {
            try {
                connect();                                           // 서버와 TCP/IP 연결
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    };

    // 서버와 연결하는 connect() 함수
    private void connect() throws IOException {
        Log.d("[Tag]","----------------------------------------------------------");
        try {
            socket = new Socket(address, port);                     // 소켓 생성(IP, 포트)
        } catch (Exception e) {                                     // 에러시
            while (true) {                                          // 무한 반복
                try {
                    Thread.sleep(2000);                       // 2초 뒤
                    socket = new Socket(address, port);             // 소켓 재생성 시도
                    break;                                          // 연결되면 루프 종료
                } catch (Exception e1) {                            // 실패시
                    Log.d("[Fail]","------------Exception Fail-------------");
                    System.out.println("Retry ...");                // "재시도 ..."
                }
            }                                                       // 루프 반복
        }
        // 연결 성공
        Log.d("[연결성공]","----------"+socket);
        System.out.println("Connected Server: " + address);                 // "연결된 서버: 해당 IP"
        new Receiver(socket).start();
        sender = new Sender(socket);                                        // sender 쓰레드 생성
        getList();                                                          // getList()
    }
    // 서버 접속 시, 접속했음을 클라이언트들에게 메시지 전송
    private void getList() {
        Log.d("[태그]","---------여기까지왔는가-----------");
        Msg msg = new Msg(null, id,"iamAndroid");                  // Hand Shake : iamAndroid : Server>Server.java
                                                                            // Msg 객체의 msg 변수 선언 (메시지) ex: 님이 참가하셨습니다.
        sender.setMsg(msg);                                                  // sender 쓰레드에 메시지 내용 저장
        new Thread(sender).start();                                          // 메시지 내용에 대해 sender 쓰레드 실행.

    }
    public void clickBt(View v){
        Msg msg = null;
        if(v.getId() == R.id.bt_start){
            msg = new Msg(id,"tempStart");
        }else if(v.getId() == R.id.bt_stop){
            msg = new Msg(id,"tempStop");
        }
        sender.setMsg(msg);                                                 // sender 쓰레드에 메시지 내용 저장
        new Thread(sender).start();
    }

    // Sender 쓰레드
    class Sender implements Runnable {
        // 변수 선언
        Socket socket;              // 소켓
        ObjectOutputStream oo;      // 아웃풋스티림
        Msg msg;                    // 메시지

        // Sender에 소켓을 담은 생성자
        public Sender (Socket socket) throws IOException {
            Log.d("[sender]","----------------센더 도달--------------");
            this.socket = socket;                                       // 소켓
            oo = new ObjectOutputStream(socket.getOutputStream());      // 소켓에서 아웃풋스트림을 가져와 oo에 저장
        }

        // 메시지 내용을 저장
        public void setMsg(Msg msg) {
            this.msg = msg;
        }
        @Override
        public void run() {
            if(oo != null) {
                try {
                    oo.writeObject(msg);                                // msg의 내용을 아웃풋스트림에 쓴다.
                } catch (IOException e) {
                    // 서버가 죽어 있을 때
                    // 더 이상의 메세지가 날라가지 않을 때 에러가 난다.
                    //e.printStackTrace();

                    try {
                        if(socket != null) {
                            socket.close();                             // 소켓 닫음
                        }
                    }catch(Exception e1){
                        e1.printStackTrace();
                    }

                    try {
                        // 다시 서버와 연결 시도
                        System.out.println("Retry ...");
                        Thread.sleep(2000);
                        connect();                                      // 연결 시도
                    } catch (Exception e1) {
                        e1.printStackTrace();
                    }
                } // end try
            }
        }
    }

    class Receiver extends Thread {
        ObjectInputStream oi;
        public Receiver(Socket socket) throws IOException {
            oi = new ObjectInputStream(socket.getInputStream());
        }
        @Override
        public void run() {
            while(oi != null) {
                Msg msg = null;
                try {
                    msg = (Msg) oi.readObject();
                    Msg finalMsg = msg;
                    runOnUiThread(new Runnable() {
                        @Override
                        public void run() {
                            String tx = tx_data.getText().toString();
                            tx_data.setText("[ID]"+finalMsg.getId() + " [MSG]" + finalMsg.getMsg() +"\n"+tx);
                        }
                    });
                    System.out.println(msg.getId() + msg.getMsg());
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