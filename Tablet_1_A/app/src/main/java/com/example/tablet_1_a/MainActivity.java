package com.example.tablet_1_a;

import androidx.appcompat.app.AppCompatActivity;

import android.app.NotificationManager;
import android.graphics.Color;
import android.os.Bundle;
import android.util.Log;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.Socket;

import com.msg.Msg;

public class MainActivity extends AppCompatActivity {

    /* 1층 A구역 DEVICE */

    // 서버의 ON, OFF 상태
    TextView serverstat;

    // ON, OFF 배경색
    String onColor, offColor;

    // TCP/IP 연결 정보
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

        onColor = "#3ac47d";
        offColor = "#794c8a";

        serverstat = findViewById(R.id.textView10);

        port = 5253;
        address = "192.168.1.22";
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

                            // 1층 A구역의 센서 상태 처리
                            if(!finalMsg.getMsg().equals("iamTablet")){

                                // cmd : 들어오는 메세지, deviceId : 디바이스 이름, deviceStat : ON or OFF
                                String cmd = finalMsg.getMsg().trim();
                                String deviceId = cmd.substring(0,cmd.lastIndexOf("_"));
                                String deviceStat = cmd.substring(cmd.lastIndexOf("_") + 1);

                                try{
                                    // id 이름 앞에는 문자로 시작해야 하기 때문에 id 앞에 T와 L로 구분
                                    // T_ : ON/OFF를 표시하는 TextView, L : 각 디바이스의 LinearLayout
                                    // DEVICE들의 상태를 표시하는 TextView에 deviceStat를 반영
                                    int dT = getResources().getIdentifier("T_" + deviceId,"id", getPackageName());
                                    ((TextView)findViewById(dT)).setText(deviceStat);

                                    // DEVICE들의 상태를 따른 배경색을 각각의 LinearLayout에 반영
                                    int dL = getResources().getIdentifier("L_" + deviceId,"id", getPackageName());
                                    if(deviceStat.equals("ON")){
                                        ((LinearLayout)findViewById(dL)).setBackgroundColor(Color.parseColor(onColor));
                                    }else if(deviceStat.equals("OFF")){
                                        ((LinearLayout)findViewById(dL)).setBackgroundColor(Color.parseColor(offColor));
                                    }
                                }catch (Exception e){
                                    // 다른 층이나 구역의 DEVICE 신호가 들어올 때 에러
                                }
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