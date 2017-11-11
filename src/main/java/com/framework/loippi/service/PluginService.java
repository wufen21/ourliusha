package com.framework.loippi.service;

import java.util.List;

import com.framework.loippi.plugins.pc.PaymentPlugin;
import com.framework.loippi.plugins.sms.SmsPlugin;
import com.framework.loippi.plugins.storage.StoragePlugin;

/**
 * Service - 插件
 * 
 * @author Mounate Yan。
 * @version 1.0
 */
public interface PluginService {
	
	/**
	 * 获取短信插件
	 * 
	 * @return 短信插件
	 */
	List<SmsPlugin> getSmsPlugins();
	
	/**
	 * 获取支付插件
	 * 
	 * @return 支付插件
	 */
	List<PaymentPlugin> getPaymentPlugins();

	/**
	 * 获取存储插件
	 * 
	 * @return 存储插件
	 */
	List<StoragePlugin> getStoragePlugins();

	/**
	 * 获取存储插件
	 * 
	 * @param id
	 *            ID
	 * @return 存储插件
	 */
	StoragePlugin getStoragePlugin(String id);
	
	/**
	 * 获取支付插件
	 * 
	 * @param id
	 *            ID
	 * @return 支付插件
	 */
	PaymentPlugin getPaymentPlugin(String id);
	
	/**
	 * 获取短信插件
	 * 
	 * @param id
	 *            ID
	 * @return 短信插件
	 */
	SmsPlugin getSmsPlugin(String id);
	
	/**
	 * 获取支付插件
	 * 
	 * @param isEnabled
	 *            是否启用
	 * @return 支付插件
	 */
	List<PaymentPlugin> getPaymentPlugins(boolean isEnabled);
	
	
	/**
	 * 获取短信插件
	 * 
	 * @param isEnabled
	 *            是否启用
	 * @return 短信插件
	 */
	List<SmsPlugin> geSmsPlugins(boolean isEnabled);
	
	
	/**
	 * 获取存储插件
	 * 
	 * @param isEnabled
	 *            是否启用
	 * @return 存储插件
	 */
	List<StoragePlugin> getStoragePlugins(boolean isEnabled);

	


}