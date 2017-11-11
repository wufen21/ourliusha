package com.framework.loippi.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.framework.loippi.entity.Area;
import com.framework.loippi.mybatis.dao.GenericDao;

/**
 * DAO - Area
 * 
 * @author Loippi Team
 * @version 1.0
 */
public interface AreaDao  extends GenericDao<Area, Long> {
	
	/**
	 * 查找ROOT菜单
	 */
	List<Area> findRoots();
	
	/**
	 * 根据ID获取子菜单
	 */
	List<Area> findChildrens(@Param("id")Long id);

}
