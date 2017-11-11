package com.framework.loippi.utils;

/**
 * 公共参数
 * 
 * @author Mounate Yan。
 * @version 1.0
 */
public final class CommonAttributes {
	
	/** 日期格式配比 */
	public static final String[] DATE_PATTERNS = new String[] { "yyyy",
			"yyyy-MM", "yyyyMM", "yyyy/MM", "yyyy-MM-dd", "yyyyMMdd",
			"yyyy/MM/dd", "yyyy-MM-dd HH:mm:ss", "yyyyMMddHHmmss", 	"yyyy/MM/dd HH:mm:ss" };

	/** metronic-framework.xml文件路径 */
	public static final String FRAMEWORK_XML_PATH = "/metronic-framework-config.xml";

	/** metronic-framework.properties文件路径 */
	public static final String FRAMEWORK_PROPERTIES_PATH = "/metronic-framework-config.properties";

	/**
	 * 不可实例化
	 */
	private CommonAttributes() {
	}
}