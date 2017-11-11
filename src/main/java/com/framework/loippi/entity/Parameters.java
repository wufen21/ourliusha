package com.framework.loippi.entity;

import com.framework.loippi.mybatis.eitity.GenericEntity;
import com.framework.loippi.mybatis.ext.annotation.Column;
import com.framework.loippi.mybatis.ext.annotation.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Entity - 接口参数
 * 
 * @author Loippi Team
 * @version 2.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "T_API_PARAMETERS")
public class Parameters implements GenericEntity {

	private static final long serialVersionUID = 5081846432919091193L;

	/** 编号 */
	@Column(id = true, name = "ID", updatable = false)
	private Long id;
	
	/** 参数名称 */
	@Column(name = "NAME" )
	private String name;
	
	/** 参数说明 */
	@Column(name = "REMARK" )
	private String remark;
	
	/** 参数类型 */
	@Column(name = "TYPE" )
	private String type;
	
	/** 关联接口 */
	@Column(name = "INTERFACER_ID" )
	private Long interfacerId;
	
}
