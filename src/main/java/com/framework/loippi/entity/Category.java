package com.framework.loippi.entity;

import java.util.ArrayList;
import java.util.List;

import com.framework.loippi.mybatis.eitity.GenericEntity;
import com.framework.loippi.mybatis.ext.annotation.Column;
import com.framework.loippi.mybatis.ext.annotation.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Entity - 接口分类
 * 
 * @author Loippi Team
 * @version 2.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "T_API_CATEGORY")
public class Category implements GenericEntity {

	private static final long serialVersionUID = 5081846432919091193L;

	/** 编号 */
	@Column(id = true, name = "ID", updatable = false)
	private Long id;
	
	/** 中文名称 */
	@Column(name = "NAME" )
	private String name;
	
	/** 模块名称 */
	@Column(name = "MODULE_NAME" )
	private String moduleName;
	
	/** UUID标识 */
	@Column(name = "UUID" )
	private String uuid;
	
	/** 排序 */
	@Column(name = "SORTS" )
	private Integer sorts;
	
	/** 图标 */
	@Column(name = "ICON" )
	private String icon;
	
	/** 描述 */
	@Column(name = "DESCRIPTION" )
	private String description;
	
	/** 创建时间 */
	@Column(name = "CREATE_DATE", updatable = false )
	private java.util.Date createDate;
	
	
	//接口数目
	private Integer counts;
	
	//接口列表
	private List<Interfacer> interfacers = new ArrayList<Interfacer>();
	
}
