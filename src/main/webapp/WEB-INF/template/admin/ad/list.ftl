
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
                    	 <h5>广告管理 </h5>
                    	 <div class="ibox-tools">
                    	 	<a class="btn btn-outline btn-success btn-xs" id="btn-add-loippi" href="add.jhtml"><i class="fa fa-plus"></i> 新增</a>
	                        <a class="btn btn-outline btn-danger btn-xs btn-delete-loippi-group"><i class="fa fa-trash"></i> 删除</a>
	                    </div>
                    </div>
                    <div class="ibox-content">
						   <div class="dataTables_wrapper form-inline">
                            <table class="table table-striped table-bordered table-hover dataTables-example dataTable">
                                <thead>
                                    <tr>

                                        <th><input type="checkbox"  class="i-checks" name="checkAll"></th>
                                        <th>标题</th>
                                        <th>图片</th>
                                        <th>排序</th>
                                        <th>起始时间</th>
                                        <th>结束时间</th>
                                        <th>操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	 [#list page.content as ad] 
							        	 <tr>
					                        <td>
					                            <input type="checkbox" class="i-checks" name="ids" value="${ad.id}">
					                        </td>
					                        <td>${ad.title!''}</td>
					                        <td>${ad.image!''}</td>
					                        <td>${ad.sorts!''}</td>
					                        <td>[#if ad.startDate??]${ad.startDate?string('yyyy-MM-dd')}[/#if]</td>
					                        <td>[#if ad.endDate??]${ad.endDate?string('yyyy-MM-dd')}[/#if]</td>
					                        <td>
					                        	<a class="btn btn-info btn-xs btn-edit-loippi" data-id="${ad.id}" href="edit/${ad.id}.jhtml" ><i class="fa fa-paste"></i> 编辑</a>
					                        	<a class="btn btn-danger btn-xs btn-delete-loippi" data-id="${ad.id}" ><i class="fa fa-trash"></i> 删除</a>
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
    
    <script>
    
        $(document).ready(function () {
        	[@flash_message /]
            $(".input-daterange").datepicker({keyboardNavigation:false,forceParse:false,autoclose:true});
        });
    </script>
</body>

</html>
