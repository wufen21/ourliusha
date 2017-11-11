package com.framework.loippi.utils.redis;



import org.apache.log4j.Logger;

import redis.clients.jedis.JedisPool;

public class JedisCache {
	
	protected Logger log = Logger.getLogger(getClass());
	
    protected JedisPool pool;
    
    public JedisCache(){
    }
    
    public JedisCache( JedisPool pool ){
    	this.pool = pool;
    }
   
    public JedisHashCache getJedisHashCache( String key ){
    	return new JedisHashCache( pool, key );
    }
    
    public JedisStringCache getJedisStringCache( String key ){
    	return new JedisStringCache( pool, key );
    }
    
    public void destroy() {
        pool.destroy();
    }

    public JedisPool getPool() {
        return pool;
    }

    public void setPool(JedisPool pool) {
        this.pool = pool;
    }


}
