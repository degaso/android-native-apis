package com.android.js.api;

import android.annotation.SuppressLint;
import android.app.Activity;

public class Toast {
    private Activity activity;

    public Toast(Activity activity){
        this.activity = activity;
    }

    public void showToast(String text, int duration){
        if(duration > 1) duration = 1;
        if(duration < 0) duration = 0;
        @SuppressLint("WrongConstant") android.widget.Toast toast = android.widget.Toast.makeText(this.activity ,text, duration);
        toast.show();
    }
}
