package com.framework.loippi.service;

/**
 * Service - 缓存
 * 
 * @author Mounate Yan。
 * @version 1.0
 */
public interface CacheService {

	
	/**
	 * 读取缓存
	 * 
	 * @param key
	 * @param prefix
	 * @param clas
	 * @return
	 */
	public Object get(String key);
	/**
	 * 写入缓存
	 * 
	 * @param key
	 * @param prefix
	 * @param value
	 * @return
	 */
	public boolean set(String key, Object value, Integer expiration) ;
	/**
	 * 删除缓存
	 * 
	 * @param key
	 * @param prefix
	 * @return
	 */
	public boolean delete(String key);
	
	/**
	 * 获取缓存存储路径
	 * 
	 * @return 缓存存储路径
	 */
	String getDiskStorePath();

	/**
	 * 获取缓存数
	 * 
	 * @return 缓存数
	 */
	int getCacheSize();

	/**
	 * 清除缓存
	 */
	void clear();
	
}