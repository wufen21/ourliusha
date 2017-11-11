package com.framework.loippi.shiro;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 身份信息
 * 
 * @author Mounate Yan。
 * @version 1.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Principal implements Serializable {

	private static final long serialVersionUID = 5798882004228239559L;

	/** ID */
	private Long id;

	/** 用户名 */
	private String username;
	
	/** 角色 */
	private String rolename;
	
	/** 头像 */
	private String avatar;
	
}