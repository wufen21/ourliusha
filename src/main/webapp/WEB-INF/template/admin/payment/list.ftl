
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
                    	 <h5>交易流水管理 </h5>
                    </div>
                    <div class="ibox-content">
                        <!--搜索框结束BEGIN-->
                        <div class="row">
                           		     <div class="col-sm-3 m-b-xs">
                             				 <input type="text" placeholder="交易账户" class="input-sm form-control" name="filter_account" value="${paramter.account!''}"> 
                          		     </div>          
                      			    <div class="col-sm-3 m-b-xs">
                               				<div class="input-daterange input-group" id="datepicker">
                              				  <input type="text" class="input-sm form-control" name="filter_startTime" value="${paramter.startTime!''}" placeholder="交易开始时间">
                                			<span class="input-group-addon">到</span>
                            				    <input type="text" class="input-sm form-control" name="filter_endTime" value="${paramter.endTime!''}" placeholder="交易结束时间">
                         			      </div>
                      			  </div>
                      	 </div>
                      	  <div class="row">                        
                            <div class="col-sm-1">
                            <input type="button"  class="btn btn-sm btn-primary loippi-search-button" value="搜索"/>
                            </div>
                        </div>
                        <!--搜索框结束END-->
                        <!--列表开始BEGIN-->
			 <div class="dataTables_wrapper form-inline">
                            <table class="table table-striped table-bordered table-hover dataTables-example dataTable">
                                <thead>
                                    <tr>
					<!--【改列表标题：描述—】-->
					<th>
                                      <input type="checkbox"  class="i-checks" name="checkAll"></th>
                                        </th>
                                        <th>交易流水号</th>
                                         <th>交易金额（元）</th>
                                         <th>支付账号姓名</th>
                                         <th>交易账号</th>
                                         <th>交易时间</th>
                                         <th>交易状态</th>  
                                    </tr>
                                </thead>
                                <tbody>
                                <!--【改示例名称：描述—】-->
                                	 [#list page.content as payment] 
							        	 <tr>
							        	   <td>
					                         	   	<input type="checkbox" class="i-checks" name="ids" value="${payment.id}">
					                       		   </td>
					                             	 <!--交易流水号-->
					                             	 <td>
					                             	 ${(payment.sn)!' '}
					                       		 </td>
					                       		 <!--交易金额（元）-->
					                             	 <td>
					                             	 ${(payment.amount)!' '}
					                       		 </td>
					                       		 <!--支付账号姓名-->
					                             	 <td>
					                             	 ${(payment.payee)!' '}
					                       		 </td>
					                       		 <!--交易账号-->
					                             	 <td>
					                             	 ${(payment.account)!' '}
					                       		 </td>
					                       		 <!--交易时间-->
					                             	 <td>
					                             	 ${(payment.payDate)?string('yyyy-MM-dd HH:mm:ss')}
					                       		 </td>
                                     					<!--交易状态-->
					                             	 <td>
					                             	 ${(payment.status)!' '}
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
