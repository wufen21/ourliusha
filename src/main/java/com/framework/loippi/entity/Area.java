package com.framework.loippi.entity;

import java.util.Date;

import com.framework.loippi.mybatis.eitity.GenericEntity;
import com.framework.loippi.mybatis.ext.annotation.Column;
import com.framework.loippi.mybatis.ext.annotation.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Entity - 区域
 * 
 * @author Loippi Team
 * @version 1.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "T_SYSTEM_AREA")
public class Area implements GenericEntity {

	private static final long serialVersionUID = -1828187541642897081L;

	/** ID */
	@Column(id = true, name = "ID", updatable = false)
	private Long id;

	/** 创建时间 */
	@Column(name = "CREATE_DATE")
	private Date createDate;
	
	/** 名称 */
	@Column(name = "NAME")
	private String name;
	
	/** 区域全称 */
	@Column(name = "FULL_NAME")
	private String fullName;
	
	/** 树路径 */
	@Column(name = "TREE_PATH")
	private String treePath;
	
	/** 父级区域 */
	@Column(name = "PARENT_ID")
	private Long parentId;

}
