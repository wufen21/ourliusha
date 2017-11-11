package com.framework.loippi.controller.admin;

import java.io.ByteArrayInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;

import com.framework.loippi.controller.admin.dto.APIDTO;
import com.framework.loippi.entity.Category;
import com.framework.loippi.entity.Interfacer;
import com.framework.loippi.entity.Parameters;
import com.framework.loippi.entity.Results;
import com.framework.loippi.service.ApiSettingService;
import com.framework.loippi.service.CategoryService;
import com.framework.loippi.service.InterfacerService;
import com.framework.loippi.service.ParametersService;
import com.framework.loippi.service.ResultsService;
import com.framework.loippi.service.TemplateService;
import com.framework.loippi.support.ApiSetting;
import com.framework.loippi.support.Message;
import com.framework.loippi.utils.Paramap;
import com.loippi.core.gen.processor.Generator;

import cn.jpush.api.utils.StringUtils;

/**
 * Controller - 接口
 * 
 * @author Loippi Team
 * @version 2.0
 */
@Controller("adminApiController")
@RequestMapping({ "/admin/api" })
public class ApiController extends GenericController {
	@Resource
	private ApiSettingService settingService;

	@Resource
	private CategoryService categoryService;

	@Resource
	private InterfacerService interfacerService;
	
	@Resource
	private ParametersService parametersService;
	
	@Resource
	private ResultsService resultsService;
	
	@Resource
	private TemplateService templateService;
	
	@Resource(name = "freeMarkerConfigurer")
	private FreeMarkerConfigurer freeMarkerConfigurer;
	/**
	 * 首页
	 */
	@RequestMapping(value = { "/index" }, method = { RequestMethod.GET })
	public String index(ModelMap model) {
		loadGenericDatas(null, model);
		return "/admin/api/index";
	}
	
	/**
	 * 预览
	 */
	@RequestMapping(value = { "/view" }, method = { RequestMethod.GET })
	public String view(ModelMap model) {
		model.addAttribute("apiSettings", settingService.defaults());
		List<Category> categories = categoryService.findAll();
		for (Category category : categories) {
			category.setCounts(interfacerService.count(Paramap.create().put("categoryId", category.getId())).intValue());
			List<Interfacer> interfacers = interfacerService.findList("categoryId",  category.getId());
			for (Interfacer interfacer : interfacers) {
				interfacer.setParameters(parametersService.findList("interfacerId", interfacer.getId()));
				interfacer.setResults(resultsService.findList("interfacerId", interfacer.getId()));
			}
			category.getInterfacers().addAll(interfacers);
		}
		model.addAttribute("categories", categories);
		return "/admin/api/view";
	}

	/**
	 * 保存分类
	 */
	@RequestMapping(value = { "/category/save" }, method = { RequestMethod.POST })
	public @ResponseBody Message category_save(Category category) {
		category.setCreateDate(new Date());
		category.setUuid(UUID.randomUUID().toString());
		categoryService.save(category);
		return SUCCESS_MESSAGE;
	}
	
	
	/**
	 * 查看分类
	 */
	@RequestMapping(value = { "/category/view/{id}" }, method = { RequestMethod.GET })
	public String category_view(@PathVariable Long id, ModelMap model) {
		loadGenericDatas(id, model);
		return "/admin/api/index";
	}
	
	/**
	 * 删除分类
	 */
	@RequestMapping(value = { "/category/delete" }, method = { RequestMethod.POST })
	public @ResponseBody Message category_delete(Long id, ModelMap model) {
		List<Interfacer> interfacers = interfacerService.findList("categoryId", id);
		if(interfacers.isEmpty()){
			categoryService.delete(id);
			return SUCCESS_MESSAGE;
		}else{
			return Message.warn("分类下有接口数据,无法删除");
		}
		
	}


	/**
	 * 保存分类
	 */
	@RequestMapping(value = { "/interfacer/delete" }, method = { RequestMethod.POST })
	public @ResponseBody Message interfacer_delete(Long id) {
		parametersService.deleteByInterfacerId(id);
		resultsService.deleteByInterfacerId(id);
		interfacerService.delete(id);
		return SUCCESS_MESSAGE;
	}
	
	/**
	 * 创建接口表单页面跳转
	 */
	@RequestMapping(value = { "/interfacer/add" }, method = { RequestMethod.GET })
	public String add(ModelMap model) {
		loadGenericDatas(null, model);
		return "/admin/api/add";
	}
	
	
	/**
	 * 更新接口表单页面跳转
	 */
	@RequestMapping(value = { "/interfacer/edit/{id}" }, method = { RequestMethod.GET })
	public String edit(@PathVariable Long id,ModelMap model) {
		List<Category> categories = categoryService.findAll();
		for (Category category : categories) {
			category.setCounts(interfacerService.count(Paramap.create().put("categoryId", category.getId())).intValue());
		}
		Interfacer interfacer = interfacerService.find(id);
		interfacer.setParameters(parametersService.findList("interfacerId", interfacer.getId()));
		interfacer.setResults(resultsService.findList("interfacerId", interfacer.getId()));
		
		model.addAttribute("interfacer", interfacer);
		model.addAttribute("categories", categories);
		model.addAttribute("apiSettings", settingService.defaults());
		return "/admin/api/edit";
	}

	
	/**
	 * 创建接口
	 */
	@RequestMapping(value = { "/interfacer/save" }, method = { RequestMethod.POST })
	public String  save(ModelMap model,APIDTO dto,RedirectAttributes redirectAttributes) {
		Interfacer interfacer = new Interfacer();
		interfacer.setCategoryId(dto.getCategoryId());
		interfacer.setCodes(dto.getCodes());
		interfacer.setMethod(dto.getMethod());
		interfacer.setName(dto.getIname());
		interfacer.setUrl(dto.getUrl());
		interfacer.setDescription(dto.getDescription());
		interfacer.setCreateDate(new Date());
		interfacer.setUpdateDate(new Date());
		interfacer.setUuid(UUID.randomUUID().toString());
		interfacerService.save(interfacer);
		for (Parameters parameter : dto.getParams()) {
			if(parameter!= null && StringUtils.isNotEmpty(parameter.getName())){
				parameter.setInterfacerId(interfacer.getId());
				parametersService.save(parameter);
			}
		}
		
		for (Results result : dto.getResults()) {
			if(result!= null && StringUtils.isNotEmpty(result.getName())){
				result.setInterfacerId(interfacer.getId());
				resultsService.save(result);
			}
		}
		addFlashMessage(redirectAttributes, SUCCESS_MESSAGE);
		return "redirect:../category/view/"+interfacer.getCategoryId()+".jhtml";
	}
	
	
	/**
	 * 修改接口
	 */
	@RequestMapping(value = { "/interfacer/update" }, method = { RequestMethod.POST })
	public String  update(ModelMap model,Long id, APIDTO dto,RedirectAttributes redirectAttributes) {
		Interfacer interfacer = interfacerService.find(id);
		interfacer.setCategoryId(dto.getCategoryId());
		interfacer.setCodes(dto.getCodes());
		interfacer.setMethod(dto.getMethod());
		interfacer.setName(dto.getIname());
		interfacer.setUrl(dto.getUrl());
		interfacer.setDescription(dto.getDescription());
		interfacer.setUpdateDate(new Date());
		interfacerService.update(interfacer);
		parametersService.deleteByInterfacerId(id);
		resultsService.deleteByInterfacerId(id);
		for (Parameters parameter : dto.getParams()) {
			if(parameter!= null && StringUtils.isNotEmpty(parameter.getName())){
				parameter.setInterfacerId(interfacer.getId());
				parametersService.save(parameter);
			}
		}
		
		for (Results result : dto.getResults()) {
			if(result!= null && StringUtils.isNotEmpty(result.getName())){
				result.setInterfacerId(interfacer.getId());
				resultsService.save(result);
			}
		}
		addFlashMessage(redirectAttributes, SUCCESS_MESSAGE);
		System.out.println("redirect:category/view/"+interfacer.getCategoryId()+".jhtml");
		return "redirect:../category/view/"+interfacer.getCategoryId()+".jhtml";
	}
	
	
	/**
	 * 生成代码
	 */
	@RequestMapping(value = "/gen_code", method = RequestMethod.POST)
	@ResponseBody
	public Message gen_code(HttpServletResponse response) {
		String fullPath = this.getClass().getResource("").getPath().replace("classes/com/framework/loippi/controller/admin/", "generated-apis");
		
		List<Category> categories = categoryService.findAll();
		for (Category category : categories) {
			Map<String, Object> data = new HashMap<String, Object>();
			List<Interfacer> interfacers = interfacerService.findList("categoryId",  category.getId());
			for (Interfacer interfacer : interfacers) {
				Map<String, Object> model = new HashMap<String, Object>();
				interfacer.setParameters(parametersService.findList("interfacerId", interfacer.getId()));
				interfacer.setResults(resultsService.findList("interfacerId", interfacer.getId()));
				model.put("url",interfacer.getUrl());
				model.put("author", "Loippi Team");
				model.put("version", "2.0");
				model.put("remark", interfacer.getName());
				model.put("description", interfacer.getDescription());
				model.put("interfacer",interfacer);
				Generator.runDTO(fullPath, category.getModuleName(), model,interfacer.getFunctionName());
			}
			data.put("functionName", category.getName());
			data.put("author", "Loippi Team");
			data.put("version", "2.0");
			data.put("moduleName", category.getModuleName());
			data.put("description", category.getDescription());
			data.put("interfacers", interfacers);
			Generator.runAPI(fullPath, category.getModuleName(), data);
		}
		return SUCCESS_MESSAGE;
	}

	/**
	 * 下载
	 */
	@RequestMapping(value = "/download", method = RequestMethod.GET)
	public void download(HttpServletResponse response) {
		ApiSetting setting =  settingService.defaults();
		Map<String, Object> model = new HashMap<String, Object>();
		Map<String, Object> collection = Paramap.create().put("uuid", UUID.randomUUID().toString()).put("name", setting.getName()).put("description", setting.getDescription()).put("timestamp", System.currentTimeMillis()).put("owner", "49959");
		model.put("collection", collection);
		List<Category> categories = categoryService.findAll();
		for (Category category : categories) {
			category.setCounts(interfacerService.count(Paramap.create().put("categoryId", category.getId())).intValue());
			List<Interfacer> interfacers = interfacerService.findList("categoryId",  category.getId());
			for (Interfacer interfacer : interfacers) {
				interfacer.setParameters(parametersService.findList("interfacerId", interfacer.getId()));
				interfacer.setResults(resultsService.findList("interfacerId", interfacer.getId()));
			}
			category.getInterfacers().addAll(interfacers);
		}
		model.put("categories", categories);
		processPostmanFile(response, model);
	}

	private void processPostmanFile(HttpServletResponse response, Map<String, Object> model) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application;charset=UTF-8");
		response.setHeader("Content-Disposition", "attachment;fileName=" + System.currentTimeMillis() + ".json.postman_collection");
		try {
			String text = Generator.runPostman(model);
			ByteArrayInputStream stream = new ByteArrayInputStream(text.getBytes("UTF-8"));
			OutputStream os = response.getOutputStream();
			byte[] b = new byte[2048];
			int length;
			while ((length = stream.read(b)) > 0) {
				os.write(b, 0, length);
			}
			stream.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} 
	}
	
	
	private void loadGenericDatas(Long id, ModelMap model) {
		model.addAttribute("apiSettings", settingService.defaults());
		List<Category> categories = categoryService.findAll();
		for (Category category : categories) {
			category.setCounts(interfacerService.count(Paramap.create().put("categoryId", category.getId())).intValue());
		}
		if(id == null){
			id = categories.get(0).getId();
		}
		Category category = categoryService.find(id);
		List<Interfacer> interfacers = interfacerService.findList(Paramap.create().put("categoryId", id));
		model.addAttribute("category", category);
		model.addAttribute("categories", categories);
		model.addAttribute("interfacers", interfacers);
	}
	
}
