package com.framework.loippi.job;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.core.task.TaskExecutor;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.framework.loippi.utils.JpushRunnable;
import com.framework.loippi.utils.Paramap;
import com.framework.loippi.utils.StringUtil;
import com.framework.loippi.utils.redis.JedisCache;
import com.framework.loippi.utils.redis.JedisHashCache;

//更新音乐人直播在线标识
@Component("UpdateCatchIngJob")
@Lazy(false)
public class UpdateCatchIngJob{
//<cron-expression>0 0/30 * * * ?</cron-expression>:每隔30分钟 
//<cron-expression>0 0/15 * * * ?</cron-expression>每隔15分钟 
//<cron-expression>0 0 0/1 * * ?</cron-expression>每隔1个小时 
	
	@Resource
	private JedisCache jedisCache;
	private Logger log = LoggerFactory.getLogger(UpdateCatchIngJob.class);

	@Scheduled(cron = "*/3 * * * * ?")  
	public void build() {
		  log.info("每3秒执行一次，查看音乐人直播在线标识!");
		  
	}
	

} 

