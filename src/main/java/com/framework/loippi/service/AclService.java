package com.framework.loippi.service;

import java.util.List;

import com.framework.loippi.entity.Acl;

/**
 * SERVICE - ACL
 * 
 * @author Loippi Team
 * @version 1.0
 */
public interface AclService extends GenericService<Acl, Long> {
	
	/**
	 * 主键删除ACL
	 */
	Long delete(Long id); 

	/**
	 * 查找ROOT菜单
	 */
	List<Acl> findRoots();
	
	/**
	 * 根据ID获取子菜单
	 */
	List<Acl> findChildrens(Long id);
	List<Acl> findByParams(Object parameter);
}
