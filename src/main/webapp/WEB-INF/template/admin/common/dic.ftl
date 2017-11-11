
<!doctype html>
<html class="js cssanimations">
<head lang="en">
  <meta charset="UTF-8">
  <title>数据字典 - ${setting.siteName}</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="format-detection" content="telephone=no">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp">
  <link rel="alternate icon" type="image/png" href="${base}/resources/assets/i/favicon.png">
  <link rel="stylesheet" href="${base}/resources/assets/css/amazeui.min.css">
  <link rel="stylesheet" href="${base}/resources/assets/css/amaze.min.css">
<link rel="stylesheet" href="${base}/resources/assets/css/api.css">
</head>
<body class="am-with-topbar-fixed-top">
<header class="am-topbar  am-topbar-fixed-top">
  <h1 class="am-topbar-brand">
    <a href="javascript:;" >数据字典 - ${setting.siteName}</a>
  </h1>

  <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only" data-am-collapse="{target: '#doc-topbar-collapse'}"><span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span></button>

  <div class="am-collapse am-topbar-collapse" id="doc-topbar-collapse">
    <div class="am-topbar-right">
      <div class="am-dropdown" data-am-dropdown="{boundary: '.am-topbar'}">
        <button class="am-btn am-btn-secondary am-topbar-btn am-btn-sm am-dropdown-toggle" data-am-dropdown-toggle=""> 操作  <span class="am-icon-caret-down"></span></button>
        <ul class="am-dropdown-content">
          <li><a href="javascript:;" onclick="window.open('${base}/admin/common/dic.jhtml')"><i class="am-icon-file-code-o"></i> 新窗口打开</a></li>
          <li><a href="javascript:;" onclick="window.print()"><i class="am-icon-file-pdf-o"></i> 打印</a></li>
          <li style="display:none;"><a href="#"><i class="am-icon-file-pdf-o"></i> 导出PDF文件</a></li>
        </ul>
      </div>
    </div>
  </div>
</header>



<section class="amz-main">
        <div class="col-md-3 am-u-md-2">
            <div class="am-sticky-placeholder">
                <div id="amz-offcanvas" class="am-offcanvas doc-offcanvas">
                    <!-- sidebar -->
                    <section class="amz-sidebar am-offcanvas-bar" style="position: fixed;   margin-top: 55px;    margin-left: 10px;width: 16.66666667%;    height: calc(100% - 70px);">
                        <ul class="am-nav" id="sidebar" style="overflow: hidden;">
                        	[#list tables as table]
                         	 	<li class="am-nav-header" data-name="${table.name}" title="${table.comment}"><a href="#${table.name}">${table_index+1}. ${table.name}</a></li>
                         	[/#list]
                        </ul>
                    </section>
                    <div class="amz-pager am-active" style="top: 498px;">
                        <a href="#up" class="am-icon-caret-up" data-rel="scrollUp"></a>
                        <a href="#down" class="am-icon-caret-down" data-rel="scrollDown"></a>
                    </div>
                </div>
            </div>
        </div>
      
        
        <div class="col-md-9 am-u-md-10 doc-content" id="api-content">
            <div class="am-panel-group" id="accordion">
            [#list tables as table]
              <div class="am-panel am-panel-default">
                <div class="am-panel-hd">
                  <h4 class="am-panel-title am-collapsed" data-am-collapse2="{parent: '#accordion', target: '#main_${table.name}'}" id="${table.name}">${table.name} : ${table.comment}</h4>
                </div>
                <div id="main_${table.name}" class="am-panel-collapse am-collapse am-in" >
                  <div class="am-panel-bd"> 
                    <table class="am-table am-table-bordered am-table-striped">
                        <thead>
                        <tr> <th style="width:30%">字段</th> <th style="width:20%">类型</th><th style="width:10%">主键</th> <th style="width:10%">可空</th><th style="width:30%">说明</th> </tr>
                        </thead>
                        <tbody>
                        	[#list table.columns as c]
			                <tr> <td><code>${c.name}</code></td> <td>${c.sqlType}</td> <td>[#if c.pri ==  true]是[/#if]</td><td>[#if c.null ==  true]Y[#else]N[/#if]</td><td>${c.comment}</td> </tr>
			            	[/#list]
			            </tbody>
                    </table>
                  </div>
                </div>
              </div>
              [/#list]
          </div>
        </div>
</section>

<!--[if (gte IE 9)|!(IE)]><!-->
<script src="${base}/resources/assets/js/jquery.min.js"></script>
<!--<![endif]-->
<script src="${base}/resources/assets/js/amazeui.min.js"></script>

</body></html>