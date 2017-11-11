package com.framework.loippi.utils.redis;


import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;
import redis.clients.jedis.exceptions.JedisException;




public class JedisStringCache extends JedisCache  {
	
	private String key;
	private int seconds=60*60*24*30;//30天
	
	public JedisStringCache( JedisPool pool, String key ){
		super( pool );
		this.key = key;
	}
	
    public long set(String value,int seconds ) {
    	return set( value,  seconds, false );
    }
    
    public long set(String value ) {
    	return set( value,  seconds, false );
    }

    /**
     * 
     * @param key
     * @param value
     * @param forceNewNotExist
     * @return 1-设置成功 ;0-值已存在
     */
    public long set(String value,int seconds , boolean forceNewNotExist) {
        Jedis jedis = null;
        try {
        	jedis = pool.getResource();
        	if( forceNewNotExist )
        		return jedis.setnx( key , value);
            jedis.set( key , value);
            if( seconds < 0){
        		return jedis.persist( key );
            }
            jedis.expire( key, seconds );
            return 1L;
        } catch (Exception e) {
            e.printStackTrace();
        	pool.returnBrokenResource(jedis);
         	throw new JedisException(e.getMessage());
        } finally {
            pool.returnResource(jedis);
        }
    }
    
    public String get(){
    	Jedis jedis = null;
    	try {
        	jedis = pool.getResource();
            return jedis.get(key);
        } catch (Exception e) {
            e.printStackTrace();
        	pool.returnBrokenResource(jedis);
         	throw new JedisException(e.getMessage());
        } finally {
            pool.returnResource(jedis);
        }
    }
    


    public long incr(String key, long value) {
        Jedis jedis = null;
        try {
        	jedis = pool.getResource();
    		return jedis.incrBy(key, value);
        } catch (Exception e) {
            e.printStackTrace();
        	pool.returnBrokenResource(jedis);
         	throw new JedisException(e.getMessage());
        } finally {
            pool.returnResource(jedis);
        }
    }
    
    
    public long remove(String key) {
        Jedis jedis = (Jedis)pool.getResource();
        try
        {
            long delResult = jedis.del(new String[] { key });
            return delResult;
        } catch(Exception e) {
            e.printStackTrace();
            pool.returnResource(jedis);
            throw new JedisException(e.getMessage());
        }finally{
        	pool.returnResource(jedis);
        }
    }
    
    /**
     * 设置过期时间 (秒)
     * @param key
     * @param seconds
     * @return
     */
    public long setTTLSeconds(int seconds ) {
        Jedis jedis = null;
        try {
        	jedis = pool.getResource();
        	if( seconds < 0)
        		return jedis.persist( key );
            return jedis.expire( key, seconds );
        } catch (Exception e) {
        	e.printStackTrace();
        	pool.returnBrokenResource(jedis);
        	throw new JedisException(e.getMessage());
        } finally {
            pool.returnResource(jedis);
        }
    }

    public static void main(String[] args) {
    	JedisPoolConfig config = new JedisPoolConfig();
    	config.setMaxActive(100);
   
    	
    	config.setMaxIdle(20);
    	config.setMaxWait(1000l);
    	

    	JedisPool pool = new JedisPool(config, "203.195.168.151", 6379,1000,"myredis");
  
    	JedisStringCache jedisStringCache = new JedisStringCache(pool, "sa");
    	System.err.println(jedisStringCache.get());
    	
    
    //	jedisStringCache.set("tesa阿斯顿sdaasd",6,false);
    	
    System.err.println(jedisStringCache.get());	;
//    	List<Object> resultList = new ArrayList<Object>();
//    	Map<String,Object> resultMap = new HashMap<String,Object>();
//    	List<String> paramList = new ArrayList<String>();
//    	paramList.add("8001");
//    	resultMap = (Map<String, Object>) jedisHashCache.hgetAll("QUEUE_CENTRAL");
//    	long map = jedisHashCache.size("QUEUE_CENTRAL");
//    	resultMap.get("BMS_ORDER100001");
//    	System.out.println("resultMap="+ resultMap);
//    	Map<String,Object> bmsMap = (Map<String, Object>) resultMap.get("BMS_ORDER100001");
//    	String bmsMap = (String) resultMap.get("BMS_ORDER100001");
//    	System.out.println("resultList="+bmsMap);
//    	String a = "";
//    	if(!StringUtils.isEmpty(a)){
//    		System.out.println("a"+a);
//    	}
    
    	
    	
	}
}








