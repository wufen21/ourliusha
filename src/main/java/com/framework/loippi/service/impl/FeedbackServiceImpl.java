package com.framework.loippi.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.framework.loippi.dao.FeedbackDao;
import com.framework.loippi.entity.Feedback;
import com.framework.loippi.service.FeedbackService;

/**
 * SERVICE -Feedback
 * 
 * @author Loippi Team
 * @version 1.0
 */
@Service
public class FeedbackServiceImpl extends GenericServiceImpl<Feedback, Long> implements FeedbackService {
	
	@Autowired
	private FeedbackDao feedbackDao;
	
	
	@Autowired
	public void setGenericDao() {
		super.setGenericDao(feedbackDao);
	}
}
