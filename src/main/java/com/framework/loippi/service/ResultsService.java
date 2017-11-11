package com.framework.loippi.service;

import com.framework.loippi.entity.Results;

/**
 * SERVICE - Results(返回值)
 * 
 * @author Loippi Team
 * @version 2.0
 */
public interface ResultsService  extends GenericService<Results, Long> {
	/**
	 * 根据接口编号删除
	 * 
	 * @param id
	 * @return
	 */
	Long deleteByInterfacerId(Long id);
}
