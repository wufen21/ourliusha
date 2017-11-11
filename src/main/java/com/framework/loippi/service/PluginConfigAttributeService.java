package com.framework.loippi.service;

import com.framework.loippi.entity.PluginConfigAttribute;

/**
 * SERVICE - PluginConfigAttribute(插件属性)
 * 
 * @author Loippi Team
 * @version 2.0
 */
public interface PluginConfigAttributeService extends GenericService<PluginConfigAttribute, Long> {
	/**
	 * 删除插件属性
	 * 
	 * @param pluginId
	 *            插件编号
	 */
	public void deleteByPluginId(String pluginId);
}
