package com.framework.loippi.utils;

import java.io.Serializable;

import org.slf4j.LoggerFactory;

/**
 * 日志公共类
 * 使用公共类,可以在记录日志的同时监听一些指定的异常,并做出对应的处理
 * 
 */
public class MyLogs implements Serializable{

	private static final long serialVersionUID = 3712607993638244986L;
	
	/**
	 * log的info
	 * @param clazz
	 * @param obj
	 */
	public static void info(Class<?> clazz, String obj){
		
		LoggerFactory.getLogger(clazz).info(obj);
	}
	
	/**
	 * log的info
	 * @param clazz
	 * @param obj
	 * @param e
	 */
	public static void info(Class<?> clazz, String obj, Throwable e){
		
		LoggerFactory.getLogger(clazz).info(obj, e);
	}
	
	/**
	 * log的debug
	 * @param clazz
	 * @param obj
	 */
	public static void debug(Class<?> clazz, String obj){
		
		LoggerFactory.getLogger(clazz).debug(obj);
	}
	
	/**
	 * log的debug
	 * @param clazz
	 * @param obj
	 * @param e
	 */
	public static void debug(Class<?> clazz, String obj, Throwable e){
		
		LoggerFactory.getLogger(clazz).debug(obj, e);
	}
	
	/**
	 * log的warn
	 * @param clazz
	 * @param obj
	 */
	public static void warn(Class<?> clazz, String obj){
		
		LoggerFactory.getLogger(clazz).warn(obj);
	}
	
	/**
	 * log的warn
	 * @param clazz
	 * @param obj
	 * @param e
	 */
	public static void warn(Class<?> clazz, String obj, Throwable e){
		
		LoggerFactory.getLogger(clazz).warn(obj, e);
	}
	
	/**
	 * log的error
	 * @param clazz
	 * @param obj
	 */
	public static void error(Class<?> clazz, String obj){
		
		LoggerFactory.getLogger(clazz).error(obj);
	}
	
	/**
	 * log的error
	 * @param clazz
	 * @param obj
	 * @param e
	 */
	public static void error(Class<?> clazz, String obj, Throwable e){
		
		LoggerFactory.getLogger(clazz).error(obj, e);
	}

}
