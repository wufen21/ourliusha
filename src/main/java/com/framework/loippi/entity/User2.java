package com.framework.loippi.entity;

import com.framework.loippi.mybatis.eitity.GenericEntity;
import com.framework.loippi.mybatis.ext.annotation.Column;
import com.framework.loippi.mybatis.ext.annotation.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Entity - user2
 * 
 * @author wgb
 * @version 2.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "T_TEST_USER2")
public class User2 implements GenericEntity {

	private static final long serialVersionUID = 5081846432919091193L;

	/** ID */
	@Column(id = true, name = "id", updatable = false)
	private Long id;
	
	/** 姓名 */
	@Column(name = "name" )
	private String name;
	
	/** 创建时间 */
	@Column(name = "CREATE_DATE" )
	private java.util.Date createDate;
	
}
