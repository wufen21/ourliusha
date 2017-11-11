package com.framework.loippi.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.framework.loippi.dao.ParametersDao;
import com.framework.loippi.entity.Parameters;
import com.framework.loippi.service.ParametersService;

/**
 * SERVICE - Parameters(接口参数)
 * 
 * @author Loippi Team
 * @version 2.0
 */
@Service
public class ParametersServiceImpl extends GenericServiceImpl<Parameters, Long> implements ParametersService {
	
	@Autowired
	private ParametersDao parametersDao;
	
	
	@Autowired
	public void setGenericDao() {
		super.setGenericDao(parametersDao);
	}


	@Override
	public Long deleteByInterfacerId(Long id) {
		return parametersDao.deleteByInterfacerId(id);
	}
}
