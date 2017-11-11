package com.framework.loippi.service.impl;

import org.springframework.stereotype.Service;

import com.framework.loippi.controller.api.ApiBaseController;
import com.framework.loippi.service.AuthsAPIService;

@Service
public class AuthAPIServiceImpl extends ApiBaseController implements AuthsAPIService {

	//@Resource
	//private UUserService uUserService;
  
	/** 手机登录 */
	/*@Override
	@Transactional
	public LoginUser AuthsLogin(UUser uUser) {
		RandomGUIDUtil myGUID = new RandomGUIDUtil();
		String sessionid = myGUID.valueAfterMD5;
		LoginUser loginUser = new LoginUser();
		loginUser = setLoginUser(loginUser, uUser, sessionid);
		this.setRedisLogiUser(sessionid, loginUser);
		uUser.setLastAccessTime(new Date());
		uUserService.update(uUser);
		return loginUser;
	}*/

	
}
