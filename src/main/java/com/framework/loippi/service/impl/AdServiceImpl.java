package com.framework.loippi.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.framework.loippi.dao.AdDao;
import com.framework.loippi.entity.Ad;
import com.framework.loippi.service.AdService;

/**
 * SERVICE - Ad
 * 
 * @author Loippi Team
 * @version 1.0
 */
@Service
public class AdServiceImpl extends GenericServiceImpl<Ad, Long>implements AdService {

	@Autowired
	private AdDao adDao;

	@Autowired
	public void setGenericDao() {
		super.setGenericDao(adDao);
	}
}
