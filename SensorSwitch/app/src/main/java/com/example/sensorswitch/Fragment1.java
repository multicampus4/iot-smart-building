package com.example.sensorswitch;

import android.os.Bundle;

import androidx.fragment.app.Fragment;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import com.google.android.material.bottomnavigation.BottomNavigationView;


public class Fragment1 extends Fragment {
    MainActivity m;

    // MainActivity 에서 보낸 this 받아옴
    // fragment 에서 Toast 띄우우기 위해.. 메인액티비티에 띄워야 하므로 정보 받아와 토스트 던질때 m 입력
    public Fragment1() {

    }


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {

        return inflater.inflate(R.layout.fragment_1, container, false);
    }
}