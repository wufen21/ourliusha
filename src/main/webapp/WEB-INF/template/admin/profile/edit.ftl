
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
                    	 <h5>编辑资料</h5>
                    </div>            	
                  	<div class="ibox-content">
                  		<form id="saveAclForm" class="form-horizontal" action="update.jhtml" method="post">
                        <div class="form-group">
                       		<div class="row">
                       			<div class="col-sm-6">
	                               <label class="col-sm-3 control-label"><span class="required"> * </span>头像</label>
	                                <div class="col-sm-9">
	                                    <div class="input-group">
											<input type="text" class="form-control" name="avatar" id="avatar" value="${user.avatar}" >
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
	                               <label class="col-sm-3 control-label"><span class="required"> * </span>昵称</label>
	                                <div class="col-sm-9">
											<input type="text" class="form-control" name="nickname" value="${user.nickname}" id="nickname" >
	                                </div>
                       			</div>
                       		</div>
                        </div>
                        <div class="hr-line-dashed"></div>
	                    <div class="form-group">
	                        <div class="col-sm-12 col-sm-offset-3">
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
        	
			$("#browserButton").browser({input:$("#avatar")});
        	$(".chosen-select").chosen({width:"100%"}); 
        	 
        	jQuery("#inputForm").validate({
                rules: {
                   nickname: {
						required: true,
						pattern: /^[0-9a-z_A-Z\u4e00-\u9fa5]+$/,
						minlength: 2,
						maxlength: 20
					},
					avatar:{
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
