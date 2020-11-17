package com.example.sensorswitch;

import android.content.Intent;
import android.util.Log;

import androidx.annotation.NonNull;
import androidx.localbroadcastmanager.content.LocalBroadcastManager;

import com.google.firebase.messaging.FirebaseMessagingService;
import com.google.firebase.messaging.RemoteMessage;

public class FcmTest extends FirebaseMessagingService {
    public FcmTest() {
    }

    @Override
    public void onMessageReceived(@NonNull RemoteMessage remoteMessage) {
        String title = remoteMessage.getNotification().getTitle();
        String control = remoteMessage.getData().get("control");
        String data = remoteMessage.getData().get("data");
        String body = remoteMessage.getData().get("body");

        Log.d("[TAG]:",title + " " + control  + " " + data);

        // MainActivity에 데이터 전송
        Intent intent = new Intent("notification");                 // MainActivity에서 설정해 두었던 "notification" 인텐트와
        intent.putExtra("title", title);                            // 보내고 싶은 데이터들을
        intent.putExtra("control", control);
        intent.putExtra("data", data);
        intent.putExtra("body", body);
        LocalBroadcastManager.getInstance(this).sendBroadcast(intent);    // 보낸다.
    }
}