package com.framework.loippi.utils.wechat.utils;


import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;

import javax.net.ssl.X509TrustManager;

/**
 * 证书信任管理器（用于https请求）
 */
public class AzuraX509TrustManager implements X509TrustManager {
	/* (non-Javadoc)
	 * @see javax.net.ssl.X509TrustManager#checkClientTrusted(java.security.cert.X509Certificate[], java.lang.String)
	 */
	public void checkClientTrusted(X509Certificate[] arg0, String arg1)
		throws CertificateException 
    {

	}

	/* (non-Javadoc)
	 * @see javax.net.ssl.X509TrustManager#checkServerTrusted(java.security.cert.X509Certificate[], java.lang.String)
	 */
	public void checkServerTrusted(X509Certificate[] arg0, String arg1)
		throws CertificateException 
    {

	}

	/* (non-Javadoc)
	 * @see javax.net.ssl.X509TrustManager#getAcceptedIssuers()
	 */
	public X509Certificate[] getAcceptedIssuers() 
    {
		return null;
	}

//	X509TrustManager sunJSSEX509TrustManager;
//
//	AzuraX509TrustManager() throws Exception {
//		// create a "default" JSSE X509TrustManager.
//		KeyStore ks = KeyStore.getInstance("JKS");
//		ks.load(new FileInputStream("trustedCerts"), "passphrase"
//						.toCharArray());
//		TrustManagerFactory tmf = TrustManagerFactory.getInstance("SunX509",
//				"SunJSSE");
//		tmf.init(ks);
//		TrustManager tms[] = tmf.getTrustManagers();
//		/*
//		 * Iterate over the returned trustmanagers, look for an instance of
//		 * X509TrustManager. If found, use that as our "default" trust manager.
//		 */
//		for (int i = 0; i < tms.length; i++) {
//			if (tms[i] instanceof X509TrustManager) {
//				sunJSSEX509TrustManager = (X509TrustManager) tms[i];
//				return;
//			}
//		}
//		/*
//		 * Find some other way to initialize, or else we have to fail the
//		 * constructor.
//		 */
//		throw new Exception("Couldn't initialize");
//	}
//
//	public void checkClientTrusted(X509Certificate[] chain, String authType)
//			throws CertificateException {
//		try {
//			sunJSSEX509TrustManager.checkClientTrusted(chain, authType);
//		} catch (CertificateException excep) {
//		}
//	}
//
//	public void checkServerTrusted(X509Certificate[] chain, String authType)
//			throws CertificateException {
//		try {
//			sunJSSEX509TrustManager.checkServerTrusted(chain, authType);
//		} catch (CertificateException excep) {
//		}
//	}
//
//	public X509Certificate[] getAcceptedIssuers() {
//		return sunJSSEX509TrustManager.getAcceptedIssuers();
//	}
}
