package com.framework.loippi.controller.admin;

import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.framework.loippi.entity.Payment;
import com.framework.loippi.service.PaymentService;
import com.framework.loippi.service.UserService;
import com.framework.loippi.support.Message;
import com.framework.loippi.support.Pageable;
import com.framework.loippi.utils.DateUtils;
import com.framework.loippi.utils.ParameterUtils;

/**
 * Controller - 交易流水
 * 
 * @author Mounate Yan。
 * @version 1.0
 */
@Controller("adminPaymentController")
@RequestMapping( { "/admin/payment" })
public class PaymentController extends GenericController {

	@Resource
	private PaymentService paymentService;
	
	@Resource
	private UserService userService;
	

	/**
	 * 跳转添加页面
	 * 
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value = { "/add" }, method = { RequestMethod.GET })
	public String add(ModelMap model) {
		return "/admin/payment/add";
	}

	/**
	 * 保存
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save( Payment payment, RedirectAttributes redirectAttributes) {
		payment.setCreateDate(new Date());
		paymentService.save(payment);
		addFlashMessage(redirectAttributes, SUCCESS_MESSAGE);
		return "redirect:list.jhtml";
	}

	/**
	 * 编辑
	 */
	@RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
	public String edit(@PathVariable Long id,  ModelMap model) {
		Payment payment = paymentService.find(id);
		model.addAttribute("payment", payment);
		return "/admin/payment/edit";
	}

	/**
	 * 更新
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(Payment ad, RedirectAttributes redirectAttributes) {
		paymentService.update(ad);
		addFlashMessage(redirectAttributes, SUCCESS_MESSAGE);
		return "redirect:list.jhtml";
	}

	/**
	 * 列表查询
	 * 
	 * @param pageable
	 * @param model
	 * @return
	 */
	@RequestMapping(value = { "/list" }, method = { RequestMethod.GET })
	public String list(Pageable pageable, HttpServletRequest request, ModelMap model)  {
		Map<String, Object> paramter = ParameterUtils.getParametersMapStartingWith(request, "filter_");
		paramter.put("endTime",DateUtils.addDateOneDay((String) paramter.get("endTime")));
		pageable.setParameter(paramter);
		model.addAttribute("page", this.paymentService.findByPage(pageable));
		paramter.put("endTime",DateUtils.decDateOneDay((String) paramter.get("endTime")));
		model.addAttribute("paramter", paramter);
		return "/admin/payment/list";
	}
	

	/**
	 * 删除操作
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(value = { "/delete" }, method = { RequestMethod.POST })
	@ResponseBody
	public Message delete(Long[] ids) {
		if (ids.length >= this.paymentService.count())
			return Message.error("admin.common.deleteAllNotAllowed",
					new Object[0]);
		this.paymentService.deleteAll(ids);
		return SUCCESS_MESSAGE;
	}
}
