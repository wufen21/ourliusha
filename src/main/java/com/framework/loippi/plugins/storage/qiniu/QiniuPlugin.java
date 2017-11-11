package com.framework.loippi.plugins.storage.qiniu;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Component;

import com.framework.loippi.entity.PluginConfig;
import com.framework.loippi.plugins.storage.StoragePlugin;
import com.framework.loippi.support.FileInfo;
import com.qiniu.common.QiniuException;
import com.qiniu.storage.BucketManager;
import com.qiniu.storage.UploadManager;
import com.qiniu.storage.model.FileListing;
import com.qiniu.util.Auth;

/**
 * Plugin - 阿里云存储
 * 
 * @author Loippi Team
 * @version 2.0
 */
@Component("qiniuPlugin")
public class QiniuPlugin extends StoragePlugin {

	@Override
	public String getName() {
		return "七牛云存储";
	}

	@Override
	public String getVersion() {
		return "2.0";
	}

	@Override
	public String getAuthor() {
		return "Loippi Team";
	}

	@Override
	public String getSiteUrl() {
		return "http://www.eccar.com.cn";
	}

	@Override
	public String getInstallUrl() {
		return "qiniu/install.jhtml";
	}

	@Override
	public String getUninstallUrl() {
		return "qiniu/uninstall.jhtml";
	}

	@Override
	public String getSettingUrl() {
		return "qiniu/setting.jhtml";
	}

	@Override
	public void upload(String path, File file, String contentType) {
		PluginConfig pluginConfig = getPluginConfig();
		if (pluginConfig != null) {
			String secretKey = pluginConfig.getAttribute("secretKey");
			String accessKey = pluginConfig.getAttribute("accessKey");
			String bucketName = pluginConfig.getAttribute("bucketName");
			InputStream inputStream = null;
			try {
				inputStream = new FileInputStream(file);
				UploadManager uploadManager = new UploadManager();
				Auth auth = Auth.create(accessKey, secretKey);
				try { 
					uploadManager.put(file, StringUtils.substringAfterLast(StringUtils.removeEnd(path, "/"), "/"), auth.uploadToken(bucketName));
				} catch (QiniuException e) {
					e.printStackTrace();
				} 
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				IOUtils.closeQuietly(inputStream);
			}
		}
	}

	@Override
	public String getUrl(String path) {
		PluginConfig pluginConfig = getPluginConfig();
		if (pluginConfig != null) {
			String urlPrefix = pluginConfig.getAttribute("urlPrefix");
			return urlPrefix  + "/" + path;
		}
		return null;
	}

	@Override
	public List<FileInfo> browser(String path) {
		List<FileInfo> fileInfos = new ArrayList<FileInfo>();
		PluginConfig pluginConfig = getPluginConfig();
		if (pluginConfig != null) {
			String secretKey = pluginConfig.getAttribute("secretKey");
			String accessKey = pluginConfig.getAttribute("accessKey");
			String bucketName = pluginConfig.getAttribute("bucketName");
			String urlPrefix = pluginConfig.getAttribute("urlPrefix");
			try {
				  Auth auth = Auth.create(accessKey, secretKey);
			    //实例化一个BucketManager对象
			    BucketManager bucketManager = new BucketManager(auth);
			    FileListing listing= bucketManager.listFiles(bucketName, urlPrefix, null, 0, null);
			    com.qiniu.storage.model.FileInfo[] qiniuInfos = listing.items;
				for (com.qiniu.storage.model.FileInfo info : qiniuInfos) {
					FileInfo fileInfo = new FileInfo();
					fileInfo.setName(info.key);
					fileInfo.setUrl(urlPrefix  + "/" + info.key);
					fileInfo.setIsDirectory(true);
					fileInfo.setSize(0L);
					fileInfos.add(fileInfo);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return fileInfos;
	}

}