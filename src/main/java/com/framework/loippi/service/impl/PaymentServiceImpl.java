package com.framework.loippi.service.impl;

import java.util.Date;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.framework.loippi.dao.PaymentDao;
import com.framework.loippi.entity.Payment;
import com.framework.loippi.entity.Payment.Status;
import com.framework.loippi.service.PaymentService;
import com.framework.loippi.utils.Paramap;

/**
 * SERVICE -Payment
 * 
 * @author Loippi Team
 * @version 1.0
 */
@Service("paymentServiceImpl")
public class PaymentServiceImpl extends GenericServiceImpl<Payment, Long>implements PaymentService {

	@Autowired
	private PaymentDao paymentDao;

	@Autowired
	public void setGenericDao() {
		super.setGenericDao(paymentDao);
	}

	@Transactional(readOnly = true)
	public Payment findBySn(String sn) {
		List<Payment> payments = paymentDao.findByParams(Paramap.create().put("sn", sn));
		if (CollectionUtils.isNotEmpty(payments)) {
			return payments.get(0);
		}
		return null;
	}

	public void handle(Payment payment) {
		if (payment != null && payment.getStatus() == Status.wait.ordinal()) {
			payment.setStatus(Status.success.ordinal());
			payment.setPayDate(new Date());
			paymentDao.update(payment);
		}
	}
}
