var framework = {
	base: "${base}",
	locale: "${locale}"
};

var setting = {
	uploadImageExtension: "${setting.uploadImageExtension}",
	uploadFlashExtension: "${setting.uploadFlashExtension}",
	uploadMediaExtension: "${setting.uploadMediaExtension}",
	uploadFileExtension: "${setting.uploadFileExtension}"
};

var messages = {
	"admin.message.success": "${message("admin.message.success")}",
	"admin.message.error": "${message("admin.message.error")}",
	"admin.dialog.ok": "${message("admin.dialog.ok")}",
	"admin.dialog.cancel": "${message("admin.dialog.cancel")}",
	"admin.dialog.deleteConfirm": "${message("admin.dialog.deleteConfirm")}",
	"admin.dialog.clearConfirm": "${message("admin.dialog.clearConfirm")}",
	"admin.browser.title": "${message("admin.browser.title")}",
	"admin.browser.upload": "${message("admin.browser.upload")}",
	"admin.browser.parent": "${message("admin.browser.parent")}",
	"admin.browser.orderType": "${message("admin.browser.orderType")}",
	"admin.browser.name": "${message("admin.browser.name")}",
	"admin.browser.size": "${message("admin.browser.size")}",
	"admin.browser.type": "${message("admin.browser.type")}",
	"admin.browser.select": "${message("admin.browser.select")}",
	"admin.upload.sizeInvalid": "${message("admin.upload.sizeInvalid")}",
	"admin.upload.typeInvalid": "${message("admin.upload.typeInvalid")}",
	"admin.upload.invalid": "${message("admin.upload.invalid")}",
	"admin.validate.required": "${message("admin.validate.required")}",
	"admin.validate.email": "${message("admin.validate.email")}",
	"admin.validate.url": "${message("admin.validate.url")}",
	"admin.validate.date": "${message("admin.validate.date")}",
	"admin.validate.dateISO": "${message("admin.validate.dateISO")}",
	"admin.validate.pointcard": "${message("admin.validate.pointcard")}",
	"admin.validate.number": "${message("admin.validate.number")}",
	"admin.validate.digits": "${message("admin.validate.digits")}",
	"admin.validate.minlength": "${message("admin.validate.minlength")}",
	"admin.validate.maxlength": "${message("admin.validate.maxlength")}",
	"admin.validate.rangelength": "${message("admin.validate.rangelength")}",
	"admin.validate.min": "${message("admin.validate.min")}",
	"admin.validate.max": "${message("admin.validate.max")}",
	"admin.validate.range": "${message("admin.validate.range")}",
	"admin.validate.accept": "${message("admin.validate.accept")}",
	"admin.validate.equalTo": "${message("admin.validate.equalTo")}",
	"admin.validate.remote": "${message("admin.validate.remote")}",
	"admin.validate.integer": "${message("admin.validate.integer")}",
	"admin.validate.positive": "${message("admin.validate.positive")}",
	"admin.validate.negative": "${message("admin.validate.negative")}",
	"admin.validate.decimal": "${message("admin.validate.decimal")}",
	"admin.validate.pattern": "${message("admin.validate.pattern")}",
	"admin.validate.extension": "${message("admin.validate.extension")}"
};

// 添加Cookie
function addCookie(name, value, options) {
	if (arguments.length > 1 && name != null) {
		if (options == null) {
			options = {};
		}
		if (value == null) {
			options.expires = -1;
		}
		if (typeof options.expires == "number") {
			var time = options.expires;
			var expires = options.expires = new Date();
			expires.setTime(expires.getTime() + time * 1000);
		}
		document.cookie = encodeURIComponent(String(name)) + "=" + encodeURIComponent(String(value)) + (options.expires ? "; expires=" + options.expires.toUTCString() : "") + (options.path ? "; path=" + options.path : "") + (options.domain ? "; domain=" + options.domain : ""), (options.secure ? "; secure" : "");
	}
}

// 获取Cookie
function getCookie(name) {
	if (name != null) {
		var value = new RegExp("(?:^|; )" + encodeURIComponent(String(name)) + "=([^;]*)").exec(document.cookie);
		return value ? decodeURIComponent(value[1]) : null;
	}
}

// 移除Cookie
function removeCookie(name, options) {
	addCookie(name, null, options);
}

// 多语言
function message(code) {
	if (code != null) {
		var content = messages[code] != null ? messages[code] : code;
		if (arguments.length == 1) {
			return content;
		} else {
			if ($.isArray(arguments[1])) {
				$.each(arguments[1], function(i, n) {
					content = content.replace(new RegExp("\\{" + i + "\\}", "g"), n);
				});
				return content;
			} else {
				$.each(Array.prototype.slice.apply(arguments).slice(1), function(i, n) {
					content = content.replace(new RegExp("\\{" + i + "\\}", "g"), n);
				});
				return content;
			}
		}
	}
}

(function($) {

	// 文件浏览
	$.fn.extend({
		browser: function(options) {
			var settings = {
				type: "image",
				title: message("admin.browser.title"),
				isUpload: true,
				browserUrl: framework.base + "/admin/file/browser.jhtml",
				uploadUrl: framework.base + "/admin/file/upload.jhtml",
				callback: null
			};
			$.extend(settings, options);
			
			var token = getCookie("token");
			var cache = new Array();
			return this.each(function() {
				var browserFrameId = "browserFrame" + (new Date()).valueOf() + Math.floor(Math.random() * 1000000);
				var $browserButton = $(this);
				$browserButton.click(function() {
					var $browser = $('<div class="xxBrowser"><\/div>');
					var $browserBar = $('<div class="browserBar"><\/div>').appendTo($browser);
					var $browserFrame;
					var $browserForm;
					var $browserUploadButton;
					var $browserUploadInput;
					var $browserParentButton;
					var $browserOrderType;
					var $browserLoadingIcon;
					var $browserList;
					if (settings.isUpload) {
						$browserFrame = $('<iframe id="' + browserFrameId + '" name="' + browserFrameId + '" style="display: none;"><\/iframe>').appendTo($browserBar);
						$browserForm = $('<form action="' + settings.uploadUrl + '" method="post" encType="multipart/form-data" target="' + browserFrameId + '" style="position: absolute;"><input type="hidden" name="token" value="' + token + '" \/><input type="hidden" name="fileType" value="' + settings.type + '" \/><\/form>').appendTo($browserBar);
						$browserUploadButton = $('<a href="javascript:;" class="browserUploadButton btn btn-outline btn-default btn-xs"><i class="fa fa-upload"></i> ' + message("admin.browser.upload") + '<\/a>').appendTo($browserForm);
						$browserUploadInput = $('<input type="file" name="file" \/>').appendTo($browserUploadButton);
					}
					$browserParentButton = $('<a href="javascript:;" class="btn btn-outline btn-default btn-xs" style="margin-left: 90px;"><i class="fa fa-mail-reply"></i> ' + message("admin.browser.parent") + '<\/a>').appendTo($browserBar);
					//$browserBar.append(message("admin.browser.orderType") + ": ");
					$browserOrderType = $('<select name="orderType" style="display:none;" class="browserOrderType"><option value="name">' + message("admin.browser.name") + '<\/option><option value="size">' + message("admin.browser.size") + '<\/option><option value="type">' + message("admin.browser.type") + '<\/option><\/select>').appendTo($browserBar);
					$browserLoadingIcon = $('<span class="loadingIcon" style="display: none;">&nbsp;<\/span>').appendTo($browserBar);
					$browserList = $('<div class="browserList"><\/div>').appendTo($browser);
	
					var $dialog = art.dialog({
					    title: settings.title,
					    content: $browser[0],
					    width: 470,
					    fixed: true,
					    padding: 0,
					    lock: true
					});
					
					browserList("/");
					
					function browserList(path) {
						var key = settings.type + "_" + path + "_" + $browserOrderType.val();
						if (cache[key] == null) {
							$.ajax({
								url: settings.browserUrl,
								type: "GET",
								data: {fileType: settings.type, orderType: $browserOrderType.val(), path: path},
								dataType: "json",
								cache: false,
								beforeSend: function() {
									$browserLoadingIcon.show();
								},
								success: function(data) {
									createBrowserList(path, data);
									cache[key] = data;
								},
								complete: function() {
									$browserLoadingIcon.hide();
								}
							});
						} else {
							createBrowserList(path, cache[key]);
						}
					}
					
					function createBrowserList(path, data) {
						var browserListHtml = "";
						$.each(data, function(i, fileInfo) {
							var iconUrl;
							var title;
							if (fileInfo.isDirectory) {
								iconUrl = framework.base + "/resources/img/folder_icon.png";
								title = fileInfo.name;
							} else if (new RegExp("^\\S.*\\.(jpg|jpeg|bmp|gif|png)$", "i").test(fileInfo.name)) {
								iconUrl = fileInfo.url;
								title = fileInfo.name + " (" + Math.ceil(fileInfo.size / 1024) + "KB, " + new Date(fileInfo.lastModified).toLocaleString() + ")";
							} else {
								iconUrl = framework.base + "/resources/img/file_icon.gif";
								title = fileInfo.name + " (" + Math.ceil(fileInfo.size / 1024) + "KB, " + new Date(fileInfo.lastModified).toLocaleString() + ")";
							}
							browserListHtml += '<div class="browserItem"><img src="' + iconUrl + '" title="' + title + '" url="' + fileInfo.url + '" isDirectory="' + fileInfo.isDirectory + '" \/><div>' + fileInfo.name + '<\/div><\/div>';
						});
						$browserList.html(browserListHtml);
						
						$browserList.find("img").bind("click", function() {
							var $this = $(this);
							var isDirectory = $this.attr("isDirectory");
							if (isDirectory == "true") {
								var name = $this.next().text();
								browserList(path + name + "/");
							} else {
								var url = $this.attr("url");
								if (settings.input != null) {
									settings.input.val(url);
								} else {
									$browserButton.prev(":text").val(url);
								}
								if (settings.callback != null && typeof settings.callback == "function") {
									settings.callback(url);
								}
								$dialog.close();
							}
						});
						
						if (path == "/") {
							$browserParentButton.unbind("click");
						} else {
							var parentPath = path.substr(0, path.replace(/\/$/, "").lastIndexOf("/") + 1);
							$browserParentButton.unbind("click").bind("click", function() {
								browserList(parentPath);
							});
						}
						$browserOrderType.unbind("change").bind("change", function() {
							browserList(path);
						});
					}
					
					$browserUploadInput.change(function() {
						var allowedUploadExtensions;
						if (settings.type == "flash") {
							allowedUploadExtensions = setting.uploadFlashExtension;
						} else if (settings.type == "media") {
							allowedUploadExtensions = setting.uploadMediaExtension;
						} else if (settings.type == "file") {
							allowedUploadExtensions = setting.uploadFileExtension;
						} else {
							allowedUploadExtensions = setting.uploadImageExtension;
						}
						if ($.trim(allowedUploadExtensions) == "" || !new RegExp("^\\S.*\\.(" + allowedUploadExtensions.replace(/,/g, "|") + ")$", "i").test($browserUploadInput.val())) {
							art.warn(message("admin.upload.typeInvalid"));
							return false;
						}
						$browserLoadingIcon.show();
						$browserForm.submit();
					});
					
					$browserFrame.load(function() {
						var text;
						var io = document.getElementById(browserFrameId);
						if(io.contentWindow) {
							text = io.contentWindow.document.body ? io.contentWindow.document.body.innerHTML : null;
						} else if(io.contentDocument) {
							text = io.contentDocument.document.body ? io.contentDocument.document.body.innerHTML : null;
						}
						if ($.trim(text) != "") {
							$browserLoadingIcon.hide();
							var data = $.parseJSON(text);
							if (data.url != null) {
								if (settings.input != null) {
									settings.input.val(data.url);
								} else {
									$browserButton.prev(":text").val(data.url);
								}
								if (settings.callback != null && typeof settings.callback == "function") {
									settings.callback(data.url);
								}
								cache = new Array();
								$dialog.close();
							} else {
								art.message(data);
							}
						}
					});
					
				});
			});
		}
	});

	// 令牌
	$(document).ajaxSend(function(event, request, settings) {
		if (!settings.crossDomain && settings.type != null && settings.type.toLowerCase() == "post") {
			var token = getCookie("token");
			if (token != null) {
				request.setRequestHeader("token", token);
			}
		}
	});
	
	$(document).ajaxComplete(function(event, request, settings) {
		var loginStatus = request.getResponseHeader("loginStatus");
		var tokenStatus = request.getResponseHeader("tokenStatus");
		
		if (loginStatus == "accessDenied") {
			art.warn("${message("admin.login.accessDenied")}");
			window.setTimeout(function() {
				window.location.reload(true);
			}, 1000);
		} else if (tokenStatus == "accessDenied") {
			var token = getCookie("token");
			if (token != null) {
				$.extend(settings, {
					global: false,
					headers: {token: token}
				});
				$.ajax(settings);
			}
		}

	});

})(jQuery);

//Loading
jQuery.loading = {
	init : function(content) {    
		$("body").append('<div id="p_one_loading"><div style="position: fixed;top: 0;right: 0;bottom: 0;left: 0;background-color: rgba(0,0,0,.4);z-index: 2147483647;"><div style="position: absolute;width: 150px;height: 105px;top: 0;right: 0;bottom: 0;left: 0;margin: auto;color: #fff;text-align: center;"><img src="data:image/svg+xml;base64,PCEtLSBCeSBTYW0gSGVyYmVydCAoQHNoZXJiKSwgZm9yIGV2ZXJ5b25lLiBNb3JlIEAgaHR0cDovL2dvby5nbC83QUp6YkwgLS0+Cjxzdmcgd2lkdGg9IjQ0IiBoZWlnaHQ9IjQ0IiB2aWV3Qm94PSIwIDAgNDQgNDQiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgc3Ryb2tlPSIjZmZmIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCIgc3Ryb2tlLXdpZHRoPSIyIj4KICAgICAgICA8Y2lyY2xlIGN4PSIyMiIgY3k9IjIyIiByPSIxIj4KICAgICAgICAgICAgPGFuaW1hdGUgYXR0cmlidXRlTmFtZT0iciIKICAgICAgICAgICAgICAgIGJlZ2luPSIwcyIgZHVyPSIxLjhzIgogICAgICAgICAgICAgICAgdmFsdWVzPSIxOyAyMCIKICAgICAgICAgICAgICAgIGNhbGNNb2RlPSJzcGxpbmUiCiAgICAgICAgICAgICAgICBrZXlUaW1lcz0iMDsgMSIKICAgICAgICAgICAgICAgIGtleVNwbGluZXM9IjAuMTY1LCAwLjg0LCAwLjQ0LCAxIgogICAgICAgICAgICAgICAgcmVwZWF0Q291bnQ9ImluZGVmaW5pdGUiIC8+CiAgICAgICAgICAgIDxhbmltYXRlIGF0dHJpYnV0ZU5hbWU9InN0cm9rZS1vcGFjaXR5IgogICAgICAgICAgICAgICAgYmVnaW49IjBzIiBkdXI9IjEuOHMiCiAgICAgICAgICAgICAgICB2YWx1ZXM9IjE7IDAiCiAgICAgICAgICAgICAgICBjYWxjTW9kZT0ic3BsaW5lIgogICAgICAgICAgICAgICAga2V5VGltZXM9IjA7IDEiCiAgICAgICAgICAgICAgICBrZXlTcGxpbmVzPSIwLjMsIDAuNjEsIDAuMzU1LCAxIgogICAgICAgICAgICAgICAgcmVwZWF0Q291bnQ9ImluZGVmaW5pdGUiIC8+CiAgICAgICAgPC9jaXJjbGU+CiAgICAgICAgPGNpcmNsZSBjeD0iMjIiIGN5PSIyMiIgcj0iMSI+CiAgICAgICAgICAgIDxhbmltYXRlIGF0dHJpYnV0ZU5hbWU9InIiCiAgICAgICAgICAgICAgICBiZWdpbj0iLTAuOXMiIGR1cj0iMS44cyIKICAgICAgICAgICAgICAgIHZhbHVlcz0iMTsgMjAiCiAgICAgICAgICAgICAgICBjYWxjTW9kZT0ic3BsaW5lIgogICAgICAgICAgICAgICAga2V5VGltZXM9IjA7IDEiCiAgICAgICAgICAgICAgICBrZXlTcGxpbmVzPSIwLjE2NSwgMC44NCwgMC40NCwgMSIKICAgICAgICAgICAgICAgIHJlcGVhdENvdW50PSJpbmRlZmluaXRlIiAvPgogICAgICAgICAgICA8YW5pbWF0ZSBhdHRyaWJ1dGVOYW1lPSJzdHJva2Utb3BhY2l0eSIKICAgICAgICAgICAgICAgIGJlZ2luPSItMC45cyIgZHVyPSIxLjhzIgogICAgICAgICAgICAgICAgdmFsdWVzPSIxOyAwIgogICAgICAgICAgICAgICAgY2FsY01vZGU9InNwbGluZSIKICAgICAgICAgICAgICAgIGtleVRpbWVzPSIwOyAxIgogICAgICAgICAgICAgICAga2V5U3BsaW5lcz0iMC4zLCAwLjYxLCAwLjM1NSwgMSIKICAgICAgICAgICAgICAgIHJlcGVhdENvdW50PSJpbmRlZmluaXRlIiAvPgogICAgICAgIDwvY2lyY2xlPgogICAgPC9nPgo8L3N2Zz4=" width="50" height="50">'+'<div>'+content+'</div>'+'</div></div></div>');  
	},
	close:function(){
		if($("#p_one_loading")[0]){
			$("#p_one_loading").remove();
		}
	}
}; 
// 令牌
$().ready(function() {
	
	$("form").submit(function() {
		var $this = $(this);
		if ($this.attr("method") != null && $this.attr("method").toLowerCase() == "post" && $this.find("input[name='token']").size() == 0) {
			var token = getCookie("token");
			if (token != null) {
				$this.append('<input type="hidden" name="token" value="' + token + '" \/>');
			}
		}
	});
	// 搜索
 	$(".loippi-search-button").click(function(){
 		//点击搜索按钮，将页码重置为第一页
 		if($("#pageNumber")[0]){
 			$("#pageNumber").val(1);
 		}
 		$("form").submit();
 	});
});

$().ready(function() {
	if($.validator != null) {
		$.extend($.validator.messages, {
		    required: message("admin.validate.required"),
			email: message("admin.validate.email"),
			url: message("admin.validate.url"),
			date: message("admin.validate.date"),
			dateISO: message("admin.validate.dateISO"),
			pointcard: message("admin.validate.pointcard"),
			number: message("admin.validate.number"),
			digits: message("admin.validate.digits"),
			minlength: $.validator.format(message("admin.validate.minlength")),
			maxlength: $.validator.format(message("admin.validate.maxlength")),
			rangelength: $.validator.format(message("admin.validate.rangelength")),
			min: $.validator.format(message("admin.validate.min")),
			max: $.validator.format(message("admin.validate.max")),
			range: $.validator.format(message("admin.validate.range")),
			accept: message("admin.validate.accept"),
			equalTo: message("admin.validate.equalTo"),
			remote: message("admin.validate.remote"),
			integer: message("admin.validate.integer"),
			positive: message("admin.validate.positive"),
			negative: message("admin.validate.negative"),
			decimal: message("admin.validate.decimal"),
			pattern: message("admin.validate.pattern"),
			extension: message("admin.validate.extension")
		});

		jQuery.validator.setDefaults({
			errorElement: 'span', //default input error message container
            errorClass: 'help-block help-block-error', // default input error message class
            focusInvalid: false, // do not focus the last invalid input
			ignore: ".ignore",
			ignoreTitle: true,
			errorPlacement: function (error, element) { // render error placement for each input type
                var icon = $(element).parent('.input-icon').children('i');
                icon.removeClass('fa-check').addClass("fa-warning");  
                icon.attr("data-original-title", error.text()).tooltip({'container': 'body'});
            },

            highlight: function (element) { // hightlight error inputs
                $(element).parent().parent().removeClass("has-success").addClass('has-error'); // set error class to the control group   
            },
            success: function (label, element) {
                var icon = $(element).parent('.input-icon').children('i');
                $(element).parent().parent().removeClass('has-error').addClass('has-success'); // set success class to the control group
                icon.removeClass("fa-warning").addClass("fa-check");
            },
			submitHandler: function(form) {
				$(form).find(":submit").prop("disabled", true);
				form.submit();
			}
		});
	}
});


$().ready(function(){
	if(!(typeof age === 'undefined')){
		toastr.options = {
		  "closeButton": false,
		  "debug": false,
		  "positionClass": "toast-top-center",
		  "onclick": null,
		  "showDuration": "1000",
		  "hideDuration": "1000",
		  "timeOut": "5000",
		  "extendedTimeOut": "1000",
		  "showEasing": "swing",
		  "hideEasing": "linear",
		  "showMethod": "fadeIn",
		  "hideMethod": "fadeOut"
		}
	}
	
	var $backButton = $("#backButton");
	// 返回上一页
	$backButton.click( function() {
		location.href = document.referrer;
		return false;
	});
});


// 编辑器
if(typeof(KindEditor) != "undefined") {
	var lang = framework.locale == "en_US" ? "en" : framework.locale; 
	KindEditor.ready(function(K) {
		editor = K.create("#editor", {
			height: "350px",
			items: [
				"source", "|", "undo", "redo", "|", "preview", "print", "template", "cut", "copy", "paste",
				"plainpaste", "wordpaste", "|", "justifyleft", "justifycenter", "justifyright",
				"justifyfull", "insertorderedlist", "insertunorderedlist", "indent", "outdent", "subscript",
				"superscript", "clearhtml", "quickformat", "selectall", "|", "fullscreen", "/",
				"formatblock", "fontname", "fontsize", "|", "forecolor", "hilitecolor", "bold",
				"italic", "underline", "strikethrough", "lineheight", "removeformat", "|", "image",
				"flash", "media", "insertfile", "table", "hr", "emoticons", "baidumap", "pagebreak",
				"anchor", "link", "unlink"
			],
			langType: lang,
			syncType: "form",
			filterMode: false,
			pagebreakHtml: '<hr class="pageBreak" \/>',
			allowFileManager: true,
			filePostName: "file",
			fileManagerJson: framework.base + "/admin/file/browser.jhtml",
			uploadJson: framework.base + "/admin/file/upload.jhtml",
			uploadImageExtension: setting.uploadImageExtension,
			uploadFlashExtension: setting.uploadFlashExtension,
			uploadMediaExtension: setting.uploadMediaExtension,
			uploadFileExtension: setting.uploadFileExtension,
			extraFileUploadParams: {
				token: getCookie("token")
			},
			afterChange: function() {
				this.sync();
			}
		});
	});
}
