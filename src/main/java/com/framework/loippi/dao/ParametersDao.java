package com.framework.loippi.dao;

import org.apache.ibatis.annotations.Param;

import com.framework.loippi.entity.Parameters;
import com.framework.loippi.mybatis.dao.GenericDao;

/**
 * DAO - Parameters(接口参数)
 * 
 * @author Loippi Team
 * @version 2.0
 */
public interface ParametersDao  extends GenericDao<Parameters, Long> {
	/**
	 * 根据接口编号删除
	 * 
	 * @param id
	 * @return
	 */
	Long deleteByInterfacerId(@Param("interfacerId")Long interfacerId);
}
