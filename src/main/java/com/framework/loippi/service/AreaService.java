package com.framework.loippi.service;

import java.util.List;

import com.framework.loippi.entity.Area;

/**
 * SERVICE - AREA
 * 
 * @author Loippi Team
 * @version 1.0
 */
public interface AreaService extends GenericService<Area, Long> {
	

	/**
	 * 查找ROOT菜单
	 */
	List<Area> findRoots();
	
	/**
	 * 根据ID获取子菜单
	 */
	List<Area> findChildrens(Long id);
}
