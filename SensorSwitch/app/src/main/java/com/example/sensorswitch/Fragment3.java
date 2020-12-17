package com.example.sensorswitch;

import android.os.Bundle;

import androidx.fragment.app.Fragment;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import com.airbnb.lottie.LottieAnimationView;
import com.airbnb.lottie.LottieDrawable;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Fragment3 extends Fragment {

    // 현재시간을 msec 으로 구한다.
    long now = System.currentTimeMillis();
    // 현재시간을 date 변수에 저장한다.
    Date date = new Date(now);
    // 시간을 나타냇 포맷을 정한다 ( yyyy/MM/dd 같은 형태로 변형 가능 )
    SimpleDateFormat sdfNow = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
    // nowDate 변수에 값을 저장한다.
    String formatDate = sdfNow.format(date);


    public Fragment3() {
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {

        View view = inflater.inflate(R.layout.fragment_3, container, false);
        LottieAnimationView animationView = view.findViewById(R.id.lottieAniView);
        setUpAnimation(animationView, R.raw.nfc_scanning2, LottieDrawable.INFINITE);

        MyGlobals.getInstance().setFrgment3on(true);

        // NFC 태깅 시간 출력
        TextView textView = view.findViewById(R.id.textView);
        textView.setText(formatDate);

        return view;
    }

    public void setUpAnimation(LottieAnimationView animationView, int lottie_raw_file, int loop ) {
        // 재생할 애니메이션 넣어준다.
        animationView.setAnimation(lottie_raw_file);
        // 반복횟수를 무한히 주고 싶을 땐 LottieDrawable.INFINITE or 원하는 횟수
        animationView.setRepeatCount(loop);
        // 시작
        animationView.playAnimation();
    }

}