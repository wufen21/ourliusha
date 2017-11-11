package com.framework.loippi.utils.qiniu;


import java.util.UUID;
import java.io.File;
import java.io.IOException;

import javax.annotation.Resource;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.core.task.TaskExecutor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.qiniu.common.QiniuException;
import com.qiniu.http.Response;
import com.qiniu.storage.UploadManager;
import com.qiniu.util.Auth;

@Service("qiniuFileServiceImpl")
public class FileServiceImpl implements FileService {
	
	private Logger log = Logger.getLogger(getClass());
	public static final String uploadImageExtension = "jpg,jpeg,bmp,gif,png";
	public static final String uploadFlashExtension = "swf,flv";
	public static final String uploadMediaExtension = "swf,flv,mp3,wav,avi,rm,rmvb";
	public static final String uploadFileExtension = "zip,rar,7z,doc,docx,xls,xlsx,ppt,pptx";
	/** 分隔符 */
	private static final String SEPARATOR = ",";
	
	public static final String QINIU_TOKEN = "fitxr";
	
	public static final String QINIU_AK = "TxUm56J2VJYH7yaITkAmTyUsFBgPdWMUo77ITz9R";
	
	public static final String QINIU_SK = "LnuGi34q91XP7GYo6kOQMqpYNFDrNAVWZIT9coiW";
	
	public static final String QINIU_PREFIX = "http://7xnsrj.com1.z0.glb.clouddn.com/";
	/**
	 * 文件类型
	 */
	public enum FileType {

		/** 图片 */
		image,

		/** Flash */
		flash,

		/** 媒体 */
		media,

		/** 文件 */
		file
	}
	

	@Resource(name = "taskExecutor")
	private TaskExecutor taskExecutor;	
	
	UploadManager uploadManager = new UploadManager();
    Auth auth = Auth.create(QINIU_AK, QINIU_SK);
    
//    String token = auth.uploadToken(QINIU_TOKEN);
	


	@Override
	public String upload(MultipartFile multipartFile, boolean async) {
		try {
			 String filename = UUID.randomUUID().toString().concat("."+FilenameUtils.getExtension(multipartFile.getOriginalFilename()));
			if(async){
				addTask(multipartFile,filename);
			}else{
				uploadManager.put(multipartFile.getBytes(), filename , auth.uploadToken(QINIU_TOKEN));
			}
		    return QINIU_PREFIX.concat(filename);
		} catch (QiniuException e) {
			 Response r = e.response;
		        // 请求失败时简单状态信息
		        log.error(r.toString());
		        try {
		            // 响应的文本信息
		            log.error(r.bodyString());
		        } catch (QiniuException e1) {
		            //ignore
		        }
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	
	/**
	 * 添加上传任务
	 * 
	 * @param storagePlugin
	 *            存储插件
	 * @param path
	 *            上传路径
	 * @param tempFile
	 *            临时文件
	 * @param contentType
	 *            文件类型
	 */
	private void addTask(final MultipartFile multipartFile,final String filename) {
		taskExecutor.execute(new Runnable() {
			public void run() {
				try {
					 uploadManager.put(multipartFile.getBytes(), filename , auth.uploadToken(QINIU_TOKEN));
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	
	/**
	 * 获取允许上传图片扩展名
	 * 
	 * @return 允许上传图片扩展名
	 */
	public String[] getUploadImageExtensions() {
		return StringUtils.split(uploadImageExtension, SEPARATOR);
	}

	/**
	 * 获取允许上传Flash扩展名
	 * 
	 * @return 允许上传Flash扩展名
	 */
	public String[] getUploadFlashExtensions() {
		return StringUtils.split(uploadFlashExtension, SEPARATOR);
	}

	/**
	 * 获取允许上传媒体扩展名
	 * 
	 * @return 允许上传媒体扩展名
	 */
	public String[] getUploadMediaExtensions() {
		return StringUtils.split(uploadMediaExtension, SEPARATOR);
	}

	/**
	 * 获取允许上传文件扩展名
	 * 
	 * @return 允许上传文件扩展名
	 */
	public String[] getUploadFileExtensions() {
		return StringUtils.split(uploadFileExtension, SEPARATOR);
	}
	
	public static final String getToken(){
		
		UploadManager uploadManager = new UploadManager();
	    Auth auth = Auth.create(QINIU_AK, QINIU_SK);
	    String token = auth.uploadToken(QINIU_TOKEN);
	    return token;
	}
	
public static void main(String[] args) throws QiniuException {
	}
}
