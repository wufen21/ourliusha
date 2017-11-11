
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
                	<form id="listForm" action="list.jhtml" method="get">
                    <div class="ibox-title">
                    	 <h5>日志列表 </h5>
                    	 <div class="ibox-tools">
	                        <button type="button" class="btn btn-outline btn-danger btn-xs btn-delete-loippi-group"><i class="fa fa-trash"></i> 清空</button>
	                    </div>
                    </div>
                    <div class="ibox-content">
						   <div class="dataTables_wrapper form-inline">
                            <table class="table table-striped table-bordered table-hover dataTables-example dataTable">
                                <thead>
                                    <tr>
                                       <th  >
									 		${message("Log.operation")}
										</th>
										<th >
										 	${message("Log.operator")}
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
                                    </tr>
                                </thead>
                                <tbody>
                                	 [#list page.content as log] 
							        	 <tr>
						                    <td >
												${log.operation}
											</td>
											<td>
												${log.operator}
											</td>
											<td>
												${log.ip}
											</td>
											<td>
												[#if log.content??]
													<span title="${log.content}">${abbreviate(log.content, 50, "...")}</span>
												[/#if]
											</td>
											<td>
												<span title="${log.createDate?string("yyyy-MM-dd HH:mm:ss")}">${log.createDate?string("yyyy-MM-dd HH:mm:ss")}</span>
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
	
	<!-- BEGIN Script -->
		[#include "/admin/include/script.ftl"]
	<!-- END Script -->
</body>

</html>
