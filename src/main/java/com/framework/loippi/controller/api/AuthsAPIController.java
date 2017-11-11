package com.framework.loippi.controller.api;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.framework.loippi.controller.api.common.APIReturnJson;
import com.framework.loippi.controller.api.common.APIXerror;
import com.framework.loippi.controller.api.param.AuthsLoginParam;
import com.framework.loippi.service.AuthsAPIService;

/**
 * API - 身份驗證模塊接口
 * 
 * @author wufen
 * @version 2.0
 */
@Controller
@RequestMapping(value = "/api/auths")
public class AuthsAPIController extends ApiBaseController{
	private Logger log = LoggerFactory.getLogger(getClass());
	
	@Resource
	private AuthsAPIService authsAPIService;


	/**
	 * 手機登錄
	 */
	@RequestMapping(value = "/userLogin", method = RequestMethod.POST)
	public @ResponseBody String userLogin(@Valid AuthsLoginParam param,
			BindingResult vResult, HttpServletRequest request) {
		if (vResult.hasErrors()) {
			return APIReturnJson.error(APIXerror.PARAM_INVALID_5000020);
		}
		
			
		return APIReturnJson.success();
	}
	

	
}
