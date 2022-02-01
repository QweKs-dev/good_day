package com.example.good_day;

import io.flutter.app.FlutterApplication;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugin.common.PluginRegistry.PluginRegistrantCallback;
import io.flutter.plugins.androidalarmmanager.AlarmService;
import io.flutter.plugins.androidalarmmanager.AndroidAlarmManagerPlugin;
import com.dexterous.flutterlocalnotifications.FlutterLocalNotificationsPlugin;
import com.whelksoft.flutter_native_timezone.FlutterNativeTimezonePlugin;  

public class Application extends FlutterApplication implements PluginRegistrantCallback {
    @Override
    public void onCreate() {
        super.onCreate();
        AlarmService.setPluginRegistrant(this);
    }

    @Override
    public void registerWith(PluginRegistry registry) {

        AndroidAlarmManagerPlugin.registerWith(
                registry.registrarFor("io.flutter.plugins.androidalarmmanager.AndroidAlarmManagerPlugin"));

        FlutterLocalNotificationsPlugin.registerWith(
                registry.registrarFor("com.dexterous.flutterlocalnotifications.FlutterLocalNotificationsPlugin"));

        FlutterNativeTimezonePlugin.registerWith(
            registry.registrarFor("com.whelksoft.flutter_native_timezone.FlutterNativeTimezonePlugin"));

    }
}