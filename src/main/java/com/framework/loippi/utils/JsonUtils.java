package com.framework.loippi.utils;

import java.io.IOException;
import java.io.Writer;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONNull;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;
import net.sf.json.util.JSONUtils;

import org.springframework.util.Assert;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * Utils - JSON
 * 
 * @author Mounate Yan。
 * @version 1.0 
 */
public final class JsonUtils {

	/** ObjectMapper */
	private static ObjectMapper mapper = new ObjectMapper();

	/**
	 * 不可实例化
	 */
	private JsonUtils() {
	}

	/**
	 * 将对象转换为JSON字符串
	 * 
	 * @param value
	 *            对象
	 * @return JSOn字符串
	 */
	public static String toJson(Object value) {
		try {
			return mapper.writeValueAsString(value);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 将JSON字符串转换为对象
	 * 
	 * @param json
	 *            JSON字符串
	 * @param valueType
	 *            对象类型
	 * @return 对象
	 */
	public static <T> T toObject(String json, Class<T> valueType) {
		Assert.hasText(json);
		Assert.notNull(valueType);
		try {
			return mapper.readValue(json, valueType);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 将JSON字符串转换为对象
	 * 
	 * @param json
	 *            JSON字符串
	 * @param typeReference
	 *            对象类型
	 * @return 对象
	 */
	public static <T> T toObject(String json, TypeReference<?> typeReference) {
		Assert.hasText(json);
		Assert.notNull(typeReference);
		try {
			return mapper.readValue(json, typeReference);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 将JSON字符串转换为对象
	 * 
	 * @param json
	 *            JSON字符串
	 * @param javaType
	 *            对象类型
	 * @return 对象
	 */
	public static <T> T toObject(String json, JavaType javaType) {
		Assert.hasText(json);
		Assert.notNull(javaType);
		try {
			return mapper.readValue(json, javaType);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 将对象转换为JSON流
	 * 
	 * @param writer
	 *            writer
	 * @param value
	 *            对象
	 */
	public static void writeValue(Writer writer, Object value) {
		try {
			mapper.writeValue(writer, value);
		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	
	   
    /**   
     * 从一个JSON 对象字符格式中得到一个java对象   
     *    
     * @param jsonString   
     * @param pojoCalss   
     * @return   
     */    
    public   static  Object getObject4JsonString(String jsonString, Class<?> pojoCalss) {   
        JSONObject jsonObject = JSONObject.fromObject(jsonString);   
        Object pojo = JSONObject.toBean(jsonObject, pojoCalss);   
        return  pojo;   
    }   
    /**   
     * 从一个JSON 对象字符格式中得到一个java对象   
     *    
     * @param jsonString   
     * @param pojoCalss   
     * @return   
     */    
    @SuppressWarnings("unchecked")
	public   static  Object getObject4JsonString(String jsonString, Class<?> pojoCalss,Map<String ,Class> classMap) {   
        JSONObject jsonObject = JSONObject.fromObject(jsonString);   
        Object pojo = JSONObject.toBean(jsonObject, pojoCalss, classMap) ;
        return  pojo;   
    }   
   
    /**   
     * 从json HASH表达式中获取一个map，改map支持嵌套功能   
     *    
     * @param jsonString   
     * @return   
     */    
    @SuppressWarnings("unchecked")
	public   static  Map getMap4Json(String jsonString) {   
        JSONObject jsonObject = JSONObject.fromObject(jsonString);   
        Iterator keyIter = jsonObject.keys();   
        Map valueMap = new  HashMap();   
        while  (keyIter.hasNext()) {   
        	String key = (String) keyIter.next();   
        	Object value = jsonObject.get(key);   
            valueMap.put(key, value);   
        }   
        return  valueMap;   
    }   
   
   
   
    /**   
     * 从json对象集合表达式中得到一个java对象列表   
     *    
     * @param jsonString   
     * @param pojoClass   
     * @return   
     */    
    @SuppressWarnings("unchecked")
	public   static  List<?> getList4Json(String jsonString, Class<?> pojoClass) {   
        JSONArray jsonArray = JSONArray.fromObject(jsonString);   
        List list = new  ArrayList();   
        for  ( int  i =  0 ; i < jsonArray.size(); i++) {   
        	JSONObject jsonObject = jsonArray.getJSONObject(i);   
            Object pojoValue = JSONObject.toBean(jsonObject, pojoClass);   
            list.add(pojoValue);   
        }   
        return  list;   
   
    }   
   
    /**   
     * 从json数组中得到相应java数组   
     *    
     * @param jsonString   
     * @return   
     */    
    public   static  Object[] getObjectArray4Json(String jsonString) {   
        JSONArray jsonArray = JSONArray.fromObject(jsonString);   
        return  jsonArray.toArray();   
   
    }   
   
   
    /**   
     * 从json数组中解析出java字符串数组   
     *    
     * @param jsonString   
     * @return   
     */    
    public   static  String[] getStringArray4Json(String jsonString) {   
        JSONArray jsonArray = JSONArray.fromObject(jsonString);   
        String[] stringArray = new  String[jsonArray.size()];   
        for  ( int  i =  0 ; i < jsonArray.size(); i++) {   
            stringArray[i] = jsonArray.getString(i);   
        }   
        return  stringArray;   
    }   
   
   
    /**   
     * 从json数组中解析出javaLong型对象数组   
     *    
     * @param jsonString   
     * @return   
     */    
    public   static  Long[] getLongArray4Json(String jsonString) {   
        JSONArray jsonArray = JSONArray.fromObject(jsonString);   
        Long[] longArray = new  Long[jsonArray.size()];   
        for  ( int  i =  0 ; i < jsonArray.size(); i++) {   
            longArray[i] = jsonArray.getLong(i);   
        }   
        return  longArray;   
    }   
   
   
    /**   
     * 从json数组中解析出java Integer型对象数组   
     *    
     * @param jsonString   
     * @return   
     */    
    public   static  Integer[] getIntegerArray4Json(String jsonString) {   
        JSONArray jsonArray = JSONArray.fromObject(jsonString);   
        Integer[] integerArray = new  Integer[jsonArray.size()];   
        for  ( int  i =  0 ; i < jsonArray.size(); i++) {   
            integerArray[i] = jsonArray.getInt(i);   
        }   
        return  integerArray;   
    }   
   
    /**   
     * 将java对象转换成json字符串   
     * @param javaObj   
     * @return   
     */    
    public   static  String getJsonString4JavaPOJO(Object javaObj) {   
        JSONObject json = JSONObject.fromObject(javaObj);   
        return  json.toString();   
    }   
    
    /**   
     * 将java对象转换成json字符串   
     * @param javaObj   
     * @return   
     */    
    public   static  String getJsonString4JavaArrayPOJO(Object javaObj) {   
    	JSONArray jsonArray = JSONArray.fromObject(javaObj);   
        return  jsonArray.toString();   
    }   
   
    /**   
     * 将java对象转换成json字符串,并设定日期格式   
     * @param javaObj   
     * @param dataFormat   
     * @return   
     */    
    public   static  String getJsonString4JavaPOJO(Object javaObj,   
            String dataFormat) {   
        JsonConfig jsonConfig = configJson(dataFormat);   
        JSONObject json = JSONObject.fromObject(javaObj, jsonConfig);   
        return  json.toString();   
    }   
    
    /**
     * 将java对象转换成json字符,并设定日期格式  、除去不想生成的字段
     * @param javaObj
     * @param excludes  除去不想生成的字段（特别适合去掉级联的对象）
     * @param dataFormat
     * @return
     */
    public   static  String getJsonString4JavaPOJO(Object javaObj,   
    		String[] excludes, String dataFormat) {   
        JsonConfig jsonConfig = configJson(excludes,dataFormat);   
        JSONObject json = JSONObject.fromObject(javaObj, jsonConfig);   
        return  json.toString();   
    }   
    
    
    
    
    
    /**   
     * JSON 时间解析器具   
     * @param datePattern   
     * @return   
     */    
    public   static  JsonConfig configJson(String datePattern) {   
        JsonConfig jsonConfig = new  JsonConfig();   
        jsonConfig.setExcludes(new  String[] {  ""  });   
        jsonConfig.setIgnoreDefaultExcludes(false );   
        jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);   
        return  jsonConfig;   
    }   
   
   
    /**   
     * 除去不想生成的字段（特别适合去掉级联的对象）+时间转换   
     * @param excludes 除去不想生成的字段   
     * @param datePattern   
     * @return   
     */    
    public   static  JsonConfig configJson(String[] excludes, String datePattern) {   
        JsonConfig jsonConfig = new  JsonConfig();   
        jsonConfig.setExcludes(excludes);   
        jsonConfig.setIgnoreDefaultExcludes(true );   
        jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);   
        return  jsonConfig;   
    }   
   
    
    
	@SuppressWarnings("unchecked")
	public static String Object2String(Object javaObj) {
		JSONObject object = JSONObject.fromObject(javaObj);   
		if (object.isNullObject()) {
			return JSONNull.getInstance().toString();
		}
		try {
			Iterator keys = object.keys();
			StringBuffer sb = new StringBuffer("{");

			while (keys.hasNext()) {
				if (sb.length() > 1) {
					sb.append(',');
				}
				Object o = keys.next();
				if(JSONUtils.valueToString(object.get(o))!=null&&JSONUtils.valueToString(object.get(o))!=""){
					sb.append(JSONUtils.quote(o.toString()));
					sb.append(':');
					sb.append(GSONUtils.valueToString(object.get(o)));
				}
			}
			sb.append('}');
			return sb.toString();
		} catch (Exception e) {
			return null;
		}
	}

}