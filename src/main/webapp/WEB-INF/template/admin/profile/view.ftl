
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
        	<div class="col-sm-4">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>个人资料</h5>
                    </div>
                    <div>
                        <div class="ibox-content no-padding border-left-right">
                            <img alt="image" class="img-responsive" style="min-width:100%" src="${user.avatar}">
                        </div>
                        <div class="ibox-content profile-content">
                            <h4><strong>${user.username}</strong>[#if user.nickname??](${user.nickname})[/#if]</h4>
                            <p><i class="fa fa-map-marker"></i> ${user.role.name}</p>
                            <h5>登录信息</h5>
                            <p>
                              	${user.loginDate?string('yyyy-MM-dd HH:mm:ss')}
                            </p>
                            <p>
                              	${user.loginIp}
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        
         </div>
    </div>
    <!-- 全局js -->
    <script src="${base}/resources/js/jquery-2.1.1.min.js"></script>
    <script src="${base}/resources/js/bootstrap.min.js?v=3.4.0"></script>
</body>

</html>
