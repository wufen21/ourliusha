package com.framework.loippi.controller.admin;

import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.framework.loippi.entity.GenTableColumn;
import com.framework.loippi.entity.User;
import com.framework.loippi.mybatis.ext.Java2MybatisTypeConvert;
import com.framework.loippi.service.GenSchemeService;
import com.framework.loippi.service.GenTableColumnService;
import com.framework.loippi.service.UserService;
import com.framework.loippi.entity.GenScheme;
import com.framework.loippi.entity.GenTable;
import com.framework.loippi.service.GenTableService;
import com.framework.loippi.support.Message;
import com.framework.loippi.support.Page;
import com.framework.loippi.support.Pageable;
import com.framework.loippi.utils.ParameterUtils;
import com.loippi.core.gen.IFactory;
import com.loippi.core.gen.ITable;
import com.loippi.core.gen.mysql.impl.MysqlFactory;
import com.loippi.core.gen.strategy.Context;
import com.loippi.core.gen.strategy.FullStrategy;
import com.loippi.core.gen.strategy.OnlyBusinessStrategy;
import com.loippi.core.gen.strategy.OnlyPersistenceStrategy;
import com.loippi.core.gen.strategy.OnlyViewStrategy;
import com.loippi.core.gen.strategy.PersistenceBusinessStrategy;

/**
 * Controlelr - 业务表
 * 
 * @author Loippi Team
 * @version 1.0
 */
@Controller("adminGenTableController")
@RequestMapping("/admin/gen_table")
public class GenTableController extends GenericController {

	@Value("${jdbc.url}")
	private String url;

	@Value("${jdbc.username}")
	private String username;

	@Value("${jdbc.password}")
	private String password;
	
	@Resource
	private UserService userService;

	@Resource
	private GenTableService tableService;
	
	@Resource
	private GenTableColumnService columnService;

	@Resource
	private GenSchemeService schemeService;
	
	/**
	 * 添加新业务表：选择数据库表
	 */
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add(ModelMap model) {
		try {
			IFactory factory = MysqlFactory.getInstance(url, username, password);
			List<ITable> tables = factory.getTables();
			model.addAttribute("tables", tables);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "/admin/gen_table/add";
	}

	/**
	 * 添加新业务表：表单
	 */
	@RequestMapping(value = "/form", method = RequestMethod.GET)
	public String form(ModelMap model, String tableName) {
		try {
			IFactory factory = MysqlFactory.getInstance(url, username, password);
			ITable table = factory.getTable(tableName);
			List<ITable> tables = factory.getTables();
			model.addAttribute("tables", tables);
			model.addAttribute("table", table);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "/admin/gen_table/form";
	}

	/**
	 * 列表
	 */
	@RequiresPermissions("admin:gen:table")
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Pageable pageable, HttpServletRequest request, ModelMap model) {
		Map<String, Object> paramter = ParameterUtils.getParametersMapStartingWith(request, "filter_");
		pageable.setParameter(paramter);
		Page<GenTable> page = tableService.findByPage(pageable);
		model.addAttribute("page", page);
		model.addAttribute("paramter", paramter);
		return "/admin/gen_table/list";
	}

	/**
	 * 保存
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(GenTable table, RedirectAttributes redirectAttributes,HttpServletRequest request) {
		User current = userService.getCurrent();
		table.setCreateDate(new Date());
		table.setCreator(current.getId());
		tableService.save(table);
		for (GenTableColumn column : table.getColumns()) {
			column.setMybatisJdbcType(Java2MybatisTypeConvert.convert(column.getJavaType()));
			column.setCreateDate(new Date());
			column.setCreator(current.getId());
			column.setGenTableId(table.getId());
			columnService.save(column);
		}
		
		User user = userService.getCurrent();
		GenScheme scheme=new GenScheme();
		scheme.setGenTableId(table.getId());
		scheme.setModuleName(table.getDescription());
		scheme.setName(table.getDescription());
		scheme.setTemplate(5);
		scheme.setCreateDate(new Date());
		scheme.setUpdateDate(new Date());
		scheme.setStrategy(1);
		scheme.setCreator(user.getId());
		scheme.setUpdator(user.getId());
		scheme.setPackageName("com.framework.loippi");
		scheme.setDescription(table.getDescription());
		scheme.setAuthor("wmj");
		schemeService.save(scheme);
		generate(request, scheme, tableService.find(scheme.getGenTableId()));

		
		addFlashMessage(redirectAttributes, SUCCESS_MESSAGE);
		return "redirect:list.jhtml";
	}
	
	 /**
	 * 删除
	 */
	 @RequestMapping(value = "/delete", method = RequestMethod.POST)
	 public @ResponseBody Message delete(Long[] ids) {
		for (Long id : ids) {
			columnService.deleteByTableId(id);
		}
		tableService.deleteAll(ids);
		return SUCCESS_MESSAGE;
	 }
	 
	 private void generate(HttpServletRequest request,GenScheme scheme,GenTable table){
			String fullPath = this.getClass().getResource("").getPath().replace("classes/com/framework/loippi/controller/admin/", "generated-codes");
			//这里
			fullPath="E:/workplace/base/target";
			
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
