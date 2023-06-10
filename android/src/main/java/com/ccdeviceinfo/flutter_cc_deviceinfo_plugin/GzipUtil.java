package com.ccdeviceinfo.flutter_cc_deviceinfo_plugin;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.zip.GZIPOutputStream;

public class GzipUtil {
    public static String compress(String str) throws IOException {
        if (null == str || str.length() <= 0) {
            return str;
        }
        // 建立一个新的输出流
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        // 使用默认缓冲区大小建立新的输出流
        GZIPOutputStream gzip = new GZIPOutputStream(out);
        // 将字节写入此输出流
        gzip.write(str.getBytes("utf-8")); // 由于后台默认字符集有多是GBK字符集，因此此处需指定一个字符集
        gzip.close();
        // 使用指定的 charsetName，经过解码字节将缓冲区内容转换为字符串
        return out.toString("ISO-8859-1");
    }
}