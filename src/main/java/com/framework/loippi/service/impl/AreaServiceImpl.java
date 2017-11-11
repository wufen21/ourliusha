package com.framework.loippi.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.framework.loippi.dao.AreaDao;
import com.framework.loippi.entity.Area;
import com.framework.loippi.service.AreaService;

/**
 * Service - AREA
 * 
 * @author LinkCity Team
 * @version 3.0
 */
@Service("areaServiceImpl")
public class AreaServiceImpl extends GenericServiceImpl<Area, Long> implements AreaService {
	
	@Autowired
	private AreaDao areaDao;
	
	@Autowired
	public void setGenericDao() {
		super.setGenericDao(areaDao);
	}
	
	


	public List<Area> findRoots() {
		return areaDao.findRoots();
	}

	public List<Area> findChildrens(Long id) {
		return areaDao.findChildrens(id);
	}
	
	
}
