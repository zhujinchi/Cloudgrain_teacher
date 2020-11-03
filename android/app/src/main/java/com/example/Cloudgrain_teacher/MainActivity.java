package com.example.Cloudgrain_teacher;

import android.os.Bundle;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugins.GeneratedPluginRegistrant;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "com.flutter.epic/epic";
    private MethodChannel methodChannel;

    @Override
    public void configureFlutterEngine(FlutterEngine flutterEngine){
        GeneratedPluginRegistrant.registerWith(flutterEngine);
        methodChannel = new MethodChannel(flutterEngine.getDartExecutor(), CHANNEL);
        methodChannel.setMethodCallHandler(
                new MethodChannel.MethodCallHandler() {
                    @Override
                    public void onMethodCall(MethodCall call, MethodChannel.Result result) {
                        if (call.method.equals("Printy")) {
                            result.success("Hi from Java");
                        } else {
                            //没有对应方法
                            result.notImplemented();
                        }
                    }
                }
        );
    }
}
