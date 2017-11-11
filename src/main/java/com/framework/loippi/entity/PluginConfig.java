package com.framework.loippi.entity;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.framework.loippi.mybatis.eitity.GenericEntity;
import com.framework.loippi.mybatis.ext.annotation.Column;
import com.framework.loippi.mybatis.ext.annotation.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
/**
 * Entity - 插件配置
 * 
 * @author Loippi Team
 * @version 2.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "T_SYSTEM_PLUGIN_CONFIG")
public class PluginConfig implements GenericEntity {

	private static final long serialVersionUID = -4357367409438384806L;

	/** ID */
	@Column(id = true, name = "ID", updatable = false)
	private Long id;

	/** 插件ID */
	@Column(name = "PLUGIN_ID")
	private String pluginId;

	/** 是否启用 */
	@Column(name = "IS_ENABLED")
	private Integer enabled;

	/** 属性 */
	private List<PluginConfigAttribute> attributes = new ArrayList<PluginConfigAttribute>();
	
	/**
	 * 获取属性值
	 * 
	 * @param name
	 *            属性名称
	 * @return 属性值
	 */
	public String getAttribute(String name) {
		if (getAttributes() != null && name != null) {
			for (PluginConfigAttribute pluginConfigAttribute : getAttributes()) {
				if(pluginConfigAttribute.getName().equals(name)){
					return pluginConfigAttribute.getAttribute();
				}
			}
		} 
		return null;
	}
	
	
	/**
	 * 获取属性值
	 * 
	 * @param name
	 *            属性名称
	 * @return 属性值
	 */
	public Map<String, String> getAttributesMap() {
		Map<String, String> attributesMap = new HashMap<String, String>();
		for (PluginConfigAttribute pluginConfigAttribute : attributes) {
			attributesMap.put(pluginConfigAttribute.getName(), pluginConfigAttribute.getAttribute());
		}
		return attributesMap;
	}
	
}