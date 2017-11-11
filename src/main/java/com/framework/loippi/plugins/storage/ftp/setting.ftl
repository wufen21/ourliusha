
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
                    	 <h5>${message("admin.plugin.ftp.setting")}</h5>
                    	 <div class="ibox-tools">
                    	 	<button type="button" class="btn btn-outline btn-white btn-xs" id="btn-return-loippi" 
                    	 	onclick="location.href='../list.jhtml'"><i class="fa fa-reply-all"></i> 返回列表</button>
                        </div>
                    </div>            	
                  	<div class="ibox-content">
                  		<form id="inputForm" action="${base}/admin/storage_plugin/file/update.jhtml"  method="post" class="form-horizontal">
	                  		<div class="form-group">
	                       		<div class="row">
	                       			<div class="col-sm-6">
	                       			 	<label class="col-sm-3 control-label">${message("admin.plugin.ftp.host")}<span class="required" aria-required="true"> * </span></label>
	                       			 	 <div class="col-sm-9">
		                                    <input type="text" name="host" value="${pluginConfig.attributesMap['host']}" maxlength="20"  class="form-control" placeholder="${message("admin.plugin.ftp.host")}">
		                                </div>
		                                  
	                       			</div>
	                       		</div>
	                        </div>
	                        <div class="form-group">
	                       		<div class="row">
	                       			<div class="col-sm-6">
	                       			 	<label class="col-sm-3 control-label">${message("admin.plugin.ftp.port")}<span class="required" aria-required="true"> * </span></label>
	                       			 	 <div class="col-sm-9">
		                                    <input type="text" name="port" value="${pluginConfig.attributesMap['port']}" maxlength="20"  class="form-control" placeholder="${message("admin.plugin.ftp.port")}">
		                                </div>
		                                  
	                       			</div>
	                       		</div>
	                        </div>
	                        <div class="form-group">
	                       		<div class="row">
	                       			<div class="col-sm-6">
	                       			 	<label class="col-sm-3 control-label">${message("admin.plugin.ftp.password")}<span class="required" aria-required="true"> * </span></label>
	                       			 	 <div class="col-sm-9">
		                                    <input type="text" name="password" value="${pluginConfig.attributesMap['password']}" maxlength="20"  class="form-control" placeholder="${message("admin.plugin.ftp.password")}">
		                                </div>
		                                  
	                       			</div>
	                       		</div>
	                        </div>
	                        <div class="form-group">
	                       		<div class="row">
	                       			<div class="col-sm-6">
	                       			 	<label class="col-sm-3 control-label">${message("admin.plugin.ftp.urlPrefix")}<span class="required" aria-required="true"> * </span></label>
	                       			 	 <div class="col-sm-9">
		                                  <input type="text" name="urlPrefix" value="${pluginConfig.attributesMap['urlPrefix']}" maxlength="20" class="form-control" placeholder="${message("admin.plugin.ftp.urlPrefix")}">
		                                </div>
		                                  
	                       			</div>
	                       		</div>
	                        </div>
	                         <div class="form-group">
	                       		<div class="row">
	                       			<div class="col-sm-6">
	                       			 	<label class="col-md-3 control-label">${message("StoragePlugin.isEnabled")}</label>
	                       			 	 <div class="col-sm-9">
	                       			 	 	<div class="checkbox-inline i-checks ">
		                                      	<input type="checkbox" name="isEnabled" value="true"[#if pluginConfig.enabled == 1] checked[/#if] />
		                                    </div>
		                                </div>
		                                  
	                       			</div>
	                       		</div>
	                        </div>
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
			
        	$(".chosen-select").chosen({width:"100%"}); 
        	
        	jQuery("#inputForm").validate({
                rules: {
                	host: "required",
					port: {
						required: true,
						digits: true
					},
					username: "required",
					urlPrefix: "required"
                }
            });
        });
        
    </script>
</body>

</html>
