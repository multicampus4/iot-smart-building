package com.example.sensorswitch;


import android.app.Dialog;
import android.content.Context;
import android.graphics.drawable.ColorDrawable;
import android.view.Gravity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.WindowManager;

public class lottieDialogFragment extends Dialog {
    public lottieDialogFragment(Context context) {
        super(context);

        WindowManager.LayoutParams wlmp = getWindow().getAttributes();

        wlmp.gravity = Gravity.CENTER_HORIZONTAL;
        getWindow().setAttributes(wlmp);
        getWindow().setBackgroundDrawable(new ColorDrawable(android.graphics.Color.TRANSPARENT));
        setTitle(null);
        setCancelable(true);
        setOnCancelListener(null);
        setCanceledOnTouchOutside(false);
        View view = LayoutInflater.from(context).inflate(
                R.layout.dialog_lottie, null);
        setContentView(view);
    }
}