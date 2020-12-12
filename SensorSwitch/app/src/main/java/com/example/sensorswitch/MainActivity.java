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

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        actionBar = getSupportActionBar();
        actionBar.hide();

        fragment1 = new Fragment1();    // this : fragment에 현재 메인액티비티 전달
        fragment2 = new Fragment2();
        fragment3 = new Fragment3();

        fragmentManager = getSupportFragmentManager();
        fragmentManager.beginTransaction().replace(R.id.frameLayout, fragment1).commit();

        bottomNavigationView = findViewById(R.id.bottom_nav);
        bottomNavigationView.setOnNavigationItemSelectedListener(new BottomNavigationView.OnNavigationItemSelectedListener() {
            @Override
            public boolean onNavigationItemSelected(@NonNull MenuItem item) {
                switch(item.getItemId()) {
                    case R.id.tab1:
                        fragmentManager.beginTransaction().replace(R.id.frameLayout, fragment1).commit();
                        Toast.makeText(MainActivity.this, "tab1", Toast.LENGTH_SHORT).show();
                        return true;
                    case R.id.tab2:
                        fragmentManager.beginTransaction().replace(R.id.frameLayout, fragment2).commit();
                        Toast.makeText(MainActivity.this, "tab2", Toast.LENGTH_SHORT).show();
                        return true;
                    case R.id.tab3:
                        fragmentManager.beginTransaction().replace(R.id.frameLayout, fragment3).commit();
                        Toast.makeText(MainActivity.this, "tab3", Toast.LENGTH_SHORT).show();
                        return true;
                }
                return false;
            }
        });
    }

}