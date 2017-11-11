[#assign shiro=JspTaglibs["/WEB-INF/tld/shiro.tld"] /]
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <title>${setting.siteName} - 主页</title>
    <meta name="keywords" content="${setting.siteName}">
  <meta name="description" content="${setting.siteName}">

    <link href="${base}/resources/css/bootstrap.min.css?v=3.4.0" rel="stylesheet">
    <link href="${base}/resources/css/font-awesome.min.css?v=4.3.0" rel="stylesheet">
    <link href="${base}/resources/css/animate.min.css" rel="stylesheet">
    <link href="${base}/resources/css/style.min.css?v=3.0.0" rel="stylesheet">
    <link href="${base}/resources/css/common.css?v=3.0.0" rel="stylesheet">
    <link href="${base}/resources/js/plugins/layer/layim/layim.css" rel="stylesheet">
    <link rel="icon" type="image/x-icon" href="http://www.requirejs.cn/favicon.png">
    
    
</style>
</head>

<body class="fixed-sidebar full-height-layout gray-bg  pace-done fixed-nav">
    <div id="wrapper">
        <!--左侧导航开始-->
        <nav class="navbar-default navbar-static-side" role="navigation">
            <div class="nav-close"><i class="fa fa-times-circle"></i>
            </div>
            <div class="sidebar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="nav-header">
                        <div class="dropdown profile-element">
                            <span><img alt="image" class="img-circle" src="${principal.avatar}" style="width: 60px;"/></span>
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="clear">
                               <span class="block m-t-xs"><strong class="font-bold">${principal.username}</strong></span>
                                <span class="text-muted text-xs block">${principal.rolename}<b class="caret"></b></span>
                                </span>
                            </a>
                            <ul class="dropdown-menu animated fadeInRight m-t-xs">
                                <li><a class="J_menuItem" href="javascript:;" data-href="${base}/admin/profile/edit.jhtml">修改头像</a>
                                </li>
                                <li><a class="J_menuItem" href="javascript:;" data-href="${base}/admin/profile/view.jhtml">个人资料</a>
                                </li>
                                <li class="divider"></li>
                                <li><a href="${base}/admin/common/logout.jhtml">安全退出</a>
                                </li>
                            </ul>
                        </div>
                        <div class="logo-element">采办网
                        </div>
                    </li>
                    <li>
                        <a class="J_menuItem" href="javascript:;" data-href="${base}/admin/common/index.jhtml"><i class="fa fa-home"></i> <span class="nav-label">首页</span></a>
                    </li>
                    
                    [#list acls as acl]
                    [@shiro.hasPermission name = acl.permission]
                    <li>
                    	[#if acl.children?has_content]
	                    	<a href="javascript:;">
	                            <i class="${acl.icon}"></i>
	                            <span class="nav-label"> ${acl.name}</span>
	                            <span class="fa arrow"></span>
	                        </a>
	                        <ul class="nav nav-second-level">
	                        	[#list acl.children as a]
		                        	[@shiro.hasPermission name = a.permission]
		                            <li>
		                                <a class="J_menuItem" href="javascript:;" data-href="${base}${a.url}">[#if a.icon??]<i class="${a.icon}"></i>[/#if]${a.name}</a>
		                            </li>
		                            [/@shiro.hasPermission]
	                            [/#list]
	                        </ul>
                    	[#else]
                    		<a class="J_menuItem" href="javascript:;" data-href="${base}${acl.url}"><i class="${acl.icon}"></i> <span class="nav-label">${acl.name}</span></a>
                    	[/#if]
                    </li>
                    [/@shiro.hasPermission]
                    [/#list]
                </ul>
            </div>
        </nav>
        <!--左侧导航结束-->
        <!--右侧部分开始-->
        <div id="page-wrapper" class="gray-bg dashbard-1">
        	<div class="row border-bottom">
                <nav class="navbar navbar-fixed-top" role="navigation" style="margin-bottom: 0">
                  	<div class="navbar-header">
                  		<h1 style=" margin-left: 20px;width: 220px;    font-size: 27px;    height: 27px; border-radius: 4px; border: 1px solid #F3F3F4; box-shadow: inset 0 0 11px 5px #ccc;">Loippi Framework</h1>
                    </div>
                    <ul class="nav navbar-top-links navbar-right">
                        <li>
                            <a href="javascript:;" data-index="0"><i class="fa fa-clock-o"></i> ${.now}</a>
                        </li>
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                <i class="fa fa-tasks"></i> 主题
                            </a>
                              <ul role="menu" class="dropdown-menu dropdown-messages" style="width: 150px;">
			                        <li class="J_tabShowActive"><a href="javascript:;" data-theme="1" class="changeTheme">Hplus 风格</a>
			                        </li>
			                        <li class="divider"></li>
			                        <li class="J_tabCloseAll" ><a href="javascript:;" data-theme="2" class="changeTheme">Classic 风格</a>
			                        </li>
			                    </ul>
                        </li>
                    </ul>
                </nav>
            </div>
            <div class="row content-tabs">
            	<button class="roll-nav roll-left navbar-minimalize"><i class="fa fa-bars"></i>
                </button>
                <button class="roll-nav roll-left J_tabLeft" style="margin-left:40px;"><i class="fa fa-backward"></i>
                </button>
                <nav class="page-tabs J_menuTabs">
                    <div class="page-tabs-content">
                        <a href="javascript:;" class="active J_menuTab" data-id="${base}/admin/common/index.jhtml">首页</a>
                    </div>
                </nav>
                <button class="roll-nav roll-right J_tabRight"><i class="fa fa-forward"></i>
                </button>
                <button class="roll-nav roll-right dropdown J_tabClose"><span class="dropdown-toggle" data-toggle="dropdown">关闭操作<span class="caret"></span></span>
                    <ul role="menu" class="dropdown-menu dropdown-menu-right">
                        <li class="J_tabShowActive"><a>定位当前选项卡</a>
                        </li>
                        <li class="divider"></li>
                        <li class="J_tabCloseAll"><a>关闭全部选项卡</a>
                        </li>
                        <li class="J_tabCloseOther"><a>关闭其他选项卡</a>
                        </li>
                    </ul>
                </button>
                <a href="${base}/admin/common/logout.jhtml" class="roll-nav roll-right J_tabExit"><i class="fa fa fa-sign-out"></i> 退出</a>
            </div>
            <div class="row J_mainContent" id="content-main">
                <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="${base}/admin/common/index.jhtml" frameborder="0" data-id="${base}/admin/common/index.jhtml" seamless></iframe>
            </div>
            <div class="footer">
                <div class="pull-right">&copy; 2015-2016 Loippi Item 版权所有   
                </div>
            </div>
        </div>
        <!--右侧部分结束-->
    </div>

    <!-- 全局js -->
    <script src="${base}/resources/js/jquery-2.1.1.min.js"></script>
    <script src="${base}/resources/js/bootstrap.min.js?v=3.4.0"></script>
     <script src="${base}/resources/js/admin/common.js"></script>
    <script src="${base}/resources/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="${base}/resources/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="${base}/resources/js/plugins/layer/layim/layer/layer.min.js"></script>
    <!-- 自定义js -->
    <script src="${base}/resources/js/hplus.min.js?v=3.0.0"></script>
    <script type="text/javascript" src="${base}/resources/js/contabs.js"></script>

    <!-- 第三方插件 -->
    <script src="${base}/resources/js/plugins/pace/pace.min.js"></script>
</body>
</html>
