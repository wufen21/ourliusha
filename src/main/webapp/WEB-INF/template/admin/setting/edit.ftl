
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">

    <title>${setting.siteName} - 主页</title>
    <meta name="keywords" content="${setting.siteName}">
  	<meta name="description" content="${setting.siteName}">

  	<!-- BEGIN HEADER -->
		[#include "/admin/include/style.ftl"]
	<!-- END HEADER -->
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content  animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
            	<div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>系统设置</h5>
                    </div>
                    <div class="ibox-content">
                    	<form action="update.jhtml" id="inputForm" method="post" enctype="multipart/form-data" class="form-horizontal">
                    	 <div class="tabs-container">
		                    <ul class="nav nav-tabs">
		                        <li class="active"><a data-toggle="tab" href="#tab-1" aria-expanded="true">基础设置</a>
		                        </li>
		                        <li class=""><a data-toggle="tab" href="#tab-2" aria-expanded="false">邮件设置</a>
		                        </li>
		                         <li class=""><a data-toggle="tab" href="#tab-3" aria-expanded="false">其他设置</a>
		                        </li>
		                    </ul>
		                    <div class="tab-content">
		                        <div id="tab-1" class="tab-pane active">
		                            <div class="panel-body">
		                               <div class="form-group">
		                               		<div class="row">
		                               			 <div class="col-sm-6">
		                               			 	<label class="col-sm-3 control-label"><span class="required" aria-required="true"> * </span>${message("Setting.siteName")}</label>
					                                <div class="col-sm-9">
					                                    <input type="text" name="siteName" value="${setting.siteName}" class="form-control">
					                                </div>
		                               			 </div>
		                               			 <div class="col-sm-6">
		                               			 	<label class="col-sm-3 control-label">${message("Setting.siteUrl")}</label>
					                                <div class="col-sm-9">
					                                    <input type="text" name="siteUrl" value="${setting.siteUrl}" class="form-control">
					                                </div>
		                               			 </div>
		                               		</div>
			                            </div>
			                            <div class="form-group">
		                               		<div class="row">
		                               			 <div class="col-sm-6">
		                               			 	<label class="control-label col-md-3">${message("Setting.logo")}</label>
					                                <div class="col-sm-9">
					                                	<div id="file-pretty">
								                                <input type="file" class="form-control" name="logoImageFile">
								                        </div>
					                                </div>
		                               			 </div>
		                               			 <div class="col-sm-6">
		                               			 	<label class="col-sm-3 control-label">${message("Setting.contact")}</label>
					                                <div class="col-sm-9">
					                                    <input type="text" name="contact" value="${setting.contact}" class="form-control">
					                                    
					                                </div>
		                               			 </div>
		                               		</div>
			                            </div>
			                             <div class="form-group">
		                               		<div class="row">
		                               			 <div class="col-sm-6">
		                               			 	<label class="col-sm-3 control-label"><span class="required" aria-required="true"> * </span>${message("Setting.address")}</label>
					                                <div class="col-sm-9">
					                                    <input type="text" name="address" value="${setting.address}" class="form-control">
					                                </div>
		                               			 </div>
		                               			 <div class="col-sm-6">
		                               			 	<label class="col-sm-3 control-label"><span class="required" aria-required="true"> * </span>${message("Setting.email")}</label>
					                                <div class="col-sm-9">
					                                    <input type="text" name="email" value="${setting.email}" class="form-control">
					                                </div>
		                               			 </div>
		                               		</div>
			                            </div>
			                             <div class="form-group">
		                               		<div class="row">
		                               			<div class="col-sm-6">
		                               			 	<label class="col-sm-3 control-label">${message("Setting.phone")}</label>
					                                <div class="col-sm-9">
					                                    <input type="text" name="phone" value="${setting.phone}" class="form-control">
					                                </div>
		                               			 </div>
		                               			 <div class="col-sm-6">
		                               			 	<label class="col-sm-3 control-label"><span class="required" aria-required="true"> * </span>${message("Setting.certtext")}</label>
					                                <div class="col-sm-9">
					                                    <input type="text" name="certtext" value="${setting.certtext}" class="form-control">
					                                </div>
		                               			 </div>
		                               		</div>
			                            </div>
		                            </div>
		                        </div>
		                        <div id="tab-2" class="tab-pane">
		                            <div class="panel-body">
		                            	 <div class="form-group">
		                               		<div class="row">
		                               			 <div class="col-sm-6">
		                               			 	<label class="col-sm-3 control-label"><span class="required" aria-required="true"> * </span>${message("Setting.smtpFromMail")}</label>
					                                <div class="col-sm-9">
					                                    <input type="text" name="smtpFromMail"  id="smtpFromMail" value="${setting.smtpFromMail}" class="form-control">
					                                </div>
		                               			 </div>
		                               			 <div class="col-sm-6">
		                               			 	<label class="col-sm-3 control-label"><span class="required" aria-required="true"> * </span>${message("admin.setting.toMail")}</label>
					                                <div class="col-sm-9">
					                                	<div class="input-group">
					                                        <input type="text" class="form-control ignore"id="toMail" name="toMail"><span class="input-group-btn"> <button id="mailTest" type="button" class="btn btn-primary"><i class="fa fa-yelp"></i> ${message("admin.setting.mailTest")}
					                                        </button> </span>
					                                    </div>
					                                </div>
		                               			 </div>
		                               		</div>
			                            </div>
			                             <div class="form-group">
		                               		<div class="row">
		                               			 <div class="col-sm-6">
		                               			 	<label class="col-sm-3 control-label"><span class="required" aria-required="true"> * </span>${message("Setting.smtpHost")}</label>
					                                <div class="col-sm-9">
					                                    <input type="text" name="smtpHost" id="smtpHost" value="${setting.smtpHost}" class="form-control">
					                                </div>
		                               			 </div>
		                               			 <div class="col-sm-6">
		                               			 	<label class="col-sm-3 control-label"><span class="required" aria-required="true"> * </span>${message("Setting.smtpPort")}</label>
					                                <div class="col-sm-9">
					                                    <input type="text" name="smtpPort" id="smtpPort" value="${setting.smtpPort}" class="form-control">
					                                </div>
		                               			 </div>
		                               		</div>
			                            </div>
			                             <div class="form-group">
		                               		<div class="row">
		                               			 <div class="col-sm-6">
		                               			 	<label class="col-sm-3 control-label"><span class="required" aria-required="true"> * </span>${message("Setting.smtpUsername")}</label>
					                                <div class="col-sm-9">
					                                    <input type="text" name="smtpUsername" id="smtpUsername" value="${setting.smtpUsername}" class="form-control">
					                                </div>
		                               			 </div>
		                               			 <div class="col-sm-6">
		                               			 	<label class="col-sm-3 control-label">${message("Setting.smtpPassword")}</label>
					                                <div class="col-sm-9">
					                                    <input type="password" name="smtpPassword" id="smtpPassword"  class="form-control">
					                                </div>
		                               			 </div>
		                               		</div>
			                            </div>
		                            </div>
		                        </div>
		                        <div id="tab-3" class="tab-pane">
		                            <div class="panel-body">
		                               <div class="form-group">
		                               		<div class="row">
		                               			 <div class="col-sm-6">
		                               			 	<label class="col-sm-3 control-label"><span class="required" aria-required="true"> * </span>${message("Setting.accountLockCount")}</label>
					                                <div class="col-sm-9">
					                                    <input type="text" name="accountLockCount" id="accountLockCount" value="${setting.accountLockCount}" class="form-control">
					                                </div>
		                               			 </div>
		                               			 <div class="col-sm-6">
		                               			 	<label class="col-sm-3 control-label"><span class="required" aria-required="true"> * </span>${message("Setting.accountLockTime")}</label>
					                                <div class="col-sm-9">
					                                    <input type="text" name="accountLockTime" id="accountLockTime" value="${setting.accountLockTime}" class="form-control">
					                                </div>
		                               			 </div>
		                               		</div>
			                            </div>
			                            <div class="form-group">
		                               		<div class="row">
		                               			 <div class="col-sm-6">
		                               			 	<label class="col-sm-3 control-label"><span class="required"> * </span>${message("Setting.uploadMaxSize")}</label>
					                                <div class="col-sm-9">
					                                    <input type="text" name="uploadMaxSize" id="uploadMaxSize" value="${setting.uploadMaxSize}" class="form-control">
					                                </div>
		                               			 </div>
		                               			 <div class="col-sm-6">
		                               			 	<label class="col-sm-3 control-label">${message("Setting.uploadFlashExtension")}</label>
					                                <div class="col-sm-9">
					                                    <input type="text" name="uploadFlashExtension" id="uploadFlashExtension" value="${setting.uploadFlashExtension}" class="form-control">
					                                </div>
		                               			 </div>
		                               		</div>
			                            </div>
			                            <div class="form-group">
		                               		<div class="row">
		                               			 <div class="col-sm-6">
		                               			 	<label class="col-sm-3 control-label">${message("Setting.uploadMediaExtension")}</label>
					                                <div class="col-sm-9">
					                                    <input type="text" name="uploadMediaExtension" id="uploadMediaExtension" value="${setting.uploadMediaExtension}" class="form-control">
					                                </div>
		                               			 </div>
		                               			 <div class="col-sm-6">
		                               			 	<label class="col-sm-3 control-label">${message("Setting.uploadFileExtension")}</label>
					                                <div class="col-sm-9">
					                                    <input type="text" name="uploadFileExtension" id="uploadFileExtension" value="${setting.uploadFileExtension}" class="form-control">
					                                </div>
		                               			 </div>
		                               		</div>
			                            </div>
			                            <div class="form-group">
		                               		<div class="row">
		                               			 <div class="col-sm-6">
		                               			 	<label class="col-sm-3 control-label"><span class="required"> * </span>${message("Setting.imageUploadPath")}</label>
					                                <div class="col-sm-9">
					                                    <input type="text" name="imageUploadPath" id="imageUploadPath" value="${setting.imageUploadPath}" class="form-control">
					                                </div>
		                               			 </div>
		                               			 <div class="col-sm-6">
		                               			 	<label class="col-sm-3 control-label"><span class="required"> * </span>${message("Setting.flashUploadPath")}</label>
					                                <div class="col-sm-9">
					                                    <input type="text" name="flashUploadPath" id="flashUploadPath" value="${setting.flashUploadPath}" class="form-control">
					                                </div>
		                               			 </div>
		                               		</div>
			                            </div>
			                              <div class="form-group">
		                               		<div class="row">
		                               			 <div class="col-sm-6">
		                               			 	<label class="col-sm-3 control-label"><span class="required"> * </span>${message("Setting.mediaUploadPath")}</label>
					                                <div class="col-sm-9">
					                                    <input type="text" name="mediaUploadPath" id="mediaUploadPath" value="${setting.mediaUploadPath}" class="form-control">
					                                </div>
		                               			 </div>
		                               			 <div class="col-sm-6">
		                               			 	<label class="col-sm-3 control-label"><span class="required"> * </span>${message("Setting.fileUploadPath")}</label>
					                                <div class="col-sm-9">
					                                    <input type="text" name="fileUploadPath" id="fileUploadPath" value="${setting.fileUploadPath}" class="form-control">
					                                </div>
		                               			 </div>
		                               		</div>
			                            </div>
			                              <div class="form-group">
		                               		<div class="row">
		                               			 <div class="col-sm-6">
		                               			 	<label class="col-sm-3 control-label"><span class="required"> * </span>${message("Setting.cookiePath")}</label>
					                                <div class="col-sm-9">
					                                    <input type="text" name="cookiePath" id="cookiePath" value="${setting.cookiePath}" class="form-control">
					                                </div>
		                               			 </div>
		                               			 <div class="col-sm-6">
		                               			 	<label class="col-sm-3 control-label">${message("Setting.cookieDomain")}</label>
					                                <div class="col-sm-9">
					                                    <input type="text" name="cookieDomain" id="cookieDomain" value="${setting.cookieDomain}" class="form-control">
					                                </div>
		                               			 </div>
		                               		</div>
			                            </div>
			                              <div class="form-group">
		                               		<div class="row">
		                               			 <div class="col-sm-6">
		                               			 	<label class="col-sm-3 control-label">${message("Setting.priceScale")}</label>
					                                <div class="col-sm-9">
					                                    <select name="priceScale" data-placeholder="选择省份..." class="chosen-select"  style="width:350px;" >
															<option  hassubinfo="true" value="0"[#if setting.priceScale == 0] selected="selected"[/#if]>${message("admin.setting.priceScale0")}</option>
															<option  hassubinfo="true" value="1"[#if setting.priceScale == 1] selected="selected"[/#if]>${message("admin.setting.priceScale1")}</option>
															<option  hassubinfo="true" value="2"[#if setting.priceScale == 2] selected="selected"[/#if]>${message("admin.setting.priceScale2")}</option>
															<option  hassubinfo="true" value="3"[#if setting.priceScale == 3] selected="selected"[/#if]>${message("admin.setting.priceScale3")}</option>
														</select>
					                                </div>
		                               			 </div>
		                               			 <div class="col-sm-6">
		                               			 	<label class="col-sm-3 control-label">${message("Setting.priceRoundType")}</label>
					                                <div class="col-sm-9">
					                                   	<select name="priceRoundType" class="chosen-select"   style="width:350px;">
															[#list roundTypes as roundType]
																<option  hassubinfo="true" value="${roundType}" [#if roundType == setting.priceRoundType] selected="selected"[/#if]>${message("Setting.RoundType." + roundType)}</option>
															[/#list]
														</select>
					                                </div>
		                               			 </div>
		                               		</div>
			                            </div>
			                              <div class="form-group">
		                               		<div class="row">
		                               			 <div class="col-sm-6">
		                               			 	<label class="col-sm-3 control-label">${message("Setting.currencySign")}</label>
					                                <div class="col-sm-9">
					                                    <input type="text" name="currencySign" id="currencySign" value="${setting.currencySign}" class="form-control">
					                                </div>
		                               			 </div>
		                               			 <div class="col-sm-6">
		                               			 	<label class="col-sm-3 control-label">${message("Setting.currencyUnit")}</label>
					                                <div class="col-sm-9">
					                                    <input type="text" name="currencyUnit" id="currencyUnit" value="${setting.currencyUnit}" class="form-control">
					                                </div>
		                               			 </div>
		                               		</div>
			                            </div>
			                            
			                             <div class="form-group">
		                               		<div class="row">
		                               			  <div class="col-sm-6">
		                               			 	<label class="col-sm-3 control-label">${message("Setting.uploadImageExtension")}</label>
					                                <div class="col-sm-9">
					                                    <input type="text" name="uploadImageExtension" id="uploadImageExtension" value="${setting.uploadImageExtension}" class="form-control">
					                                </div>
		                               			 </div>
		                               		</div>
			                       			<div class="col-sm-6">
			                       			 	<label class="col-sm-3 control-label">开发模式</label>
			                       			 	 <div class="col-sm-9">
				                                    
				                                    <div class="checkbox-inline i-checks">
				                                       <input type="checkbox" class="i-checks" name="isDevelopmentEnabled" value="true">
				                                    </div>
				                                </div>
				                                  
			                       			</div>
			                            </div>
		                            </div>
		                        </div>
		                    </div>
		                </div>
		                <div class="hr-line-dashed"></div>
	                    <div class="form-group">
	                        <div class="col-sm-12 col-sm-offset-10">
	                            <button class="btn btn-success" type="submit">保存内容</button>
	                        </div>
	                    </div>
		          		</form>
                    </div>
                </div>
            </div>
        </div>
    </div>
	
	<!-- BEGIN Script -->
		[#include "/admin/include/script.ftl"]
	<!-- END Script -->
    <script>
		$(document).ready(function(){
			var $smtpFromMail = $("#smtpFromMail");
			var $smtpHost = $("#smtpHost");
			var $smtpPort = $("#smtpPort");
			var $smtpUsername = $("#smtpUsername");
			var $smtpPassword = $("#smtpPassword");
			var $toMail = $("#toMail");
			var $mailTest = $("#mailTest");
			var $mailTestStatus = $("#mailTestStatus");
			[@flash_message /]
			
			$('#file-pretty input[type="file"]').prettyFile();
			
		    $(".chosen-select").chosen({width:"100%"}); 
		    
			// 邮件测试
			$mailTest.click(function() {
				var $this = $(this);
				if ($this.val() == "${message("admin.setting.mailTest")}") {
					$this.val("${message("admin.setting.sendMail")}");
					$toMailWrap.show();
				} else {
					function valid(element) {
						return $("#inputForm").validate().element(element);
					}
					var o;
					$.ajax({
						url: "mail_test.jhtml",
						type: "POST",
						data: {smtpFromMail: $smtpFromMail.val(), smtpHost: $smtpHost.val(), smtpPort: $smtpPort.val(), smtpUsername: $smtpUsername.val(), smtpPassword: $smtpPassword.val(), toMail: $toMail.val()},
						dataType: "json",
						cache: false,
						beforeSend: function() {
							if (valid($smtpFromMail) & valid($smtpHost) & valid($smtpPort) & valid($smtpUsername) ) {
								if(!valid($toMail)){
									art.error("请填写正确的邮箱地址");
									return false;
								}else{
									 o = layer.load();
								}
							} else {
								return false;
							}
						},
						success: function(message) {
						 	layer.close(o)
							$mailTestStatus.empty();
							art.message(message);
						}
					});
				}
			});

			jQuery("#inputForm").validate({
	            rules: {
	                siteName: {
	                    minlength: 2,
	                    required: true
	                },
	                email: {
	                    required: true,
	                    email: true
	                },
	                smtpFromMail: {
	                    required: true,
	                    email: true
	                },
	                toMail: {
						required: true,
						email: true
					},
	                siteUrl: {
	                    required: true,
	                    url: true
	                },
	                hoted: {
	                    required: true,
	                    digits: true
	                },
	                smtpHost: {
	                    required: true
	                },
	                smtpPort: {
	                    required: true,
	                    digits: true
	                },
	                smtpUsername: {
	                    required: true
	                },
	                cookiePath: {
	                    required: true
	                },
	                startPushTime:"required",
	                endPushTime:"required",
	                imageUploadPath: "required",
					flashUploadPath: "required",
					mediaUploadPath: "required",
					fileUploadPath: "required",
					masterSecret: "required",
					appKey: "required",
					accountLockCount: {
						required: true,
						digits: true,
						min: 1
					},
					accountLockTime: {
						required: true,
						digits: true
					},
					uploadMaxSize: {
						required: true,
						digits: true
					},
					certtext:{
						required: true
					}
	            }
	        });
		});
	</script>
</body>

</html>
