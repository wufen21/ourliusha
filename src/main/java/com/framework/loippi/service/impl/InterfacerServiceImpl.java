package com.framework.loippi.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.framework.loippi.dao.InterfacerDao;
import com.framework.loippi.entity.Interfacer;
import com.framework.loippi.service.InterfacerService;

/**
 * SERVICE - Interfacer(接口分类)
 * 
 * @author Loippi Team
 * @version 2.0
 */
@Service
public class InterfacerServiceImpl extends GenericServiceImpl<Interfacer, Long> implements InterfacerService {
	
	@Autowired
	private InterfacerDao interfacerDao;
	
	
	@Autowired
	public void setGenericDao() {
		super.setGenericDao(interfacerDao);
	}
}
