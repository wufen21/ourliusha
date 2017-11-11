package com.framework.loippi.controller.api.param;

import java.util.Date;

import com.framework.loippi.entity.Area;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class LoginUser {
	private Long id;
	private String avatar;
	private String nickname;
	private Integer sex;
	private String phone;
	private String sessionId;
	private String hxId;


}
