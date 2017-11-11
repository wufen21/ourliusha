
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">

    <title>${setting.siteName} - 主页</title>
    <meta name="keywords" content="${setting.siteName}">
    <meta name="description" content="${setting.siteName}">

    <link href="${base}/resources/css/bootstrap.min.css?v=3.4.0" rel="stylesheet">
    <link href="${base}/resources/css/font-awesome.min.css?v=4.3.0" rel="stylesheet">
    <link href="${base}/resources/css/plugins/jsTree/style.min.css" rel="stylesheet">
    <link href="${base}/resources/css/animate.min.css" rel="stylesheet">
    <link href="${base}/resources/css/style.min.css?v=3.0.0" rel="stylesheet">
    <!-- iCheck -->
    <link href="${base}/resources/css/plugins/iCheck/custom.css" rel="stylesheet">
    <!-- Sweet Alert -->
    <link href="${base}/resources/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <link href="${base}/resources/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">
	<style>
		html, body, div, span, input, p,h1, h2, h3, h4, h5, h6, blockquote, a, abbr, acronym, address, strong, b, u, i, center,dl, dt, dd, ol, ul,td,tr {
		    font-family:"Microsoft Yahei","微软雅黑","宋体", "Simsun", "Open Sans";
		}
	</style>
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content  animated fadeInRight">

        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                	<form id="listForm" action="list.jhtml" method="get">
                    <div class="ibox-title">
                    	 <h5>意见反馈 </h5>
                    	  <div class="ibox-tools">
	                        <a class="btn btn-outline btn-danger btn-xs btn-delete-loippi-group"><i class="fa fa-trash"></i> 删除</a>
	                 </div>
                    </div>
                    <div class="ibox-content">
						   <div class="dataTables_wrapper form-inline">
                            <table class="table table-striped table-bordered table-hover dataTables-example dataTable">
                                <thead>
                                    <tr>
                                    	 <th><input type="checkbox"  class="i-checks" name="checkAll"></th>
                                       <th  >
									 		手机号
										</th>
										<th >
									 		${message("Log.ip")}
										</th>
										<th >
									 		${message("Log.content")}
										</th>
										<th >
									 		${message("admin.common.createDate")}
										</th>
										<th>操作</th>       
                                    </tr>
                                </thead>
                                <tbody>
                                	 [#list page.content as feedback] 
							        	 <tr>
							        	 	 <td>
					                         <!--【改示例名称：描述—】-->
					                            <input type="checkbox" class="i-checks" name="ids" value="${feedback.id}">
					                        </td>
						                    <td >
												${feedback.mobile}
											</td>
											<td>
												${feedback.ip}
											</td>
											<td>
												[#if feedback.content??]
													<span title="${feedback.content}">${feedback.content}</span>
												[/#if]
											</td>
											<td>
												<span title="${feedback.createDate?string("yyyy-MM-dd HH:mm:ss")}">${feedback.createDate?string("yyyy-MM-dd HH:mm:ss")}</span>
											</td>
											<td>
											<a class="btn btn-danger btn-xs btn-delete-loippi" data-id="${feedback.id}" ><i class="fa fa-trash"></i> 删除</a>
											</td>
						                    </tr>
							        [/#list] 
                                </tbody>
                            </table>
                       		[@pagination pageNumber = page.pageNumber totalPages = page.totalPages]
								[#include "/admin/include/pagination.ftl"]
							[/@pagination]
                        </div>
                    </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
	
    <!-- 全局js -->
    <script src="${base}/resources/js/jquery-2.1.1.min.js"></script>
    <script src="${base}/resources/js/bootstrap.min.js?v=3.4.0"></script>
     <!-- Peity -->
    <script src="${base}/resources/js/plugins/peity/jquery.peity.min.js"></script>
    <!-- 自定义js -->
    <script src="${base}/resources/js/content.min.js?v=1.0.0"></script>
    <!-- iCheck -->
    <script src="${base}/resources/js/plugins/iCheck/icheck.min.js"></script>
    <!-- Peity -->
    <script src="${base}/resources/js/demo/peity-demo.min.js"></script>
	<!-- Sweet alert -->
    <script src="${base}/resources/js/plugins/sweetalert/sweetalert.min.js"></script>
    <!-- layer javascript -->
    <script src="${base}/resources/js/plugins/layer/layer.min.js"></script>
    <script src="${base}/resources/js/plugins/bootbox/bootbox.min.js"></script>
    <script type="text/javascript" src="${base}/resources/js/admin/common.js"></script>
    
    <script>
    
        $(document).ready(function () {
        	var layerFrame;
        	bootbox.setDefaults({locale:framework.locale});
        	// 复选框
            $('.i-checks').iCheck({ checkboxClass: 'icheckbox_square-green',  radioClass: 'iradio_square-green',  });
            $("input[name='checkAll']").on('ifChanged',function(){
       			$("input[name='ids']").iCheck($(this).is(":checked") == true ? 'check':'uncheck');  
       		});
            var $listForm = $("#listForm");
			var $pageTotal = $("#pageTotal");
			var $pageSize = $("#pageSize");
			var $pageNumber = $("#pageNumber");
			// 页码跳转
			$.pageSkip = function(pageNumber) {
				$pageNumber.val(pageNumber);
				$listForm.submit();
				return false;
			}
            
             // 删除单条记录
            $(".btn-delete-loippi").click(function(){
            	var $this = $(this);
            	 bootbox.confirm(message("admin.dialog.deleteConfirm"), function(result) {
				 	if(result){
				 		$.ajax({
							url: "delete.jhtml",
							type: "POST",
							data: {ids:$this.attr('data-id')},
							dataType: "json",
							cache: false,
							success: function(message) {
								window.setTimeout(function() {
										window.location.reload();
									}, 1000);
							}
						});
				 	}
                }); 
            });
           
           // 删除多条记录
           $(".btn-delete-loippi-group").click(function(){
           		var $checkeds = jQuery($("input[name='ids']:checked"));
           		
           		if($checkeds.length == 0){art.warn('请选择删除记录！');return;}
           		
           		bootbox.confirm(message("admin.dialog.deleteConfirm"), function(result) {
				 	if(result){
				 		$.ajax({
							url: "delete.jhtml",
							type: "POST",
							data: $checkeds.serialize(),
							dataType: "json",
							cache: false,
							success: function(message) {
								art.message(message);
								if (message.type == "success") {
									window.setTimeout(function() {
										window.location.reload(true);
									}, 1000);
								}
							}
						});
				 	}
                }); 
           });
        });
    </script>
</body>

</html>
