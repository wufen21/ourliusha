package com.framework.loippi.interceptor;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.framework.loippi.api.utils.ApiUtils;
import com.framework.loippi.api.utils.Xerror;
import com.framework.loippi.service.CacheService;
import com.framework.loippi.support.APIPrincipal;
import com.framework.loippi.utils.SettingUtils;

public class AuthenticationInterceptor extends HandlerInterceptorAdapter {

	@Resource
	private CacheService cacheService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		if(SettingUtils.get().getIsDevelopmentEnabled())return true;
		// 获取回话ID
		String authenticationId = request.getParameter(APIPrincipal.PORPERTITY_AUTHENTICATION);
		// 获取缓存实体
		APIPrincipal principal = (APIPrincipal) cacheService.get(APIPrincipal.getCacheKey(authenticationId));
		if (principal != null) {
			return true;
		} else {// 是需要拦截的地址则要判断是否跳转到首页
			String requestType = request.getHeader("X-Requested-With");
			if (requestType != null && requestType.equalsIgnoreCase("XMLHttpRequest")) {// 如果为异步请求，则拒绝访问
				response.addHeader("loginStatus", "accessDenied");
				response.sendError(HttpServletResponse.SC_FORBIDDEN);
				return false;
			} else {// 返回登录页面
				if (request.getMethod().equalsIgnoreCase("GET")) {
					responseJsonMessage(response, ApiUtils.error(Xerror.URL_METHOD_NOPOST_JSON_CODE));
				} else {
					responseJsonMessage(response, ApiUtils.error(Xerror.USER_UNLOGIN_JSON_CODE, "用户未登录"));
				}
				return false;
			}
		}
	}

	private void responseJsonMessage(HttpServletResponse response, String msg) {
		response.setCharacterEncoding("UTF_8");
		response.setHeader("Content-type", "text/html;charset=UTF-8");
		PrintWriter writer;
		try {
			writer = response.getWriter();
			writer.write(msg);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
