
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
                    	<!--【改标题：描述—】-->
                    	 <h5>分类管理 </h5>
                    	 <div class="ibox-tools">
                    	 	<a class="btn btn-outline btn-success btn-xs" id="btn-add-loippi" href="add.jhtml"><i class="fa fa-plus"></i> 新增</a>
	                        <a class="btn btn-outline btn-danger btn-xs btn-delete-loippi-group"><i class="fa fa-trash"></i> 删除</a>
	                 </div>
                    </div>
                    <div class="ibox-content">
                        <!--搜索框结束END-->
                        <!--列表开始BEGIN-->
			 <div class="dataTables_wrapper form-inline">
                            <table class="table table-striped table-bordered table-hover dataTables-example dataTable">
                                <thead>
                                    <tr>
					<!--【改列表标题：描述—】-->
                                        <th><input type="checkbox"  class="i-checks" name="checkAll"></th>
                                        <th>类别名称</th>
                                        <th>是否在APP显示</th>
                                        <th>是否需要分享</th>
                                        <th>备注</th>      
                                         <th>操作</th>     
                                    </tr>
                                </thead>
                                <tbody>
                                <!--【改示例名称：描述—】-->
                                	 [#list page.content as articleCategory] 
							        	 <tr>
					                        <td>
					                         <!--【改示例名称：描述—】-->
					                            <input type="checkbox" class="i-checks" name="ids" value="${articleCategory.id}">
					                        </td>
					                         <!--【改参数名：描述—】-->
					                        
					                        <td>${articleCategory.name!''}</td><!--类别名称-->
					                        <td>[#if  articleCategory.show?exists]${articleCategory.show?string("是","否")}[/#if]</td><!--是否在APP显示-->
					                        <td>[#if  articleCategory.share?exists]${articleCategory.share?string("是","否")}[/#if]</td><!--是否分享-->
					                        <td>[#if  articleCategory.memo?exists]${articleCategory.memo!''}[/#if]</td><!--memo-->
					                        
					                        <td> 
					                        	<!--【改示例名称：描述—】-->
					                        	<a class="btn btn-info btn-xs btn-edit-loippi" data-id="${articleCategory.id}" href="edit.jhtml?id=${articleCategory.id}" ><i class="fa fa-paste"></i> 编辑</a>
					                        	<a class="btn btn-danger btn-xs btn-delete-loippi" data-id="${articleCategory.id}" ><i class="fa fa-trash"></i> 删除</a>
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
        });
    </script>
</body>

</html>
