package com.example.tablet;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.Socket;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Set;
import com.msg.Msg;

public class MainActivity extends AppCompatActivity {
    TextView tx1, tx2, tx3, tx4, serverstat;

    int port;
    String address;
    String id;
    Socket socket;

    Sender sender;

    NotificationManager manager;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        tx1 = findViewById(R.id.textView);
        tx2 = findViewById(R.id.textView2);
        tx3 = findViewById(R.id.textView3);
        tx4 = findViewById(R.id.textView4);

        serverstat = findViewById(R.id.textView10);

        port = 5253;
        address = "172.30.1.27";
        id = "[Tablet]";
        new Thread(con).start();

    }



    // 앱 나갈 때
    @Override
    public void onBackPressed() {
        super.onBackPressed();
        try{
            Msg msg = new Msg(null, id, "q");
            sender.setMsg(msg);
            new Thread(sender).start();
            if(socket != null){
                socket.close();
            }
            finish();
            onDestroy();

        }catch (Exception e){

        }

    }

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

    private void connect() throws IOException {
        try {
            socket = new Socket(address, port);
        } catch (Exception e) {
            while(true) {
                try {
                    Thread.sleep(2000);
                    socket = new Socket(address, port);
                    break;
                } catch (Exception e1) {
                    serverstat.setText("OFF");
                    System.out.println("Retry ...");
                }
            }
        }
        System.out.println("Connected Server: " + address);
        sender = new Sender(socket);
        new Receiver(socket).start();
        serverstat.setText("ON");
        getInitial();
    }

    // 서버 접속 시, 접속했음을 클라이언트들에게 메시지 전송
    private void getInitial() {
        Msg msg = new Msg(null, id,"iamTablet");                                             // Hand Shake : iamTablet : Server>Server.java
        // Msg 객체의 msg 변수 선언 (메시지) ex: 님이 참가하셨습니다.
        sender.setMsg(msg);                                                                             // sender 쓰레드에 메시지 내용 저장
        new Thread(sender).start();                                                                     // 메시지 내용에 대해 sender 쓰레드 실행.

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

                            if(finalMsg.getMsg().equals("iamTablet")){
                                tx4.setText("OFF");
                            }else if(finalMsg.getMsg().equals("ledStart")){
                                tx4.setText("ON");
                            }else if(finalMsg.getMsg().equals("ledStop")){
                                tx4.setText("OFF");
                            }
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

    class Sender implements Runnable {
        Socket socket;
        ObjectOutputStream oo;
        Msg msg;

        public Sender (Socket socket) throws IOException {
            this.socket = socket;
            oo = new ObjectOutputStream(socket.getOutputStream());
        }
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
                    //e.printStackTrace();

                    try {
                        if(socket != null) {
                            socket.close();
                        }
                    }catch(Exception e1){
                        e1.printStackTrace();
                    }

                    try {
                        // 다시 서버와 연결 시도
                        System.out.println("Retry ...");
                        Thread.sleep(2000);
                        connect();
                    } catch (Exception e1) {
                        e1.printStackTrace();
                    }
                } // end try
            }
        }


    }
}