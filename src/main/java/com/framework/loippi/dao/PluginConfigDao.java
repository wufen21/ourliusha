package com.framework.loippi.dao;

import org.apache.ibatis.annotations.Param;

import com.framework.loippi.entity.PluginConfig;
import com.framework.loippi.mybatis.dao.GenericDao;

/**
 * DAO - PluginConfig(插件配置)
 * 
 * @author Loippi Team
 * @version 2.0
 */
public interface PluginConfigDao  extends GenericDao<PluginConfig, Long> {

	/**
	 * 根据插件ID查找插件配置
	 * 
	 * @param pluginId
	 *            插件ID
	 * @return 插件配置，若不存在则返回null
	 */
	PluginConfig findByPluginId(@Param("pluginId")String pluginId);
}
