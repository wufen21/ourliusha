package com.framework.loippi.entity;

import java.util.Date;

import org.jsoup.Jsoup;

import com.framework.loippi.mybatis.eitity.GenericEntity;
import com.framework.loippi.mybatis.ext.annotation.Column;
import com.framework.loippi.mybatis.ext.annotation.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Entity - 文章
 * 
 * @author Loippi Team
 * @version 1.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "T_JW_ARTICLE")
public class Article implements GenericEntity {

	private static final long serialVersionUID = 4708111795696268541L;

	public static final String PROPERTY_UNREAD = "unRead";

	/** ID */
	@Column(id = true, name = "ID", updatable = false)
	private Long id;

	/** 创建时间 */
	@Column(name = "CREATE_DATE")
	private Date createDate;

	/** 标题 */
	@Column(name = "TITLE")
	private String title;

	/** 内容 */
	@Column(name = "CONTENT")
	private String content;

	/** 图片 */
	@Column(name = "IMAGE")
	private String image;

	/** 分类 */
	@Column(name = "ARTICLE_CATEGORY_ID")
	private Long categoryId;

	/** 创建者 */
	@Column(name = "CREATOR")
	private Long creator;

	/** 是否显示 */
	@Column(name = "IS_SHOW")
	private boolean show;

	/** 创建时间 */
	@Column(name = "PUBLISH_DATE")
	private Date publishDate;

	/**无用*/
	@Column(name = "UNREAD")
	private boolean unRead;
	
	// 分类
	private ArticleCategory category;

	// 获取文本内容
	public String getText() {
		if (getContent() != null) {
			return Jsoup.parse(getContent()).text();
		}
		return null;
	}

}
