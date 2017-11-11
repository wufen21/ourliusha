package com.easemob.server.example.httpclient.apidemo;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.easemob.server.example.comm.Constants;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.JsonNodeFactory;
import com.fasterxml.jackson.databind.node.ObjectNode;

public class Huanxin {
	private static final Logger LOGGER = LoggerFactory.getLogger(EasemobMessages.class);
	private static final JsonNodeFactory factory = new JsonNodeFactory(false);
	public static String createHuanxinUser(String username,String nickname) {
    	/**
         * 注册IM用户[单个]
         */
        ObjectNode datanode = JsonNodeFactory.instance.objectNode();
        datanode.put("nickname",nickname);
        datanode.put("username",username);
        datanode.put("password", Constants.DEFAULT_PASSWORD);
        ObjectNode createNewIMUserSingleNode = EasemobIMUsers.createNewIMUserSingle(datanode);
        ObjectMapper mapper = new ObjectMapper();  
        
        if (null != createNewIMUserSingleNode) {
        	  //将json字符串转换为json对象  
        	    JSONObject obj = new JSONObject().fromObject(  createNewIMUserSingleNode.toString());
        	    JSONArray  entities=obj.getJSONArray("entities");      	    
        	    for (int i = 0; i < entities.size(); i++) {
        	        JSONObject jo = (JSONObject) entities.get(i);
        	        return jo.get("uuid").toString();
        	   }
        }
		return null;
	}
	
	
	public static String updateHuanxinNickName(String userName,String nickName) {
    	/**
         * 修改用户昵称
         */
        ObjectNode datanode = JsonNodeFactory.instance.objectNode();
		 datanode.put("nickname",nickName);
        ObjectNode createNewIMUserSingleNode =  EasemobIMUsers.modifyIMUserNameWithAdminToken(userName,datanode);
	        ObjectMapper mapper = new ObjectMapper();  
	        if (null != createNewIMUserSingleNode) {
	        	   JSONObject obj = new JSONObject().fromObject( createNewIMUserSingleNode.toString());//将json字符串转换为json对象  
	          return "OK";
	      }
	    return null;
	}
	
	public static void sentMessageHuanxinNickName(String fromNickName,String targetUserName,String content) {
		JsonNodeFactory factory = new JsonNodeFactory(false);
		    String from =fromNickName;
	        String targetTypeus = "users";
	        ObjectNode ext = factory.objectNode();
	        ArrayNode targetusers = factory.arrayNode();
	        targetusers.add(targetUserName);
	     
	        ObjectNode txtmsg = factory.objectNode();
	        txtmsg.put("msg", content);
	        txtmsg.put("type","txt");
	        ObjectNode sendTxtMessageusernode =EasemobMessages. sendMessages(targetTypeus, targetusers, txtmsg, from, ext);
	        if (null != sendTxtMessageusernode) {
	            LOGGER.info("给用户发一条文本消息: " + sendTxtMessageusernode.toString());
	        }
	}
    
	/**
	 * 加入黑名单
	 * @param fromNickName
	 * @param targetUserName
	 */
	public static void blocksFriendSingle(String fromNickName,String targetUserName) {
	
        ObjectNode dataObjectNode = JsonNodeFactory.instance.objectNode();
    	ArrayNode arrayNode = factory.arrayNode();
        arrayNode.add(targetUserName);
   
        dataObjectNode.put("usernames", arrayNode);
		 
        ObjectNode blocksFriendSingle =  EasemobIMUsers.blocksFriendSingle(fromNickName, dataObjectNode);
	        ObjectMapper mapper = new ObjectMapper();  
	        if (null != blocksFriendSingle) {
	        	   JSONObject obj = new JSONObject().fromObject( blocksFriendSingle.toString());//将json字符串转换为json对象  
	        System.err.println(obj);
	      }
	 
	}
	
	/**
	 * 删除黑名单
	 * @param fromNickName
	 * @param targetUserName
	 */
	public static void delBlocksFriendSingle(String fromNickName,String targetUserName) {
	
        ObjectNode dataObjectNode = JsonNodeFactory.instance.objectNode();

        ObjectNode delBlocksFriendSingle =  EasemobIMUsers.delBlocksFriendSingle(fromNickName,targetUserName, dataObjectNode);
	        ObjectMapper mapper = new ObjectMapper();  
	        if (null != delBlocksFriendSingle) {
	        	   JSONObject obj = new JSONObject().fromObject( delBlocksFriendSingle.toString());//将json字符串转换为json对象  
	        System.err.println(obj);
	      }
	 
	}
	
	
	/**
	 * 黑名单列表
	 * @param fromNickName
	 * @param targetUserName
	 */
	public static void getBlockedFriends(String fromNickName) {
	
        ObjectNode dataObjectNode = JsonNodeFactory.instance.objectNode();

        ObjectNode delBlocksFriendSingle =  EasemobIMUsers.getBlockedFriends(fromNickName, dataObjectNode);
	        ObjectMapper mapper = new ObjectMapper();  
	        if (null != delBlocksFriendSingle) {
	        	   JSONObject obj = new JSONObject().fromObject( delBlocksFriendSingle.toString());//将json字符串转换为json对象  
	        System.err.println(obj);
	      }
	 
	}
	
	/**
	 * 账号解禁
	 * @param fromNickName
	 * @param targetUserName
	 */
	public static void activate(String fromNickName) {
	
        ObjectNode dataObjectNode = JsonNodeFactory.instance.objectNode();

        ObjectNode delBlocksFriendSingle =  EasemobIMUsers.activate(fromNickName, dataObjectNode);
	        ObjectMapper mapper = new ObjectMapper();  
	        if (null != delBlocksFriendSingle) {
	        	   JSONObject obj = new JSONObject().fromObject( delBlocksFriendSingle.toString());//将json字符串转换为json对象  
	        System.err.println(obj);
	      }
	 
	}
	
	/**
	 * 账号禁用
	 * @param fromNickName
	 * @param targetUserName
	 */
	public static void deactivate(String fromNickName) {
	
        ObjectNode dataObjectNode = JsonNodeFactory.instance.objectNode();

        ObjectNode delBlocksFriendSingle =  EasemobIMUsers.deactivate(fromNickName, dataObjectNode);
	        ObjectMapper mapper = new ObjectMapper();  
	        if (null != delBlocksFriendSingle) {
	        	   JSONObject obj = new JSONObject().fromObject( delBlocksFriendSingle.toString());//将json字符串转换为json对象  
	        System.err.println(obj);
	      }
	 
	}
	
	public static void main(String[] args) {
		Huanxin.blocksFriendSingle("589b0498510d1c55d640f3a3a304f2f6", "d7180e5c592f06746f705309b5e19bc9");

		Huanxin.getBlockedFriends("589b0498510d1c55d640f3a3a304f2f6");
	}
}
