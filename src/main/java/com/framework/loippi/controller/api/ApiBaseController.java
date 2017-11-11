package com.framework.loippi.controller.api;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import com.framework.loippi.controller.api.common.APIReturnJson;
import com.framework.loippi.controller.api.common.APIXerror;
import com.framework.loippi.controller.api.param.LoginUser;
import com.framework.loippi.utils.StringUtil;
import com.framework.loippi.utils.redis.JedisCache;
import com.framework.loippi.utils.redis.JedisStringCache;

public class ApiBaseController {

	protected final Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	protected JedisCache jedisCache;

	/**
	 * 用于处理异常的
	 * 
	 * @return
	 */
	@ExceptionHandler({ Exception.class })
	public @ResponseBody String Exception(HttpServletRequest request, Exception e) {
		logger.error("系统错误", e);
		String uri = request.getRequestURI();
		String ip = request.getRemoteAddr();
		logger.info("uri=" + uri);
		logger.info("ip=" + ip);

		// 开发模式
		return APIReturnJson.error(APIXerror.SYSTEM_ERROR_5000000);
		// 生产模式
		//return ReturnJson.jsonString("系统出错!", AppConstants.SYSTEM_ERROR5000000);
	}
	
	public void setRedisLogiUser(String sessionId, LoginUser loginUser) {
		// 检查是否已经登录
		JedisStringCache jedisStringCache = jedisCache.getJedisStringCache(sessionId);
		jedisStringCache.set(JSONObject.fromObject(loginUser).toString());
	}

	public void updateRedisLogiUser(String sessionId, LoginUser loginUser) {
		// 检查是否已经登录
		JedisStringCache jedisStringCache = jedisCache.getJedisStringCache(sessionId);
		if (jedisStringCache.get() != null) {
			jedisStringCache.set(JSONObject.fromObject(loginUser).toString());
		}
	}

	/* 缓存相关 */
	public void setRedisLoginCode(String mobileNum, String code) {
		// 设置验证码缓存
		JedisStringCache jedisStringCache = jedisCache.getJedisStringCache(mobileNum);
		jedisStringCache.set(code, 60);
	}

	public void removeRedisLogiUser(String sessionId) {
		// 检查是否已经登录
		JedisStringCache jedisStringCache = jedisCache.getJedisStringCache(sessionId);
		jedisStringCache.remove(sessionId);
	}

	public LoginUser validateRedisLogiUser(String sessionId) {
		if (StringUtil.isEmpty(sessionId)) {
			return null;
		}
		// 检查是否已经登录
		JedisStringCache jedisStringCache = jedisCache.getJedisStringCache(sessionId);
		if (jedisStringCache.get() == null) {
			return null;
		}
		new JSONObject();
		JSONObject jsonObject = JSONObject.fromObject(jedisStringCache.get());// 将json字符串转换为json对象

		LoginUser loginUser = (LoginUser) JSONObject.toBean(jsonObject, LoginUser.class);// 将建json对象转换为Person对象
		return loginUser;
	}

	/*public LoginUser setLoginUser(LoginUser loginuser, UUser tuserold, String sessionId) {
		loginuser.setAvatar(tuserold.getAvatar());
		loginuser.setId(tuserold.getId());
		loginuser.setNickname(tuserold.getNickname());
		loginuser.setPhone(tuserold.getPhone());
		loginuser.setSex(tuserold.getSex());
		loginuser.setSessionId(sessionId);
		loginuser.setHxId(tuserold.getHxId());
		return loginuser;
	}*/
	
//	/* 保存倒计时redis */
//	public void setRedisGroupTime(String groupId, int time) {
//		// 设置验证码缓存
//		JedisStringCache jedisStringCache = jedisCache.getJedisStringCache(groupId);
//		jedisStringCache.set(groupId, 60);
//	}
	
	
	public String getSessionId(HttpServletRequest request){
		String sessionId = request.getParameter("sessionId")==null?request.getHeader("sessionId"):request.getParameter("sessionId");
		return sessionId;
	}


}
