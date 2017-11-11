
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
                    	 <h5>${message("admin.plugin.file.setting")}</h5>
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
	                       			 	<label class="col-sm-3 control-label">是否内置</label>
	                       			 	 <div class="col-sm-9">
		                                    <div class="checkbox-inline i-checks ">
		                                       <input type="checkbox" class="i-checks" name="isSystem" checked disabled value="true">
		                                    </div>
		                                </div>
		                                  
	                       			</div>
	                       		</div>
	                        </div>
	                        <div class="hr-line-dashed"></div>
		                    <div class="form-group">
		                        <div class="col-sm-12 col-sm-offset-11">
		                        	<button type="button" class="btn btn-default" onclick="window.history.back();">返回</button>
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
        });
        
    </script>
</body>

</html>
