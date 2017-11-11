package com.framework.loippi.service;

import java.util.Map;

import com.framework.loippi.entity.PluginConfig;

/**
 * SERVICE - PluginConfig(插件配置)
 * 
 * @author Loippi Team
 * @version 2.0
 */
public interface PluginConfigService extends GenericService<PluginConfig, Long> {
	/**
	 * 判断插件ID是否存在
	 * 
	 * @param pluginId
	 *            插件ID
	 * @return 插件ID是否存在
	 */
	boolean pluginIdExists(String pluginId);

	/**
	 * 根据插件ID查找插件配置
	 * 
	 * @param pluginId
	 *            插件ID
	 * @return 插件配置，若不存在则返回null
	 */
	PluginConfig findByPluginId(String pluginId);

	/**
	 * 修改插件配置以及属性
	 * 
	 * @param config
	 *            配置
	 * @param attributes
	 *            属性
	 */
	void updatePluginConfig(PluginConfig config, Map<String, String> attributes);
}
