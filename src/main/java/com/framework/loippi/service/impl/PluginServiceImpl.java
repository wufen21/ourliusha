package com.framework.loippi.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.collections.Predicate;
import org.springframework.stereotype.Service;

import com.framework.loippi.plugins.pc.PaymentPlugin;
import com.framework.loippi.plugins.sms.SmsPlugin;
import com.framework.loippi.plugins.storage.StoragePlugin;
import com.framework.loippi.service.PluginService;

/**
 * Service - 插件
 * 
 * @author Mounate Yan。
 * @version 1.0
 */
@Service("pluginServiceImpl")
public class PluginServiceImpl implements PluginService {

	@Resource
	private List<PaymentPlugin> paymentPlugins = new ArrayList<PaymentPlugin>();

	@Resource
	private List<StoragePlugin> storagePlugins = new ArrayList<StoragePlugin>();
	
	
	@Resource
	private List<SmsPlugin> smsPlugins = new ArrayList<SmsPlugin>();

	@Resource
	private Map<String, StoragePlugin> storagePluginMap = new HashMap<String, StoragePlugin>();

	@Resource
	private Map<String, PaymentPlugin> paymentPluginMap = new HashMap<String, PaymentPlugin>();
	
	@Resource
	private Map<String, SmsPlugin> smsPluginMap = new HashMap<String, SmsPlugin>();

	public List<PaymentPlugin> getPaymentPlugins() {
		return paymentPlugins;
	}

	public List<StoragePlugin> getStoragePlugins() {
		return storagePlugins;
	}

	public List<StoragePlugin> getStoragePlugins(final boolean isEnabled) {
		List<StoragePlugin> result = new ArrayList<StoragePlugin>();
		CollectionUtils.select(storagePlugins, new Predicate() {
			public boolean evaluate(Object object) {
				StoragePlugin storagePlugin = (StoragePlugin) object;
				return storagePlugin.getIsEnabled() == isEnabled;
			}
		}, result);
		return result;
	}

	public List<PaymentPlugin> getPaymentPlugins(final boolean isEnabled) {
		List<PaymentPlugin> result = new ArrayList<PaymentPlugin>();
		CollectionUtils.select(paymentPlugins, new Predicate() {
			public boolean evaluate(Object object) {
				PaymentPlugin paymentPlugin = (PaymentPlugin) object;
				return paymentPlugin.getEnabled() == isEnabled;
			}
		}, result);
		return result;
	}

	public StoragePlugin getStoragePlugin(String id) {
		return storagePluginMap.get(id);
	}

	public PaymentPlugin getPaymentPlugin(String id) {
		return paymentPluginMap.get(id);
	}

	@Override
	public List<SmsPlugin> getSmsPlugins() {
		return smsPlugins;
	}

	@Override
	public SmsPlugin getSmsPlugin(String id) {
		return smsPluginMap.get(id);
	}

	@Override
	public List<SmsPlugin> geSmsPlugins(final boolean isEnabled) {
		List<SmsPlugin> result = new ArrayList<SmsPlugin>();
		CollectionUtils.select(paymentPlugins, new Predicate() {
			public boolean evaluate(Object object) {
				SmsPlugin smsPlugin = (SmsPlugin) object;
				return smsPlugin.getIsEnabled() == isEnabled;
			}
		}, result);
		return result;
	}
}