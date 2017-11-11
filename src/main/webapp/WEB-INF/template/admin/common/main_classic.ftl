[#assign shiro=JspTaglibs["/WEB-INF/tld/shiro.tld"] /]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<title>${setting.siteName} - 主页</title>
    <meta name="keywords" content="${setting.siteName}">
  	<meta name="description" content="${setting.siteName}">
	<link rel="icon" type="image/x-icon" href="http://www.requirejs.cn/favicon.png">
	<link href="${base}/resources/themes/classic/css/skin_0.css" rel="stylesheet" type="text/css" id="cssfile">
	<link rel="stylesheet" href="${base}/resources/iconfont/iconfont.css">
	<script type="text/javascript" src="${base}/resources/js/jquery-2.1.1.min.js"></script>
	<script src="${base}/resources/js/admin/common.js" type="text/javascript"></script>
	<script src="${base}/resources/themes/classic/js/main.js" type="text/javascript"></script>
</head>
<body style="margin: 0px;" scroll="no">
	<div id="pagemask" style="display: none;"></div>
	<table style="width: 100%;" id="frametable" height="100%" width="100%"
		cellpadding="0" cellspacing="0">
		<tbody>
			<tr style="background: rgb(255, 255, 255);">
				<td colspan="2" height="90" class="mainhd"><div
						class="layout-header">
						<!-- Title/Logo - can use text instead of image -->
						<div id="title">
							<i class="icon iconfont my-logo-main"></i>
						</div>
						<!-- Top navigation -->
						<div id="topnav" class="top-nav">
							<ul>
								<li class="adminid" title="您好:${principal.username}">您好&nbsp;:&nbsp;<strong>${principal.username}</strong></li>
								<li><a
									href="${base}/admin/profile/edit.jhtml"
									target="workspace"><span>修改头像</span></a></li>
								<li><a
									href="${base}/admin/profile/view.jhtml"
									target="workspace" title="个人资料"><span>个人资料</span></a></li>
								<li><a
									href="${base}/admin/common/logout.jhtml"
									title="退出"><span>退出</span></a></li>
							</ul>
							<ul class="themeList" id="themeList">
								<li theme="default" class="default changeTheme"  data-theme="1"  title="Hplus"><div >Hplus</div></li>
								<li theme="green" class="green changeTheme"  data-theme="2"  title="Classic" class="selected"><div >Classic</div></li>
							</ul>
						</div>
						<!-- End of Top navigation -->
						<!-- Main navigation -->
						<nav id="nav" class="main-nav">
						<ul>
							
							<li><a class="link actived" id="0" href="javascript:;"
								onclick="openItem(&#39;0&#39;);"><span>首页</span></a></li>
							[#list acls as acl]
                    		[@shiro.hasPermission name = acl.permission]
							<li><a class="link" id="${acl.id}" href="javascript:;"
								onclick="openItem(&#39;${acl.id}&#39;);"><span>${acl.name}</span></a></li>
							[/@shiro.hasPermission]
                   			[/#list]
						</ul>
						</nav>
						<div class="loca">
							<strong>您的位置:</strong>
							<div id="crumbs" class="crumbs">
								<span>首页</span><span class="arrow">&nbsp;</span><span>工作台</span>
							</div>
						</div>
					</div>
					<div></div></td>
			</tr>
			<tr style="background: rgb(251, 251, 251);">
				<td class="menutd" valign="top" width="161">
					<div id="mainMenu" class="main-menu">
						
						<ul id="sort_0" style="display: block;">
							<li><dl>
									<dd>
										<ol>
											
											<li><a href="javascript:void(0);"
												url="${base}/admin/common/index.jhtml" name="0" id="0"
												onclick="openItem(&#39;0&#39;,&#39;0&#39;);" class="">工作台</a></li>
										</ol>
									</dd>
								</dl></li>
						</ul>
						[#list acls as acl]
                    	[@shiro.hasPermission name = acl.permission]
						<ul id="sort_${acl.id}" style="display: none;">
							<li><dl>
									<dd>
										<ol>
											[#list acl.children as a]
		                        			[@shiro.hasPermission name = a.permission]
											<li><a href="javascript:void(0);"
												url="${base}${a.url}" name="${a.id}" id="${a.id}"
												onclick="openItem(&#39;${acl.id}&#39;,&#39;${a.id}&#39;);" class="">${a.name}</a></li>
											[/@shiro.hasPermission]
	                            			[/#list]
										</ol>
									</dd>
								</dl></li>
						</ul>
						[/@shiro.hasPermission]
                    	[/#list]
					</div>
				</td>
				<td valign="top" width="100%"><iframe src="${base}/admin/common/index.jhtml"
						id="workspace" name="workspace"
						style="overflow: visible; height: 889px; width: 1740px;"
						frameborder="0" width="100%" height="100%" scrolling="yes"
						onload="window.parent"></iframe></td>
			</tr>
		</tbody>
	</table>


</body>
</html>