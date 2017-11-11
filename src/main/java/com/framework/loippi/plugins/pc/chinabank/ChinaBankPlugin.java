package com.framework.loippi.plugins.pc.chinabank;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.stereotype.Component;

import com.framework.loippi.entity.Payment;
import com.framework.loippi.entity.PluginConfig;
import com.framework.loippi.plugins.pc.PaymentPlugin;

/**
 * Plugin - 网银在线支付
 * 
 * @author Loippi Team
 * @version 2.0
 */
@Component("chinaBankPlugin")
public class ChinaBankPlugin extends PaymentPlugin {

	/** 货币 */
	private static final String CURRENCY = "CNY";

	@Override
	public String getName() {
		return "网银在线支付";
	}

	@Override
	public String getVersion() {
		return "2.0";
	}

	@Override
	public String getAuthor() {
		return "Loippi Team";
	}

	@Override
	public String getSiteUrl() {
		return "http://www.chinabank.com.cn";
	}

	@Override
	public String getInstallUrl() {
		return "chinabank/install.jhtml";
	}

	@Override
	public String getUninstallUrl() {
		return "chinabank/uninstall.jhtml";
	}

	@Override
	public String getSettingUrl() {
		return "chinabank/setting.jhtml";
	}

	@Override
	public String getRequestUrl() {
		return "https://pay3.chinabank.com.cn/PayGate";
	}

	@Override
	public RequestMethod getRequestMethod() {
		return RequestMethod.post;
	}

	@Override
	public String getRequestCharset() {
		return "UTF-8";
	}

	@Override
	public Map<String, Object> getParameterMap(String sn, String description,
			HttpServletRequest request) {
		PluginConfig pluginConfig = getPluginConfig();
		Payment payment = getPayment(sn);
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		parameterMap.put("v_mid", pluginConfig.getAttribute("partner"));
		parameterMap.put("v_oid", sn);
		parameterMap.put("v_amount", payment.getAmount().toString());
		parameterMap.put("v_moneytype", CURRENCY);
		parameterMap.put("v_url", getNotifyUrl(sn, NotifyMethod.sync));
		parameterMap.put("v_md5info", generateSign(parameterMap));
		return parameterMap;
	}

	@Override
	public boolean verifyNotify(String sn, NotifyMethod notifyMethod,
			HttpServletRequest request) {
		PluginConfig pluginConfig = getPluginConfig();
		
		String mdt = DigestUtils.md5Hex(request.getParameter("v_oid")+request.getParameter("v_pstatus")+ request.getParameter("v_amount")+request.getParameter("v_moneytype")+pluginConfig.getAttribute("key"));
		
		boolean flag = request.getParameter("v_md5str").toString().trim().equals(mdt.toUpperCase().trim()) && request.getParameter("v_pstatus").trim().equals("20");
		
		return flag;
	}

	@Override
	public String getNotifyMessage(String sn, NotifyMethod notifyMethod,
			HttpServletRequest request) {
		return null;
	}

	@Override
	public Integer getTimeout() {
		return 21600;
	}

	/**
	 * 生成签名
	 * 
	 * @param parameterMap
	 *            参数
	 * @return 签名
	 */
	private String generateSign(Map<String, ?> parameterMap) {
		PluginConfig pluginConfig = getPluginConfig();
		return DigestUtils.md5Hex(parameterMap.get("v_amount").toString()+parameterMap.get("v_moneytype").toString()+
				parameterMap.get("v_oid").toString()+ parameterMap.get("v_mid").toString()+
				parameterMap.get("v_url").toString()+pluginConfig.getAttribute("key")).toUpperCase();
	}
	
}
