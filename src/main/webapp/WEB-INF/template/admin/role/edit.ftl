
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
                    	 <h5>编辑角色</h5>
                    	 <div class="ibox-tools">
                    	 	<button type="button" class="btn btn-outline btn-white btn-xs" id="btn-return-loippi" 
                    	 	onclick="location.href='list.jhtml'"><i class="fa fa-reply-all"></i> 返回列表</button>
                        </div>
                    </div>            	
                  	<div class="ibox-content">
                  		<form id="inputForm" class="form-horizontal" action="update.jhtml" method="post">
                        <input type="hidden" value="${role.id}" name="id" />
                        <div class="form-group">
                       		<div class="row">
                       			<div class="col-sm-6">
                       			 	<label class="col-sm-3 control-label"><span class="required"> * </span>名称</label>
	                                <div class="col-sm-9">
	                                    <input type="text" name="name" id="name" value="${role.name}" class="form-control">
	                                </div>
                       			</div>
                       			<div class="col-sm-6">
                       			 	<label class="col-sm-3 control-label">描述</label>
	                                <div class="col-sm-9">
	                                    <input type="text" name="description" value="${role.description}" id="description" class="form-control">
	                                </div>
                       			</div>
                       		</div>
                        </div>
                         <div class="form-group">
                       		<div class="row">
                       			<div class="col-sm-9">
                       			 	<label class="col-sm-2 control-label">资源菜单</label>
                       			 	 <div class="col-sm-10">
                       			 	 	[#list roots as root]
		                                    <div class="checkbox-inline i-checks">
		                                       <input type="checkbox" class="i-checks" [#if role.aclIds?seq_contains(root.id)]checked[/#if] name="ids" value="${root.id}">${root.name}
		                                    </div>
		                                    <br>
		                                    [#list root.children as child]
		                                    	<div class="checkbox-inline i-checks"style="margin-left:30px;">
			                                       <input type="checkbox" class="i-checks" name="ids"  [#if role.aclIds?seq_contains(child.id)]checked[/#if] value="${child.id}">${child.name}
			                                    </div>
			                                    <br>
			                                    [#list child.children as btn]
			                                    	<div class="checkbox-inline i-checks" [#if btn_index == 0]style="margin-left:60px;"[/#if]>
				                                       <input type="checkbox" class="i-checks" name="ids" value="${btn.id}"  [#if role.aclIds?seq_contains(btn.id)]checked[/#if]>${btn.name}
				                                    </div>
				                                    [#if !btn_has_next] <br>[/#if]
		                                    	[/#list]
		                                    [/#list]
		                                    <br>
	                                    [/#list]
	                                </div>
                       			</div>
                       		</div>
                        </div>
                         <div class="form-group">
                       		<div class="row">
                       			<div class="col-sm-6">
                       			 	<label class="col-sm-3 control-label">是否内置</label>
                       			 	 <div class="col-sm-9">
	                                    
	                                    <div class="checkbox-inline i-checks">
	                                       <input type="checkbox" class="i-checks" name="isSystem" value="true" [#if role.isSystem == true]checked[/#if] >
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
        	[@flash_message /]
        	
        	$('.i-checks').iCheck({ checkboxClass: 'icheckbox_square-green',  radioClass: 'iradio_square-green',  });
        	 
        	 
        	jQuery("#inputForm").validate({
                rules: {
                   name: {
						required: true,
						pattern: /^[0-9a-z_A-Z\u4e00-\u9fa5]+$/,
						minlength: 2,
						maxlength: 20
					}
                },
                messages: {
				}
            });
        });
        
    </script>
</body>

</html>
