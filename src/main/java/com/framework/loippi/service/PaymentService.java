package com.framework.loippi.service;

import com.framework.loippi.entity.Payment;

/**
 * SERVICE -Payment
 * 
 * @author Loippi Team
 * @version 1.0
 */
public interface PaymentService extends GenericService<Payment, Long> {
	
	
	/**
	 * 根据编号查找收款单
	 * 
	 * @param sn
	 *            编号(忽略大小写)
	 * @return 收款单，若不存在则返回null
	 */
	Payment findBySn(String sn);

	/**
	 * 支付处理
	 * 
	 * @param payment
	 *            收款单
	 */
	void handle(Payment payment);
}
