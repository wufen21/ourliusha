
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">

    <title>${apiSettings.name}</title>
    <meta name="keywords" content="${setting.siteName}">
  	<meta name="description" content="${setting.siteName}">

  	<!-- BEGIN HEADER -->
		[#include "/admin/include/style.ftl"]
	<!-- END HEADER -->
		<link href="${base}/resources/css/plugins/codemirror/codemirror.css" rel="stylesheet">
    <link href="${base}/resources/css/plugins/codemirror/ambiance.css" rel="stylesheet">
</head>

<body class="gray-bg">
	<div class="row  border-bottom white-bg dashboard-header" style="padding: 10px;">
		<div class="col-sm-12">
			<div class="p-xs tooltip-demo">
				<span class="text-muted small pull-right" style=" margin-top: 10px;">版本:${apiSettings.version}  <br>作者:${apiSettings.author}</span>
				<div class="pull-left m-r-md">
					<i class="${apiSettings.logo} text-navy mid-icon" style="color:#676a6c;"></i>
				</div>
				<h2>${apiSettings.name}</h2>
					<span>介绍：${apiSettings.description}
				</span>
			</div>
		</div>
	</div>
	<div class="wrapper wrapper-content">
		<div class="row">
			<div class="col-sm-2">
				<div class="ibox float-e-margins">
					<div class="ibox-content mailbox-content">
						<div class="file-manager">
							<h5>接口分类</h5>
							<ul class="folder-list m-b-md" style="padding: 0">
								[#list categories as category]
								<li class="x-category">
									[#if category.counts?? && category.counts gt 0]<span class="label label-warning pull-right" style="margin: 15px 0px;">${category.counts}</span>[/#if]
									<a href="#category_${category.id}" style="padding: 15px 0;display: inline-table;"><i class="${category.icon}"></i>${category.name}</a>
								</li>
								[/#list]
							</ul>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-10 animated fadeInRight">
				[#list categories as category]
				<div class="mail-box-header" id="category_${category.id}">
					<h2>
						${category.name}[#if category.counts?? && category.counts gt 0]（${category.counts}）[/#if]<small style="margin-left: 10px; font-size: 5px;">${category.description}</small>
					</h2>
				</div>
				<div class="mail-box">
					[#list category.interfacers as inface]
					<div class="ibox-content">
    					<p style="padding: 10px;border: 1px solid #e7eaec;border-bottom: none;background-color: #F3F3F4;margin-bottom: 0px;">${inface.name}</p>
						<blockquote  style="font-size:16px;border: 1px solid #eee;">
							<span class="label label-warning">${inface.method}</span> ${inface.url}<hr>说明： ${inface.description}
            			</blockquote>
            			[#if inface.parameters?? && inface.parameters?size gt 0]
   						<p style="padding: 10px;border: 1px solid #e7eaec;border-bottom: none;background-color: #F3F3F4;margin-bottom: 0px;">请求参数</p>
							<table class="table table-bordered">
	                            <thead>
	                                <tr>
	                                   <th style="width:20%;">参数名</th>
	                                    <th style="width:30%;">类型</th>
	                                    <th>说明</th>
	                                </tr>
	                            </thead>
	                            <tbody>
	                            	[#list inface.parameters as param]
	                                <tr>
	                                    <td>${param.name}</td>
	                                    <td>${param.type}</td>
	                                    <td>${param.remark}</td>
	                                </tr>
	                                [/#list]
	                            </tbody>
	                        </table>
		                [/#if]
		                [#if inface.results?? && inface.results?size gt 0]
		                <p style="padding: 10px;border: 1px solid #e7eaec;border-bottom: none;background-color: #F3F3F4;margin-bottom: 0px;">返回参数</p>
							<table class="table table-bordered">
	                            <thead>
	                                <tr>
	                                    <th style="width:20%;">参数名</th>
	                                    <th style="width:30%;">类型</th>
	                                    <th>说明</th>
	                                </tr>
	                            </thead>
	                            <tbody>
	                            	[#list inface.results as param]
	                                <tr>
	                                    <td>${param.name}</td>
	                                    <td>${param.type}</td>
	                                    <td>${param.remark}</td>
	                                </tr>
	                                [/#list]
	                            </tbody>
	                        </table>
		                [/#if]
		                [#if inface.codes??]
		                <p style="padding: 10px;border: 1px solid #e7eaec;border-left: none;border-right: none;border-bottom: none; background-color: #F3F3F4; margin-bottom: 0px; ">示例代码</p>
                     	<textarea class="codes" name="codes">${inface.codes}</textarea>
					 	[/#if]
					</div>
					[/#list]
				</div>
				[/#list]
			</div>
			
		</div>
	</div>
	[#include "/admin/include/script.ftl"]
	<script src="${base}/resources/js/plugins/codemirror/codemirror.js"></script>
    <script src="${base}/resources/js/plugins/codemirror/mode/javascript/javascript.js"></script>
     <script >
      $(document).ready(function () {
      		$(".codes").each(function(){
      			CodeMirror.fromTextArea(this, {
	                lineNumbers: true,
	                matchBrackets: true,
	                styleActiveLine: true
	            });
      		});
				
	   });  
	  </script>       
</body>
</html>
