package com.framework.loippi.utils;

import org.apache.log4j.Logger;

import cn.jpush.api.JPushClient;
import cn.jpush.api.common.APIConnectionException;
import cn.jpush.api.common.APIRequestException;
import cn.jpush.api.push.PushResult;
import cn.jpush.api.push.model.Message;
import cn.jpush.api.push.model.Options;
import cn.jpush.api.push.model.Platform;
import cn.jpush.api.push.model.PushPayload;
import cn.jpush.api.push.model.audience.Audience;
import cn.jpush.api.push.model.audience.AudienceTarget;
import cn.jpush.api.push.model.notification.AndroidNotification;
import cn.jpush.api.push.model.notification.IosNotification;
import cn.jpush.api.push.model.notification.Notification;
import cn.jpush.api.report.ReceivedsResult;
import net.sf.json.JSONObject;

/**
 * 极光推送
 */
public class JpushUtils {
	private static Logger log = Logger.getLogger(JpushUtils.class);
	public static String masterSecret = "0b2bdca405b29d5d9906d815";
	public static String appKey = "9c6a66fb85e399a7b78f545c";
	private static String packageName = "com.zijing.fitstar";
	private static JPushClient jpushClient = new JPushClient(masterSecret, appKey);
	public  static String PICKER_TAG = "plantboxTag";
	/**
	 * 推送到所有平台用户
	 * 
	 * @param content
	 * @return
	 */
	public static boolean push2all(String content) {
		
		PushPayload payload = PushPayload.alertAll(content);
		try {
			PushResult result = jpushClient.sendPush(payload);
			return result.isResultOK();
		} catch (APIConnectionException e) {
			log.info(e.getMessage());
		} catch (APIRequestException e) {
			log.info(e.getMessage());
		}
		return false;
	}
	
	
	public static String push2alias(String content,String alias) {
		JPushClient jpushClient = new JPushClient(masterSecret, appKey);
		
	//消息一小时，会清除
		PushPayload payload = PushPayload.newBuilder().setPlatform(Platform.all())
				.setAudience(Audience.alias(alias))
		
				.setOptions(Options.newBuilder().setTimeToLive(60*60).build())
				.setNotification(Notification.alert(content)).setMessage(Message.content(content)).build();
		try {
			PushResult result = jpushClient.sendPush(payload);
			if(result.getOriginalContent()!=null){
			    JSONObject jsonObj = JSONObject.fromObject(result.getOriginalContent()); 
				return jsonObj.getString("msg_id");
				}
			return result.getOriginalContent();
		} catch (APIConnectionException e) {
			log.info(e.getMessage());
		} catch (APIRequestException e) {
			log.info(e.getMessage());
		}
		return null;
	}
	
	/**
	 * 平台是 iOS，推送目标是 "tag1", "tag_all" 的交集，推送内容同时包括通知与消息 - 通知信息是 ALERT，角标数字为 5，通知声音为 "happy"，并且附加字段 from = "JPush"；消息内容是 MSG_CONTENT。通知是 APNs 推送通道的，消息是 JPush 应用内消息通道的。APNs 的推送环境是“生产”（如果不显式设置的话，Library 会默认指定为开发）
	 */
	 public static String push2alias_ios(String content,String alias,String extraKey,String extraValue,int count) {
			JPushClient jpushClient = new JPushClient(masterSecret, appKey);
			
	
			
			//消息一小时，会清除
				PushPayload payload = PushPayload.newBuilder()
				        .setPlatform(Platform.all())
						.setAudience(Audience.alias(alias))
						.setMessage(Message.newBuilder().setMsgContent(content).build())
						
						//生产 环境设置   .setOptions(Options.newBuilder().setApnsProduction(true).setTimeToLive(60*60).build())
						.setOptions(Options.newBuilder().setTimeToLive(60*60).build())
						.setNotification(Notification.newBuilder()
		                        .addPlatformNotification(IosNotification.newBuilder()
		                                .setAlert(content)
		                                .setBadge(count)
		                                .setSound("happy.caf")
		                                .addExtra(extraKey, extraValue)
		                                .build())
		                          .addPlatformNotification(AndroidNotification.newBuilder()
		                                .setAlert(content)
		                                .addExtra(extraKey, extraValue)
		                                .build())       
		                        .build())
		                    .build();
				       ;
				try {
					PushResult result = jpushClient.sendPush(payload);
					if(result.getOriginalContent()!=null){
					    JSONObject jsonObj = JSONObject.fromObject(result.getOriginalContent()); 
						return jsonObj.getString("msg_id");
						}
					return result.getOriginalContent();
				} catch (APIConnectionException e) {
					log.info(e.getMessage());
				} catch (APIRequestException e) {
					log.info(e.getMessage());
				}
				return null;
			
		
			
	    }
	
	
	/**
	 * 平台是 iOS，推送目标是 "tag1", "tag_all" 的交集，推送内容同时包括通知与消息 - 通知信息是 ALERT，角标数字为 5，通知声音为 "happy"，并且附加字段 from = "JPush"；消息内容是 MSG_CONTENT。通知是 APNs 推送通道的，消息是 JPush 应用内消息通道的。APNs 的推送环境是“生产”（如果不显式设置的话，Library 会默认指定为开发）
	 */
	 public static PushPayload buildPushObject_ios_tagAnd_alertWithExtrasAndMessage(String MSG_CONTENT,String ALERT) {
	        return PushPayload.newBuilder()
	                .setPlatform(Platform.ios())
	                .setAudience(Audience.tag_and("tag1", "tag_all"))
	                .setNotification(Notification.newBuilder()
	                        .addPlatformNotification(IosNotification.newBuilder()
	                                .setAlert(ALERT)
	                                .setBadge(5)
	                                .setSound("happy.caf")
	                                .addExtra("from", "JPush")
	                                .build())
	                        .build())
	                 .setMessage(Message.content(MSG_CONTENT))
	                 .setOptions(Options.newBuilder()
	                         .setApnsProduction(true)
	                         .build())
	                 .build();
	    }
	
	
	
	
	/**
	 * 极光推送 发送
	 * @param content
	 * @param tag
	 * @return msg_id
	 */
	public static String push2tag(String content,String tag) {
		JPushClient jpushClient = new JPushClient(masterSecret, appKey);
		PushPayload payload = PushPayload.newBuilder().setPlatform(Platform.all())
				 .setAudience(Audience.tag( tag))
				.setNotification(Notification.alert(content))
				.setMessage(Message.content(content)).build();
		try {
			PushResult result = jpushClient.sendPush(payload);
			if(result.getOriginalContent()!=null){
			    JSONObject jsonObj = JSONObject.fromObject(result.getOriginalContent()); 
				return jsonObj.getString("msg_id");
				}
			return result.getOriginalContent();
		} catch (APIConnectionException e) {
			log.info(e.getMessage());
		} catch (APIRequestException e) {
			log.info(e.getMessage());
		}
		return null;
	}
	
	
	/**
	 * 构建推送对象：所有平台，推送目标是别名为 "alias1"，通知内容为 ALERT
	 * @param ALERT
	 * @return
	 */
	public static PushPayload buildPushObject_all_alias_alert(String ALERT) {
        return PushPayload.newBuilder()
                .setPlatform(Platform.all())
                .setAudience(Audience.alias("alias1"))
                .setNotification(Notification.alert(ALERT))
                .build();
    }

	/**
	 * 构建推送对象：平台是 Android，目标是 tag 为 "tag1" 的设备，内容是 Android 通知 ALERT，并且标题为 TITLE。
	 */
	public static PushPayload buildPushObject_android_tag_alertWithTitle(String ALERT,String TITLE) {
        return PushPayload.newBuilder()
                .setPlatform(Platform.android())
                .setAudience(Audience.tag("tag1"))
                .setNotification(Notification.android(ALERT, TITLE, null))
                .build();
    }
	

	 
	 
	 /**
	  * 平台是 Andorid 与 iOS，推送目标是 （"tag1" 与 "tag2" 的并集）且（"alias1" 与 "alias2" 的并集），推送内容是 - 内容为 MSG_CONTENT 的消息，并且附加字段 from = JPush。
	  * @return
	  */
	 public static PushPayload buildPushObject_ios_audienceMore_messageWithExtras(String MSG_CONTENT) {
	        return PushPayload.newBuilder()
	                .setPlatform(Platform.android_ios())
	                .setAudience(Audience.newBuilder()
	                        .addAudienceTarget(AudienceTarget.tag("tag1", "tag2"))
	                        .addAudienceTarget(AudienceTarget.alias("alias1", "alias2"))
	                        .build())
	                .setMessage(Message.newBuilder()
	                        .setMsgContent(MSG_CONTENT)
	                        .addExtra("from", "JPush")
	                        .build())
	                .build();
	    }
	 
	 
	 public static void main(String[] args) {
		//push2all("有新订单啦");
	//	System.err.println(JpushUtils.push2tag("有新订单啦",JpushUtils.PICKER_TAG));
		 JpushUtils.push2alias_ios("ce", "3", "asdas", "asdas",1);

	}
}
