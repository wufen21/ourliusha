package com.framework.loippi.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.framework.loippi.dao.AppDao;
import com.framework.loippi.entity.App;
import com.framework.loippi.service.AppService;

/**
 * SERVICE -App
 * 
 * @author Loippi Team
 * @version 1.0
 */
@Service
public class AppServiceImpl extends GenericServiceImpl<App, Long>implements AppService {

	@Autowired
	private AppDao appDao;

	@Autowired
	public void setGenericDao() {
		super.setGenericDao(appDao);
	}
}
