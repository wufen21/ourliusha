package com.framework.loippi.entity;

import java.math.BigDecimal;
import java.util.Date;

import com.framework.loippi.mybatis.eitity.GenericEntity;
import com.framework.loippi.mybatis.ext.annotation.Column;
import com.framework.loippi.mybatis.ext.annotation.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Entity - 交易流水
 * 
 * @author Loippi Team
 * @version 1.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "T_JW_PAYMENT")
public class Payment implements GenericEntity {
	private static final long serialVersionUID = 2241615731709456870L;
	
	
	/**
	 * 状态
	 */
	public enum Status {

		/** 等待支付 */
		wait{
			public String label(){
				return "等待支付";
			}
		},

		/** 支付成功 */
		success{
			public String label(){
				return "支付成功";
			}
		},

		/** 支付失败 */
		failure{
			public String label(){
				return "支付失败";
			}
		};
		public String label(){
			return this.label();
		}
	}


	/** ID */
	@Column(id = true, name = "ID", updatable = false)
	private Long id;

	/** 创建时间 */
	@Column(name = "CREATE_DATE")
	private Date createDate;
	
	/** 单号 */
	@Column(name = "SN")
	private String sn;
	
	/** 交易金额 */
	@Column(name = "AMOUNT")
	private BigDecimal amount;
	
	/**支付账户姓名 */
	@Column(name = "PAYEE")
	private String payee;
	
	/** 交易账号 */
	@Column(name = "ACCOUNT")
	private String account;
	
	/** 交易状态 */
	@Column(name = "STATUS")
	private int status;

	/** 创建时间 */
	@Column(name = "PAY_DATE")
	private Date payDate;

}
