package com.framework.loippi.entity;

import java.util.Date;

import com.framework.loippi.mybatis.eitity.GenericEntity;
import com.framework.loippi.mybatis.ext.annotation.Column;
import com.framework.loippi.mybatis.ext.annotation.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Entity - 应用版本
 * 
 * @author Loippi Team
 * @version 1.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "T_JW_APP")
public class App implements GenericEntity {

	private static final long serialVersionUID = -1828187541642897081L;

	/** ID */
	@Column(id = true, name = "ID", updatable = false)
	private Long id;

	/** 创建时间 */
	@Column(name = "CREATE_DATE")
	private Date createDate;

	/** 更新日期 */
	@Column(name = "UPDATE_DATE")
	private Date updateDate;

	/** 设备：IOS 0 Android 1 */
	@Column(name = "DEVICE")
	private int device;

	/** 版本号 */
	@Column(name = "VERSION")
	private String version;

	/** 内容 */
	@Column(name = "CONTENT")
	private String content;

	/** 地址 */
	@Column(name = "URL")
	private String url;

	/** 更新者 */
	@Column(name = "UPDATOR")
	private Long updator;
	
	/** 更新者 */
	@Column(name = "IS_FORCE")
	private boolean isForce = false;
	
	
	/**APP设备类型*/
	public enum Device{
		IOS {
			public String label(){
				return "IOS";
			}
		},
		ANDROID{
			public String label(){
				return "Android";
			}
		};
		public String label(){
			return  this.label();
		}
	}

}
