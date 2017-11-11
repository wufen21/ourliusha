
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">

    <title>${setting.siteName} - 系统信息</title>
    <meta name="keywords" content="${setting.siteName}">
  <meta name="description" content="${setting.siteName}">

    <link href="${base}/resources/css/bootstrap.min.css?v=3.4.0" rel="stylesheet">
    <link href="${base}/resources/css/font-awesome.min.css?v=4.3.0" rel="stylesheet">
    <link href="${base}/resources/css/plugins/jsTree/style.min.css" rel="stylesheet">
    <link href="${base}/resources/css/animate.min.css" rel="stylesheet">
    <link href="${base}/resources/css/style.min.css?v=3.0.0" rel="stylesheet">
    <!-- iCheck -->
    <link href="${base}/resources/css/plugins/iCheck/custom.css" rel="stylesheet">
    <!-- Sweet Alert -->
    <link href="${base}/resources/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">
    <link href="${base}/resources/css/plugins/datapicker/datepicker3.css" rel="stylesheet">
    
	<style>
		html, body, div, span, input, p,h1, h2, h3, h4, h5, h6, blockquote, a, abbr, acronym, address, strong, b, u, i, center,dl, dt, dd, ol, ul,td,tr {
		    font-family:"Microsoft Yahei","微软雅黑","宋体", "Simsun", "Open Sans";
		}
	</style>
</head>

<body class="gray-bg">
 
	<div class="row  border-bottom white-bg dashboard-header">
        <div class="col-sm-12 ui-sortable">
            <blockquote class="text-success" style="font-size:14px">Loippi framework是一款基于代码生成器的智能快速开发平台，引领新开发模式(智能开发\在线开发\插件开发)， 可以帮助解决Java项目80%的重复工作，让开发更多关注业务逻辑。既能快速提高开发效率，帮助公司节省人力成本，同时又不失灵活性。 
   				 <br>简单功能由代码生成器生成使用; 复杂业务采用表单自定义，业务流程使用工作流来实现、扩展出任务接口，供开发编写业务逻辑。 实现了流程任务节点和任务接口的灵活配置，既保证了公司流程的保密性，又减少了开发人员的工作量
               <br>Loippi framework采用了目前极为流行的扁平化响应式的设计风格以及经典的jQuery UI风格可切换，可以完美的兼容电脑，pad，手机等多个平台。
                <br>…………
            </blockquote>

            <hr>
        </div>
    </div>

    <div class="wrapper wrapper-content  animated fadeInRight">
	<!--第一个表BEGIN-->
	<div class="row">
	   <div class="col-sm-4">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                      <span style="font-weight:bold;"> 系统信息</span>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            
                        </div>
                    </div>
                    <div class="ibox-content">
                    	<div class="ibox-content">
                        <p><i class="fa fa-laptop"></i> ${message("admin.index.systemName")}：${systemName}
                        </p>
                        <p><i class="fa fa-info-circle"></i> ${message("admin.index.systemVersion")}： ${systemVersion}
                        </p>
                        <p><i class="fa fa-fire"></i> ${message("admin.index.javaVersion")}：${javaVersion}
                        </p>
                        <p><i class="fa fa-windows"></i> ${message("admin.index.osName")}：${osName}  ${osArch}
                        </p>
                         <p><i class="fa fa-tachometer"></i>${message("admin.index.serverInfo")}：${serverInfo}
                        </p>
                         <p><i class="fa fa-flask"></i> ${message("admin.index.servletVersion")}： ${servletVersion}
                        </p>
                    </div>
                     	</div>
                    </div>
                </div>
                <div class="col-sm-4">

                <div class="ibox float-e-margins">
                     <div class="ibox-title">
                        <h5>Loippi framework 技术特点</h5> 
                        <div class="ibox-tools">
                            <a class="collapse-link ui-sortable">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <p> Loippi framework开发平台采用 SpringMVC + MyBatis + BootStrap + Apache Shiro + Ehcache + Freemarker + lombok + Quartz(eslatic-job) + eslatic-search + redis + POI 开发组件 的基础架构,采用面向声明的开发模式， 基于泛型编写极少代码即可实现复杂的数据展示、数据编辑、
表单处理等功能，再配合代码生成器的使用,将J2EE的开发效率提高5倍以上，可以将代码减少50%以上。

                        </p><ol>
						<li>代码生成器，支持多种数据模型,根据表生成对应的Entity,Service,Dao,Controller,FTL等,增删改查/排序/导出导入Excel/权限控制/功能生成直接使用</li>
						<li>基础用户权限，强大数据权限，操作权限控制精密细致，对所有管理链接都进行权限验证，可控制到按钮，对指定数据集权限进行过滤</li>
						<li>简易Excel导入导出/以及POI的复杂处理Excel文件</li>
						<li>查询过滤器，查询功能自动生成，后台动态拼SQL追加查询条件；支持多种匹配方式（全匹配/模糊查询/包含查询/不匹配查询） </li>
						<li>国际化，支持多语言，多语言系统切换（测试中，即将发布)</li>
						<li>集成百度Echarts，实现曲线图，柱状图，数据等报表</li>
						<li>系统日志监控，详细记录操作日志，可支持追查表修改日志</li>
						<li>Openfire/环信集成WEBIM：集成在线聊天系统。</li>
						<li>提供常用工具类封装，日志、缓存、验证、字典、组织机构等，常用标签（taglib），获取当前组织机构、字典等数据。</li>
						<li>连接池监视：监视当期系统数据库连接池状态，可进行分析SQL找出系统性能瓶颈。</li>
						<li>提供APP接口，可以快速和移动APP整合。</li>
						<li>快速体验</li>
						<li>支持多种浏览器: IE, 火狐, Google 等浏览器访问速度都很快</li>
						<li>支持数据库: Mysql,Oracle数据库的支持，但不限于数据库，平台留有其它数据库支持接口等</li>
						<li>要求JDK1.6+</li>
                        </ol>
                    </div>
                </div>
              
            </div>
            
            <div class="col-sm-4 ui-sortable">
                <div class="ibox float-e-margins">
                     <div class="ibox-title">
                        <h5>升级日志</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link ui-sortable">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="index.html#">
                                <i class="fa fa-wrench"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <div class="panel-body">
                            <div class="panel-group" id="version">
                            		<div class="panel panel-default">
	                                    <div class="panel-heading">
	                                        <h5 class="panel-title">
	                                                <a data-toggle="collapse" data-parent="#version" href="#v2.2">v2.0Beta版</a><code class="pull-right">2016.04.30更新</code>
	                                            </h5>
	                                    </div>
	                                    <div id="v2.2" class="panel-collapse collapse in ui-sortable">
	                                        <div class="panel-body">
	                                            <ol>
	                                                <li>优化Login页面</li>
	                                                <li>将log4j转为logback日志管理</li>
	                                                <li>新增jQueryUI风格支持切换</li>
	                                                <li>重构代码</li>
	                                                <li>新增代码生成器模块</li>
	                                                <li>新增数据字典管理模块</li>
	                                                <li>感谢大家的持续关注，如果你有更好的建议，请直接联系我。</li>
	                                            </ol>
	                                        </div>
	                                    </div>
	                                </div>
	                                
	                                
	                           <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h5 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#version" href="#v2.0">v1.2Beta版</a><code class="pull-right">2016.02.04更新</code>
                                            </h5>
                                    </div>
                                    <div id="v2.0" class="panel-collapse collapse in ui-sortable">
                                        <div class="panel-body">
                                            <ol>
                                            	<li>这是Loippi framework的第一个重要版本</li>
                                                <li>吉沃科技APP，以Dubbo为基础搭建的SOA框架</li>
                                               	<li>建立后台系统模块</li>
                                               	<li>新增APP接口处理模块</li>
                                            </ol>
                                        </div>
                                    </div>
                                </div>
                                
                            	<div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h5 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#version" href="#v2.0">v1.0Beta版</a><code class="pull-right">2015.11.09更新</code>
                                            </h5>
                                    </div>
                                    <div id="v2.0" class="panel-collapse collapse in ui-sortable">
                                        <div class="panel-body">
                                            <ol>
                                            	<li>这是Loippi framework的第一个基础版本</li>
                                                <li>基础架构初步集成</li>
                                            </ol>
                                        </div>
                                    </div>
                                </div>
                                
                </div>
            </div>
            </div>
            </div>
            </div>
        </div>
    </div>
	
    <!-- 全局js -->
    <script src="${base}/resources/js/jquery-2.1.1.min.js"></script>
    <script src="${base}/resources/js/bootstrap.min.js?v=3.4.0"></script>
     <!-- Peity -->
    <script src="${base}/resources/js/plugins/peity/jquery.peity.min.js"></script>
    <!-- 自定义js -->
    <script src="${base}/resources/js/content.min.js?v=1.0.0"></script>
    <!-- iCheck -->
    <script src="${base}/resources/js/plugins/iCheck/icheck.min.js"></script>
    <!-- layer javascript -->
    <script src="${base}/resources/js/plugins/layer/layer.min.js"></script>
    <script src="${base}/resources/js/plugins/bootbox/bootbox.min.js"></script>
    <script type="text/javascript" src="${base}/resources/js/admin/common.js"></script>
</body>

</html>
