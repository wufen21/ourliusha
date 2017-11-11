package com.framework.loippi.controller.admin;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.framework.loippi.service.*;
import com.framework.loippi.support.Pageable;
import com.framework.loippi.utils.Paramap;
import com.framework.loippi.utils.redis.JedisCache;
import com.framework.loippi.utils.redis.JedisStringCache;
import com.google.code.kaptcha.Producer;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;

import com.framework.loippi.entity.Acl;
import com.framework.loippi.entity.Area;
import com.framework.loippi.entity.User;
import com.framework.loippi.shiro.Principal;
import com.framework.loippi.support.Message;
import com.loippi.core.gen.IFactory;
import com.loippi.core.gen.ITable;
import com.loippi.core.gen.mysql.impl.MysqlFactory;




/**
 * Controller - 共用
 * 
 * @author Loippi Team
 * @version 1.0
 */
@Controller("adminCommonController")
@RequestMapping("/admin/common")
public class CommonController extends GenericController implements ServletContextAware  {

	@Value("${system.name}")
	private String systemName;
	@Value("${system.version}")
	private String systemVersion;
	@Value("${system.description}")
	private String systemDescription;
	
	
	@Value("${jdbc.url}")
	private String url;

	@Value("${jdbc.username}")
	private String username;

	@Value("${jdbc.password}")
	private String password;
	
	@Resource
	private AclService aclService;
	
	@Resource
	private AreaService areaService;
	
	@Resource
	private UserService userService;
	

	
	/** servletContext */
	private ServletContext servletContext;

	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}

	@Resource
	private 	FileService fileService;

	
	 private Producer captchaProducer = null;  
	   
	 @Autowired
	 public void setCaptchaProducer(Producer captchaProducer){  
	        this.captchaProducer = captchaProducer;  
	    }  
		@Autowired
		private JedisCache jedisCache;
	/**
	 * 主页
	 */
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(HttpServletRequest request ,ModelMap model) {

		model.addAttribute("systemName", systemName);
		model.addAttribute("systemVersion", systemVersion);
		model.addAttribute("systemDescription", systemDescription);
		model.addAttribute("javaVersion", System.getProperty("java.version"));
		model.addAttribute("javaHome", System.getProperty("java.home"));
		model.addAttribute("osName", System.getProperty("os.name"));
		model.addAttribute("osArch", System.getProperty("os.arch"));
		model.addAttribute("serverInfo", servletContext.getServerInfo());
		model.addAttribute("servletVersion", servletContext.getMajorVersion() + "." + servletContext.getMinorVersion());
		Subject subject = SecurityUtils.getSubject();
		if (subject != null) {
			Principal principal = (Principal) subject.getPrincipal();
			if (principal != null && principal.getId() != null) {
				model.addAttribute("principal", principal);
			}
		}
		
		Map map=new HashMap();
		map.put("order", "PARENT_ID,sorts");
		List <Acl>	allAcls=aclService.findByParams(map);
		List<Acl> acls = aclService.findRoots();
		for (Acl acl : acls) {
		acl.getChildren().addAll(this.getChildrens(allAcls,acl.getId()));
		}
		model.addAttribute("acls", acls);
		User user = userService.getCurrent();
		if(user != null && user.getTheme() != null &&  user.getTheme() == 2){
			return "/admin/common/main_classic";
		}
		return "/admin/common/main";
	}
	
		private List <Acl>	getChildrens(List <Acl>	allAcls,Long pId){
		
		List <Acl>	 childrens=new ArrayList();
		for (Iterator iterator = allAcls.iterator(); iterator.hasNext();) {
			Acl acl = (Acl) iterator.next();
			if(pId.equals(acl.getParentId())){
				childrens.add(acl);
			}
		}
		return childrens;
	}
	
	/**
	 * 主题设置
	 */
	
	@RequestMapping(value = "/theme", method = RequestMethod.POST)
	public @ResponseBody Message theme(HttpServletRequest request,Integer theme ,ModelMap model) {
		User user = userService.getCurrent();
		user.setTheme(theme);
		userService.update(user);
		return SUCCESS_MESSAGE;
	}
	
	
	

	/**
	 * 首页
	 */
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Pageable pageable, ModelMap model) {
		
		
		model.addAttribute("systemName", systemName);
		model.addAttribute("systemVersion", systemVersion);
		model.addAttribute("systemDescription", systemDescription);
		model.addAttribute("javaVersion", System.getProperty("java.version"));
		model.addAttribute("javaHome", System.getProperty("java.home"));
		model.addAttribute("osName", System.getProperty("os.name"));
		model.addAttribute("osArch", System.getProperty("os.arch"));
		model.addAttribute("serverInfo", servletContext.getServerInfo());
		model.addAttribute("servletVersion", servletContext.getMajorVersion() + "." + servletContext.getMinorVersion());

		return "/admin/common/index";
	}
	
	



	/**
	 * 注销
	 */
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String execute(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		SecurityUtils.getSubject().logout();
		return "redirect:/admin/login.jhtml?jssionid="+session.getId();
	}
	
	
	
	/**
	 * 数据字典
	 */
	@RequestMapping(value = "/dic", method = RequestMethod.GET)
	public String dic(ModelMap model) {
		try {
			IFactory factory = MysqlFactory.getInstance(url, username, password);
			List<ITable> tables = factory.getTables();
			model.addAttribute("tables", tables);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "/admin/common/dic";
	}
	
	
	/**
	 * 地区
	 */
	@RequestMapping(value = "/area", method = RequestMethod.GET)
	public @ResponseBody Map<Long, String> area(Long parentId) {
		List<Area> areas = new ArrayList<Area>();
		if (parentId != null) {
			areas = areaService.findChildrens(parentId);
		} else {
			areas = areaService.findRoots();
		}
		Map<Long, String> options = new HashMap<Long, String>();
		for (Area area : areas) {
			options.put(area.getId(), area.getName());
		}
		return options;
	}

	/**
	 * 验证码
	 */
	@RequestMapping(value = "/captcha", method = RequestMethod.GET)
	public void image(String captchaId, HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (StringUtils.isEmpty(captchaId)) {
			captchaId = request.getSession().getId();
		}
		 response.setDateHeader("Expires",0);
		 response.setHeader("Cache-Control","no-cache, must-revalidate");
		 response.addHeader("Cache-Control","post-check=0, pre-check=0");
		 response.setHeader("Pragma","no-cache");
		 response.setContentType("image/jpeg");

		 String capText = captchaProducer.createText();// 生成验证码字符串
		 JedisStringCache	jedisStringCache=	jedisCache.getJedisStringCache(captchaId);
		 jedisStringCache.set(capText);
		System.err.println("capText==="+capText);

		 BufferedImage bi = captchaProducer.createImage(capText);// 生成验证码图片
		 ServletOutputStream out = response.getOutputStream();
		 ImageIO.write(bi, "jpg", out);
		try{
		 out.flush();
		 } finally{
		 out.close();
		 }

		return;
	}

	/**
	 * 错误提示
	 */
	@RequestMapping("/error")
	public String error() {
		return ERROR_VIEW;
	}

	/**
	 * 权限错误
	 */
	@RequestMapping("/unauthorized")
	public String unauthorized(HttpServletRequest request,
			HttpServletResponse response) {
		String requestType = request.getHeader("X-Requested-With");
		if (requestType != null
				&& requestType.equalsIgnoreCase("XMLHttpRequest")) {
			response.addHeader("loginStatus", "unauthorized");
			try {
				response.sendError(HttpServletResponse.SC_FORBIDDEN);
			} catch (IOException e) {
				e.printStackTrace();
			}
			return null;
		}
		return "/admin/common/unauthorized";
	}
	
	/**
	 * 资源不存在
	 */
	@RequestMapping("/resource_not_found")
	public String resourceNotFound() {
		return "/admin/common/resource_not_found";
	}
	
	

}