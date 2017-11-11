<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML>
	<HEAD>
		<META content="IE=11.0000" http-equiv="X-UA-Compatible">

		<META http-equiv="Content-Type" content="text/html; charset=utf-8">
		<TITLE>e车夫 - 登录</TITLE>
		<SCRIPT src="js/lib/jquery/jquery.min.js" type="text/javascript"></SCRIPT>
<script src="uploadify/jquery.uploadify.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="uploadify/uploadify.css">
<style type="text/css">

</style>
		
	</HEAD>
	<BODY>
		<form>
		<div id="queue"></div>
		<input id="file_upload" name="file_upload" type="file" >
			<input id="file_upload2" name="file_upload2" type="file" multiple="true">
	</form>

	</BODY>
	
		<script type="text/javascript">

		$(function() {

			$('#file_upload').uploadify({
				       
				        height  : 30,
				        swf      : 'uploadify/uploadify.swf',
				        uploader : 'http://upload.qiniu.com/',
				        width   : 120,
				        fileObjName : 'file',
				        'fileTypeExts': '*.gif; *.jpeg; *.jpg; *.png',  
				        buttonText:'选择文件',
				        'fileSizeLimit' : '3000KB',
				        method  : 'Post',
				         'multi': false,//是否允许多文件上传。默认为false
				        'overrideEvents': ['onSelectError', 'onDialogClose'], 
				       'onSelectError': function (file, errorCode, 

errorMsg) {  
                  
                         switch (errorCode) {
                        
                        case -100:  
                            alert("上传的文件数量已经超出系统限制的" + jQuery

('#file_upload').uploadify('settings', 'queueSizeLimit') + "个文件！");  
                            break;  
                        case -110:  
                            alert("文件 [" + file.name + "] 大小超出系统限制的" + jQuery

('#file_upload').uploadify('settings', 'fileSizeLimit') + "大小！");  
                            break;  
                        case -120:  
                            alert("文件 [" + file.name + "] 大小异常！");  
                            break;  
                        case -130:  
                            alert("文件 [" + file.name + "] 类型不正确！");  
                            break;  
                    }  
                },  
                'onClearQueue': function (queueItemCount) {  
                    alert("取消上传");  
                    return;  
                }, 
                 'onUploadStart': function (file) {
           var timestamp=new Date().getTime();
          // 如想取1000~10000的随机数则：
            var randoms= Math.floor(Math.random()*100)+9000;
           timestamp= timestamp+'K'+randoms;
           console.log(file.type);
                    $("#file_upload").uploadify(  "settings", "formData",  {'token' : '7bvoBEUc_wSGq0YFA9uQLNFI6HvGUmqKweTxUtN3:CwsASjB4WQmBboq-LKHF2IPu7S0=:eyJzY29wZSI6Imh1eGluIiwiZGVhZGxpbmUiOjE0NDQ1NzY4Njl9', 'key' :timestamp+file.type});  
                    //在onUploadStart事件中，也就是上传之前，把参数写好传递到后台。  
                } ,   
               'onComplete': function(event, queueID, fileObj, response, data) {//当单个文件上传完成后触发
                alert("文件:" + fileObj.name + " 上传成功！");
              
            },  
				
			});
			
			$('#file_upload2').uploadify({
				       
				        height  : 30,
				        swf      : 'uploadify/uploadify.swf',
				        uploader : 'http://upload.qiniu.com/',
				        width   : 120,
				        fileObjName : 'file',
				        'fileTypeExts': '*.gif; *.jpeg; *.jpg; *.png',  
				        buttonText:'选择文件',
				        'fileSizeLimit' : '3000KB',
				        method  : 'Post',
				        'overrideEvents': ['onSelectError', 'onDialogClose'], 
				       'onSelectError': function (file, errorCode, 

errorMsg) {  
                  
                         switch (errorCode) {  
                        case -100:  
                            alert("上传的文件数量已经超出系统限制的" + jQuery

('#file_upload2').uploadify('settings', 'queueSizeLimit') + "个文件！");  
                            break;  
                        case -110:  
                            alert("文件 [" + file.name + "] 大小超出系统限制的" + jQuery

('#file_upload2').uploadify('settings', 'fileSizeLimit') + "大小！");  
                            break;  
                        case -120:  
                            alert("文件 [" + file.name + "] 大小异常！");  
                            break;  
                        case -130:  
                            alert("文件 [" + file.name + "] 类型不正确！");  
                            break;  
                    }  
                },  
                'onClearQueue': function (queueItemCount) {  
                    alert("取消上传");  
                    return;  
                }, 
                 'onUploadStart': function (file) {
           
                    $("#file_upload2").uploadify(  "settings", "formData",  {'token' : '7bvoBEUc_wSGq0YFA9uQLNFI6HvGUmqKweTxUtN3:XvahjEtE9Q87PfG8I5TVTJaOgiA=:eyJzY29wZSI6Imh1eGluIiwiZGVhZGxpbmUiOjE0NDQ1NzMxOTh9', 'key' :file.name});  
                    //在onUploadStart事件中，也就是上传之前，把参数写好传递到后台。  
                } ,
                onUploadSuccess: function(file,data, response) {
                
                alert("上传成功"+data);
                }
				
			});
		});
	</script>
</HTML>