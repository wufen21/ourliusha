package com.framework.loippi.controller.admin;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.framework.loippi.controller.admin.dto.AclDTO;
import com.framework.loippi.entity.Acl;
import com.framework.loippi.service.AclService;
import com.framework.loippi.service.RoleAclService;
import com.framework.loippi.shiro.Principal;
import com.framework.loippi.support.Message;

@Controller("adminAclController")
@RequestMapping("/admin/acl")
public class AclController extends GenericController {

	@Resource
	private AclService aclService;

	@Resource
	private RoleAclService roleAclService;

	/**
	 * 添加
	 */
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add(ModelMap model) {
		return "/admin/acl/add";
	}

	/**
	 * 保存
	 */
	@RequestMapping(value = "/saveOrUpdate", method = RequestMethod.POST)
	public String save(Acl acl, RedirectAttributes redirectAttributes) {
		Subject subject = SecurityUtils.getSubject();
		if (acl.getId() == null) {
			acl.setCreateDate(new Date());
			if (subject != null) {
				Principal principal = (Principal) subject.getPrincipal();
				if (principal != null && principal.getId() != null) {
					acl.setCreator(principal.getId());
				}
			}
			aclService.save(acl);
		} else {
			if (subject != null) {
				Principal principal = (Principal) subject.getPrincipal();
				if (principal != null && principal.getId() != null) {
					acl.setUpdator(principal.getId());
				}
			}
			acl.setUpdateDate(new Date());
			aclService.update(acl);
		}
		addFlashMessage(redirectAttributes, SUCCESS_MESSAGE);
		return "redirect:list.jhtml";
	}

	/**
	 * 编辑
	 */
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String edit(Long id, ModelMap model) {
		model.addAttribute("acl", aclService.find(id));
		List<Acl> acls = aclService.findRoots();
		for (Acl acl : acls) {
			acl.getChildren().addAll(aclService.findChildrens(acl.getId()));
		}
		model.addAttribute("acls", acls);
		return "/admin/acl/edit";
	}

	/**
	 * 详情
	 */
	@RequestMapping(value = "/view/{id}", method = RequestMethod.GET)
	public String view(@PathVariable Long id, ModelMap model) {
		return "/admin/acl/view";
	}

	/**
	 * 更新
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(Acl acl, RedirectAttributes redirectAttributes) {
		acl.setUpdateDate(new Date());
		Subject subject = SecurityUtils.getSubject();
		if (subject != null) {
			Principal principal = (Principal) subject.getPrincipal();
			if (principal != null && principal.getId() != null) {
				acl.setUpdator(principal.getId());
			}
		}
		addFlashMessage(redirectAttributes, SUCCESS_MESSAGE);
		return "redirect:list.jhtml";
	}

	/**
	 * 列表
	 */
	@RequiresPermissions("admin:system:acl")
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(ModelMap model) {
		List<Acl> acls = aclService.findRoots();
		for (Acl acl : acls) {
			acl.getChildren().addAll(aclService.findChildrens(acl.getId()));
		}
		model.addAttribute("acls", acls);
		return "/admin/acl/list";
	}

	/**
	 * 获取ROOT菜单
	 */
	@RequestMapping(value = "/ajax_roots", method = RequestMethod.GET)
	public @ResponseBody List<AclDTO> ajax_roots() {
		return new AclDTO().build(aclService.findRoots());
	}

	/**
	 * 获取子菜单
	 */
	@RequestMapping(value = "/ajax_children", method = RequestMethod.GET)
	public @ResponseBody List<AclDTO> ajax_children(Long id) {
		return new AclDTO().build(aclService.findChildrens(id));
	}

	/**
	 * 删除
	 */
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public @ResponseBody Message delete(Long id) {
		if (CollectionUtils.isEmpty(aclService.findChildrens(id))) {
			aclService.delete(id);
			return SUCCESS_MESSAGE;
		}
		return Message.error("不可删除,包含子菜单!");
	}
}
