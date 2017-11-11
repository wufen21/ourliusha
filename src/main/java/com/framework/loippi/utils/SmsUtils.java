package com.framework.loippi.utils;

import java.io.InputStream;
import java.net.URL;
import java.net.URLEncoder;

import org.apache.commons.lang.StringUtils;

/**
 * 短信发送接口
 */
public class SmsUtils {

	private static String sendUrl = "http://sdk.zhongguowuxian.com:98/ws/BatchSend.aspx";
	private static String userid = "GZLKJ0004627";
	private static String password = "yunzhiya@111666";
	private static String sign = "";

	/**
	 * 发送短信
	 * 
	 * @param phone
	 * @param content
	 * @return
	 */
	public static boolean send(String phone, String content) {
		if (StringUtils.isEmpty(phone) || StringUtils.isEmpty(content)) {
			return false;
		}
		try {
			content += sign;
			String send_content = URLEncoder.encode(content.replaceAll("<br/>", " "), "GBK");
			String urlAddr = String.format("%s?CorpID=%s&Pwd=%s&Mobile=%s&Content=%s&Cell=&SendTime=", sendUrl, userid,
					password, phone, send_content);
			URL url = new URL(urlAddr);
			StringBuffer out = new StringBuffer();
			byte[] b = new byte[4096];
			InputStream in = url.openStream();
			for (int n; (n = in.read(b)) != -1;) {
				out.append(new String(b, 0, n));
			}
			String result = out.toString();
            System.err.println("result=="+result);
			int code = new Integer(result).intValue();
			if (code >= 0) {
				return true;
			}
			return false;
		} catch (Exception e) {
			return false;
		}
	}
	
	public static void main(String[] args) {
		System.out.println(send("13533936688", "验证码为：1353,请在10分钟内使用"));
	}

}
