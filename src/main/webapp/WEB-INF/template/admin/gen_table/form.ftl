
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
	<style>.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th{    padding: 2px;}</style>
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content  animated fadeInRight">

        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                    	 <!--【改标题：描述—】-->
                    	 <h5>新增业务表</h5>
                    	 <div class="ibox-tools">
                    	 	<button type="button" class="btn btn-outline btn-white btn-xs" id="btn-return-loippi" 
                    	 	onclick="location.href='add.jhtml'"><i class="fa fa-reply-all"></i> 返回</button>
                        </div>
                    </div>            	
                  	<div class="ibox-content">
                  		<form id="inputForm" class="form-horizontal" action="save.jhtml" method="post">
                        <div class="form-group">
                       		<div class="row">
                       			<div class="col-sm-6">
                       			 	<label class="col-sm-3 control-label"><span class="required"> * </span>表名</label>
	                           	    <div class="col-sm-9">
	                           	    	 <input type="text" name="name" id="name" class="form-control" value="${table.name?upper_case}"> 	                          
	                                </div>
                       			</div>
                       		</div>
                        </div>
                        <div class="form-group">
                       		<div class="row">
                       			<div class="col-sm-6">
                       			 	<label class="col-sm-3 control-label"><span class="required"> * </span>说明</label>
	                           	    <div class="col-sm-9">
	                           	    	 <input type="text" name="description" id="description" class="form-control" value="${table.comment}"> 	                  
	                                </div>
                       			</div>
                       			<div class="col-sm-6">
	                           	    	  <span class="required" style="    line-height: 34px;"> 注意：如果是子表说明会用于主表列表中 </span>                     
                       			</div>
                       		</div>
                        </div>
                       <div class="form-group">
                       		<div class="row">
                       			<div class="col-sm-6">
                       			 	<label class="col-sm-3 control-label"><span class="required"> * </span>类名</label>
	                           	    <div class="col-sm-9">
	                           	    	 <input type="text" name="className" id="className" class="form-control" value="${table.javaNameUpper}"> 
	                           	    	
	                                </div>
                       			</div>
                       			<div class="col-sm-6">
                       			 	  <span class="required" style="    line-height: 34px;"> 注意：如果有表前缀，请手动修改成自己需要的实体名 </span> 
                       			</div>
                       		</div>
                        </div>
                          <div class="form-group">
                       		<div class="row">
                       			<div class="col-sm-6">
                       			 	<label class="col-sm-3 control-label">父级表名</label>
	                           	    <div class="col-sm-9">
	                           	    	 <select name="tableName" id="tableName" data-placeholder="选择父级表..." class="chosen-select"  style="width:350px;" >
	                           	    	 	 <option value="">选择父级表...</option>
                                     		 [#list tables as table]
				       						 	<option value="${table.name}">${table.name} : ${table.comment}</option>
				    						 [/#list]
										</select>           
	                                </div>
                       			</div>
                       			<div class="col-sm-6">
                       			 	<label class="col-sm-3 control-label">当前表外键</label>
	                           	    <div class="col-sm-6">
	                           	    	 <select name="tableName" id="tableName" data-placeholder="选择表外键字段..." class="chosen-select"  style="width:350px;" >
                                     		 [#list table.columns as column]
				       						 	<option value="${column.name}">${column.name} : ${column.comment}</option>
				    						 [/#list]
										</select>           
	                                </div>
	                                <div class="col-sm-3">
	                           	    	 <span class="required" style="    line-height: 34px;"> 注意：tree结构无需选择 </span> 
	                                </div>
                       			</div>
                       		</div>
                        </div>
                        
                        <div class="row">
				            <div class="col-sm-12">
				                    <div class="ibox-content">
				                        <table class="table" style="margin-bottom:0px;">
				                            <thead>
				                                <tr>
				                                    <th>列名</th>
				                                    <th>说明</th>
				                                    <th>物理类型</th>
				                                    <th>Java类型</th>
				                                    <th>Java属性名称</th>
				                                    <th>主键</th>
				                                    <th>可空</th>
				                                    <th>插入</th>
				                                    <th>编辑</th>
				                                    <th>列表</th>
				                                    <th>查询</th>
				                                    <th>查询匹配方式</th>
				                                    <th>显示表单类型</th>
				                                    <th>排序</th>
				                                </tr>
				                            </thead>
				                            <tbody>
				                            	[#list table.columns as column]
				                                <tr>
				                                    <td>${column.name} <input type="hidden" value="${column.name}" name="columns[${column_index}].name"/></td>
				                                    <td><input type="text" value="${column.comment}"class="form-control" name="columns[${column_index}].comments"/></td>
				                                    <td>${column.sqlType}<input type="hidden" value="${column.sqlType}" name="columns[${column_index}].jdbcType"/></td>
				                                    <td>
				                                    	<select name="columns[${column_index}].javaType" class="form-control">
															<option value="String" [#if column.type == 'String']selected[/#if]>String</option>
															<option value="Long" [#if column.type == 'Long']selected[/#if]>Long</option>
															<option value="Integer"[#if column.type == 'Integer']selected[/#if]>Integer</option>
															<option value="Double"[#if column.type == 'Double']selected[/#if]>Double</option>
															<option value="Float" [#if column.type == 'Float']selected[/#if]>Float</option>
															<option value="java.math.BigDecimal" [#if column.type == 'BigDecimal']selected[/#if]>BigDecimal</option>
															<option value="java.util.Date" [#if column.type == 'Date']selected[/#if]>Date</option>
													</select>
													</td>
				                                    <td><input type="text" value="${column.javaName}"class="form-control" name="columns[${column_index}].javaField"/></td>
				                                    <td><input type="checkbox" value="1" [#if column.pri == true]checked[/#if]  name="columns[${column_index}].pk"></td>
				                                    <td><input type="checkbox" value="1" [#if column.null == true]checked[/#if]  name="columns[${column_index}].nullable"></td>
				                                    <td><input type="checkbox" value="1" checked  name="columns[${column_index}].insert"></td>
				                                    <td><input type="checkbox" value="1" checked  name="columns[${column_index}].edit"></td>
				                                    <td><input type="checkbox" value="1" checked name="columns[${column_index}].list"></td>
				                                    <td><input type="checkbox" value="1" checked name="columns[${column_index}].query"></td>
				                                     <td>
														<select name="columns[${column_index}].queryType" class="form-control">
															<option value="=" title="">=</option>
															<option value="!=" title="">!=</option>
															<option value=">" title="">&gt;</option>
															<option value=">=" title="">&gt;=</option>
															<option value="<" title="">&lt;</option>
															<option value="<=" title="">&lt;=</option>
															<option value="like" title="">Like</option>
														</select>
													</td>
													<td>
														<select name="columns[${column_index}].showType" class="form-control">
																<option value="input" title="">单行文本</option>
																<option value="textarea" title="">多行文本</option>
																<option value="dateselect" title="">日期选择</option>
																<option value="fulltext" title="">富文本控件</option>
																<option value="upload" title="">图片上传控件</option>
														</select>
													</td>
													<td>
														<input type="text" name="columns[${column_index}].sort" value="${(column_index + 1) * 10}" maxlength="200" class="form-control" style="width:60px;">
													</td>
				                                </tr>
				                                [/#list]
				                            </tbody>
				                        </table>
				                    </div>
				            </div>
				        </div>
                        <div class="hr-line-dashed"></div>
	                    <div class="form-group">
	                        <div class="col-sm-12 col-sm-offset-10">
	                        	<button type="button" class="btn btn-default" onclick="window.history.back();">返回</button>
	                            <button class="btn btn-success" type="submit">保存</button>
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
		$(document).ready(function(){
			$(".chosen-select").chosen({width:"100%"}); 
			
			jQuery("#inputForm").validate({
                rules: {
                   name: {
						required: true,
						minlength: 2,
						maxlength: 50
					},
					className: {
						required: true
					},
					description: {
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
