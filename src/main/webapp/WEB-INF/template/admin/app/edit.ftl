
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
                    	 <h5>应用更新</h5>
                    	 <div class="ibox-tools">
                    	 	<button type="button" class="btn btn-outline btn-white btn-xs" id="btn-return-loippi" 
                    	 	onclick="location.href='list.jhtml'"><i class="fa fa-reply-all"></i> 返回列表</button>
                        </div>
                    </div>            	
                  	<div class="ibox-content">
                  		<form id="inputForm" class="form-horizontal" action="update.jhtml" method="post">
                  		<input type="hidden" value="${app.id}" name="id"/>
                  		<div class="form-group">
                       		<div class="row">
                       			 <div class="col-sm-6">
                       			 	<label class="col-sm-3 control-label">设备类型</label>
	                                <div class="col-sm-9">
	                                	<p class="form-control-static">[#if app.device == 0]IOS[#else]Android[/#if]</p>
	                                </div>
                       			 </div>
                       		</div>
                        </div>
                        <div class="form-group">
                       		<div class="row">
                       			<div class="col-sm-6">
                       			 	<label class="col-sm-3 control-label"><span class="required"> * </span>URL</label>
	                                <div class="col-sm-9">
	                                  <input type="text" [#if app.device == 1]readonly[/#if] name="filepath" class="form-control" maxlength="200"  value="${app.url}" />
	                                </div>
                       			</div>
                       		</div>
                        </div>
                        [#if app.device == 1]
                        <div class="form-group">
                       		<div class="row">
                       			<div class="col-sm-6">
	                               <label class="col-sm-3 control-label"><span class="required"> * </span>更新包</label>
	                                <div class="col-sm-9">
										<div id="file-pretty">
				                                <input type="file" class="form-control" name="file">
				                        </div>
	                                </div>
                       			</div>
                       		</div>
                        </div>
                        [/#if]
                         <div class="form-group">
                       		<div class="row">
                       			<div class="col-sm-6">
                       			 	<label class="col-sm-3 control-label"><span class="required"> * </span>版本号</label>
	                                <div class="col-sm-9">
	                                    <input type="text" name="version" id="version" class="form-control" value="${app.version}">
	                                </div>
                       			</div>
                       		</div>
                        </div>
                        <div class="form-group">
                       		<div class="row">
                       			<div class="col-sm-6">
                       			 	<label class="col-sm-3 control-label"><span class="required"> * </span>更新内容</label>
	                                <div class="col-sm-9">
	                                	<textarea  name="content" class="form-control">${app.content?html}</textarea>
	                                </div>
                       			</div>
                       		</div>
                        </div>
                        <div class="hr-line-dashed"></div>
	                    <div class="form-group">
	                        <div class="col-sm-12 col-sm-offset-10">
	                        	<button type="button" class="btn btn-default" onclick="window.history.back();">返回</button>
	                            <button class="btn btn-success" type="submit">提交更新</button>
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
        	
        	$('#file-pretty input[type="file"]').prettyFile();
        	
        	jQuery("#inputForm").validate({
				rules: {
					type: "required",
					device: "required",
					version: "required",
					filepath: "required"
				}
			});
        });
        
    </script>
</body>

</html>