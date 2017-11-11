package com.framework.loippi.support;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 接口文档设置
 * 
 * @author Loippi Team
 * @version 2.0
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ApiSetting {

	/** 编号 */
	private String id;

	/**  名称  */
	private String name;

	/**  Logo */
	private String logo;

	/** 基础URL */
	private String baseUrl;

	/**  版本号 */
	private String version;

	/**  作者 */
	private String author;
	
	/**  描述 */
	private String description;
}
