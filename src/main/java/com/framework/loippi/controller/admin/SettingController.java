package com.framework.loippi.controller.admin;

import java.io.FileOutputStream;
import java.io.OutputStream;
import java.net.ConnectException;
import java.net.UnknownHostException;
import java.util.Properties;

import javax.annotation.Resource;
import javax.mail.MessagingException;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.support.PropertiesLoaderUtils;
import org.springframework.mail.MailAuthenticationException;
import org.springframework.mail.MailSendException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.framework.loippi.service.CacheService;
import com.framework.loippi.service.FileService;
import com.framework.loippi.service.MailService;
import com.framework.loippi.service.StaticService;
import com.framework.loippi.support.CommonAttributes;
import com.framework.loippi.support.FileInfo.FileType;
import com.framework.loippi.support.Message;
import com.framework.loippi.support.Setting;
import com.framework.loippi.support.Setting.RoundType;
import com.framework.loippi.utils.SettingUtils;
import com.sun.mail.smtp.SMTPSendFailedException;
import com.sun.mail.smtp.SMTPSenderFailedException;

/**
 * Controller - 系统设置
 * 
 * @author Mounate Yan。
 * @version 1.0
 */
@Controller("adminSettingController")
@RequestMapping("/admin/setting")
public class SettingController extends GenericController {
	@Resource(name = "fileServiceImpl")
	private FileService fileService;
	@Resource(name = "mailServiceImpl")
	private MailService mailService;
	@Resource(name = "cacheServiceImpl")
	private CacheService cacheService;
	@Resource(name = "staticServiceImpl")
	private StaticService staticService;

	/**
	 * 邮件测试
	 */
	@RequestMapping(value = "/mail_test", method = RequestMethod.POST)
	public @ResponseBody
	Message mailTest(String smtpFromMail, String smtpHost, Integer smtpPort, String smtpUsername, String smtpPassword, String toMail) {
		if (StringUtils.isEmpty(toMail)) {
			return ERROR_MESSAGE;
		}
		Setting setting = SettingUtils.get();
		if (StringUtils.isEmpty(smtpPassword)) {
			smtpPassword = setting.getSmtpPassword();
		}
		try {
			mailService.sendTestMail(smtpFromMail, smtpHost, smtpPort, smtpUsername, smtpPassword, toMail);
		} catch (MailSendException e) {
			Exception[] messageExceptions = e.getMessageExceptions();
			if (messageExceptions != null) {
				for (Exception exception : messageExceptions) {
					if (exception instanceof SMTPSendFailedException) {
						SMTPSendFailedException smtpSendFailedException = (SMTPSendFailedException) exception;
						Exception nextException = smtpSendFailedException.getNextException();
						if (nextException instanceof SMTPSenderFailedException) {
							return Message.error("admin.setting.mailTestSenderFailed");
						}
					} else if (exception instanceof MessagingException) {
						MessagingException messagingException = (MessagingException) exception;
						Exception nextException = messagingException.getNextException();
						if (nextException instanceof UnknownHostException) {
							return Message.error("admin.setting.mailTestUnknownHost");
						} else if (nextException instanceof ConnectException) {
							return Message.error("admin.setting.mailTestConnect");
						}
					}
				}
			}
			return Message.error("admin.setting.mailTestError");
		} catch (MailAuthenticationException e) {
			return Message.error("admin.setting.mailTestAuthentication");
		} catch (Exception e) {
			return Message.error("admin.setting.mailTestError");
		}
		return Message.success("admin.setting.mailTestSuccess");
	}

	/**
	 * 编辑
	 */
	@RequiresPermissions("admin:system:setting")
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String edit(ModelMap model) {
		model.addAttribute("roundTypes", RoundType.values());
		return "/admin/setting/edit";
	}

	/**
	 * 更新
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(Setting setting, MultipartFile logoImageFile, ModelMap model , RedirectAttributes redirectAttributes) {
		
		Setting srcSetting = SettingUtils.get();
		if (StringUtils.isEmpty(setting.getSmtpPassword())) {
			setting.setSmtpPassword(srcSetting.getSmtpPassword());
		}
		if (logoImageFile != null && !logoImageFile.isEmpty()) {
			if (!fileService.isValid(FileType.image, logoImageFile)) {
				addFlashMessage(redirectAttributes, Message.error("admin.upload.invalid"));
				return "redirect:edit.jhtml";
			}
			String logoImage = fileService.uploadLocal(FileType.image, logoImageFile);
			setting.setLogo(logoImage);
		} else {
			setting.setLogo(srcSetting.getLogo());
		}
		setting.setCaptchaTypes(srcSetting.getCaptchaTypes());
		SettingUtils.set(setting);
		cacheService.clear();
		staticService.buildOther();

		OutputStream outputStream = null;
		try {
			org.springframework.core.io.Resource resource = new ClassPathResource(CommonAttributes.FRAMEWORK_PROPERTIES_PATH);
			Properties properties = PropertiesLoaderUtils.loadProperties(resource);
			outputStream = new FileOutputStream(resource.getFile());
			properties.setProperty("template.update_delay", "0");
			properties.setProperty("message.cache_seconds", "0");
			properties.store(outputStream, "METRONIC FRAMEWORK PROPERTIES");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			IOUtils.closeQuietly(outputStream);
		}
		//解密
		addFlashMessage(redirectAttributes, SUCCESS_MESSAGE);
		return "redirect:edit.jhtml";
	}

}