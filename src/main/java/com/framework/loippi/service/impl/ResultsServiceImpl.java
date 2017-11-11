package com.framework.loippi.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.framework.loippi.dao.ResultsDao;
import com.framework.loippi.entity.Results;
import com.framework.loippi.service.ResultsService;

/**
 * SERVICE - Results(返回值)
 * 
 * @author Loippi Team
 * @version 2.0
 */
@Service
public class ResultsServiceImpl extends GenericServiceImpl<Results, Long> implements ResultsService {
	
	@Autowired
	private ResultsDao resultsDao;
	
	
	@Autowired
	public void setGenericDao() {
		super.setGenericDao(resultsDao);
	}
	
	@Override
	public Long deleteByInterfacerId(Long id) {
		return resultsDao.deleteByInterfacerId(id);
	}
}
