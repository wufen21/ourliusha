package com.framework.loippi.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.framework.loippi.dao.PluginConfigAttributeDao;
import com.framework.loippi.entity.PluginConfigAttribute;
import com.framework.loippi.service.PluginConfigAttributeService;

/**
 * SERVICE - PluginConfigAttribute(插件属性)
 * 
 * @author Loippi Team
 * @version 2.0
 */
@Service
public class PluginConfigAttributeServiceImpl extends GenericServiceImpl<PluginConfigAttribute, Long> implements PluginConfigAttributeService {
	
	@Autowired
	private PluginConfigAttributeDao pluginConfigAttributeDao;
	
	
	@Autowired
	public void setGenericDao() {
		super.setGenericDao(pluginConfigAttributeDao);
	}
	
	
	/**
	 * 删除插件属性
	 * 
	 * @param pluginId
	 *            插件编号
	 */
	public void deleteByPluginId(String pluginId){
		this.pluginConfigAttributeDao.deleteByPluginId(pluginId);
	}
}
