package com.framework.loippi.controller.admin;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.framework.loippi.entity.GenScheme;
import com.framework.loippi.entity.GenTable;
import com.framework.loippi.entity.User;
import com.framework.loippi.service.GenSchemeService;
import com.framework.loippi.service.GenTableService;
import com.framework.loippi.service.UserService;
import com.framework.loippi.support.Message;
import com.framework.loippi.support.Page;
import com.framework.loippi.support.Pageable;
import com.loippi.core.gen.strategy.Context;
import com.loippi.core.gen.strategy.FullStrategy;
import com.loippi.core.gen.strategy.OnlyBusinessStrategy;
import com.loippi.core.gen.strategy.OnlyPersistenceStrategy;
import com.loippi.core.gen.strategy.OnlyViewStrategy;
import com.loippi.core.gen.strategy.PersistenceBusinessStrategy;

/**
 * Controlelr - 生成方案
 * 
 * @author Loippi Team
 * @version 1.0
 */
@Controller("adminGenSechemeController")
@RequestMapping("/admin/gen_scheme")
public class GenSchemeController extends GenericController {
	
	@Resource
	private UserService userService;

	@Resource
	private GenTableService tableService;

	@Resource
	private GenSchemeService schemeService;

	/**
	 * 添加
	 */
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add(ModelMap model) {
		List<GenTable> tables = tableService.findAll();
		model.addAttribute("tables", tables);
		return "/admin/gen_scheme/add";
	}

	/**
	 * 列表
	 */
	@RequiresPermissions("admin:gen:scheme")
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Pageable pageable, HttpServletRequest request, ModelMap model) {
		processQueryConditions(pageable, request);
		Page<GenScheme> page = schemeService.findByPage(pageable);
		model.addAttribute("paramter", pageable.getParameter());
		model.addAttribute("page", page);
		return "/admin/gen_scheme/list";
	}

	/**
	 * 保存
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save( HttpServletRequest request,GenScheme scheme, RedirectAttributes redirectAttributes) {
		User user = userService.getCurrent();
		scheme.setCreateDate(new Date());
		scheme.setUpdateDate(new Date());
		scheme.setStrategy(1);
		scheme.setCreator(user.getId());
		scheme.setUpdator(user.getId());
		schemeService.save(scheme);
		generate(request, scheme, tableService.find(scheme.getGenTableId()));
		addFlashMessage(redirectAttributes, SUCCESS_MESSAGE);
		return "redirect:list.jhtml";
	}
	
	
	/**
	 * 生成
	 */
	@RequestMapping(value = "/gen", method = RequestMethod.POST)
	public @ResponseBody Message gen(HttpServletRequest request,Long id) {
		GenScheme scheme = schemeService.find(id);
		generate(request, scheme, tableService.find(scheme.getGenTableId()));
		return SUCCESS_MESSAGE;
	}
	

	/**
	 * 删除
	 */
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public @ResponseBody Message delete(Long[] ids) {
		schemeService.deleteAll(ids);
		return SUCCESS_MESSAGE;
	}
	
	
	
	private void generate(HttpServletRequest request,GenScheme scheme,GenTable table){
		String fullPath = this.getClass().getResource("").getPath().replace("classes/com/framework/loippi/controller/admin/", "generated-codes");
		
		fullPath="E:/workplace/base/target2";
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("scheme", scheme);
		data.put("table", table);
		Context context = null;
		if(scheme.getTemplate() == 1){
			context = new Context(new OnlyPersistenceStrategy(), data,fullPath , table.getClassName(), scheme.getPackageName());
		}else if(scheme.getTemplate() == 2){
			context = new Context(new OnlyBusinessStrategy(), data, fullPath , table.getClassName(), scheme.getPackageName());
		}else if(scheme.getTemplate() == 3){
			context = new Context(new OnlyViewStrategy(), data, fullPath , table.getClassName(), scheme.getPackageName());
		}else if(scheme.getTemplate() == 4){
			context = new Context(new PersistenceBusinessStrategy(), data, fullPath , table.getClassName(), scheme.getPackageName());
		}else if(scheme.getTemplate() == 5){
			context = new Context(new FullStrategy(), data, fullPath , table.getClassName(), scheme.getPackageName());
		}
		if(context != null){
			context.generate();
		}
	}
}
