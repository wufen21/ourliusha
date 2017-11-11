<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0052)http://b2b2c.leimingtech.com/leimingtech-admin/login -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<title>Loippi Framework 2.0</title>
	 <link rel="icon" type="image/x-icon" href="http://www.requirejs.cn/favicon.png">
	<link href="${base}/resources/themes/classic/css/base.css" rel="stylesheet" type="text/css">
	<link href="${base}/resources/plugins/artdialog/skins/simple.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="${base}/resources/iconfont/iconfont.css">
	<script type="text/javascript" src="${base}/resources/js/jquery-2.1.1.min.js"></script>
	<script type="text/javascript" src="${base}/resources/js/admin/jsbn.js"></script>
	<script type="text/javascript" src="${base}/resources/js/admin/prng4.js"></script>
	<script type="text/javascript" src="${base}/resources/js/admin/rng.js"></script>
	<script type="text/javascript" src="${base}/resources/js/admin/rsa.js"></script>
	<script type="text/javascript" src="${base}/resources/js/admin/base64.js"></script>
	<script type="text/javascript" src="${base}/resources/js/admin/common.js"></script>
	<script src="${base}/resources/plugins/artdialog/artDialog.min.js?skin=default" type="text/javascript"></script>
	<script src="${base}/resources/plugins/artdialog/artDialog.plugins.js" type="text/javascript"></script>
	<script src="${base}/resources/themes/classic/js/login.js?1=1" type="text/javascript"></script>
	<script>
    	$().ready( function() {
			[@flash_message /]
			
			var $loginForm = $("#loginForm");
			var $enPassword = $("#enPassword");
			var $username = $("#username");
			var $password = $("#password");
			var $captcha = $("#captcha");
			var $isRememberUsername = $("#isRememberUsername");
			
			// 记住用户名
			if(getCookie("adminUsername") != null) {
				$isRememberUsername.prop("checked", true);
				$username.val(getCookie("adminUsername"));
				$password.focus();
			} else {
				$isRememberUsername.prop("checked", false);
				$username.focus();
			}
			
		    // 表单验证、记住用户名
			$loginForm.submit( function() {
				if ($username.val() == "") {
					art.warn("${message("admin.login.usernameRequired")}");
					return false;
				}
				if ($password.val() == "") {
					art.warn("${message("admin.login.passwordRequired")}");
					return false;
				}
				if ($captcha.val() == "") {
					art.warn("${message("admin.login.captchaRequired")}");
					return false;
				}
				if($isRememberUsername[0]){
					if ($isRememberUsername.prop("checked")) {
						addCookie("adminUsername", $username.val(), {expires: 7 * 24 * 60 * 60});
					} else {
						removeCookie("adminUsername");
					}
				}
				var rsaKey = new RSAKey();
				rsaKey.setPublic(b64tohex("${modulus}"), b64tohex("${exponent}"));
				var enPassword = hex2b64(rsaKey.encrypt($password.val()));
				$enPassword.val(enPassword);
			});
    	});
    
    </script>
</head>

<body class="login-page"
	style="background: url(&quot;${base}/resources/themes/classic/images/bg4.jpg&quot;);">
	<div class="login-content">
		<div class="login-panel">
			<p class="logo animate0 bounceIn" style="height:100px;">
				<i class="icon iconfont my-logo"></i>
			</p>
			 <form class="m-t" id="loginForm" action="${base}/admin/login.jhtml" method="post">
				<ol class="login-form">
					<li class="animate1 bounceIn"><input class="acc" type="text"
						name="username" id="username" placeholder="管理员账号"
						autocomplete="off"></li><input type="hidden" id="enPassword" name="enPassword" />
					<li class="animate2 bounceIn"><input class="pass"
						type="password" name="password" id="password" placeholder="登录密码"
						autocomplete="off"></li>
 					[#if setting.captchaTypes?seq_contains('adminLogin')]
					<li class="animate3 bounceIn"><input class="code" type="text"
					value="2"	name="captcha" id="captcha"placeholder="验证码" autocomplete="off" style="text-transform: uppercase;">
						<span class="code-mod"> <img class="code-img"
								id="captchaImage" src="${base}/admin/common/captcha.jhtml?captchaId=${captchaId}" title="点击更换一张">
									<a href="javascript:void(0);" class="code-change"
									title="更换一张验证码" onclick="changeCaptcha('${captchaId}','${base}')"></a></span></li>
					  <input type="hidden" name="captchaId" value="${captchaId}" />
                	[/#if]
					<li class="animate4 bounceIn">
						<button name="submit">登 录</button>
					</li>
				</ol>
			</form>
		</div>
	</div>

	<div class="footer-fixed">
		<div class="footer">©2016 颜付乾 . 配件基地 . Loippi Framework 2.0</div>
	</div>
	<!-- footer-wrap] -->


</body>
</html>