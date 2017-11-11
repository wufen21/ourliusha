package com.framework.loippi.utils.wechat.utils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.net.ConnectException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import java.util.Map.Entry;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.TrustManager;

import net.sf.json.JSONException;
import net.sf.json.JSONObject;

import org.jdom.JDOMException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.framework.loippi.utils.wechat.bean.AccessToken;
import com.wxap.util.Sha1Util;


/**
 * 公众平台通用接口工具类
 * 
 */
public class WechatShareUtil {
	private static Logger log = LoggerFactory.getLogger(WechatShareUtil.class);
	
	private static HashMap<String, String> parameters = new HashMap<String, String>();
	public static final String BASE_URL = "http://www.echefu.cc";
	public static final String WECHAT_SIGN_TYPE = "sha1";
	
	/**
	 * App支付
	 */
	public static final String WECHAT_APP_ID = "wx14658f9874c6c7af";
	public static final String WECHAT_SECRET = "735b7e1dc089c732d249d799a14e14a9";
	public static final String PartnerKey = "1266652601";
	
	/**
	 * 原生公众号支付
	 */
	public static final String NATIVE_PARTNER_KEY = "1247904001";//
	public static final String NATIVE_APP_ID = "wxce89c9f7e34219b3";//公众好APPID
	public static final String NATIVE_SECRET = "075d0b7556b29f1dafa8ac350acfc919";
	
	
	public static final String WECHAT_APP_PAY_SIGN_KEY = "Yunzhiya111666GG6197576V12NOMING";
	
	// 获取access_token的接口地址（GET） 限200（次/天）
		public final static String access_token_url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid={0}&secret={1}";

	// ticket
	    public final static String access_ticket_url = "https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token={0}&type=jsapi";
	
		/**
		 * 获取access_token
		 * 
		 * @param appid
		 *            凭证
		 * @param secret
		 *            密钥
		 * @return
		 */
		public static String getTicket(String appid,String secret) {
			String requestUrl = access_token_url.replace("{0}", appid).replace("{1}",secret);
			JSONObject jsonObject = httpsRequest(requestUrl, "GET", null);
            String ticket=null;
			if (null != jsonObject) {
				try {
				String token=	jsonObject.getString("access_token");
				
				 requestUrl = access_ticket_url.replace("{0}", token);
				 jsonObject = httpsRequest(requestUrl, "GET", null);
				 ticket=	jsonObject.getString("ticket");
				
				} catch (JSONException e) {
					log.error("获取token失败 errcode:{} errmsg:{}", jsonObject
							.getInt("errcode"), jsonObject.getString("errmsg"));
				}
			}
			return ticket;
		}
		
		
	/**
	 * 发起https请求并获取结果
	 * 
	 * @param requestUrl
	 *            请求地址
	 * @param requestMethod
	 *            请求方式（GET、POST）
	 * @param outputStr
	 *            提交的数据
	 * @return JSONObject(通过JSONObject.get(key)的方式获取json对象的属性值)
	 */
	public static JSONObject httpsRequest(String requestUrl,
			String requestMethod, String outputStr) {
		JSONObject jsonObject = null;
		StringBuffer buffer = new StringBuffer();
		try {
			// 创建SSLContext对象，并使用我们指定的信任管理器初始化
			TrustManager[] tm = { new AzuraX509TrustManager() };
			SSLContext sslContext = SSLContext.getInstance("SSL", "SunJSSE");
			sslContext.init(null, tm, new java.security.SecureRandom());
			// 从上述SSLContext对象中得到SSLSocketFactory对象
			SSLSocketFactory ssf = sslContext.getSocketFactory();

			URL url = new URL(requestUrl);
			HttpsURLConnection httpUrlConn = (HttpsURLConnection) url
					.openConnection();
			httpUrlConn.setSSLSocketFactory(ssf);
			httpUrlConn.setDoOutput(true);
			httpUrlConn.setDoInput(true);
			httpUrlConn.setUseCaches(false);
			// 设置请求方式（GET/POST）
			httpUrlConn.setRequestMethod(requestMethod);

			if ("GET".equalsIgnoreCase(requestMethod))
				httpUrlConn.connect();

			// 当有数据需要提交时
			if (null != outputStr) {
				OutputStream outputStream = httpUrlConn.getOutputStream();
				// 注意编码格式，防止中文乱码
				outputStream.write(outputStr.getBytes("UTF-8"));
				outputStream.close();
			}

			// 将返回的输入流转换成字符串
			InputStream inputStream = httpUrlConn.getInputStream();
			InputStreamReader inputStreamReader = new InputStreamReader(
					inputStream, "utf-8");
			BufferedReader bufferedReader = new BufferedReader(
					inputStreamReader);

			String str = null;
			while ((str = bufferedReader.readLine()) != null) {
				buffer.append(str);
			}
			bufferedReader.close();
			inputStreamReader.close();
			// 释放资源
			inputStream.close();
			inputStream = null;
			httpUrlConn.disconnect();
			jsonObject = JSONObject.fromObject(buffer.toString());
		} catch (ConnectException ce) {
			log.error("Weixin server connection timed out.");
		} catch (Exception e) {
			log.error("https request error:{}", e);
		}
		return jsonObject;
	}

	
	/**
	 * 发起https请求并获取结果
	 * 
	 * @param requestUrl
	 *            请求地址
	 * @param requestMethod
	 *            请求方式（GET、POST）
	 * @param outputStr
	 *            提交的数据
	 * @return JSONObject(通过JSONObject.get(key)的方式获取json对象的属性值)
	 */
	public static String prepayId(String requestUrl,
			String requestMethod, String outputStr) {
		JSONObject jsonObject = null;
		StringBuffer buffer = new StringBuffer();
		try {
			// 创建SSLContext对象，并使用我们指定的信任管理器初始化
			TrustManager[] tm = { new AzuraX509TrustManager() };
			SSLContext sslContext = SSLContext.getInstance("SSL", "SunJSSE");
			sslContext.init(null, tm, new java.security.SecureRandom());
			// 从上述SSLContext对象中得到SSLSocketFactory对象
			SSLSocketFactory ssf = sslContext.getSocketFactory();

			URL url = new URL(requestUrl);
			HttpsURLConnection httpUrlConn = (HttpsURLConnection) url
					.openConnection();
			httpUrlConn.setSSLSocketFactory(ssf);
			httpUrlConn.setDoOutput(true);
			httpUrlConn.setDoInput(true);
			httpUrlConn.setUseCaches(false);
			// 设置请求方式（GET/POST）
			httpUrlConn.setRequestMethod(requestMethod);

			if ("GET".equalsIgnoreCase(requestMethod))
				httpUrlConn.connect();

			// 当有数据需要提交时
			if (null != outputStr) {
				OutputStream outputStream = httpUrlConn.getOutputStream();
				// 注意编码格式，防止中文乱码
				outputStream.write(outputStr.getBytes("UTF-8"));
				outputStream.close();
			}

			// 将返回的输入流转换成字符串
			InputStream inputStream = httpUrlConn.getInputStream();
			InputStreamReader inputStreamReader = new InputStreamReader(
					inputStream, "utf-8");
			BufferedReader bufferedReader = new BufferedReader(
					inputStreamReader);

			String str = null;
			while ((str = bufferedReader.readLine()) != null) {
				buffer.append(str);
			}
			bufferedReader.close();
			inputStreamReader.close();
			// 释放资源
			inputStream.close();
			inputStream = null;
		} catch (ConnectException ce) {
			log.error("Weixin server connection timed out.");
		} catch (Exception e) {
			log.error("https request error:{}", e);
		}
		return buffer.toString();
	}
	
	/**
	 * 获取access_token
	 * 
	 * @param appid
	 *            凭证
	 * @param secret
	 *            密钥
	 * @return
	 */
	public static AccessToken getAccessToken(String appid,String secret) {
		AccessToken accessToken = null;
		String requestUrl = access_token_url.replace("{0}", appid).replace("{1}",secret);
		JSONObject jsonObject = httpsRequest(requestUrl, "GET", null);
		log.debug("url:"+requestUrl);
		if (null != jsonObject) {
			try {
				accessToken = new AccessToken(jsonObject.getString("access_token"), jsonObject.getInt("expires_in"));
			} catch (JSONException e) {
				log.error("获取token失败 errcode:{} errmsg:{}", jsonObject
						.getInt("errcode"), jsonObject.getString("errmsg"));
			}
		}
		return accessToken;
	}
	
	
	public static final String gen_prepay_url = "https://api.weixin.qq.com/pay/genprepay?access_token=%s";
	public static final String gen_prepay_url_1 ="https://api.mch.weixin.qq.com/pay/unifiedorder";
	
	public static String genPrepay1(AppOrder order,String ip) throws SDKRuntimeException{
		parameters.clear();
		parameters.put("appid", WECHAT_APP_ID);
		parameters.put("body", order.getOrderCode());
		parameters.put("mch_id", PartnerKey);
		parameters.put("out_trade_no", order.getOrderCode());
		parameters.put("total_fee", order.getPay().multiply(new BigDecimal(100)).intValue()+"");
		parameters.put("notify_url", BASE_URL + "/app/order/notify/wechat/"+order.getId());
		parameters.put("spbill_create_ip", ip);
		parameters.put("nonce_str", CommonUtil.CreateNoncestr());
		parameters.put("trade_type", "APP");
		parameters.put("sign", sign());
		
		            StringBuilder strBuilder = new StringBuilder();  
		            strBuilder.append("<xml>");  
		            Set<String> objSet = parameters.keySet();  
		            for (Object key : objSet)  
		            {  
		                if (key == null)  
		                {  
		                    continue;  
		                }  
		                strBuilder.append("<").append(key.toString()).append(">");  
		                Object value = parameters.get(key);
		                strBuilder.append(value.toString());
		                strBuilder.append("</").append(key.toString()).append(">");  
		            }  
		            strBuilder.append("</xml>");  
		return prepayId(gen_prepay_url_1, "POST",strBuilder.toString()).toString();
	}
	
	
	public static String genPrepayRecharge(Integer tranId,BigDecimal amount, String ip) throws SDKRuntimeException{
		parameters.clear();
		parameters.put("appid", WECHAT_APP_ID);
		parameters.put("body", "T"+System.currentTimeMillis());
		parameters.put("mch_id", PartnerKey);
		parameters.put("out_trade_no", "T"+System.currentTimeMillis());
		parameters.put("total_fee", amount.multiply(new BigDecimal(100)).intValue()+"");
		parameters.put("notify_url", BASE_URL + "/app/recharge/notify/wechat/"+tranId);
		parameters.put("spbill_create_ip", ip);
		parameters.put("nonce_str", CommonUtil.CreateNoncestr());
		parameters.put("trade_type", "APP");
		parameters.put("sign", sign());
		
        StringBuilder strBuilder = new StringBuilder();  
        strBuilder.append("<xml>");  
        Set<String> objSet = parameters.keySet();  
        for (Object key : objSet)  
        {  
            if (key == null)  
            {  
                continue;  
            }  
            strBuilder.append("<").append(key.toString()).append(">");  
            Object value = parameters.get(key);
            strBuilder.append(value.toString());
            strBuilder.append("</").append(key.toString()).append(">");  
        }  
        strBuilder.append("</xml>");  
		return prepayId(gen_prepay_url_1, "POST",strBuilder.toString()).toString();
	}
	
	public static String JSAPIgenPrepayRecharge(Integer tranId,BigDecimal amount,String openid, String ip) throws SDKRuntimeException{
		parameters.clear();
		parameters.put("appid", NATIVE_APP_ID);
		parameters.put("body", "e车夫账户充值");
		parameters.put("mch_id", NATIVE_PARTNER_KEY);
		parameters.put("openid", openid);
		parameters.put("out_trade_no", "T"+System.currentTimeMillis());
		parameters.put("total_fee", amount.multiply(new BigDecimal(100)).intValue()+"");
		parameters.put("notify_url", BASE_URL + "/app/recharge/notify/"+tranId);
		parameters.put("spbill_create_ip", ip);
		parameters.put("nonce_str", CommonUtil.CreateNoncestr());
		parameters.put("trade_type", "JSAPI");
		parameters.put("sign", sign());
		
		 StringBuilder strBuilder = new StringBuilder();  
         strBuilder.append("<xml>");  
         Set<String> objSet = parameters.keySet();  
         for (Object key : objSet)  
         {  
             if (key == null)  
             {  
                 continue;  
             }  
             strBuilder.append("<").append(key.toString()).append(">");  
             Object value = parameters.get(key);
             strBuilder.append(value.toString());
             strBuilder.append("</").append(key.toString()).append(">");  
         }  
         strBuilder.append("</xml>");  
		return prepayId(gen_prepay_url_1, "POST",strBuilder.toString()).toString();
	}
	

	
	public static String genPrepay(String token ,AppOrder order,String ip) throws SDKRuntimeException{
		parameters.clear();
		parameters.put("bank_type", "WX");
		parameters.put("body", order.getOrderCode());
		parameters.put("partner", PartnerKey);
		parameters.put("out_trade_no", order.getOrderCode());
		parameters.put("total_fee", order.getPay().multiply(new BigDecimal(100)).toString());
		parameters.put("fee_type", "1");
		parameters.put("notify_url", BASE_URL + "/app/order/notify/"+order.getId());
		parameters.put("spbill_create_ip", ip);
		parameters.put("input_charset", "GBK");
		return httpsRequest(String.format(gen_prepay_url, token), "POST", CreateAppPackage(order.getOrderCode())).toString();
	}
	
	
	// 生成app支付请求json
		public static String CreateAppPackage(String traceid) throws SDKRuntimeException {
			HashMap<String, String> nativeObj = new HashMap<String, String>();
			if (CheckCftParameters() == false) {
				throw new SDKRuntimeException("生成package参数缺失！");
			}
			nativeObj.put("appid", WECHAT_APP_ID);
			nativeObj.put("package", GetCftPackage());
			nativeObj.put("timestamp", Long.toString(new Date().getTime()/1000));
			nativeObj.put("traceid", traceid);
			nativeObj.put("noncestr", CommonUtil.CreateNoncestr());
			nativeObj.put("app_signature", GetBizSign(nativeObj));
			nativeObj.put("sign_method", WECHAT_SIGN_TYPE);
			return JSONObject.fromObject(nativeObj).toString();
		}
		
		
		/**
		 * 签名
		 * @param bizObj
		 * @return
		 * @throws SDKRuntimeException
		 */
		public static String GetBizSign(HashMap<String, String> bizObj)
				throws SDKRuntimeException {
			HashMap<String, String> bizParameters = new HashMap<String, String>();

			List<Map.Entry<String, String>> infoIds = new ArrayList<Map.Entry<String, String>>(
					bizObj.entrySet());

			Collections.sort(infoIds, new Comparator<Map.Entry<String, String>>() {
				public int compare(Map.Entry<String, String> o1,
						Map.Entry<String, String> o2) {
					return (o1.getKey()).toString().compareTo(o2.getKey());
				}
			});

			for (int i = 0; i < infoIds.size(); i++) {
				Map.Entry<String, String> item = infoIds.get(i);
				if (item.getKey() != "") {
					bizParameters.put(item.getKey().toLowerCase(), item.getValue());
				}
			}

			if (WECHAT_APP_PAY_SIGN_KEY == "") {
				throw new SDKRuntimeException("APPKEY为空！");
			}
			bizParameters.put("appkey", WECHAT_APP_PAY_SIGN_KEY);
			String bizString = CommonUtil.FormatBizQueryParaMap(bizParameters,
					false);
			//System.out.println(bizString);

			return SHA1Util.Sha1(bizString);

		}
	

		/**
		 * 签名
		 * @param signature
		 * @return
		 * @throws SDKRuntimeException
		 */
		public static String GetSignature(HashMap<String, String> bizObj)
				throws SDKRuntimeException {
			HashMap<String, String> bizParameters = new HashMap<String, String>();

			List<Map.Entry<String, String>> infoIds = new ArrayList<Map.Entry<String, String>>(
					bizObj.entrySet());

			Collections.sort(infoIds, new Comparator<Map.Entry<String, String>>() {
				public int compare(Map.Entry<String, String> o1,
						Map.Entry<String, String> o2) {
					return (o1.getKey()).toString().compareTo(o2.getKey());
				}
			});

			for (int i = 0; i < infoIds.size(); i++) {
				Map.Entry<String, String> item = infoIds.get(i);
				if (item.getKey() != "") {
					bizParameters.put(item.getKey().toLowerCase(), item.getValue());
				}
			}

			
			String bizString = CommonUtil.FormatBizQueryParaMap(bizParameters,
					false);
			//System.out.println(bizString);

			return SHA1Util.Sha1(bizString);

		}
	
		
		/**
		 * 检查必填参数是否为空
		 * @return
		 */
		private static Boolean CheckCftParameters() {
			if (parameters.get("bank_type") == "" || parameters.get("body") == ""
					|| parameters.get("partner") == ""
					|| parameters.get("out_trade_no") == ""
					|| parameters.get("total_fee") == ""
					|| parameters.get("fee_type") == ""
					|| parameters.get("notify_url") == null
					|| parameters.get("spbill_create_ip") == ""
					|| parameters.get("input_charset") == "") {
				return false;
			}
			return true;
		}

		/**
		 * 用秘钥对参数parameters加密
		 * @return
		 * @throws SDKRuntimeException
		 */
		public static String GetCftPackage() throws SDKRuntimeException {
			if ("" == PartnerKey) {
				throw new SDKRuntimeException("密钥不能为空！");
			}
			String unSignParaString = CommonUtil.FormatBizQueryParaMap(parameters,
					false);
			String paraString = CommonUtil.FormatBizQueryParaMap(parameters, true);
			return paraString + "&sign="
					+ MD5SignUtil.Sign(unSignParaString, PartnerKey);

		}
		
		public static String sign() throws SDKRuntimeException{
			String unSignParaString = CommonUtil.FormatBizQueryParaMap(parameters,
					false);
			return MD5SignUtil.Sign(unSignParaString, WECHAT_APP_PAY_SIGN_KEY);
		}
		
		
		
		
		
		/**
		 *  1 第一步：用户同意授权，获取code
			2 第二步：通过code换取网页授权access_token
			3 第三步：刷新access_token（如果需要）
			4 第四步：拉取用户信息(需scope为 snsapi_userinfo)
		 * @param args
		 */
		private static final String auth2_code_url = "https://open.weixin.qq.com/connect/oauth2/authorize?appid={appid}&redirect_uri={redirect_uri}&response_type=code&scope={scope}&state={state}#wechat_redirect";
		private static final String auth2_access_token_url = "https://api.weixin.qq.com/sns/oauth2/access_token?appid={0}&secret={1}&code={2}&grant_type=authorization_code";
		private static final String auth2_refresh_token_url = "https://api.weixin.qq.com/sns/oauth2/refresh_token?appid={0}&grant_type=refresh_token&refresh_token={1}";
		private static final String auth2_get_user_url = "https://api.weixin.qq.com/sns/userinfo?access_token={0}&openid={1}&lang=zh_CN";
		/**
		 * 跳转授权url
			appid	  公众号的唯一标识
			redirect_uri	  授权后重定向的回调链接地址，请使用urlencode对链接进行处理
			response_type	 返回类型，请填写code
			scope	 应用授权作用域，snsapi_base （不弹出授权页面，直接跳转，只能获取用户openid），snsapi_userinfo （弹出授权页面，可通过openid拿到昵称、性别、所在地。并且，即使在未关注的情况下，只要用户授权，也能获取其信息）
			state	 重定向后会带上state参数，开发者可以填写a-zA-Z0-9的参数值
		 * @return
		 */
		public static  String  getRedirectWeixinAuth2SiteUrl(String appid,String redirect_uri,String scope,String state){
			return auth2_code_url.replace("{appid}", appid).replace("{redirect_uri}", redirect_uri).replace("{scope}", scope).replace("{state}", state);
		}
		/**
		 * 通过code换取网页授权access_token
		 * @param appid 公众号的唯一标识
		 * @param secret 公众号的appsecret
		 * @param code 填写第一步获取的code参数
		 * @return {
				   "access_token":"ACCESS_TOKEN",
				   "expires_in":7200,
				   "refresh_token":"REFRESH_TOKEN",
				   "openid":"OPENID",
				   "scope":"SCOPE"
				}
		 */
		public static JSONObject  getAuth2AccessTokenByCode(String appid,String secret,String code ){
			String url = auth2_access_token_url.replace("{0}", appid).replace("{1}", secret).replace("{2}", code);
			JSONObject jsonObject = httpsRequest(url, "GET", null);
			return jsonObject;
		}
		
		/**
		 * 第三步：刷新access_token（如果需要）
		 * @param args
		 * @return  {
			   "access_token":"ACCESS_TOKEN",
			   "expires_in":7200,
			   "refresh_token":"REFRESH_TOKEN",
			   "openid":"OPENID",
			   "scope":"SCOPE"
			}
		 */
		public static  JSONObject getAuth2RefreshToken(String appid,String refresh_token ){
			String url = auth2_refresh_token_url.replace("{0}", appid).replace("{1}", refresh_token);
			JSONObject jsonObject = httpsRequest(url, "GET", null);
			return jsonObject;
		}
		
		
		

		public static Map jsApiPay(String openid, String total_fee, 
			String out_trade_num,String body,String SPBILL_CREATE_IP) throws JDOMException, IOException {	
			String noceStr=Sha1Util.getNonceStr();//随机字符串
			String timeStamp=Sha1Util.getTimeStamp();//时间戳
			// 接口package部分-内容----------------------------------------------------------
			TreeMap<String, String> contentMap = new TreeMap<String, String>();
			contentMap.put("appid", WechatShareUtil.NATIVE_APP_ID); // 公众账号 ID
			contentMap.put("mch_id", WechatShareUtil. NATIVE_PARTNER_KEY); // 商户号
			contentMap.put("nonce_str", noceStr); // 随机字符串	
			System.err.println("body=="+body);
			contentMap.put("body",body); // 商品描述
			contentMap.put("out_trade_no",out_trade_num); // 商户订单号
			System.err.println("total_fee=="+total_fee);
			contentMap.put("total_fee",total_fee); // 订单总金额,以分为单位 
			contentMap.put("spbill_create_ip",SPBILL_CREATE_IP); // 订单生成的机器IP
			contentMap.put("notify_url",BASE_URL + "/app/order/notify/wechat/"+out_trade_num); // 通知地址
			contentMap.put("trade_type","JSAPI"); // 交易类型
			contentMap.put("openid",openid); // 用户标识
			String sign = WeiXinSignAndPackage.createPackage(contentMap);
			System.err.println("sign==="+sign);
			contentMap.put("sign", sign);
			
			
			
			   StringBuilder strBuilder = new StringBuilder();  
		        strBuilder.append("<xml>");  
		        Set<String> objSet = contentMap.keySet();  
		        for (Object key : objSet)  
		        {  
		            if (key == null)  
		            {  
		                continue;  
		            }  
		            strBuilder.append("<").append(key.toString()).append(">");  
		            Object value = contentMap.get(key);
		            strBuilder.append(value.toString());
		            strBuilder.append("</").append(key.toString()).append(">");  
		        }  
		        strBuilder.append("</xml>");  
			String result= 	prepayId(gen_prepay_url_1, "POST",strBuilder.toString()).toString();
			System.err.println("result==="+result);
			Map<String,String> map=XMLUtil.doXMLParse(result);//调用统一接口返回的值转换为XML格式
			System.out.println(map);
			TreeMap<String, String> wxPayParamMap = new TreeMap<String, String>();
			wxPayParamMap.put("appId", WechatShareUtil.NATIVE_APP_ID);
			wxPayParamMap.put("timeStamp",timeStamp );	
			System.err.println("timeStamp==="+timeStamp);
			wxPayParamMap.put("nonceStr",noceStr); 
			System.err.println("noceStr==="+noceStr);
			wxPayParamMap.put("package", "prepay_id="+map.get("prepay_id"));
			System.err.println("map.get(prepay_id)==="+map.get("prepay_id"));
			wxPayParamMap.put("signType", "MD5");
			String paySign=WeiXinSignAndPackage.createPaySign(wxPayParamMap);//支付得到的签名
			wxPayParamMap.put("paySign", paySign);	
			wxPayParamMap.put("payMoney", total_fee);//到前段显示使用，支付不需要此参数
			
			
			return wxPayParamMap;
		}
		
		
		
		
		public static Map jsApiPayToRecharge(String openid, String total_fee, 
				String out_trade_num,String body,String SPBILL_CREATE_IP) throws JDOMException, IOException {	
				String noceStr=Sha1Util.getNonceStr();//随机字符串
				String timeStamp=Sha1Util.getTimeStamp();//时间戳
				// 接口package部分-内容----------------------------------------------------------
				TreeMap<String, String> contentMap = new TreeMap<String, String>();
				contentMap.put("appid", WechatShareUtil.NATIVE_APP_ID); // 公众账号 ID
				contentMap.put("mch_id", WechatShareUtil. NATIVE_PARTNER_KEY); // 商户号
				contentMap.put("nonce_str", noceStr); // 随机字符串	
				System.err.println("body=="+body);
				contentMap.put("body",body); // 商品描述
				contentMap.put("out_trade_no",out_trade_num); // 商户订单号
				System.err.println("total_fee=="+total_fee);
				contentMap.put("total_fee",total_fee); // 订单总金额,以分为单位 
				contentMap.put("spbill_create_ip",SPBILL_CREATE_IP); // 订单生成的机器IP
				contentMap.put("notify_url",BASE_URL + "/wap/member/account/rechargeTsuccess/"+out_trade_num); // 通知地址
				contentMap.put("trade_type","JSAPI"); // 交易类型
				contentMap.put("openid",openid); // 用户标识
				String sign = WeiXinSignAndPackage.createPackage(contentMap);
				System.err.println("sign==="+sign);
				contentMap.put("sign", sign);
				
				
				
				   StringBuilder strBuilder = new StringBuilder();  
			        strBuilder.append("<xml>");  
			        Set<String> objSet = contentMap.keySet();  
			        for (Object key : objSet)  
			        {  
			            if (key == null)  
			            {  
			                continue;  
			            }  
			            strBuilder.append("<").append(key.toString()).append(">");  
			            Object value = contentMap.get(key);
			            strBuilder.append(value.toString());
			            strBuilder.append("</").append(key.toString()).append(">");  
			        }  
			        strBuilder.append("</xml>");  
				String result= 	prepayId(gen_prepay_url_1, "POST",strBuilder.toString()).toString();
				System.err.println("result==="+result);
				Map<String,String> map=XMLUtil.doXMLParse(result);//调用统一接口返回的值转换为XML格式
				System.out.println(map);
				TreeMap<String, String> wxPayParamMap = new TreeMap<String, String>();
				wxPayParamMap.put("appId", WechatShareUtil.NATIVE_APP_ID);
				wxPayParamMap.put("timeStamp",timeStamp );	
				System.err.println("timeStamp==="+timeStamp);
				wxPayParamMap.put("nonceStr",noceStr); 
				System.err.println("noceStr==="+noceStr);
				wxPayParamMap.put("package", "prepay_id="+map.get("prepay_id"));
				System.err.println("map.get(prepay_id)==="+map.get("prepay_id"));
				wxPayParamMap.put("signType", "MD5");
				String paySign=WeiXinSignAndPackage.createPaySign(wxPayParamMap);//支付得到的签名
				wxPayParamMap.put("paySign", paySign);	
				wxPayParamMap.put("payMoney", total_fee);//到前段显示使用，支付不需要此参数
				
				
				return wxPayParamMap;
			}

		
		public static Map jsApi(){
			Map map=new HashMap();
			String noceStr=Sha1Util.getNonceStr();//随机字符串
			String timeStamp=Sha1Util.getTimeStamp();//时间戳
			String ticket=getTicket(NATIVE_APP_ID,NATIVE_SECRET);//时间戳
			System.err.println("ticket="+ticket);
			System.err.println("noceStr="+noceStr);
			System.err.println("timeStamp="+timeStamp);
			map.put("nonceStr", noceStr);
			map.put("timestamp", timeStamp);
			map.put("appId", NATIVE_APP_ID);
		
			HashMap<String, String> contentMap = new HashMap();
			contentMap.put("url","http://www.echefu.cc/wap/member/setting/index"); 
			contentMap.put("timestamp",timeStamp); 
			contentMap.put("noncestr",noceStr); 
			contentMap.put("jsapi_ticket",ticket); // 用户标识
			String sign=null;
			try {
				sign = GetSignature(contentMap);
			} catch (SDKRuntimeException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			map.put("signature", sign);
			System.err.println(sign);
			return map;
		}
		
	public static void main(String[] args)  {
		String noceStr=Sha1Util.getNonceStr();//随机字符串
		String timeStamp=Sha1Util.getTimeStamp();//时间戳
		String ticket=getTicket(NATIVE_APP_ID,NATIVE_SECRET);//时间戳
		System.err.println("ticket="+ticket);
		System.err.println("noceStr="+noceStr);
		System.err.println("timeStamp="+timeStamp);

		HashMap<String, String> contentMap = new HashMap();
		contentMap.put("url","http://www.echefu.cc/wap/"); 
		contentMap.put("timestamp",timeStamp); 
		contentMap.put("noncestr",noceStr); 
		contentMap.put("jsapi_ticket",ticket); // 用户标识
		String sign=null;
		try {
			sign = GetSignature(contentMap);
		} catch (SDKRuntimeException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.err.println(sign);
	}
		
		
		
}

