
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
                    	 <h5>编辑广告</h5>
                    	 <div class="ibox-tools">
                    	 	<button type="button" class="btn btn-outline btn-white btn-xs" id="btn-return-loippi" 
                    	 	onclick="location.href='../list.jhtml'"><i class="fa fa-reply-all"></i> 返回列表</button>
                        </div>
                    </div>            	
                  	<div class="ibox-content">
                  		<form id="saveAclForm" class="form-horizontal" action="${base}/admin/ad/update.jhtml" method="post">
                  		<input type="hidden" value="${article.id}" name="id"/>
                        <div class="form-group">
                       		<div class="row">
                       			<div class="col-sm-6">
                       			 	<label class="col-sm-3 control-label"><span class="required"> * </span>${message("Ad.title")}</label>
	                                <div class="col-sm-9">
	                                    <input type="text" name="title" class="form-control" maxlength="200" value="${ad.title}"/>
	                                </div>
                       			</div>
                       		</div>
                        </div>
                         <div class="form-group">
                       		<div class="row">
                       			<div class="col-sm-6">
                       			 	<label class="col-sm-3 control-label"><span class="required"> * </span>${message("Ad.path")}</label>
	                                <div class="col-sm-9">
	                                	 <div class="input-group">
											<input type="text" class="form-control" name="image" id="image" value="${ad.image}">
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
                       			 	<label class="col-sm-3 control-label">${message("Ad.url")} </label>
	                                <div class="col-sm-9">
	                                	<input type="text" name="url" class="form-control" maxlength="200" value="${ad.url}" />
	                                </div>
                       			</div>
                       		</div>
                        </div>
                        
                        <div class="form-group">
                       		<div class="row">
                       			<div class="col-sm-6">
                       			 	<label class="col-sm-3 control-label">有效日期</label>
	                                <div class="col-sm-9">
				                        <div class="input-daterange input-group" id="datepicker">
			                                <input type="text" class="form-control" name="startDate"  <#if ad.startDate??> value="${ad.startDate?string('yyyy-MM-dd')}</#if>">
			                                <span class="input-group-addon">到</span>
			                                <input type="text" class="form-control" name="endDate" <#if ad.endDate??> value="${ad.endDate?string('yyyy-MM-dd')}"</#if>>
			                            </div>
	                                </div>
                       			</div>
                       		</div>
                        </div>
                      
                         <div class="form-group">
                       		<div class="row">
                       			<div class="col-sm-6">
                       			 	<label class="col-sm-3 control-label">${message("admin.common.order")}</label>
	                                <div class="col-sm-9">
	                                   <input type="text" name="sorts" class="form-control" maxlength="9" value="${ad.sorts}" />
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
			$("#browserButton").browser({input:$("#image")});
			
        	$(".chosen-select").chosen({width:"100%"}); 
        	
        	$(".input-daterange").datepicker({keyboardNavigation:false,forceParse:false,autoclose:true});
        	
        	jQuery("#inputForm").validate({
                rules: {
                   title: {
						required: true
					},
					image: {
						required: true
					},
					sorts:{
						required: true,
						digits : true
					}
                },
                messages: {
				}
            });
        });
        
    </script>
</body>

</html>
