
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
</head>

<body class="gray-bg">
	<div class="row  border-bottom white-bg dashboard-header" style="padding: 10px;">
		<div class="col-sm-12">
			<div class="p-xs tooltip-demo">
				<span class="text-muted small pull-right">版本:${apiSettings.version}  <br>作者:${apiSettings.author}</span>
				<div class="pull-left m-r-md" onclick="window.location.href='${base}/admin/api/index.jhtml'">
					<i class="${apiSettings.logo} text-navy mid-icon" style="color:#1C84C6;"></i>
				</div>
				<h2 onclick="window.location.href='${base}/admin/api/index.jhtml'">${apiSettings.name}</h2>
				
				
				<a href="${base}/admin/api/view.jhtml" target="_blank" class="btn btn-white  pull-right" data-toggle="tooltip" data-placement="top" title="" data-original-title="预览"><i class="fa fa-paper-plane"></i> </a> 
				<a href="${base}/admin/api/download.jhtml" class="btn btn-white btn-bitbucket  pull-right" style="margin-right: 2px;" data-toggle="tooltip" data-placement="top" title="" data-original-title="导出Postman文件"> <i class="fa fa-file-powerpoint-o"></i>     </a>
				<a class="btn btn-white btn-bitbucket  pull-right" style="margin-right: 2px;" data-toggle="tooltip" data-placement="top" title="" data-original-title="生成代码"> <i class="fa fa-code"></i>     </a>
				<a href="${base}/admin/api/index.jhtml" id="full_screen" target="_blank" style="margin-right: 2px;" class="btn btn-white  pull-right" data-toggle="tooltip" data-placement="top" title="" data-original-title="全屏"><i class="fa fa-arrows-alt"></i> </a>
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
									<a href="${base}/admin/api/category/view/${category.id}.jhtml" style="padding: 15px 0;display: inline-table;"> 
										<i class="${category.icon}"></i>${category.name}</a>
									<i class="fa fa-times pull-right hidden x-delete" style="padding: 15px 0;display: inline-table;cursor: pointer;" data-id="${category.id}"></i>
								</li>
								[/#list]
							</ul>
							<a class="btn btn-block btn-success compose-mail" class="btn btn-primary" data-toggle="modal" data-target="#myModal">创建分类</a>
							<a class="btn btn-block btn-white  compose-mail" href="${base}/admin/api/interfacer/add.jhtml">创建接口</a>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-10 animated fadeInRight">
				<div class="mail-box-header">
					<h2>
						${category.name}[#if category.counts?? && category.counts gt 0]（${category.counts}）[/#if]<small style="margin-left: 10px; font-size: 5px;">${category.description}</small>
					</h2>
				</div>
				<div class="mail-box">
					<table class="table table-hover table-mail">
						<tbody>
							<tr class="unread">
								<td style="    width: 50px;">类型</td>
								<td class="mail-ontact"><a href="mail_detail.html">接口名称</a>
								</td>
								<td class="mail-subject"><a href="mail_detail.html">接口描述</a>
								</td>
								<td class="">时间</td>
								<td class="">操作</td>
							</tr>
							[#list interfacers as inface]
							<tr class="read">
								<td class=""><span class="label [#if inface.method=='POST']label-warning[#else]label-primary[/#if]">${inface.method}</span>
								</td>
								<td class="mail-ontact"><a href="${base}/admin/api/interfacer/view/${inface.id}.jhtml">${inface.name}</a>
								</td>
								<td class="mail-subject"><a href="${base}/admin/api/interfacer/view/${inface.id}.jhtml">${inface.description}</a></td>
								<td class="">${inface.createDate?string('yyyy-MM-dd HH:mm')}</td>
								<td class=" mail-date">
									<a href="${base}/admin/api/interfacer/view/${inface.id}.jhtml" class="btn btn-white btn-sm hidden"><i class="fa fa-gears"></i> 调试</a>
									<a href="${base}/admin/api/interfacer/edit/${inface.id}.jhtml" class="btn btn-white btn-sm"><i class="fa fa-edit"></i> 编辑 </a>
									<a href="javascript:;" data-id="${inface.id}" class="btn btn-white btn-sm btn-delete"><i class="fa fa-trash"></i> 删除 </a></td>
							</tr>
							[/#list]
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal inmodal" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content animated bounceInRight">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
                        </button>
                        <small class="font-bold">创建分类  </div>
                        <div class="modal-body">
                        			<div class="alert alert-danger alert-dismissable hidden">
			                        </div>
                                    <div class="form-group"><label>名称</label> <input type="text" name="name" id="name" placeholder="请输入分类名称" class="form-control"></div>
                                     <div class="form-group"><label>模块</label> <input type="text" name="moduleName"  placeholder="请输入模块名称"  id="moduleName" class="form-control"></div>
                                     <div class="form-group"><label>描述</label> <input type="text" name="description" id="description"  placeholder="请输入描述信息"   class="form-control"></div>
                                     <div class="form-group"><label>排序</label> <input type="text" name="sorts" id="sorts"  placeholder="请输入排序"   class="form-control"></div>
                                     
                                      <div class="form-group"><label>图标</label><div class="input-group m-b">
               		<input type="text" name="icon" id="icon" class="form-control" placeholder="请选择图标" >
               		<span class="input-group-btn"> <button tabindex="-1" class="btn btn-white" type="button" id="input-group-addon"><i>-</i></button><button type="button" class="btn btn-white" data-toggle="modal" data-target="#icon_choose">选择</button> </span>
               	 </div></div>
                                     
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                            <button type="button" class="btn btn-success save-category">保存</button>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        [#include "/admin/include/icon_choose.ftl"]
	<!-- BEGIN Script -->
		[#include "/admin/include/script.ftl"]
	<!-- END Script -->
    <script src="${base}/resources/js/admin/loippi.api.common.js"></script>
    <script>
    
        $(document).ready(function () {
        	[@flash_message /]
        	 // 删除单条记录
		    $(".btn-delete").click(function(){
		    	var $this = $(this);
		    	 bootbox.confirm(message("admin.dialog.deleteConfirm"), function(result) {
				 	if(result){
				 		$.ajax({
							url: "${base}/admin/api/interfacer/delete.jhtml",
							type: "POST",
							data: {id:$this.attr('data-id')},
							dataType: "json",
							cache: false,
							success: function(message) {
								art.dialog.message(message);
								window.setTimeout(function() {
									window.location.reload();
								}, 1000);
							}
						});
				 	}
		        }); 
		    });
        	$(".infont").dblclick(function(){
        		$("#icon").val($(this).find("i").attr("class"));
        		$("#input-group-addon").html("<i class='"+$("#icon").val()+"' style='color:#0E9AEF;'></i>");
        		$('#icon_choose').modal('hide')
			});
        });
    </script>
</body>

</html>
