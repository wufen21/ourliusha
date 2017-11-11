package com.framework.loippi.entity;

import com.framework.loippi.mybatis.eitity.GenericEntity;
import com.framework.loippi.mybatis.ext.annotation.Column;
import com.framework.loippi.mybatis.ext.annotation.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Entity - 返回值
 * 
 * @author Loippi Team
 * @version 2.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "T_API_RESULTS")
public class Results implements GenericEntity {

	private static final long serialVersionUID = 5081846432919091193L;

	/** 编号 */
	@Column(id = true, name = "ID", updatable = false)
	private Long id;
	
	/** 名称 */
	@Column(name = "NAME" )
	private String name;
	
	/** 说明 */
	@Column(name = "REMARK" )
	private String remark;
	
	/** 类型 */
	@Column(name = "TYPE" )
	private String type;
	
	/** Debug 返回值 */
	@Column(name = "DEBUG_VALUES")
	private String values;
	
	/** 关联接口 */
	@Column(name = "INTERFACER_ID" )
	private Long interfacerId;
	
	/** 上级返回值编号 */
	@Column(name = "PARENT_ID" )
	private Long parentId;
	
}
