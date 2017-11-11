package com.framework.loippi.utils;

import java.awt.Button;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class GSONUtils {
	@SuppressWarnings("unchecked")
	public static Object serialize(String jsonString, Class object){
		Gson gson = new Gson();
		return gson.fromJson(jsonString, object);
	}
	
	@SuppressWarnings("unchecked")
	public static String deserialize(String jsonString, Class beanclass){
		GsonBuilder gsonb = new GsonBuilder();
		gsonb.setDateFormat("yyyy-MM-dd HH:mm:ss");
		Gson gson = gsonb.create();
		return (String) gson.fromJson(jsonString, beanclass);
	}
	public static String valueToString(Object obj) {
		Gson gson = new Gson();
		return gson.toJson(obj);  
	}
	
	public static void main(String[] args) {
		Button button = new Button();
		button.setName("ss");
		System.out.println(GSONUtils.valueToString(button));
	}
	
}
