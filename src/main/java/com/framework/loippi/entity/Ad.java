package com.framework.loippi.entity;

import java.util.Date;

import com.framework.loippi.mybatis.eitity.GenericEntity;
import com.framework.loippi.mybatis.ext.annotation.Column;
import com.framework.loippi.mybatis.ext.annotation.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Entity - 广告
 * 
 * @author Loippi Team
 * @version 1.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "T_JW_AD")
public class Ad implements GenericEntity {
	private static final long serialVersionUID = 5081846432919091193L;

	/** ID */
	@Column(id = true, name = "ID", updatable = false)
	private Long id;

	/** 创建时间 */
	@Column(name = "CREATE_DATE")
	private Date createDate;

	/** 排序 */
	@Column(name = "SORTS")
	private Integer sorts = 0;

	/** 连接 */
	@Column(name = "URL")
	private String url;

	/** 标题 */
	@Column(name = "TITLE")
	private String title;
	
	/** 图片 */
	@Column(name = "IMAGE")
	private String image;

	/** 开始时间 */
	@Column(name = "START_DATE")
	private Date startDate;

	/** 结束时间 */
	@Column(name = "END_DATE")
	private Date endDate;

	/** 创建者 */
	@Column(name = "CREATOR")
	private Long creator;
}
