package com.example.tablet_all;

import androidx.appcompat.app.ActionBar;
import androidx.appcompat.app.AppCompatActivity;
import androidx.constraintlayout.widget.ConstraintLayout;

import android.content.Context;
import android.graphics.Color;
import android.media.AudioManager;
import android.media.SoundPool;
import android.os.Build;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.WindowManager;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.msg.Msg;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.Socket;

import static com.example.tablet_all.BuildConfig.tcpipIp;
import static com.example.tablet_all.BuildConfig.tcpipPort;

public class MainActivity extends AppCompatActivity {
    ActionBar actionBar;
    ConstraintLayout container1;
    SoundPool soundPool;
    SoundManager soundManager;
    boolean play;
    int playSoundId;

    TextView serverstat;        // 서버의 ON, OFF 상태
    TextView areastat;          // 상태 표시할 구역
    String onColor = "#3ac47d",
            offColor = "#D5D5D5";   // ON, OFF 배경색
    String myArea;

    // TCP/IP 연결 정보
    int port;
    String address;
    String id;
    Socket socket;

    Sender sender;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN,
                WindowManager.LayoutParams.FLAG_FULLSCREEN);
        setContentView(R.layout.activity_main);
        container1 = findViewById(R.id.container1);
        actionBar = getSupportActionBar();
        actionBar.hide();

        // 롤리팝 이상 버전일 경우
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            soundPool = new SoundPool.Builder().setMaxStreams(8).build();
        } else {    // 롤리팝 이하
            soundPool = new SoundPool(8, AudioManager.STREAM_MUSIC, 0);
        }
        soundManager = new SoundManager(this, soundPool);
        soundManager.addSound(0, R.raw.turn_on);
        soundManager.addSound(1, R.raw.turn_off);

    }

    public void bt(View v) {
        switch (v.getId()) {
            case R.id.button1:
                myArea = "1_A";
                break;
            case R.id.button2:
                myArea = "2_A";
                break;
            case R.id.button3:
                myArea = "2_B";
                break;
        }

        container1.removeAllViews();
        LayoutInflater inflater = (LayoutInflater) getSystemService(Context.LAYOUT_INFLATER_SERVICE);
        inflater.inflate(R.layout.device_status, container1, true);
        serverstat = findViewById(R.id.textView10); // inflater 화면을 그린 후 findView 호출
        areastat = findViewById(R.id.textView12);

        port = tcpipPort;
        address = tcpipIp;
        id = "tablet_" + myArea;
        new Thread(con).start();
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
            while (true) {
                try {
                    Thread.sleep(2000);
                    socket = new Socket(address, port);
                    break;
                } catch (Exception e1) {
                    runOnUiThread(new Runnable() {
                        @Override
                        public void run() {
                            serverstat.setText("OFF");
                        }
                    });
                    System.out.println("Retry ...");
                }
            }
        }
        System.out.println("Connected Server: " + address);
        sender = new Sender(socket);
        new Receiver(socket).start();

        // 에러 수정 : Only the original thread that created a view hierarchy can touch its views
        // 문제 : 외부 Thread 에서 UI 변경 작업 시 에러 발생
        // 해결 : runOnUiThread로 UI Thread 호출하여 UI 변경
        runOnUiThread(new Runnable() {
            @Override
            public void run() {
                serverstat.setText("ON");
                areastat.setText(myArea);
            }
        });


        getInitial();
    }

    // 서버 접속 시, 접속했음을 클라이언트들에게 메시지 전송
    private void getInitial() {
        Msg msg = new Msg(id, "first", "First Conn. of Tablet_" + myArea);
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
            while (oi != null) {
                Msg msg = null;
                try {
                    msg = (Msg) oi.readObject();

                    Msg finalMsg = msg;
                    runOnUiThread(new Runnable() {
                        @Override
                        public void run() {

                            // 1층 A구역의 센서 상태 처리
//                            if (!finalMsg.getMsg().equals("iamTablet")) {
                            if (finalMsg.getType().equals("command")) {
                                System.out.println(finalMsg);

                                // cmd : 들어오는 메세지, deviceId : 디바이스 이름, deviceStat : ON or OFF
                                String cmd = finalMsg.getMsg().trim();
                                String deviceId = cmd.substring(0, cmd.lastIndexOf("_"));
                                String deviceStat = cmd.substring(cmd.lastIndexOf("_") + 1);

                                try {
                                    // id 이름 앞에는 문자로 시작해야 하기 때문에 id 앞에 T와 L로 구분
                                    // T_ : ON/OFF를 표시하는 TextView, L : 각 디바이스의 LinearLayout
                                    // DEVICE들의 상태를 표시하는 TextView에 deviceStat를 반영
                                    int dT = getResources().getIdentifier("T_" + deviceId, "id", getPackageName());
                                    ((TextView) findViewById(dT)).setText(deviceStat);

                                    // DEVICE들의 상태를 따른 배경색을 각각의 LinearLayout에 반영
                                    int dL = getResources().getIdentifier("L_" + deviceId, "id", getPackageName());
                                    if (deviceStat.equals("ON")) {
                                        ((LinearLayout) findViewById(dL)).setBackgroundColor(Color.parseColor(onColor));
                                        soundManager.playSound(0);
                                    } else if (deviceStat.equals("OFF")) {
                                        ((LinearLayout) findViewById(dL)).setBackgroundColor(Color.parseColor(offColor));
                                        soundManager.playSound(1);
                                    }
                                } catch (Exception e) {
                                    // 다른 층이나 구역의 DEVICE 신호가 들어올 때 에러
                                }
                            }

                        }
                    });
                    System.out.println(msg.getId() + msg.getMsg());
                } catch (Exception e) {
                    //e.printStackTrace();
                    break;
                }

            } // end while

            try {
                if (oi != null) {
                    oi.close();
                }
                if (socket != null) {
                    socket.close();
                }
            } catch (Exception e) {

            }
        }

    }

    class Sender implements Runnable {
        Socket socket;
        ObjectOutputStream oo;
        Msg msg;

        public Sender(Socket socket) throws IOException {
            this.socket = socket;
            oo = new ObjectOutputStream(socket.getOutputStream());
        }

        public void setMsg(Msg msg) {
            this.msg = msg;
        }

        @Override
        public void run() {
            if (oo != null) {
                try {
                    oo.writeObject(msg);
                } catch (IOException e) {
                    // 서버가 죽어 있을 때
                    // 더 이상의 메세지가 날라가지 않을 때 에러가 난다.
                    //e.printStackTrace();

                    try {
                        if (socket != null) {
                            socket.close();
                        }
                    } catch (Exception e1) {
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

