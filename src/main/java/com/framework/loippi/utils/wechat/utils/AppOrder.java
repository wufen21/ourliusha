package com.framework.loippi.utils.wechat.utils;



import java.math.BigDecimal;
import java.util.Date;


/**
 * app支付订单信息表
 */

public class AppOrder  {
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	private Long id;

	private String orderSessionId;
	/**
	 * 订单号
	 */
	
	private String orderCode;
	/**
	 * 订单状态 1 未付款  2 付款成功
	 */
	
	private Integer status;
	/**
	 * 支付信息
	 */

	private String content;
	/**
	 * 支付类型  1余额支付 2微信支付 3支付宝支付
	 */

	private Integer type;


	/**
	 * 实付金额
	 */
	
	private BigDecimal pay;
	
	/**
	 * 总金额
	 */

	private java.math.BigDecimal amount;
	


	/**
	 * 下单时间
	 */
	
	private Date orderTime;
	
	//用户id

	private Long userId;
	
	/**
	 *魔豆数
	 */
	
	private Integer bean;
	
	public Integer getBean() {
		return bean;
	}

	public void setBean(Integer bean) {
		this.bean = bean;
	}


	
	
	public Date getOrderTime() {
		return orderTime;
	}

	public void setOrderTime(Date orderTime) {
		this.orderTime = orderTime;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}
	
	public BigDecimal getPay() {
		return pay;
	}

	public void setPay(BigDecimal pay) {
		this.pay = pay;
	}
	
	public java.math.BigDecimal getAmount() {
		return amount;
	}

	public void setAmount(java.math.BigDecimal amount) {
		this.amount = amount;
	}


	
	
	public String getOrderSessionId() {
		return this.orderSessionId;
	}
	
	public void setOrderSessionId(String orderSessionId) {
		this.orderSessionId = orderSessionId;
	}
	public String getOrderCode() {
		return this.orderCode;
	}
	
	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}
	public Integer getStatus() {
		return this.status;
	}
	
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getContent() {
		return this.content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	public Integer getType() {
		return this.type;
	}
	
	public void setType(Integer type) {
		this.type = type;
	}
}
