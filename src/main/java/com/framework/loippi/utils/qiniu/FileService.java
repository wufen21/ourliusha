package com.framework.loippi.utils.qiniu;
import org.springframework.web.multipart.MultipartFile;



public interface FileService {


	/**
	 * 文件上传
	 * 
	 * @param fileType
	 *            文件类型
	 * @param multipartFile
	 *            上传文件
	 * @param async
	 *            是否异步
	 * @return 访问URL
	 */
	String upload(MultipartFile multipartFile, boolean async);
}
