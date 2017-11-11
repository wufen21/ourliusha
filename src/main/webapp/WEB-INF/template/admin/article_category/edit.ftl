
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
                    	 <h5>编辑分类</h5>
                    	 <div class="ibox-tools">
                    	 	<button type="button" class="btn btn-outline btn-white btn-xs" id="btn-return-loippi" 
                    	 	onclick="location.href='list.jhtml'"><i class="fa fa-reply-all"></i> 返回列表</button>
                        </div>
                    </div>            	
                  	<div class="ibox-content">
                  		<form id="saveAclForm" class="form-horizontal" action="update.jhtml" method="post">
                  		<!--【改实体名：描述—】-->
                  		<input type="hidden" value="${articleCategory.id}" name="id"/>
                  		<div class="form-group">
                       			<div class="row">
                       				 <div class="col-sm-6">
                       			 		<label class="col-sm-3 control-label"><span class="required"> * </span>类别名称</label>
	                               			 <div class="col-sm-9">
	                                			 <input type="text" name="name" id="name" class="form-control" value="${articleCategory.name!''}"> 	                                  
	                               			 </div>
                       				</div>
                       			</div>
                        </div>
                        <div class="form-group">
                       		<div class="row">
                       			<div class="col-sm-6">
	                               <label class="col-sm-3 control-label"><span class="required"> * </span>图片</label>
	                                <div class="col-sm-9">
	                                    <div class="input-group">
											<input type="text" class="form-control" name="image" id="image" value="${articleCategory.image!''}" >
											<span class="input-group-btn">
												<button class="btn btn-white" type="button" id="browserButton"><i class="fa fa-send-o"></i>&nbsp;选择</button>
											</span>
										</div>
	                                </div>
                       			</div>
                       		</div>
                        </div>
                      
                         <div class="form-group">
                       		<div class="row">
                       				 <div class="col-sm-6">
                       			 		<label class="col-sm-3 control-label"><span class="required"> * </span>备注</label>
	                               			 <div class="col-sm-9">
	                                			 <input type="text" name="memo" id="memo" class="form-control" value="${articleCategory.memo!''}"> 	                                  
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
        	var $browserButton = $("#browserButton");
        	
			$("#browserButton").browser({input:$("#image")});
        	
        	  $(".input-daterange").datepicker({keyboardNavigation:false,forceParse:false,autoclose:true});
        	
        	 //【改校验：描述—】
        	jQuery("#saveAclForm").validate({
			rules: {
					name:{
						required: true
					},
					memo:{
						required: true
					},
					image:{
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