package com.ccdeviceinfo.flutter_cc_deviceinfo_plugin;

import android.app.Activity;

import androidx.annotation.NonNull;

import com.zy.devicelibrary.UtilsApp;
import com.zy.devicelibrary.data.GeneralData;
import com.zy.devicelibrary.data.HardwareData;
import com.zy.devicelibrary.data.MediaFilesData;
import com.zy.devicelibrary.data.OtherData;
import com.zy.devicelibrary.data.StorageData;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

import com.google.gson.Gson;
import com.zy.devicelibrary.utils.GeneralUtils;
import com.zy.devicelibrary.utils.StorageQueryUtil;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.util.Map;

/**
 * FlutterCcDeviceinfoPlugin
 */
public class FlutterCcDeviceinfoPlugin implements FlutterPlugin, MethodCallHandler, ActivityAware {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private MethodChannel channel;
    private Activity mActivity = null;

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
        channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "flutter_cc_deviceinfo_plugin");
        channel.setMethodCallHandler(this);
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
        if (call.method.equals("getGeneralData")) {
            Gson gson = new Gson();
            Map<String, Object> map = JsonMap.getMap(gson.toJson(new GeneralData()));
            result.success(map);
        } else if (call.method.equals("getHardwareData")) {
            Gson gson = new Gson();
            Map<String, Object> map = JsonMap.getMap(gson.toJson(new HardwareData()));
            result.success(map);
        } else if (call.method.equals("getSimCardInfo")) {
            Gson gson = new Gson();
            Map<String, Object> map = JsonMap.getMap(gson.toJson(GeneralUtils.getSimCardInfo()));
            result.success(map);
        } else if (call.method.equals("getStorageData")) {
            Gson gson = new Gson();
            Map<String, Object> map = JsonMap.getMap(gson.toJson(new StorageData()));
            result.success(map);
        } else if (call.method.equals("getOtherData")) {
            Gson gson = new Gson();
            Map<String, Object> map = JsonMap.getMap(gson.toJson(new OtherData()));
            result.success(map);
        } else if (call.method.equals("getMediaFilesData")) {
            Gson gson = new Gson();
            Map<String, Object> map = JsonMap.getMap(gson.toJson(new MediaFilesData()));
            result.success(map);
        } else if (call.method.equals("setGzip")) {
            String res = "";
            try {
                res = new GzipUtil().compress(call.argument("data").toString());
                result.success(res);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        } else if (call.method.equals("getAESUtil")) {
            String res = AESUtil.encrypt(call.argument("data").toString(), call.argument("key").toString());
            result.success(res);
        } else {
            result.notImplemented();
        }
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        channel.setMethodCallHandler(null);
    }

    @Override
    public void onAttachedToActivity(@NonNull ActivityPluginBinding binding) {
        mActivity = binding.getActivity();
        UtilsApp.init(binding.getActivity().getApplication());
    }

    @Override
    public void onDetachedFromActivityForConfigChanges() {
        mActivity = null;
    }

    @Override
    public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding binding) {
        mActivity = binding.getActivity();
        UtilsApp.init(binding.getActivity().getApplication());
    }

    @Override
    public void onDetachedFromActivity() {
        mActivity = null;
    }
}
