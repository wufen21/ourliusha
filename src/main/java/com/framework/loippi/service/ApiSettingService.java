package com.framework.loippi.service;

import com.framework.loippi.support.ApiSetting;

/**
 * Service - 接口配置
 * 
 * @author Loippi Team
 * @version 2.0
 */
public interface ApiSettingService {

	/**
	 * 获取配置
	 * 
	 * @param id
	 *            ID
	 * @return 模板
	 */
	ApiSetting get(String id);

	/**
	 * 获取配置
	 * 
	 * @param id
	 *            ID
	 * @return 模板
	 */
	ApiSetting defaults();

}
