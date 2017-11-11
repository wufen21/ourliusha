$(document).ready(function () {
	
	//表单页面移除某一行参数
	$(".ibox-content").delegate('.fa-times-circle','click',function(){
		$(this).parent().parent().parent().remove();
	});
	//左侧菜单鼠标悬浮控制删除按钮显示隐藏
	$(".x-category").hover(function(){
		$(this).find(".x-delete").removeClass('hidden');
	},function(){
		$(this).find(".x-delete").addClass('hidden');
	});
	//删除左侧菜单
	$(".x-delete").click(function(){
		var $this = $(this);
    	 bootbox.confirm(message("admin.dialog.deleteConfirm"), function(result) {
		 	if(result){
		 		$.ajax({
					url: framework.base+"/admin/api/category/delete.jhtml",
					type: "POST",
					data: {id:$this.attr('data-id')},
					dataType: "json",
					cache: false,
					success: function(message) {
						art.dialog.message(message);
						window.setTimeout(function() {
							window.location.href="/admin/api/index.jhtml";
						}, 1000);
					}
				});
		 	}
        }); 
	});
	
	//判断在iframe时显示全屏按钮
	if(top.location==this.location){
	 	$("#full_screen").remove();
	 }
 
	//添加分类
	$("#myModal .save-category").click(function(){
		$("#myModal input").each(function(){
			if($(this).val() == null || $(this).val() == ''){
				$(".alert-danger").removeClass('hidden').html("<i class='fa fa-warning'></i>" +$(this).attr('placeholder'));
				return false;
			}else{
				$(".alert-danger").addClass('hidden');
			}
		});
		
		
		jQuery.post(framework.base+"/admin/api/category/save.jhtml",$("#myModal input").serialize(),function(data){
			$('#myModal').modal('hide')
			art.dialog.message(data);
			if(data.type='success'){
				window.location.reload();
			}				
		});
	});
	
	//生成代码
	$(".fa-code").click(function(){
		$.loading.init('代码正在生成中...');
		
		jQuery.post(framework.base+"/admin/api/gen_code.jhtml","",function(data){
			$.loading.close();
			art.dialog.message(data);
		});
	});
	
	$(".fa-file-powerpoint-o").click(function(){
		$.loading.init('文档正在生成中...');
		window.setTimeout(function() {
			$.loading.close();
		},1000);
	});
});