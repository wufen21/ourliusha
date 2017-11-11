package com.framework.loippi.service.impl;

import java.io.File;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;

import com.framework.loippi.service.ApiSettingService;
import com.framework.loippi.support.ApiSetting;
import com.framework.loippi.support.CommonAttributes;

/**
 * Service - 接口配置
 * 
 * @author Loippi Team
 * @version 2.0
 */
@Service("apiSettingServiceImpl")
public class ApiSettingServiceImpl implements ApiSettingService {
	
	private static final String DEFAULT_SETTING = "main";

	@Override
	public ApiSetting get(String id) {
		try {
			File metronicFramewokXmlFile = new ClassPathResource(CommonAttributes.FRAMEWORK_XML_PATH).getFile();
			Document document = new SAXReader().read(metronicFramewokXmlFile);
			Element element = (Element) document.selectSingleNode("/framework/api[@id='" + id + "']");
			ApiSetting setting = getApiSetting(element);
			return setting;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public ApiSetting defaults() {
		return get(DEFAULT_SETTING);
	}

	/**
	 * 获取模板
	 * 
	 * @param element
	 *            元素
	 */
	private ApiSetting getApiSetting(Element element) {
		String id = element.attributeValue("id");
		String logo = element.attributeValue("logo");
		String name = element.attributeValue("name");
		String baseUrl = element.attributeValue("baseUrl");
		String version = element.attributeValue("version");
		String author = element.attributeValue("author");
		String description = element.attributeValue("description");
		return new ApiSetting(id, name, logo, baseUrl, version, author,description);
	}

}
