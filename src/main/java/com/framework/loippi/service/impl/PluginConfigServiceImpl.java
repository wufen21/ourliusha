package com.framework.loippi.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.framework.loippi.dao.PluginConfigAttributeDao;
import com.framework.loippi.dao.PluginConfigDao;
import com.framework.loippi.entity.PluginConfig;
import com.framework.loippi.entity.PluginConfigAttribute;
import com.framework.loippi.service.PluginConfigService;

/**
 * SERVICE - PluginConfig(插件配置)
 * 
 * @author Loippi Team
 * @version 2.0
 */
@Service
public class PluginConfigServiceImpl extends GenericServiceImpl<PluginConfig, Long> implements PluginConfigService {
	
	@Autowired
	private PluginConfigDao pluginConfigDao;
	
	
	@Autowired
	private PluginConfigAttributeDao pluginConfigAttributeDao;
	
	
	@Autowired
	public void setGenericDao() {
		super.setGenericDao(pluginConfigDao);
	}
	
	
	@Transactional(readOnly = true)
	public boolean pluginIdExists(String pluginId) {
		return pluginConfigDao.findByPluginId(pluginId) == null ? false : true;
	}

	@Transactional(readOnly = true)
	public PluginConfig findByPluginId(String pluginId) {
		return pluginConfigDao.findByPluginId(pluginId);
	}


	@Override
	@Transactional
	public void updatePluginConfig(PluginConfig config, Map<String, String> attributes) {
		pluginConfigDao.update(config);
		// 清空已有属性
		pluginConfigAttributeDao.deleteByPluginId(config.getPluginId());
		for (Map.Entry<String, String> entry : attributes.entrySet()) {
			PluginConfigAttribute attribute = new PluginConfigAttribute(config.getPluginId(), entry.getKey(), entry.getValue());
			pluginConfigAttributeDao.insert(attribute);
		}
	}
}
