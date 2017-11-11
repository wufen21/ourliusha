
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
                    	 <!--【改标题：描述—】-->
                    	 <h5>新增生成方案</h5>
                    	 <div class="ibox-tools">
                    	 	<button type="button" class="btn btn-outline btn-white btn-xs" id="btn-return-loippi" 
                    	 	onclick="location.href='list.jhtml'"><i class="fa fa-reply-all"></i> 返回列表</button>
                        </div>
                    </div>            	
                  	<div class="ibox-content">
                  		<form id="inputForm" class="form-horizontal" action="save.jhtml" method="POST">
                  		<div class="form-group">
                       		<div class="row">
                       			<div class="col-sm-6">
                       			 	<label class="col-sm-3 control-label"><span class="required"> * </span>方案名称</label>
	                           	    <div class="col-sm-9">
	                           	    	 <input type="text" name="name" id="name" class="form-control" > 
	                                </div>
                       			</div>
                       		</div>
                        </div>
                        <div class="form-group">
                       		<div class="row">
                       			<div class="col-sm-6">
                       			 	<label class="col-sm-3 control-label"><span class="required"> * </span>模版分类</label>
	                           	    <div class="col-sm-9">
	                           	    	<select name="template" id="template" data-placeholder="选择模版..." class="chosen-select"  style="width: 295px;">
						            		<option xvalue="only-persistence" value="1">仅持久层（dao/entity/mapper）</option>
						            		<option xvalue="only-business" value="2">仅业务层（service）</option>
						            		<option xvalue="only-view" value="3">仅视图层（controller/ftl）</option>
						            		<option xvalue="persistence-business" value="4">业务层+持久层（service/dao/entity/mapper）</option>
						            		<option xvalue="persistence-business-view" value="5">业务层+持久层+视图层（service/dao/entity/mapper/controller/ftl）</option>
						            	</select>
	                                </div>
                       			</div>
                       			<div class="col-sm-6">
                       			 	  <span class="required" style="color:#CBCBCB;line-height: 34px;"> 生成结构：{包名}/{分层(dao,entity,service,web)}/{java类}</span> 
                       			</div>
                       		</div>
                        </div>
                        <div class="form-group">
                       		<div class="row">
                       			<div class="col-sm-6">
                       			 	<label class="col-sm-3 control-label"><span class="required"> * </span>生成包路径</label>
	                           	    <div class="col-sm-9">
	                           	    	 <input type="text" name="packageName" id="packageName" class="form-control" value="com.framework.loippi"> 
	                                </div>
                       			</div>
                       			<div class="col-sm-6">
                       			 	  <span class="required" style="color:#CBCBCB;line-height: 34px;"> 建议模块包：com.framework.loippi</span> 
                       			</div>
                       		</div>
                        </div>
                        <div class="form-group">
                       		<div class="row">
                       			<div class="col-sm-6">
                       			 	<label class="col-sm-3 control-label"><span class="required"> * </span>生成模块名</label>
	                           	    <div class="col-sm-9">
	                           	    	 <input type="text" name="moduleName" id="moduleName" class="form-control"> 
	                                </div>
                       			</div>
                       			<div class="col-sm-6">
                       			 	  <span class="required" style="color:#CBCBCB;line-height: 34px;"> 可理解为业务名,如：填入“ad”广告业务</span> 
                       			</div>
                       		</div>
                        </div>
                        <div class="form-group">
                       		<div class="row">
                       			<div class="col-sm-6">
                       			 	<label class="col-sm-3 control-label"><span class="required"> * </span>生成功能描述</label>
	                           	    <div class="col-sm-9">
	                           	    	 <input type="text" name="description" id="description" class="form-control"> 
	                                </div>
                       			</div>
                       			<div class="col-sm-6">
                       			 	  <span class="required" style="color:#CBCBCB;line-height: 34px;"> 将设置到类描述，如：填入“广告”</span> 
                       			</div>
                       		</div>
                        </div>
                         <div class="form-group">
                       		<div class="row">
                       			<div class="col-sm-6">
                       			 	<label class="col-sm-3 control-label"><span class="required"> * </span>生成功能作者</label>
	                           	    <div class="col-sm-9">
	                           	    	 <input type="text" name="author" id="author" class="form-control"> 
	                                </div>
                       			</div>
                       			<div class="col-sm-6">
                       			 	  <span class="required" style="color:#CBCBCB;line-height: 34px;"> 功能开发者</span> 
                       			</div>
                       		</div>
                        </div>
                        <div class="form-group">
                       		<div class="row">
                       			<div class="col-sm-6">
                       			 	<label class="col-sm-3 control-label"><span class="required"> * </span>业务表名</label>
	                           	    <div class="col-sm-9">
	                                     <select name="genTableId" id="genTableId" data-placeholder="选择业务表..." class="chosen-select"  style="width:350px;" >
                                     		 [#list tables as table]
				       						 	<option value="${table.id}">${table.name} : ${table.description}</option>
				    						 [/#list]
										</select>
	                                </div>
                       			</div>
                       		</div>
                        </div>
                       
                        <div class="hr-line-dashed"></div>
	                    <div class="form-group">
	                        <div class="col-sm-12 col-sm-offset-10">
	                        	<button type="button" class="btn btn-default" onclick="window.history.back();">返回</button>
	                            <button class="btn btn-success" type="submit">保存并生成方案</button>
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
			[@flash_message /]
			$(".chosen-select").chosen({width:"100%"}); 
			
			
			jQuery("#inputForm").validate({
                rules: {
                   name: {
						required: true,
						minlength: 2,
						maxlength: 50
					},
					genTableId: {
						required: true
					},
					template: {
						required: true
					},
					packageName: {
						required: true
					},
					moduleName: {
						required: true
					},
					description: {
						required: true
					},
					author: {
						required: true
					},
					publishDate: {
						required: true
					}
                },
                messages: {
				}
            });
		});
	</script>
</body>

</html>
