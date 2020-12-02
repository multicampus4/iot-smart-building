package com.example.sensorswitch;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.NotificationCompat;
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

import static com.example.sensorswitch.BuildConfig.*;

public class MainActivity extends AppCompatActivity {

    TextView tx_data;

    // 멤버 변수
    int port;                                                                                           // 포트
    String address;                                                                                     // IP 주소
    String id;                                                                                          // ID
    Socket socket;                                                                                      // 소켓
    Sender sender;                                                                                      // Sender 쓰레드

    NotificationManager manager;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        tx_data = findViewById(R.id.tx_data);

        // Topic 메시지 "aaa"라는 주제를 구독 및 구독 성공여부 확인하는 Task를 반환
        FirebaseMessaging.getInstance().subscribeToTopic("osh").
                addOnCompleteListener(new OnCompleteListener<Void>() {
                    @Override
                    public void onComplete(@NonNull Task<Void> task) {                                          // 성공했다면
                        String msg = "FCM Complete ...";                                                        // "FCM 성공"
                        if(! task.isSuccessful()){                                                              // 실패했다면
                            msg = "FCM Fail";                                                                   // "FCM 실패"
                        }
                        Log.d("[TAG]:", msg);
                    }
                });

        // notification 작동
        LocalBroadcastManager lbm = LocalBroadcastManager.getInstance(this);
        lbm.registerReceiver(receiver, new IntentFilter("notification"));
    }

    // FCM을 받아오는 Broadcast Receiver
    public BroadcastReceiver receiver = new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, Intent intent) {
            if(intent != null) {
                String title = intent.getStringExtra("title");
                String control = intent.getStringExtra("control");
                String data = intent.getStringExtra("data");
                Toast.makeText(MainActivity.this,
                        title + " " + control + " " + data, Toast.LENGTH_SHORT).show();
                tx_data.setText(title + " " + control + " " + data);                                    // 받아온 메시지를 tx_data에 출력
            }
        }
    };


    // 앱 나갈 때 (뒤로가기 버튼을 눌렀을 때 처리하는 버튼)
    @Override
    public void onBackPressed() {
        super.onBackPressed();
        try{
            Msg msg = new Msg(id, "etc", "byeAndroid");       // "byeAndroid" 라는 메시지를 담아
            sender.setMsg(msg);                               // 메시지 전송 :: 메시지 안 가는 듯 >> 수정필요
            new Thread(sender).start();                       // sender 쓰레드 시작
            if(socket != null){
                socket.close();                                                                         // 메시지 보내고 소켓 닫음
            }
            finish();                                                                                   // 액티비티 종료
//            onDestroy();                                                                              // 필요 없는 리소스 해제, 액티비티 참조 정리
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    // onCreate에서 실행했던 con 쓰레드: connect() 함수를 실행한다.
    Runnable con = new Runnable() {
        @Override
        public void run() {
            try {
                connect();                                                                              // 서버와 TCP/IP 연결
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    };

    // 서버와 연결하는 connect() 함수
    private void connect() throws IOException {
        try {
            socket = new Socket(address, port);                                                         // 소켓 생성(IP, 포트)
        } catch (Exception e) {                                                                         // 에러시
            while (true) {                                                                              // 무한 반복
                try {
                    Thread.sleep(2000);                                                           // 2초 뒤
                    socket = new Socket(address, port);                                                 // 소켓 재생성 시도
                    break;                                                                              // 연결되면 루프 종료
                } catch (Exception e1) {                                                                // 실패시
                    System.out.println("Retry ...");                                                    // "재시도 ..."
                }
            }                                                                                           // 루프 반복
        }
        // 연결 성공
        Log.d("[연결성공]","----------"+socket);
        System.out.println("Connected Server: " + address);                                             // "연결된 서버: 해당 IP"
        new Receiver(socket).start();                                                                   // Receiver 쓰레드 실행
        sender = new Sender(socket);                                                                    // sender 쓰레드 생성
        getList();                                                                                      // getList()
    }

    // 서버 접속 시, 접속했음을 클라이언트들에게 메시지 전송
    private void getList() {
        Log.d("[태그]","---------여기까지왔는가-----------");
        Msg msg = new Msg(id, "first","iamAndroid");                                             // Hand Shake : iamAndroid : Server>Server.java
        // Msg 객체의 msg 변수 선언 (메시지) ex: 님이 참가하셨습니다.
        sender.setMsg(msg);                                                                             // sender 쓰레드에 메시지 내용 저장
        new Thread(sender).start();                                                                     // 메시지 내용에 대해 sender 쓰레드 실행.

    }

    // 버튼 클릭시 "작동" 과 "중지" 메시지 전달.
    public void clickBt(View v){
        Msg msg = null;                                                                              // Msg 객체 초기화
        if(v.getId() == R.id.bt_start){                                                              // "Start" 버튼을 누르면
            msg = new Msg(id, "command","1_A_D_디바이스_액션");
            sender.setMsg(msg);
            new Thread(sender).start();
        }else if(v.getId() == R.id.bt_stop){                                                         // "Stop" 버튼을 누르면
            msg = new Msg(id, "command","1_A_D_디바이스_액션");
            sender.setMsg(msg);
            new Thread(sender).start();
        }else if(v.getId() == R.id.bt_conn){
            port = tcpipPort;       // git 로컬폴더의 my.properties 에 저장된 값 할당
            address = tcpipIp;
            id = "mobileApp";
            new Thread(con).start();
        }
        // sender 쓰레드 실행
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

        // new Thread(sender).start(); 코드에 작동
        @Override
        public void run() {
            if(oo != null) {
                try {
                    oo.writeObject(msg);                                                                // msg의 내용을 아웃풋스트림에 쓴다.
                } catch (IOException e) {
                    // 서버가 죽어 있을 때
                    // 더 이상의 메세지가 날라가지 않을 때 에러가 난다.
                    e.printStackTrace();

//                    try {
//                        if(socket != null) {
//                            socket.close();                                                           // 소켓 닫음
//
//                    }catch(Exception e1){
//                        e1.printStackTrace();
//                    }
//
//                    try {
//                        // 다시 서버와 연결 시도
//                        System.out.println("Retry ...");
//                        Thread.sleep(2000);
//                        connect();                                                                    // 연결 시도
//                    } catch (Exception e1) {
//                        e1.printStackTrace();
//                    }
                } // end try
            }
        }
    }

    // Receiver 쓰레드
    class Receiver extends Thread {
        ObjectInputStream oi;                                                                           // 인풋 스트림 객체 선언
        public Receiver(Socket socket) throws IOException {
            oi = new ObjectInputStream(socket.getInputStream());                                        // 소켓에서 인풋스트림을 가져와 oi에 대입
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
                            String tx = tx_data.getText().toString();                                   // 기존에 tx_data에 있는 내용을 tx에 넣고
                            tx_data.setText("[ID]" + finalMsg.getId()
                                    + " [TYPE]" + finalMsg.getType()
                                    + " [MSG]" + finalMsg.getMsg() +"\n"+tx);                           // 메시지를 보낸 ID와 메시지 내용을 담은 내용을 추가로 담는다
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