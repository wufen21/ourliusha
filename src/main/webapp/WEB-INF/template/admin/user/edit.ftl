
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
                    	 <h5>编辑管理员</h5>
                    	 <div class="ibox-tools">
                    	 	<button type="button" class="btn btn-outline btn-white btn-xs" id="btn-return-loippi" 
                    	 	onclick="location.href='list.jhtml'"><i class="fa fa-reply-all"></i> 返回列表</button>
                        </div>
                    </div>            	
                  	<div class="ibox-content">
                  		<form id="saveAclForm" class="form-horizontal" action="update.jhtml" method="post">
                  		<input type="hidden" class="form-control" name="id" id="id" value="${user.id}">
                  		<div class="form-group">
                       		<div class="row">
                       			 <div class="col-sm-6">
                       			 	<label class="col-sm-3 control-label">头像</label>
	                                <div class="col-sm-9">
	                                    <div class="input-group">
											<input type="text" class="form-control" name="avatar" id="avatar" value="${user.avatar}">
											<span class="input-group-btn">
												<button class="btn btn-white" type="button" id="browserButton"><i class="fa fa-send-o"></i>&nbsp;选择</button>
											</span>
										</div>
	                                </div>
                       			 </div>
                       			 <div class="col-sm-6">
                       			 	<label class="col-sm-3 control-label"><span class="required"> * </span>角色</label>
	                                <div class="col-sm-9">
	                                    <select name="roleId" id="roleId" data-placeholder="选择角色..." class="chosen-select"  style="width:350px;" >
                                     		[#list roles as role]
                                     		<option  hassubinfo="true" value="${role.id}" [#if user.roleId == role.id]selected[/#if]>${role.name}</option>
                                     		[/#list]
										</select>
	                                </div>
                       			 </div>
                       		</div>
                        </div>
                        <div class="form-group">
                       		<div class="row">
                       			<div class="col-sm-6">
                       			 	<label class="col-sm-3 control-label">昵称</label>
	                                <div class="col-sm-9">
	                                    <input type="text" name="nickname" id="nickname" class="form-control"value="${user.nickname}">
	                                </div>
                       			</div>
                       			<div class="col-sm-6">
                       			 	<label class="col-sm-3 control-label"><span class="required"> * </span>用户名</label>
	                                <div class="col-sm-9">
	                                    <input type="text" name="username" id="username" class="form-control" value="${user.username}" readonly>
	                                </div>
                       			</div>
                       		</div>
                        </div>
                         <div class="form-group">
                       		<div class="row">
                       			<div class="col-sm-6">
                       			 	<label class="col-sm-3 control-label">密码</label>
	                                <div class="col-sm-9">
	                                    <input type="password" name="password" id="password" class="form-control">
	                                </div>
                       			</div>
                       			<div class="col-sm-6">
                       			 	<label class="col-sm-3 control-label">重复密码</label>
	                                <div class="col-sm-9">
	                                    <input type="password" name="repassword" id="repassword" class="form-control">
	                                </div>
                       			</div>
                       		</div>
                        </div>
                        [#if user.username != 'admin']
                         <div class="form-group">
                       		<div class="row">
                       			<div class="col-sm-6">
                       			 	<label class="col-sm-3 control-label">客服功能</label>
                       			 	 <div class="col-sm-9">
	                                    <div class="checkbox-inline i-checks">
	                                       <input type="checkbox" class="i-checks" name="servicer" value="true" [#if user.servicer == true]checked[/#if]>
	                                    </div>
	                                </div>
	                                  
                       			</div>
                       		</div>
                        </div>
                        [/#if]
                        <div class="hr-line-dashed"></div>
	                    <div class="form-group">
	                        <div class="col-sm-12 col-sm-offset-10">
	                        	<button type="button" class="btn btn-default" onclick="window.history.back();">返回</button>
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
    
        $(document).ready(function () {
        	[@flash_message /]
        	var $browserButton = $("#browserButton");
			$browserButton.browser({input:$("#avatar")});
        	$(".chosen-select").chosen({width:"100%"}); 
        	
        	$('.i-checks').iCheck({ checkboxClass: 'icheckbox_square-green',  radioClass: 'iradio_square-green',  });
        	jQuery("#inputForm").validate({
			                rules: {
			                   username: {
									required: true,
									pattern: /^[0-9a-z_A-Z\u4e00-\u9fa5]+$/,
									minlength: 2,
									maxlength: 20,
									remote: {
										url: "check_username.jhtml",
										cache: false
									}
								},
								password: {
									pattern: /^[^\s&\"<>]+$/,
									minlength: 4,
									maxlength: 20
								},
								repassword: {
									equalTo: "#password"
								},
								email:{
									required: true,
									email :true
								},
								roleId: "required"
			                },
			                messages: {
								username: {
									pattern: "${message("admin.validate.illegal")}",
									remote: "${message("admin.validate.exist")}"
								},
								password: {
									pattern: "${message("admin.validate.illegal")}"
								}
							}
			            });
        });
        
    </script>
</body>

</html>
