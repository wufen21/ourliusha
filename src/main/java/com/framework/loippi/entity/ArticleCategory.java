package com.framework.loippi.entity;

import com.framework.loippi.mybatis.eitity.GenericEntity;
import com.framework.loippi.mybatis.ext.annotation.Column;
import com.framework.loippi.mybatis.ext.annotation.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
/**
 * Entity - 文章分类
 * 
 * @author Loippi Team
 * @version 1.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "T_JW_ARTICLE_CATEGORY")
public class ArticleCategory implements GenericEntity {
	
	private static final long serialVersionUID = 7417939720032745291L;

	private Long unReadCount = 0l;
	
	/** ID */
	@Column(id = true, name = "ID", updatable = false)
	private Long id;
	
	/** 名称 */
	@Column(name="NAME")
	private String name;
	
	/** 图片 */
	@Column(name="IMAGE")
	private String image;
	
	/** 备注 */
	@Column(name="MEMO")
	private String memo;
	
	
}
