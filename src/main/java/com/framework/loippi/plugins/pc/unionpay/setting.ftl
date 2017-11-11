[#assign shiro=JspTaglibs["/WEB-INF/tld/shiro.tld"] /]
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->
	<!-- BEGIN HEADER -->
		[#include "/admin/include/head.ftl"]
	<!-- END HEADER -->
	<!-- BEGIN BODY -->
	<!-- DOC: Apply "page-header-fixed-mobile" and "page-footer-fixed-mobile" class to body element to force fixed header or footer in mobile devices -->
	<!-- DOC: Apply "page-sidebar-closed" class to the body and "page-sidebar-menu-closed" class to the sidebar menu element to hide the sidebar by default -->
	<!-- DOC: Apply "page-sidebar-hide" class to the body to make the sidebar completely hidden on toggle -->
	<!-- DOC: Apply "" class to the body element to make the logo hidden on sidebar toggle -->
	<!-- DOC: Apply "page-sidebar-hide" class to body element to completely hide the sidebar on sidebar toggle -->
	<!-- DOC: Apply "page-sidebar-fixed" class to have fixed sidebar -->
	<!-- DOC: Apply "page-footer-fixed" class to the body element to have fixed footer -->
	<!-- DOC: Apply "page-sidebar-reversed" class to put the sidebar on the right side -->
	<!-- DOC: Apply "page-full-width" class to the body element to have full width page without the sidebar menu -->
	<body class="page-header-fixed page-sidebar-closed-hide-logo page-sidebar-closed-hide-logo">
	
		<!-- BEGIN HEADER -->	
			[#include "/admin/include/header.ftl"]
		<!-- END HEADER -->
	
		<div class="clearfix"></div>
		
		<!-- BEGIN CONTAINER -->
		<div class="page-container">
			<!-- BEGIN SIDEBAR -->
				[@sidebar pattern="admin:paymentPlugin"][#include "/admin/include/sidebar.ftl"][/@sidebar]
			<!-- END SIDEBAR -->
			
			<!-- BEGIN CONTENT -->
				<div class="page-content-wrapper">
					<div class="page-content" >
						<div class="page-head">
							<!-- BEGIN PAGE TITLE -->
							<div class="page-title">
								<h1><i class="icon-grid" style="font-size: 20px;"></i>&nbsp;${message("admin.plugin.unionpay.setting")}   </h1>
							</div>
							<!-- END PAGE TITLE -->
							[#include "/admin/include/setting.ftl"]
						</div>
						<!-- BEGIN PAGE HEADER-->
						<ul class="page-breadcrumb breadcrumb">
							<li>
								
								<a href="${base}/admin/common/main.jhtml">${message("admin.index.home")}</a>
								<i class="fa fa-circle"></i>
							</li>
							<li>
								<a href="javascript:;">${message("admin.role.systemGroup")}</a><i class="fa fa-circle"></i>
							</li>
							<li>
								<a href="javascript:;">${message("admin.plugin.unionpay.setting")}</a>
							</li>
						</ul>
						<!-- END PAGE HEADER-->
						<!-- BEGIN PAGE CONTENT-->
							<div class="row">
								<div class="col-md-12">
									<div class="portlet light bordered">
										<div class="portlet-body form">
											<!-- BEGIN FORM-->
											<form id="inputForm" action="${base}/admin/payment_plugin/unionpay/update.jhtml"  method="post" class="form-horizontal">
												<div class="form-body">
													<div class="form-group">
														<label class="col-md-3 control-label">${message("PaymentPlugin.paymentName")}<span class="required" aria-required="true"> * </span></label>
														<div class="col-md-4">
															<input type="text" name="paymentName" value="${pluginConfig.attributes['paymentName']}" class="form-control" placeholder="${message("PaymentPlugin.paymentName")}">
														</div>
													</div>
												</div>
												<div class="form-body">
													<div class="form-group">
														<label class="col-md-3 control-label">${message("admin.plugin.unionpay.partner")}<span class="required" aria-required="true"> * </span></label>
														<div class="col-md-4">
															<input type="text" name="partner" maxlength="20" value="${pluginConfig.attributes['partner']}" class="form-control" placeholder="${message("admin.plugin.unionpay.partner")}">
														</div>
													</div>
												</div>
												<div class="form-body">
													<div class="form-group">
														<label class="col-md-3 control-label">${message("admin.plugin.unionpay.key")}<span class="required" aria-required="true"> * </span></label>
														<div class="col-md-4">
															<input type="text" name="key" maxlength="20" value="${pluginConfig.attributes['key']}" class="form-control" placeholder="${message("admin.plugin.unionpay.key")}">
														</div>
													</div>
												</div>
												<div class="form-body">
													<div class="form-group">
														<label class="col-md-3 control-label">${message("PaymentPlugin.feeType")} </label>
														<div class="col-md-4">
															<select name="feeType"  class="bs-select form-control">
																[#list feeTypes as feeType]
																	<option value="${feeType}"[#if feeType == pluginConfig.attributes['feeType']] selected="selected"[/#if]>${message("PaymentPlugin.FeeType." + feeType)}</option>
																[/#list]
															</select>
														</div>
													</div>
												</div>
												<div class="form-body">
													<div class="form-group">
														<label class="col-md-3 control-label">${message("PaymentPlugin.fee")} </label>
														<div class="col-md-4">
															<input type="text" name="fee" maxlength="20" value="${pluginConfig.attributes['fee']}" class="form-control" placeholder="${message("PaymentPlugin.fee")}">
														</div>
													</div>
												</div>
												<div class="form-body">
													<div class="form-group">
														<label class="col-md-3 control-label">${message("PaymentPlugin.logo")} </label>
														<div class="col-md-4">
															<div class="input-group">
																<input type="text" class="form-control image" name="logo" id="logo"  value="${pluginConfig.attributes['logo']}">
																<span class="input-group-btn">
																	<button class="btn btn-success browserButton" data-target="image" type="button">&nbsp;${message("admin.browser.select")}</button>
																</span>
																[#if pluginConfig.attributes['logo']??]
																	<span class="input-group-btn" style="padding-left:10px;">
																		<a    href="${pluginConfig.attributes['logo']}"  class="fancybox-img btn default btn-xs green-stripe"> ${message("admin.common.view")} </a>
																	</span>
																[/#if]
															</div>
														</div>
													</div>
												</div>
												<div class="form-body">
													<div class="form-group">
														<label class="col-md-3 control-label">${message("PaymentPlugin.description")} </label>
														<div class="col-md-4">
															<input type="text" name="description" maxlength="20" value="${pluginConfig.attributes['description']}" class="form-control" placeholder="${message("PaymentPlugin.description")}">
															</textarea>
														</div>
													</div>
												</div>
												<div class="form-body">
													<div class="form-group">
														<label class="col-md-3 control-label">${message("admin.common.order")} </label>
														<div class="col-md-4">
															<input type="text" name="order" maxlength="20" value="${pluginConfig.attributes['order']}" class="form-control" placeholder="${message("admin.common.order")}">
														</div>
													</div>
												</div>
												<div class="form-body">
													<div class="form-group">
														<label class="col-md-3 control-label">${message("PaymentPlugin.isEnabled")}</label>
														<div class="col-md-4">
															<div class="checkbox-list">
															<label class="checkbox-inline">
																<input type="checkbox" name="isEnabled" value="true"[#if pluginConfig.isEnabled] checked[/#if] /></label>
															</div>
														</div>
													</div>
												</div>
												<div class="form-actions">
													<div class="row">
														<div class="col-md-offset-3 col-md-9">
															<button type="submit" class="btn green">${message("admin.common.submit")}</button>
															<button type="button" class="btn default" id="backButton">${message("admin.common.back")}</button>
														</div>
													</div>
												</div>
											</form>
											<!-- END FORM-->
										</div>
									</div>
								</div>
							</div>
						<!-- END PAGE CONTENT-->
					</div>
				</div>
			<!-- END CONTENT -->
			
			
			<!-- BEGIN QUICK SIDEBAR -->
				
			<!-- END QUICK SIDEBAR -->
		</div>
		<!-- END CONTAINER -->
		
		<!-- BEGIN FOOTER -->
			[#include "/admin/include/footer.ftl"]
		<!-- END FOOTER -->
		
		
		<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
			[#include "/admin/include/foot.ftl"]
			
			
		<!-- END JAVASCRIPTS -->
			<script>
				$(document).ready(function(){
					var $inputForm = $("#inputForm");
					var $browserButton = $(".browserButton");
					
					[@flash_message /]
					
					$browserButton.browser();
					
					 $('.bs-select').selectpicker({
			            iconBase: 'fa',
			            tickIcon: 'fa-check'
			        });
			        
					// 表单验证
					$inputForm.validate({
						rules: {
							paymentName: "required",
							partner: "required",
							key: "required",
							fee: {
								required: true,
								min: 0,
								decimal: {
									integer: 12,
									fraction: ${setting.priceScale}
								}
							},
							order: "digits"
						}
					});
				});
			</script>
	</body>
<!-- END BODY -->
</html>
