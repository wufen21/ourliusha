package com.framework.loippi.shiro.realm;


import java.util.Date;

import javax.annotation.Resource;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.DisabledAccountException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.pam.UnsupportedTokenException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import com.framework.loippi.entity.Acl;
import com.framework.loippi.entity.Role;
import com.framework.loippi.entity.User;
import com.framework.loippi.service.RoleService;
import com.framework.loippi.service.UserService;
import com.framework.loippi.shiro.AuthenticationToken;
import com.framework.loippi.shiro.Principal;
import com.framework.loippi.support.Setting.CaptchaType;
import com.framework.loippi.utils.redis.JedisCache;
import com.framework.loippi.utils.redis.JedisStringCache;


/**
 * 权限认证
 * 
 * @author Mounate Yan。
 * @version 1.0
 */
public class AuthenticationRealm extends AuthorizingRealm {
	
	@Resource
	private UserService userService;
	
	@Resource
	private RoleService roleService;

	
	@Autowired
	private JedisCache jedisCache;

	/**
	 * 获取认证信息
	 * 
	 * @param token
	 *            令牌
	 * @return 认证信息
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(org.apache.shiro.authc.AuthenticationToken token) {
		AuthenticationToken authenticationToken = (AuthenticationToken) token;
		String username = authenticationToken.getUsername();
		String password = new String(authenticationToken.getPassword());
		String ip = authenticationToken.getHost();
		String captchaId = authenticationToken.getCaptchaId();
		String captcha = authenticationToken.getCaptcha();
		//if (!captchaService.isValid(CaptchaType.adminLogin, captchaId, captcha)) {
		//	throw new UnsupportedTokenException();
		//}
		
		
         JedisStringCache	jedisStringCache=	jedisCache.getJedisStringCache(captchaId);
		 
		 //验证验证码
//			System.err.println("jedisStringCache==="+jedisStringCache.get());
//			if (jedisStringCache.get()==null||captcha==null) {
//				throw new UnsupportedTokenException();
//			}
//			
//			if(!jedisStringCache.get().toUpperCase().equals(captcha.toUpperCase())){
//				throw new UnsupportedTokenException();
//			}
		
		if (username != null && password != null) {
			User user = null;
			try {
				user = userService.find("username", username);
			} catch (Exception e) {
					e.printStackTrace();
				}
			
			if (user == null) {
				throw new UnknownAccountException();
			}

			if (!user.getIsEnabled()) {
				throw new DisabledAccountException();
			}
			if (!DigestUtils.md5Hex(password).equals(user.getPassword())) {
				int loginFailureCount = user.getLoginFailureCount() + 1;
				if (loginFailureCount >= 5) {
					user.setIsLocked(true);
					user.setLockedDate(new Date());
				}
				user.setLoginFailureCount(loginFailureCount);
				userService.update(user);
				throw new IncorrectCredentialsException();
			}
			user.setLoginIp(ip);
			user.setLoginDate(new Date());
			user.setLoginFailureCount(0);
			userService.update(user);
			Role role = roleService.find(user.getRoleId());
			return new SimpleAuthenticationInfo(new Principal(user.getId(),StringUtils.isEmpty(user.getNickname())?username:user.getNickname(),role.getName(),user.getAvatar()), password, getName());
		}
		throw new UnknownAccountException();
	}

	/**
	 * 获取授权信息
	 * 
	 * @param principals
	 *            principals
	 * @return 授权信息
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(
			PrincipalCollection principals) {
		Principal principal = (Principal) principals.fromRealm(getName()).iterator().next();
		if (principal != null) {
			SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
			User user = userService.find(principal.getId());
			Role role = roleService.findRoleAndAcls(user.getRoleId());
			for (Acl acl : role.getAuthorities()){
				if (StringUtils.isNotEmpty(acl.getPermission())){
					info.addStringPermission(acl.getPermission());
				}
			}
			return info;
		}
		return null;
	}

}