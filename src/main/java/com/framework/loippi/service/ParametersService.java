package com.framework.loippi.service;

import com.framework.loippi.entity.Parameters;

/**
 * SERVICE - Parameters(接口参数)
 * 
 * @author Loippi Team
 * @version 2.0
 */
public interface ParametersService extends GenericService<Parameters, Long> {

	/**
	 * 根据接口编号删除
	 * 
	 * @param id
	 * @return
	 */
	Long deleteByInterfacerId(Long id);
}
