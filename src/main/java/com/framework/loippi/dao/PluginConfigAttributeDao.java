package com.framework.loippi.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.framework.loippi.entity.PluginConfigAttribute;
import com.framework.loippi.mybatis.dao.GenericDao;

/**
 * DAO - PluginConfigAttribute(插件属性)
 * 
 * @author Loippi Team
 * @version 2.0
 */
public interface PluginConfigAttributeDao extends GenericDao<PluginConfigAttribute, Long> {

	/**
	 * 根据插件编号获取所有配置属性
	 * 
	 * @param pluginId
	 * @return
	 */
	public List<PluginConfigAttribute> findByPluginId(@Param("pluginId") String pluginId);
	
	
	/**
	 * 删除插件属性
	 * 
	 * @param pluginId
	 *            插件编号
	 */
	public void deleteByPluginId(@Param("pluginId") String pluginId);
}
