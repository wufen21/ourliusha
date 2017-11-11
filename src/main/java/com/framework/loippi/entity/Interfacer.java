package com.framework.loippi.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.framework.loippi.mybatis.eitity.GenericEntity;
import com.framework.loippi.mybatis.ext.annotation.Column;
import com.framework.loippi.mybatis.ext.annotation.Table;

import cn.jpush.api.utils.StringUtils;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Entity - 接口
 * 
 * @author Loippi Team
 * @version 2.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "T_API_INTERFACER")
public class Interfacer implements GenericEntity {

	private static final long serialVersionUID = 5081846432919091193L;

	/** 编号 */
	@Column(id = true, name = "ID", updatable = false)
	private Long id;
	
	/** 名称 */
	@Column(name = "NAME" )
	private String name;
	
	/** 请求方式 */
	@Column(name = "METHOD" )
	private String method;
	
	/** 接口地址 */
	@Column(name = "URL" )
	private String url;
	
	/** UUID */
	@Column(name = "UUID" )
	private String uuid;
	
	/** 接口描述 */
	@Column(name = "DESCRIPTION" )
	private String description;
	
	/** 创建时间 */
	@Column(name = "CREATE_DATE" )
	private java.util.Date createDate;
	
	/** 更新时间 */
	@Column(name = "UPDATE_DATE" )
	private java.util.Date updateDate;
	
	/** 分类 */
	@Column(name = "CATEGORY_ID" )
	private Long categoryId;
	
	/** 示例代码*/
	@Column(name = "CODES" )
	private String codes;
	
	
	// 参数
	private List<Parameters> parameters = new ArrayList<Parameters>();
	
	// 返回值
	private List<Results> results = new ArrayList<Results>();
	
	
	// Postman生成参数
	public long getTime(){
		if(this.getUpdateDate() == null){
			if(this.getCreateDate() == null){
				return new Date().getTime();
			}
			return this.getCreateDate().getTime();
		}
		return this.getUpdateDate().getTime();
	}
	
	// Java代码生成参数
	public String getFunctionName(){
		String[] arrs = this.getUrl().substring(0, this.getUrl().indexOf(".")).split("/");
		StringBuffer sb = new StringBuffer("");
		for (int i = 2; i < arrs.length; i++) {
			if(StringUtils.isNotEmpty(arrs[i]))
				sb.append(arrs[i].substring(0, 1).toUpperCase() + arrs[i].substring(1));
		}
		return sb.toString();
	}
}
