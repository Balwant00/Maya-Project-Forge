package com.balwant.maya;

import android.app.Service;
import android.content.Intent;
import android.os.IBinder;
import android.widget.Toast;
import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.os.Build;
import androidx.core.app.NotificationCompat;

public class CoreService extends Service {

    public static final String CHANNEL_ID = "MayaCoreServiceChannel";

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        
        createNotificationChannel(); 

        Notification notification = new NotificationCompat.Builder(this, CHANNEL_ID)
            .setContentTitle("Maya AI is Active")
            .setContentText("Ambient Brain is running in the background.")
            .setSmallIcon(R.mipmap.ic_launcher)
            .build();

        startForeground(1, notification);
        
        Toast.makeText(this, "Maya Core is now active.", Toast.LENGTH_LONG).show();

        return START_STICKY; 
    }

    @Override
    public void onDestroy() {
        super.onDestroy();
        Toast.makeText(this, "Maya Core has been deactivated.", Toast.LENGTH_SHORT).show();
    }
    
    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }

    private void createNotificationChannel() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            NotificationChannel serviceChannel = new NotificationChannel(
                CHANNEL_ID, 
                "Maya Core Service", 
                NotificationManager.IMPORTANCE_DEFAULT
            );
            
            NotificationManager manager = getSystemService(NotificationManager.class);
            if (manager != null) {
                manager.createNotificationChannel(serviceChannel);
            }
        }
    }
}
