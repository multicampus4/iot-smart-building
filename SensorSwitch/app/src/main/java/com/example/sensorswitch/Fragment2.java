package com.example.sensorswitch;

import android.os.Bundle;

import androidx.fragment.app.Fragment;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

public class Fragment2 extends Fragment {

    TextView tx_data;

    public Fragment2() {
        // Required empty public constructor
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {

        View view = inflater.inflate(R.layout.fragment_2, container, false);
        tx_data = view.findViewById(R.id.tx_data);
        return view;
    }

    public void setText(String text){
        tx_data.setText(text);
    }

    public String getText(){
        return (String) tx_data.getText();
    }
}

