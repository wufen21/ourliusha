
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">

    <title>${apiSettings.name}</title>
    <meta name="keywords" content="${setting.siteName}">
  	<meta name="description" content="${setting.siteName}">
  	<!-- BEGIN HEADER -->
		[#include "/admin/include/style.ftl"]
	<!-- END HEADER -->
	<link href="${base}/resources/css/plugins/codemirror/codemirror.css" rel="stylesheet">
    <link href="${base}/resources/css/plugins/codemirror/ambiance.css" rel="stylesheet">
	<style>
		.custom-form-control{
			 background-color: #FFF;    background-image: none;    border: none;    border-bottom: 1px solid #e5e6e7;
		}
		
		.form-group{
			margin-bottom: 2px;
		}
	</style>
</head>

<body class="gray-bg">
	<div class="row  border-bottom white-bg dashboard-header" style="padding: 10px;">
		<div class="col-sm-12">
			<div class="p-xs tooltip-demo">
				<span class="text-muted small pull-right">版本:${apiSettings.version}  <br>作者:${apiSettings.author}</span>
				<div class="pull-left m-r-md" onclick="window.location.href='${base}/admin/api/index.jhtml'">
					<i class="${apiSettings.logo} text-navy mid-icon" style="color:#1C84C6;"></i>
				</div>
				<h2 onclick="window.location.href='${base}/admin/api/index.jhtml'">${apiSettings.name}</h2>
				<a href="${base}/admin/api/view.jhtml" target="_blank" class="btn btn-white  pull-right" data-toggle="tooltip" data-placement="top" title="" data-original-title="预览"><i class="fa fa-paper-plane"></i> </a> 
				<a href="${base}/admin/api/download.jhtml"class="btn btn-white btn-bitbucket  pull-right" style="margin-right: 2px;" data-toggle="tooltip" data-placement="top" title="" data-original-title="导出Postman文件"> <i class="fa fa-file-powerpoint-o"></i>     </a>
				<a class="btn btn-white btn-bitbucket  pull-right" style="margin-right: 2px;" data-toggle="tooltip" data-placement="top" title="" data-original-title="生成代码"> <i class="fa fa-code"></i>     </a>
				<a href="${base}/admin/api/index.jhtml" target="_blank"  id="full_screen" style="margin-right: 2px;" class="btn btn-white  pull-right" data-toggle="tooltip" data-placement="top" title="" data-original-title="全屏"><i class="fa fa-arrows-alt"></i> </a>
					<span>介绍：${apiSettings.description}
				</span>
			</div>
		</div>
	</div>
	<div class="wrapper wrapper-content">
		<div class="row">
			<div class="col-sm-2">
				<div class="ibox float-e-margins">
					<div class="ibox-content mailbox-content">
						<div class="file-manager">
							<h5>接口分类</h5>
							<ul class="folder-list m-b-md" style="padding: 0">
								[#list categories as category]
								<li class="x-category">
									[#if category.counts?? && category.counts gt 0]<span class="label label-warning pull-right" style="margin: 15px 0px;">${category.counts}</span>[/#if]
									<a href="${base}/admin/api/category/view/${category.id}.jhtml" style="padding: 15px 0;display: inline-table;"> 
										<i class="${category.icon}"></i>${category.name}</a>
									<i class="fa fa-times pull-right hidden x-delete" style="padding: 15px 0;display: inline-table;cursor: pointer;" data-id="${category.id}"></i>
								</li>
								[/#list]
							</ul>
							<a class="btn btn-block btn-success compose-mail" class="btn btn-primary" data-toggle="modal" data-target="#myModal">创建分类</a>
							<a class="btn btn-block btn-white  compose-mail">创建接口</a>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-10 animated fadeInRight">
				<div class="mail-box-header">
					<h2>
						更新接口
					</h2>
				</div>
				<div class="mail-box">
					<div class="ibox-content">
                        <form method="post" id="inputForm" action="${base}/admin/api/interfacer/update.jhtml" class="form-horizontal">
                        	<input type="hidden" name="id" value="${interfacer.id}" />
                        	<div class="form-group">
                                <label class="col-sm-2 control-label">接口分类</label>
                                <div class="col-sm-10">
                                    <select name="categoryId" id="categoryId" data-placeholder="上级接口分类..." class="chosen-select"  style="width:350px;" >
					                 	[#list categories as cate]
					             			<option  hassubinfo="true" value="${cate.id}" [#if cate.id == interfacer.categoryId]selected[/#if]>${cate.name}</option>
					             		[/#list]
									</select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">接口名称</label>
                                <div class="col-sm-10">
                                    <input type="text" name="iname" class="form-control" value="${interfacer.name!''}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">接口地址</label>
                                 <div class="col-sm-2">
                                    <select name="method" id="method" data-placeholder="请求方式..." class="chosen-select"  style="width:350px;" >
					             		<option  hassubinfo="true" value="POST" [#if 'POST' == interfacer.method]selected[/#if]>Post</option>
					             		<option  hassubinfo="true" value="GET" [#if 'GET' == interfacer.method]selected[/#if]>Get</option>
									</select>
                                </div>
                                <div class="col-sm-8">
                                    <input type="text" name="url" class="form-control" value="${interfacer.url!''}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">接口描述</label>
                                <div class="col-sm-10">
                                    <input type="text"  name="description"  class="form-control" value="${interfacer.description!''}">
                                </div>
                            </div>
                            <div id="paramsWrapper">
                            <p style="padding: 10px;border: 1px solid #e7eaec;border-left: none;border-right: none; background-color: #F3F3F4;  /* margin-bottom: 0px; */">请求参数</p>
                            [#if interfacer.parameters?? && interfacer.parameters?size gt 0]
                           	[#list interfacer.parameters as param]
                           	<div class="form-group">
                                 <div class="col-sm-2">
                                 	<select name="params[${param_index}].type" id="type" class="form-control custom-form-control">
					             		<option hassubinfo="true" value="String" [#if param.type == 'String']selected[/#if]>String</option>
					             		<option hassubinfo="true" value="Integer" [#if param.type == 'Integer']selected[/#if]>Integer</option>
										<option hassubinfo="true" value="Long" [#if param.type == 'Long']selected[/#if]>Long</option>
										<option hassubinfo="true" value="java.util.Date" [#if param.type == 'java.util.Date']selected[/#if]>Date</option>
										<option hassubinfo="true" value="org.springframework.web.multipart.MultipartFile" [#if param.type == 'org.springframework.web.multipart.MultipartFile']selected[/#if]>File</option>
									</select>
								</div>
								<div class="col-sm-3">
                                    <input type="text" name="params[${param_index}].name" value="${param.name}" class="form-control custom-form-control" placeholder="字段" >
                                </div>
                                <div class="col-sm-6">
                                    <input type="text" name="params[${param_index}].remark" value="${param.remark}" class="form-control custom-form-control" placeholder="说明" >
                                </div>
  								<div class="col-sm-1">
  									[#if param_index == 0]
                                    <a><i class="fa fa-plus-circle" id="fa-plus-circle-params" style="line-height: 34px;font-size: 24px;"></i></a>
                                    [#else]
                                     <a><i class="fa fa-times-circle" style="line-height: 34px;font-size: 24px;"></i></a>	
                                    [/#if]
                                </div>
                            </div>
                            [/#list]
                            [#else]
                            <div class="form-group">
                                 <div class="col-sm-2">
                                 	<select name="params[0].type" id="type" class="form-control custom-form-control">
					             		<option hassubinfo="true" value="String">String</option>
					             		<option hassubinfo="true" value="Integer">Integer</option>
										<option hassubinfo="true" value="Long">Long</option>
										<option hassubinfo="true" value="java.util.Date">Date</option>
										<option hassubinfo="true" value="org.springframework.web.multipart.MultipartFile">File</option>
									</select>
								</div>
								<div class="col-sm-3">
                                    <input type="text" name="params[0].name" class="form-control custom-form-control" placeholder="字段" >
                                </div>
                                <div class="col-sm-6">
                                    <input type="text" name="params[0].remark" class="form-control custom-form-control" placeholder="说明" >
                                </div>
  								<div class="col-sm-1">
                                    <a><i class="fa fa-plus-circle" id="fa-plus-circle-params" style="line-height: 34px;font-size: 24px;"></i></a>
                                </div>
                            </div>
                           </div>
                            [/#if]
                           </div>
                            <div id="resultsWrapper">
                             <p style="padding: 10px;border: 1px solid #e7eaec;border-left: none;border-right: none; background-color: #F3F3F4;  /* margin-bottom: 0px; */">返回值</p>
                           	 [#if interfacer.results?? && interfacer.results?size gt 0]
                           	[#list interfacer.results as param]
                           	<div class="form-group">
                                 <div class="col-sm-2">
                                 	<select name="results[${param_index}].type" id="type" class="form-control custom-form-control">
					             		<option hassubinfo="true" value="String" [#if param.type == 'String']selected[/#if]>String</option>
					             		<option hassubinfo="true" value="Integer" [#if param.type == 'Integer']selected[/#if]>Integer</option>
										<option hassubinfo="true" value="Long" [#if param.type == 'Long']selected[/#if]>Long</option>
								</div>
								<div class="col-sm-4">
                                    <input type="text" name="results[${param_index}].name"  value="${param.name}" class="form-control custom-form-control" placeholder="字段">
                                </div>
                                <div class="col-sm-5">
                                    <input type="text" name="results[${param_index}].remark" value="${param.remark}" class="form-control custom-form-control" placeholder="说明" >
                                </div>
                                <div class="col-sm-3">
				                    <input type="text" name="results[${param_index].values" class="form-control custom-form-control" placeholder="Debug 返回值" >
				                </div>
  								<div class="col-sm-1">
                                    <a><i class="fa fa-plus-circle"  id="fa-plus-circle-results" style="line-height: 34px;font-size: 24px;"></i></a>
                                </div>
                            </div>
                            [/#list]
                            [#else]
                            	<div class="form-group">
                                 <div class="col-sm-2">
                                 	<select name="results[0].type" id="type" class="form-control custom-form-control">
					             		<option hassubinfo="true" value="String">String</option>
					             		<option hassubinfo="true" value="Integer">Integer</option>
										<option hassubinfo="true" value="Long">Long</option>
									</select>
								</div>
								<div class="col-sm-3">
                                    <input type="text" name="results[0].name" class="form-control custom-form-control" placeholder="字段">
                                </div>
                                <div class="col-sm-3">
                                    <input type="text" name="results[0].remark" class="form-control custom-form-control" placeholder="说明" >
                                </div>
                                <div class="col-sm-3">
				                    <input type="text" name="results[0].values" class="form-control custom-form-control" placeholder="Debug 返回值" >
				                </div>
  								<div class="col-sm-1">
                                    <a><i class="fa fa-plus-circle"  id="fa-plus-circle-results" style="line-height: 34px;font-size: 24px;"></i></a>
                                </div>
                           	 </div>
                            [/#if]
                           	 </div>
                             <p style="padding: 10px;border: 1px solid #e7eaec;border-left: none;border-right: none;border-bottom: none; background-color: #F3F3F4; margin-bottom: 0px; ">示例代码</p>
                             <div class="form-group">
                                 <div class="col-sm-12">
                                 	<textarea id="code2" name="codes">
// 操作成功
{
	"code":"1",
    "message":"操作成功"
}

// 操作失败
{
	"code":"0",
    "message":"操作失败"
}


// 其他操作 TODO                                 	
									</textarea>
								</div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-2">
                                    <button class="btn btn-success" type="submit">保存内容</button>
                                    <button class="btn btn-white" type="button" onclick="window.location.href='${base}/admin/api/index.jhtml'">取消</button>
                                </div>
                            </div>
                        </form>
                    </div>
				</div>
			</div>
		</div>
	</div>
	
	
	<div class="modal inmodal" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content animated bounceInRight">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
                        </button>
                        <small class="font-bold">创建分类  </div>
                        <div class="modal-body">
                        			<div class="alert alert-danger alert-dismissable hidden">
			                        </div>
                                    <div class="form-group"><label>名称</label> <input type="text" name="name" id="name" placeholder="请输入分类名称" class="form-control"></div>
                                     <div class="form-group"><label>模块</label> <input type="text" name="moduleName"  placeholder="请输入模块名称"  id="moduleName" class="form-control"></div>
                                     <div class="form-group"><label>描述</label> <input type="text" name="description" id="description"  placeholder="请输入描述信息"   class="form-control"></div>
                                     <div class="form-group"><label>排序</label> <input type="text" name="sorts" id="sorts"  placeholder="请输入排序"   class="form-control"></div>
                                     
                                      <div class="form-group"><label>图标</label><div class="input-group m-b">
               		<input type="text" name="icon" id="icon" class="form-control" placeholder="请选择图标" >
               		<span class="input-group-btn"> <button tabindex="-1" class="btn btn-white" type="button" id="input-group-addon"><i>-</i></button><button type="button" class="btn btn-white" data-toggle="modal" data-target="#icon_choose">选择</button> </span>
               	 </div></div>
                                     
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                            <button type="button" class="btn btn-success save-category">保存</button>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        [#include "/admin/include/icon_choose.ftl"]
	<!-- BEGIN Script -->
		[#include "/admin/include/script.ftl"]
		<script src="${base}/resources/js/plugins/codemirror/codemirror.js"></script>
    	<script src="${base}/resources/js/plugins/codemirror/mode/javascript/javascript.js"></script>
    	<script src="${base}/resources/plugins/kino/kino.razor.min.js" ></script>
	<!-- END Script -->
    	<script type="text/template" id="template-params">	
    		<div class="form-group">
                 <div class="col-sm-2">
                 	<select name="params[$index].type" id="type" class="form-control custom-form-control" >
	             		<option hassubinfo="true" value="String">String</option>
	             		<option hassubinfo="true" value="Integer">Integer</option>
						<option hassubinfo="true" value="Long">Long</option>
						<option hassubinfo="true" value="java.util.Date">Date</option>
						<option hassubinfo="true" value="org.springframework.web.multipart.MultipartFile">File</option>
					</select>
				</div>
				<div class="col-sm-3">
                    <input type="text" name="params[$index].name" class="form-control custom-form-control" placeholder="字段">
                </div>
                <div class="col-sm-6">
                    <input type="text" name="params[$index].remark" class="form-control custom-form-control" placeholder="说明" >
                </div>
				<div class="col-sm-1">
                    <a><i class="fa fa-times-circle" style="line-height: 34px;font-size: 24px;"></i></a>
                </div>
            </div>
    	</script>
    	<script type="text/template" id="template-results">	
    		<div class="form-group">
                 <div class="col-sm-2">
                 	<select name="results[$index].type" id="type" class="form-control custom-form-control" >
	             		<option hassubinfo="true" value="String">String</option>
	             		<option hassubinfo="true" value="Integer">Integer</option>
						<option hassubinfo="true" value="Long">Long</option>
					</select>
				</div>
				<div class="col-sm-3">
                    <input type="text" name="results[$index].name" class="form-control custom-form-control" placeholder="字段">
                </div>
                <div class="col-sm-3">
                    <input type="text" name="results[$index].remark" class="form-control custom-form-control" placeholder="说明" >
                </div>
                <div class="col-sm-3">
                    <input type="text" name="results[$index].values" class="form-control custom-form-control" placeholder="Debug 返回值" >
                </div>
				<div class="col-sm-1">
                    <a><i class="fa fa-times-circle" style="line-height: 34px;font-size: 24px;"></i></a>
                </div>
            </div>
    	</script>
    	 <script src="${base}/resources/js/admin/loippi.api.common.js"></script>
		<script>
	        $(document).ready(function () {
		         if(top.location==this.location){
	        	 	$("#full_screen").remove();
	        	 }
	        	 
	        	[@flash_message /]
	        	
	        	$(".chosen-select").chosen({width:"100%"}); 
	        		
	        	$(".infont").dblclick(function(){
	        		$("#icon").val($(this).find("i").attr("class"));
	        		$("#input-group-addon").html("<i class='"+$("#icon").val()+"' style='color:#0E9AEF;'></i>");
	        		$('#icon_choose').modal('hide')
				});
				
				CodeMirror.fromTextArea(document.getElementById("code2"), {
	                lineNumbers: true,
	                matchBrackets: true,
	                styleActiveLine: true
	            });
	            
	            $(".ibox-content").delegate('.fa-times-circle','click',function(){
	            	$(this).parent().parent().parent().remove();
	            });
	            kino.razor.use("$");
	            var p_index = [#if interfacer.parameters??]${interfacer.parameters?size}[#else]1[/#if] ,r_index = [#if interfacer.results??]${interfacer.results?size}[#else]1[/#if];
	            $("#fa-plus-circle-params").click(function(){
	            	var html = kino.razor(document.getElementById("template-params").innerHTML,{'index':p_index});
	            	$("#paramsWrapper").append(html);p_index ++ ;
	            });
	            $("#fa-plus-circle-results").click(function(){
	            	var html = kino.razor(document.getElementById("template-results").innerHTML,{'index':r_index});
	            	$("#resultsWrapper").append(html);r_index ++ ;
	            });
				
	        });
	    </script>
</body>

</html>
