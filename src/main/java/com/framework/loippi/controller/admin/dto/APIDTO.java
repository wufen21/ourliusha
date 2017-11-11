package com.framework.loippi.controller.admin.dto;

import java.util.ArrayList;
import java.util.List;

import com.framework.loippi.entity.Parameters;
import com.framework.loippi.entity.Results;
import com.framework.loippi.mybatis.ext.annotation.Column;

import lombok.Data;

/**
 * API DTO
 * 
 * @author Loippi Team
 * @version 2.0
 */
@Data
public class APIDTO {

	/** 名称 */
	private String iname;
	
	/** 请求方式 */
	private String method;
	
	/** 接口地址 */
	private String url;
	
	/** 接口描述 */
	private String description;
	
	/** 分类 */
	private Long categoryId;
	
	/** 示例代码*/
	private String codes;
	
	/** 参数 */
	private List<Parameters> params = new ArrayList<Parameters>();

	/** 返回值 */
	private List<Results> results = new ArrayList<Results>();
}
