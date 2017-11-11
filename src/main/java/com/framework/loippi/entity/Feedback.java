package com.framework.loippi.entity;

import java.util.Date;

import com.framework.loippi.mybatis.eitity.GenericEntity;
import com.framework.loippi.mybatis.ext.annotation.Column;
import com.framework.loippi.mybatis.ext.annotation.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Entity - 反馈
 * 
 * @author Loippi Team
 * @version 1.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "T_JW_FEEDBACK")
public class Feedback implements GenericEntity {

	private static final long serialVersionUID = -7858510769631291729L;

	/** ID */
	@Column(id = true, name = "ID", updatable = false)
	private Long id;

	/** 创建日期 */
	@Column(name = "CREATE_DATE")
	private Date createDate;

	/** 会员 */
	@Column(name = "MOBILE")
	private String mobile;

	/** 内容 */
	@Column(name = "CONTENT")
	private String content;

	/** IP */
	@Column(name = "IP")
	private String ip;
}
