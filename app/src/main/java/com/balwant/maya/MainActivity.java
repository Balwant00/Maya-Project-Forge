package com.balwant.maya;

import androidx.appcompat.app.AppCompatActivity;
import android.os.Bundle;
import android.content.Intent;
import android.os.Build;
import android.widget.Button;

public class MainActivity extends AppCompatActivity {
    
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main); 

        Button startButton = findViewById(R.id.startButton);
        Button stopButton = findViewById(R.id.stopButton);

        startButton.setOnClickListener(v -> {
            Intent serviceIntent = new Intent(this, CoreService.class);
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                startForegroundService(serviceIntent);
            } else {
                startService(serviceIntent);
            }
        });

        stopButton.setOnClickListener(v -> {
            Intent serviceIntent = new Intent(this, CoreService.class);
            stopService(serviceIntent);
        });
    }
}
