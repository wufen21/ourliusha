package com.framework.loippi.controller.admin;

import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.framework.loippi.entity.App;
import com.framework.loippi.entity.App.Device;
import com.framework.loippi.entity.User;
import com.framework.loippi.service.AppService;
import com.framework.loippi.service.FileService;
import com.framework.loippi.service.UserService;
import com.framework.loippi.support.FileInfo.FileType;
/**
 * Controller - 应用版本
 * 
 * @author Mounate Yan。
 * @version 1.0
 */
@Controller("adminAppController")
@RequestMapping("/admin/app")
public class AppController extends GenericController {
	
	@Resource
	private AppService appService;
	
	@Resource
	private FileService fileService;
	
	@Resource
	private UserService userService;

	/**
	 * 编辑
	 */
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String edit(Long id, ModelMap model) {
		model.addAttribute("app", appService.find(id));
		return "/admin/app/edit";
	}

	/**
	 * 更新
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(App app,MultipartFile file, RedirectAttributes redirectAttributes) {
		App persistent = appService.find(app.getId());
		if(persistent == null) return ERROR_VIEW;
		
		if(persistent.getDevice() == Device.ANDROID.ordinal() + 1){
			String url = fileService.uploadLocal(FileType.file, file);
			persistent.setUrl(url);
		}
		
		persistent.setVersion(app.getVersion());
		persistent.setContent(app.getContent());
		persistent.setUpdateDate(new Date());
		User user =userService.getCurrent();
		if(user != null){
			persistent.setUpdator(user.getId());
		}
		appService.update(persistent);
		addFlashMessage(redirectAttributes, SUCCESS_MESSAGE);
		return "redirect:list.jhtml";
	}

	/**
	 * 列表
	 */
	@RequiresPermissions("admin:app:list")
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list( HttpServletRequest request, ModelMap model) {
		model.addAttribute("apps", appService.findAll());
		return "/admin/app/list";
	}


}
