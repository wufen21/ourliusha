package com.framework.loippi.dao;

import org.apache.ibatis.annotations.Param;

import com.framework.loippi.entity.Results;
import com.framework.loippi.mybatis.dao.GenericDao;

/**
 * DAO - Results(返回值)
 * 
 * @author Loippi Team
 * @version 2.0
 */
public interface ResultsDao  extends GenericDao<Results, Long> {
	/**
	 * 根据接口编号删除
	 * 
	 * @param id
	 * @return
	 */
	Long deleteByInterfacerId(@Param("interfacerId")Long interfacerId);
}
