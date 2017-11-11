package com.framework.loippi.utils;

import java.util.Map;


public class JpushRunnable extends Thread {

	private String message;
	private String id;
	private String extraKey;
	private String extraValue;
	private int  count;
    public JpushRunnable(String  message,String id) {
        this.message = message;
        this.id = id;
      
    } 
    
    
    public JpushRunnable(String  message,String id,String extraKey,String extraValue) {

        this.message = message;
        this.id = id;
        this.count = count;
        this.extraKey = extraKey;
        this.extraValue = extraValue;
    } 
    public JpushRunnable(String  message,String id,String extraKey,String extraValue,Map map) {

        this.message = message;
        this.id = id;
        this.count = count;
        this.extraKey = extraKey;
        this.extraValue = extraValue;
    } 


    @Override
	public void run() {
    			//极光推送信息
    	         if(StringUtil.isEmpty(extraKey)){
        		String msgId=  JpushUtils.push2alias(message,id+"");
        		System.err.println("JpushRunnable==push2alias msgId:"+msgId+"  message="+message+"  id="+id+"  extraKey="
	     				+extraKey+"  extraValue="+extraValue);
    	         }else{
    	        	// int count=getMesCount(id);
    	        	 String msgId=  JpushUtils.push2alias_ios(message, id+"", extraKey, extraValue,0);
    	     		System.err.println("JpushRunnable==push2alias_ios msgId:"+msgId+"  message="+message+"  id="+id+"  extraKey="
    	     				+extraKey+"  extraValue="+extraValue);
    	         }
        
		
    } 
    
  
}

