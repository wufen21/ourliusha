package com.framework.loippi.utils;

/**
 * SQL工具类
 * @author dovyeYH
 *
 */
public class SQLUtil {

	/**
	 * 过滤SQL中的特殊字符
	 * @param sql
	 * @return
	 */
	public static String filterSQL(String sql){
		if(StringUtil.isEmpty(sql))
			return "";
		return sql.replaceAll(".*([';]+|(--)+).*", " ");
	}
}
