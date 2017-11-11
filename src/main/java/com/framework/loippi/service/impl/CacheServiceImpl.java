package com.framework.loippi.service.impl;

import javax.annotation.Resource;

import org.springframework.cache.annotation.CacheEvict;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;

import com.framework.loippi.service.CacheService;
import com.framework.loippi.utils.SettingUtils;

import freemarker.template.TemplateModelException;
import net.sf.ehcache.CacheManager;
import net.sf.ehcache.Ehcache;
import net.sf.ehcache.Element;
/**
 * Service - 缓存
 * 
 * @author Mounate Yan。
 * @version 1.0
 */
@Service("cacheServiceImpl")
public class CacheServiceImpl implements CacheService {
	
	private static final String SYSTEM_APP_CACHE_MODULE = "SYSTEM_APP_CACHE_MODULE";
	
	/** CacheManager */
	private static final CacheManager APICacheManager = CacheManager.create();
	
	
	@Resource(name = "ehCacheManager")
	private CacheManager cacheManager;
	@Resource(name = "messageSource")
	private ReloadableResourceBundleMessageSource reloadableResourceBundleMessageSource;
	@Resource(name = "freeMarkerConfigurer")
	private FreeMarkerConfigurer freeMarkerConfigurer;
	
	public String getDiskStorePath() {
		return cacheManager.getConfiguration().getDiskStoreConfiguration().getPath();
	}

	public int getCacheSize() {
		int cacheSize = 0;
		String[] cacheNames = cacheManager.getCacheNames();
		if (cacheNames != null) {
			for (String cacheName : cacheNames) {
				Ehcache cache = cacheManager.getEhcache(cacheName);
				if (cache != null) {
					cacheSize += cache.getSize();
				}
			}
		}
		return cacheSize;
	}

	@CacheEvict(value = { "setting","template","logConfig"}, allEntries = true)
	public void clear() {
		reloadableResourceBundleMessageSource.clearCache();
		try {
			freeMarkerConfigurer.getConfiguration().setSharedVariable("setting", SettingUtils.get());
		} catch (TemplateModelException e) {
			e.printStackTrace();
		}
		freeMarkerConfigurer.getConfiguration().clearTemplateCache();
	}
	
	
	public Object get(String key) {
		if (key == null)
			return null;
		try {
			Ehcache cache = APICacheManager.getEhcache(SYSTEM_APP_CACHE_MODULE);
			if (cache == null) {
				APICacheManager.addCache(SYSTEM_APP_CACHE_MODULE);
				cache = APICacheManager.getEhcache(SYSTEM_APP_CACHE_MODULE);
			}
			Element cacheElement = cache.get(key);
			if(cacheElement==null){
				return null;
			}
			return cacheElement.getObjectValue();			
		} catch (RuntimeException e) {
			return null;
		}
	
	}

	public boolean set(String key, Object value, Integer expiration) {
		if (key == null || value == null)
			return false;
		try {
			Ehcache cache = APICacheManager.getEhcache(SYSTEM_APP_CACHE_MODULE);
			if (cache == null) {
				APICacheManager.addCache(SYSTEM_APP_CACHE_MODULE);
				cache = APICacheManager.getEhcache(SYSTEM_APP_CACHE_MODULE);
			}
			cache.put(new net.sf.ehcache.Element(key, value, false, expiration, 0));
			return true;
		} catch (RuntimeException e) {
			return false;
		}
		
	}

	public boolean delete(String key) {
		if (key == null)
			return false;
		try {
			Ehcache cache = APICacheManager.getCache(SYSTEM_APP_CACHE_MODULE);
			if (cache != null) {
				cache.remove(key);
			}
			return true;
		} catch (RuntimeException e) {
			return false;
		}

	}

}