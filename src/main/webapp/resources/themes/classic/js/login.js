var imgArr=['bg1.jpg','bg2.jpg','bg3.jpg','bg4.jpg'];
function switchBg(){
    var randomBgIndex = Math.floor(Math.random() * imgArr.length);
    var img_url=framework.base+'/resources/themes/classic/images/'+imgArr[randomBgIndex];
    $("body").css("background","url("+img_url+")");
}
function changeCaptcha(captchaId,baseUrl){
 	$("#captchaImage").attr("src", baseUrl+"/admin/common/captcha.jhtml?captchaId="+captchaId+"&timestamp=" + (new Date()).valueOf());
 }
$(function(){
	//初始化背景
    switchBg();
    //每5秒切换背景图
    setInterval("switchBg()",5000);
    //跳出框架在主窗口登录
    //if(top.location!=this.location)	top.location=this.location;
    //用户名获取焦点
    $('#username').focus();
});