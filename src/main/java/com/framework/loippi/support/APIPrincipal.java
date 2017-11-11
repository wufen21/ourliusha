package com.framework.loippi.support;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class APIPrincipal {

	public static final String PREFIX_USER_SESSION = "APP_API_SESSION_";
	
	public static final String PORPERTITY_AUTHENTICATION = "authentication";

	/**
	 * 鉴权码
	 */
	private String authentication;

	/**
	 * 账户编号
	 */
	private Long id;
	
	/**
	 * 账户
	 */
	private String account ;

	/**
	 * 账户类型
	 */
	private int type;

	public static String getCacheKey(String authentication) {
		return PREFIX_USER_SESSION + authentication;
	}
}
