
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
            <div class="col-sm-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                    	 <h5>资源列表 </h5>
                    </div>            	
                  	<div class="ibox-content" id="jstree">
                  	</div>
                </div>
            </div>
            <div class="col-sm-9">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                    	 <h5>资源表单</h5>
                    	 <div class="ibox-tools">
                            <a class="refresh-form">
                                <i class="fa fa-refresh"></i>
                            </a>
                        </div>
                    </div>            	
                  	<div class="ibox-content">
                  		<form id="saveAclForm" class="form-horizontal" action="saveOrUpdate.jhtml" method="post">
                  		<div class="form-group">
                       		<div class="row">
                       			 <div class="col-sm-6">
                       			 	<label class="col-sm-3 control-label"><span class="required"> * </span>名称</label>
	                                <div class="col-sm-9">
	                                    <input type="text" name="name" id="name" class="form-control">
	                                </div>
                       			 </div>
                       			 <div class="col-sm-6">
                       			 	<label class="col-sm-3 control-label"><span class="required"> * </span>资源类型</label>
	                                <div class="col-sm-9">
	                                    <select name="type" id="type" data-placeholder="选择类型..." class="chosen-select"  style="width:350px;" >
                                     		<option  hassubinfo="true" value="0">导航</option>
											<option  hassubinfo="true" value="1">菜单</option>
											<option  hassubinfo="true" value="2">按钮</option>
										</select>
	                                </div>
                       			 </div>
                       		</div>
                        </div>
                        <div class="form-group">
                       		<div class="row">
                       			<div class="col-sm-6">
                       			 	<label class="col-sm-3 control-label"><span class="required"> * </span>路径</label>
	                                <div class="col-sm-9">
	                                    <input type="text" name="url" id="url" class="form-control">
	                                </div>
                       			</div>
                       			<div class="col-sm-6">
	                       			<label class="col-sm-3 control-label">上级资源</label>
	                                <div class="col-sm-9">
	                                     <select name="parentId" id="parentId" data-placeholder="上级资源..." class="chosen-select"  style="width:350px;" >
	                                     	<option  hassubinfo="true" value="">请选择资源</option>
	                                     	[#list acls as acl]
	                                 			<option  hassubinfo="true" value="${acl.id}">${acl.name}</option>
	                                 			[#list acl.children as child]
	                                 			<option  hassubinfo="true" value="${child.id}">&nbsp;&nbsp;&nbsp;&nbsp;├ &nbsp;${child.name}</option>
	                                 			[/#list]
	                                 		[/#list]
										</select>
	                                </div>
	                             </div>
                       		</div>
                        </div>
                        <div class="form-group">
                       		<div class="row">
                       			<div class="col-sm-6">
                       			 	<label class="col-sm-3 control-label">图标</label>
	                                <div class="col-sm-9">
	                                	<div class="input-group m-b">
                                       		<input type="text" name="icon" id="icon" class="form-control">
                                       		<span class="input-group-btn"> <button tabindex="-1" class="btn btn-white" type="button" id="input-group-addon"><i>-</i></button><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#icon_choose">选择</button> </span>
                                       	 </div>
                                    </div>
                       			 </div>
                       			 <div class="col-sm-6">
                       			 	<label class="col-sm-3 control-label"><span class="required"> * </span>权限标识</label>
	                                <div class="col-sm-9">
	                                    <input type="text" name="permission" id="permission" class="form-control">
	                                </div>
                       			</div>
                       		</div>
                        </div>
                        <div class="form-group">
							<div class="row">
								<div class="col-sm-6">
								 	<label class="col-sm-3 control-label">排序</label>
						            <div class="col-sm-9">
						            	<div class="input-group m-b">
						               		<input type="text" name="sorts" id="sorts"   class="form-control">
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
	[#include "/admin/include/icon_choose.ftl"]
	
	<!-- BEGIN Script -->
		[#include "/admin/include/script.ftl"]
	<!-- END Script -->
    <script>
        $(document).ready(function () {
        	[@flash_message /]
         	initPage();
            $(".refresh-form").click(function(){
            	$.ajax({
					url: "add.jhtml",
					type: "GET",
					dataType: "html",
					cache: false,
					success: function(html) {
						$("#saveAclForm").html(html);
						initPage();
					}
				});
            
            });
       		initAclTree();
        });
        
        
        function initPage(){
        	$(".chosen-select").chosen({width:"100%"}); 
        
        	$(".infont").dblclick(function(){
        		$("#icon").val($(this).find("i").attr("class"));
        		$("#input-group-addon").html("<i class='"+$("#icon").val()+"' style='color:#0E9AEF;'></i>")
        		$('#icon_choose').modal('hide')
			});
			
			
			jQuery("#saveAclForm").validate({
                rules: {
                   name:{ required: true},
                      permission:{ required: true},
                         url:{ required: true},
                   sorts:{digit:true}
                },
                messages: {
				}
            });
        }
        
        
        
        function initAclTree(){
        	$('#jstree').jstree({
				'core' : {
			  		'data' : {
					    'url'  : function (node) {
					      	return node.id === '#' ? 
					        '${base}/admin/acl/ajax_roots.json' : 
					        '${base}/admin/acl/ajax_children.json';
					    },
					    'data' : function (node) {
					      return { 'id' : node.id };
					    }
					 }
				},
				"plugins" : [ "contextmenu" ],
				"contextmenu":{  
			        "items":{  
			            "EDIT_ACL":{  
			                "label":"编辑菜单",  
			                "action":function(data){  
			                    var inst = jQuery.jstree.reference(data.reference),  
			                    obj = inst.get_node(data.reference);  
			                    $.ajax({
									url: "edit.jhtml",
									type: "GET",
									data: {id:obj.id},
									dataType: "html",
									cache: false,
									success: function(html) {
										console.log(html);
										$("#saveAclForm").html(html);
										initPage();
									}
								});
			                }  
			            },  
			            "DELETE_ACL":{  
			                "label":"删除菜单",  
			                "action":function(data){  
			                    var inst = jQuery.jstree.reference(data.reference),  
			                     obj = inst.get_node(data.reference);  
			                    $.ajax({
									url: "delete.jhtml",
									type: "POST",
									data: {id:obj.id},
									dataType: "json",
									cache: false,
									success: function(message) {
										art.message(message);
										 $('#jstree').jstree("refresh");  
										console.log(inst.delete_node(obj));
									}
								});
			                }  
			            },
			        } 
			     }  
			});
        }
    </script>
</body>

</html>
