package com.framework.loippi.utils.wechat.utils;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.framework.loippi.plugins.mobile.MobilePaymentPlugin.NotifyMethod;
import com.framework.loippi.utils.doc.JsonUtils;

/**
 * Plugin - 微信手机支付
 * 
 * @author Loippi Team
 * @version 2.0
 */
public class WeixinMobilePaymentPlugin  {

	protected final Logger logger = LoggerFactory.getLogger(getClass());

	
	private static HashMap<String, String> parameters = new HashMap<String, String>();
	public static final String BASE_URL = "http://119.23.20.116:8022/sleep";
	public static final String WECHAT_SIGN_TYPE = "sha1";
	
	/**
	 * App支付
	 */
	public static final String WECHAT_APP_ID = "wx2eeb6e4ac902c950";
	public static final String WECHAT_SECRET = "681bb138b1dc064b93809b6555cf0126";
	public static final String PartnerKey = "1480777572";
	
	/**
	 * 原生公众号支付
	 */
	public static final String NATIVE_PARTNER_KEY = "1247904001";//
	public static final String NATIVE_APP_ID = "wxce89c9f7e34219b3";//公众好APPID
	public static final String NATIVE_SECRET = "075d0b7556b29f1dafa8ac350acfc919";
	
	//在商户平台 里面 设置好的 api秘钥
	public static final String WECHAT_APP_PAY_SIGN_KEY = "681bb138b1dc064b93809b6555cf0126";

	public static final String pay_unifiedorder=  "https://api.mch.weixin.qq.com/pay/unifiedorder";

	
	public static Map getPrepaySn(AppOrder order, String description,
			HttpServletRequest request) {
		
		
		HashMap<String, String> parameterMap = new HashMap<String, String>();
		parameterMap.put("appid",WECHAT_APP_ID);
		parameterMap.put("body",
				StringUtils.abbreviate(description.replaceAll(
						"[^0-9a-zA-Z\\u4e00-\\u9fa5 ]", ""), 600));
		parameterMap.put("mch_id", PartnerKey);
		parameterMap.put("out_trade_no",  order.getOrderCode());
		parameterMap.put("total_fee",order.getPay().multiply(new BigDecimal(100)).intValue()+"");
		parameterMap.put("notify_url",BASE_URL + "/api/app/notify/notify/"
				+ order.getOrderSessionId() + "/wechat" + ".json");
		parameterMap.put("spbill_create_ip","120.24.230.80");
		parameterMap.put("nonce_str", WeixinUtils.createNoncestr());
		parameterMap.put("trade_type", "APP");
	//	parameterMap.put("limit_pay", "no_credit");
		parameterMap.put("sign", WeixinUtils.sign(
				WeixinUtils.FormatBizQueryParaMap(parameterMap, false),
				WECHAT_APP_PAY_SIGN_KEY));
		
		Map<String, String> parameters = parameterMap;
		
		
		StringBuilder strBuilder = new StringBuilder();
		strBuilder.append("<xml>");
		Set<String> objSet = parameters.keySet();
		for (Object key : objSet) {
			if (key == null) {
				continue;
			}
			strBuilder.append("<").append(key.toString()).append(">");
			Object value = parameters.get(key);
			strBuilder.append(value.toString());
			strBuilder.append("</").append(key.toString()).append(">");
		}
		
		System.err.println("weixin pay  strBuilder.toString()="+strBuilder.toString());
		strBuilder.append("</xml>");
		String xml = WeixinUtils.request(pay_unifiedorder, "POST",
				strBuilder.toString()).toString();
		
		System.err.println("weixin pay="+xml);
		if (StringUtils.isNotEmpty(xml) && xml.indexOf("SUCCESS") != -1) {
			if (xml.indexOf("prepay_id") != -1) {
				String prepayid = WeixinUtils.getJsonValue(xml, "prepay_id");
						
				HashMap<String, String> parameterMap2 = new HashMap<String, String>();
				parameterMap2.put("appid",WECHAT_APP_ID);
				parameterMap2.put("partnerid", PartnerKey);
				parameterMap2.put("prepayid", prepayid);
				parameterMap2.put("package", "Sign=WXPay");
				parameterMap2.put("noncestr", parameters.get("nonce_str"));
				parameterMap2.put("timestamp", WeixinUtils.getTimeStamp());
				parameterMap2.put("sign", WeixinUtils.sign(
						WeixinUtils.FormatBizQueryParaMap(parameterMap2, false),
						WECHAT_APP_PAY_SIGN_KEY));

				return parameterMap2;
			}
		}
		return null;
	}

	public static Map getPrepaySn2(AppOrder order, String description,
			HttpServletRequest request) {
		
		
		HashMap<String, String> parameterMap = new HashMap<String, String>();
		parameterMap.put("appid",WECHAT_APP_ID);
		parameterMap.put("body",
				StringUtils.abbreviate(description.replaceAll(
						"[^0-9a-zA-Z\\u4e00-\\u9fa5 ]", ""), 600));
		parameterMap.put("mch_id", PartnerKey);
		parameterMap.put("out_trade_no",  order.getOrderCode());
		parameterMap.put("total_fee",order.getPay().multiply(new BigDecimal(100)).intValue()+"");
		parameterMap.put("notify_url",BASE_URL + "/api/app/depositnotify/notify/"
				+ order.getOrderSessionId() + "/wechat" + ".json");
		parameterMap.put("spbill_create_ip","120.24.230.80");
		parameterMap.put("nonce_str", WeixinUtils.createNoncestr());
		parameterMap.put("trade_type", "APP");
		parameterMap.put("sign", WeixinUtils.sign(
				WeixinUtils.FormatBizQueryParaMap(parameterMap, false),
				WECHAT_APP_PAY_SIGN_KEY));
		
		Map<String, String> parameters = parameterMap;
		
		
		StringBuilder strBuilder = new StringBuilder();
		strBuilder.append("<xml>");
		Set<String> objSet = parameters.keySet();
		for (Object key : objSet) {
			if (key == null) {
				continue;
			}
			strBuilder.append("<").append(key.toString()).append(">");
			Object value = parameters.get(key);
			strBuilder.append(value.toString());
			strBuilder.append("</").append(key.toString()).append(">");
		}
		strBuilder.append("</xml>");
		String xml = WeixinUtils.request(pay_unifiedorder, "POST",
				strBuilder.toString()).toString();
		
		System.err.println("weixin pay="+xml);
		if (StringUtils.isNotEmpty(xml) && xml.indexOf("SUCCESS") != -1) {
			if (xml.indexOf("prepay_id") != -1) {
				String prepayid = WeixinUtils.getJsonValue(xml, "prepay_id");
						
				HashMap<String, String> parameterMap2 = new HashMap<String, String>();
				parameterMap2.put("appid",WECHAT_APP_ID);
				parameterMap2.put("partnerid", PartnerKey);
				parameterMap2.put("prepayid", prepayid);
				parameterMap2.put("package", "Sign=WXPay");
				parameterMap2.put("noncestr", parameters.get("nonce_str"));
				parameterMap2.put("timestamp", WeixinUtils.getTimeStamp());
				parameterMap2.put("sign", WeixinUtils.sign(
						WeixinUtils.FormatBizQueryParaMap(parameterMap2, false),
						WECHAT_APP_PAY_SIGN_KEY));

				return parameterMap2;
			}
		}
		return null;
	}

	public static void main(String[] args) {
		
		AppOrder order=new AppOrder();
		order.setPay(new BigDecimal(1));
		order.setOrderCode(System.currentTimeMillis()+"");
		order.setOrderSessionId(System.currentTimeMillis()+"");
		
		
		
		WeixinMobilePaymentPlugin.getPrepaySn(order,"description",null);
		
	}


//	@Override
//	public String getName() {
//		return "微信手机支付";
//	}
//
//	@Override
//	public String getVersion() {
//		return "2.0";
//	}
//
//	@Override
//	public String getAuthor() {
//		return "Loippi Team";
//	}
//
//	@Override
//	public String getSiteUrl() {
//		return "https://pay.weixin.qq.com/wiki/doc/api/index.html";
//	}
//
//	@Override
//	public String getInstallUrl() {
//		return "weixin/install.jhtml";
//	}
//
//	@Override
//	public String getUninstallUrl() {
//		return "weixin/uninstall.jhtml";
//	}
//
//	@Override
//	public String getSettingUrl() {
//		return "weixin/setting.jhtml";
//	}
//
//	@Override

//
//	public String getRefundUrl() {
//		return "https://api.mch.weixin.qq.com/secapi/pay/refund";
//	}
//
//	@Override
//	public String getRequestCharset() {
//		return null;
//	}
	

//	@Override
//	public boolean verifyNotify(String sn, HttpServletRequest request) {
//		return true;
//	}
//
//	@Override
//	public String getNotifyMessage(String sn, HttpServletRequest request) {
//		return "success";
//	}
//
//	@Override
//	public Integer getTimeout() {
//		return null;
//	}

	public String getPrepaySn(Long memberId, Long id, Integer count,
			String description, Long addressId, HttpServletRequest request) {
//		try {
//			PluginConfig pluginConfig = getPluginConfig();
//			String key = XDigestUtils.initKey();
//			byte[] inputData = (memberId + "," + id + "," + count + ","
//					+ 2 + "," + addressId).getBytes();
//			inputData = XDigestUtils.encrypt(inputData, key);
//			HashMap<String, String> parameterMap = new HashMap<String, String>();
//			parameterMap.put("appid", pluginConfig.getAttribute("appId"));
//			parameterMap.put("body", StringUtils.abbreviate(
//					description.replaceAll("[^0-9a-zA-Z\\u4e00-\\u9fa5 ]", ""),
//					600));
//			parameterMap.put("mch_id", pluginConfig.getAttribute("mchId"));
//			parameterMap.put("out_trade_no", System.currentTimeMillis() + "");
//			parameterMap.put("total_fee", count * 100 + "");
//			parameterMap.put("notify_url","/payment/notify/" + key + ".jhtml");
//			parameterMap.put("spbill_create_ip", request.getRemoteAddr());
//			parameterMap.put("nonce_str", WeixinUtils.createNoncestr());
//			parameterMap.put("trade_type", "APP");
//			parameterMap.put("sign", WeixinUtils.sign(
//					WeixinUtils.FormatBizQueryParaMap(parameterMap, false),
//					pluginConfig.getAttribute("signKey")));
//			StringBuilder strBuilder = new StringBuilder();
//			strBuilder.append("<xml>");
//			Set<String> objSet = parameterMap.keySet();
//			for (Object object : objSet) {
//				if (object == null) {
//					continue;
//				}
//				strBuilder.append("<").append(object.toString()).append(">");
//				Object value = parameterMap.get(object);
//				strBuilder.append(value.toString());
//				strBuilder.append("</").append(object.toString()).append(">");
//			}
//			strBuilder.append("</xml>");
//			String xml = WeixinUtils.request(getRequestUrl(), "POST",
//					strBuilder.toString()).toString();
//			if (StringUtils.isNotEmpty(xml) && xml.indexOf("SUCCESS") != -1) {
//				try {
//					return WeixinUtils.toJson(xml);
//				} catch (JDOMException e) {
//					e.printStackTrace();
//				} catch (IOException e) {
//					e.printStackTrace();
//				}
//			}
//		} catch (Exception e) {
//		}

		return null;
	}

	public boolean refundApply(String sn, HttpServletRequest request) {
//		PluginConfig pluginConfig = getPluginConfig();
//		Payment payment = getPayment(sn);
//		HashMap<String, String> parameterMap = new HashMap<String, String>();
//		parameterMap.put("appid", pluginConfig.getAttribute("appId"));
//		parameterMap.put("mch_id", pluginConfig.getAttribute("mchId"));
//		parameterMap.put("out_trade_no", sn);
//		parameterMap.put("total_fee",
//				payment.getAmount().multiply(new BigDecimal(100)).intValue()
//						+ "");
//		parameterMap.put("refund_fee",
//				payment.getAmount().multiply(new BigDecimal(100)).intValue()
//						+ "");
//		parameterMap.put("out_refund_no", System.currentTimeMillis() + "");
//		parameterMap.put("op_user_id", pluginConfig.getAttribute("mchId"));
//		parameterMap.put("nonce_str", WeixinUtils.createNoncestr());
//		parameterMap.put("sign", WeixinUtils.sign(
//				WeixinUtils.FormatBizQueryParaMap(parameterMap, false),
//				pluginConfig.getAttribute("signKey")));
//
//		StringBuilder strBuilder = new StringBuilder();
//		strBuilder.append("<xml>");
//		Set<String> objSet = parameterMap.keySet();
//		for (Object key : objSet) {
//			if (key == null) {
//				continue;
//			}
//			strBuilder.append("<").append(key.toString()).append(">");
//			Object value = parameterMap.get(key);
//			strBuilder.append(value.toString());
//			strBuilder.append("</").append(key.toString()).append(">");
//		}
//		strBuilder.append("</xml>");
//		String xml = WeixinUtils.requestSSL(getRefundUrl(),
//				pluginConfig.getAttribute("certPath"),
//				pluginConfig.getAttribute("mchId"), "POST",
//				strBuilder.toString()).toString();
//		if (StringUtils.isNotEmpty(xml) && xml.indexOf("SUCCESS") != -1) {
//
//			String resultCode = WeixinUtils.getJsonValue(xml, "result_code");
//			if ("SUCCESS".equalsIgnoreCase(resultCode)) {
//				logger.info("微信退款申请成功");
//				return true;
//			} else {
//				logger.error("微信退款申请失败--err_code_des:"
//						+ WeixinUtils.getJsonValue(xml, "err_code_des"));
//				return false;
//
//			}
//
//		}
		return false;
	}
	
	/**
	 * 获取通知URL
	 * 
	 * @param sn
	 *            编号
	 * @param notifyMethod
	 *            通知方法
	 * @return 通知URL
	 */
	protected String getNotifyUrl(String sn, NotifyMethod notifyMethod) {

		return  "/payment/notify/" + notifyMethod + "/" + sn + ".jhtml";
	}

}
