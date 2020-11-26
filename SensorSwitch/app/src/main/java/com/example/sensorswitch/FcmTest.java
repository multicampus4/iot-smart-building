package com.example.sensorswitch;

import android.annotation.SuppressLint;
import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.os.PowerManager;
import android.util.Log;

import androidx.annotation.NonNull;
import androidx.core.app.NotificationCompat;
import androidx.localbroadcastmanager.content.LocalBroadcastManager;

import com.google.firebase.messaging.FirebaseMessagingService;
import com.google.firebase.messaging.RemoteMessage;

public class FcmTest extends FirebaseMessagingService {
    NotificationManager manager;
    NotificationCompat.Builder builder;
    private static String CHANNEL_ID = "channel1";
    private static String CHANEL_NAME = "ChName";

    String title, control, data, body;
    public FcmTest() {
    }

    @Override
    public void onMessageReceived(@NonNull RemoteMessage remoteMessage) {
        title = remoteMessage.getNotification().getTitle();              // "센서 작동"
        control = remoteMessage.getData().get("control");                // "control1"
        data = remoteMessage.getData().get("data");                      // 100
        body = remoteMessage.getData().get("body");                      // "센서가 작동되었습니다."


        Log.d("[TAG]:",title + " " + control  + " " + data);          // "센서작동 control1 100"
        showNoti();
        // MainActivity에 데이터 전송
        Intent intent = new Intent("notification");                 // MainActivity에서 설정해 두었던 "notification" 인텐트와
        intent.putExtra("title", title);                            // 보내고 싶은 데이터들을
        intent.putExtra("control", control);
        intent.putExtra("data", data);
        intent.putExtra("body", body);
        LocalBroadcastManager.getInstance(this).sendBroadcast(intent);    // 보낸다.
    }
    public void showNoti(){
        builder = null;
        manager =(NotificationManager) getSystemService(NOTIFICATION_SERVICE);
        //버전이 오레오 이상일 경우
        if(Build.VERSION.SDK_INT >= Build.VERSION_CODES.O){
            manager.createNotificationChannel(
                    new NotificationChannel(CHANNEL_ID,CHANEL_NAME,NotificationManager.IMPORTANCE_HIGH));
            builder = new NotificationCompat.Builder(this, CHANNEL_ID);
            //하위 버전일 경우
        }else{
            builder = new NotificationCompat.Builder(this);
        }
        Intent intent = new Intent(this, MainActivity.class);
        PendingIntent fullScreenPendingIntent = PendingIntent.getActivity(getBaseContext(), 0, intent, PendingIntent.FLAG_CANCEL_CURRENT);
        // 알림창 제목
        builder.setContentTitle(title);
        // 알림창 메시지
        builder.setContentText(body);
        // 알림창 아이콘
        builder.setSmallIcon(R.drawable.ic_launcher_background);
        // 알림창 터치시 상단 알림상태창에서 알림이 자동으로 삭제되게 합니다.
        builder.setAutoCancel(true);
        builder.setPriority(NotificationCompat.PRIORITY_HIGH);
        //pendingIntent를 builder에 설정해줍니다.
        //알림창 터치시 인텐트가 전달할 수 있도록 해줍니다.
        builder.setFullScreenIntent(fullScreenPendingIntent, true);
        Notification notification = builder.build();
        //알림창 실행
        manager.notify(1,notification);
    }
}
