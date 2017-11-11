 $(document).ready(function () {
	var layerFrame;
	bootbox.setDefaults({locale:framework.locale});
	
	// 复选框
    $('.i-checks').iCheck({ checkboxClass: 'icheckbox_square-green',  radioClass: 'iradio_square-green',  });
    // 选择所有
    $("input[name='checkAll']").on('ifChanged',function(){
		$("input[name='ids']").iCheck($(this).is(":checked") == true ? 'check':'uncheck');  
	});
    
    //跳转
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
								window.location.reload();
							}, 1000);
						}
					}
				});
		 	}
        }); 
   });
       		
});