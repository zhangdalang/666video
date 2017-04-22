package top.video.web.util;

import java.util.HashSet;

public class UrlCache {
	private static HashSet<String> cache = new HashSet<String>();
	public static void addUrl(String url){
		cache.add(url);
	}
	
	public static void delUrl(String url){
		cache.remove(url);
	}
	
	public static boolean findUrl(String url){
		return cache.contains(url);
	}
}
