package com.framework.loippi.entity;

import com.framework.loippi.mybatis.eitity.GenericEntity;
import com.framework.loippi.mybatis.ext.annotation.Column;
import com.framework.loippi.mybatis.ext.annotation.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Entity - 插件属性
 * 
 * @author Loippi Team
 * @version 2.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "T_SYSTEM_PLUGIN_CONFIG_ATTRIBUTE")
public class PluginConfigAttribute implements GenericEntity {

	private static final long serialVersionUID = 5081846432919091193L;
	
	/** ID */
	@Column(id = true, name = "ID", updatable = false)
	private Long id;

	/** 关联插件编号 */
	@Column(name = "PLUGIN_ID" )
	private String pluginId;
	
	/** 属性名 */
	@Column(name = "NAME" )
	private String name;
	
	/** 属性值 */
	@Column(name = "ATTRIBUTE" )
	private String attribute;

	public PluginConfigAttribute(String pluginId, String name, String attribute) {
		super();
		this.pluginId = pluginId;
		this.name = name;
		this.attribute = attribute;
	}
	
}
