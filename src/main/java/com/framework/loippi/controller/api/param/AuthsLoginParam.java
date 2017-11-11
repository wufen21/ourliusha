package com.framework.loippi.controller.api.param;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

import com.esotericsoftware.kryo.NotNull;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Param - 手机登录
 * 
 * @description 手机登录
 * @author Loippi team
 * @version 2.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class AuthsLoginParam{
	@NotNull
	private Integer la;
	
	/** 手机号 */
	@NotEmpty(message="名字不能为空或者空串")
	private String phone;
	
	/** 密码 */
	@Size(min=6,message="密碼不能为空或者空串")
	@NotEmpty
	private String password;
	
	private Integer type;
	
}
