
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
                    	
                    	 <h5>存储插件</h5>
                    </div>
                    <div class="ibox-content">
                        <!--列表开始BEGIN-->
			 			<div class="dataTables_wrapper form-inline">
                            <table id="listTable" class="table table-striped table-bordered table-hover dataTables-example dataTable">
                                <thead>
                                    <tr>
                                       <th >
									 		${message("StoragePlugin.name")}
										</th>
										<th>
										 	${message("StoragePlugin.version")}
										</th>
										<th>
									 		${message("StoragePlugin.author")}
										</th>
										<th style="    width: 30px;">
									 		${message("StoragePlugin.isEnabled")}
										</th>
										<th>
											${message("admin.common.handle")}
										</th>               
                                    </tr>
                                </thead>
                                <tbody>
                                	[#list storagePlugins as storagePlugin]
										<tr class="gradeX [#if (storagePlugin_index+1) % 2 != 0]odd[#else]even[/#if]" role="row">
											<td>
												[#if storagePlugin.siteUrl??]
													<a href="${storagePlugin.siteUrl}" target="_blank">${storagePlugin.name}</a>
												[#else]
													${storagePlugin.name}
												[/#if]
											</td>
											<td >
												${storagePlugin.version!'-'}
											</td>
											<td>
												${storagePlugin.author!'-'}
											</td>
											<td>
												[#if !storagePlugin.isEnabled]
													<label class="btn btn-danger btn-xs" style="    cursor: auto;"><i class="fa fa-times"></i></label>
												[#else]
													<label class="btn btn-info btn-xs" style="    cursor: auto;"><i class="fa fa-check"></i></label>
												[/#if]
											</td>
											<td>
												[#if storagePlugin.isInstalled]
													[#if storagePlugin.settingUrl??]
														<a href="${storagePlugin.settingUrl}" class="btn btn-white btn-xs"> <i class="fa fa-gears"></i>&nbsp;${message("admin.storagePlugin.setting")}</a>
													[/#if]
													[#if storagePlugin.uninstallUrl??]
														<a href="javascript:;" data-href="${storagePlugin.uninstallUrl}" class="btn btn-danger btn-xs uninstall"><i class="fa fa-wrench"></i>&nbsp;${message("admin.storagePlugin.uninstall")}</a>
													[/#if]
												[#else]
													[#if storagePlugin.installUrl??]
														<a href="javascript:;" data-href="${storagePlugin.installUrl}" class="btn btn-success btn-xs install"><i class="fa fa-puzzle-piece"></i>&nbsp;${message("admin.storagePlugin.install")}</a>
													[/#if]
												[/#if]
											</td>
										</tr>
									[/#list]
                                </tbody>
                            </table>
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
        	var $install = $("#listTable a.install");
			var $uninstall = $("#listTable a.uninstall");
			bootbox.setDefaults({locale:framework.locale});
			[@flash_message /]
		
			// 安装
			$install.click(function() {
				var $this = $(this);
				bootbox.confirm("${message("admin.storagePlugin.installConfirm")}", function(result) {
				 	if(result){
				 		$.ajax({
							url: $this.attr("data-href"),
							type: "POST",
							dataType: "json",
							cache: false,
							success: function(message) {
								art.message(message);
								if (message.type == "success") {
									window.setTimeout(function() {
										window.location.reload(true);
									}, 3000);
								}
							}
						});
				 	}
                }); 
				return false;
			});
			
			// 卸载
			$uninstall.click(function() {
				var $this = $(this);
				bootbox.confirm("${message("admin.storagePlugin.uninstallConfirm")}", function(result) {
				 	if(result){
				 		$.ajax({
							url: $this.attr("data-href"),
							type: "POST",
							dataType: "json",
							cache: false,
							success: function(message) {
								art.message(message);
								if (message.type == "success") {
									window.setTimeout(function() {
										window.location.reload(true);
									}, 3000);
								}
							}
						});
				 	}
                }); 
				return false;
			});
        });
    </script>
</body>

</html>
