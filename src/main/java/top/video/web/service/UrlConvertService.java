package top.video.web.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gargoylesoftware.htmlunit.BrowserVersion;
import com.gargoylesoftware.htmlunit.FailingHttpStatusCodeException;
import com.gargoylesoftware.htmlunit.NicelyResynchronizingAjaxController;
import com.gargoylesoftware.htmlunit.WebClient;
import com.gargoylesoftware.htmlunit.html.HtmlElement;
import com.gargoylesoftware.htmlunit.html.HtmlPage;

import top.video.web.DAO.UrlMapDao;
import top.video.web.entity.UrlMap;
import top.video.web.util.UrlCache;

@Service
public class UrlConvertService {
	@Autowired
	private UrlMapDao mapDao;
	
	
	
	@SuppressWarnings({ "resource"})
	public String ksConvert(String url){
		if(UrlCache.findUrl(url)){
			try {
				Thread.sleep(10000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null;
		}else{
			UrlCache.addUrl(url);
			UrlMap urlMap = (UrlMap) mapDao.findByUrl(url);
			if(urlMap==null){
				WebClient wc = null;
//				if(url.indexOf("youku.com")>-1||url.indexOf("mgtv.com")>-1){
					BrowserVersion bv = new BrowserVersion("Safari", "Mozilla/5.0", "(iPad; CPU OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143 Safari/601.1", 5);
					wc = new WebClient(bv);
					wc.getOptions().setCssEnabled(true);
					wc.getOptions().setJavaScriptEnabled(true);
					wc.getOptions().setThrowExceptionOnScriptError(false);
					wc.getOptions().setThrowExceptionOnFailingStatusCode(false);
					wc.setAjaxController(new NicelyResynchronizingAjaxController());
			        try {
						HtmlPage page = wc.getPage("http://api.47ks.com/webcloud/?v=http://"+url);
						/*ajax等JS加载需要时间 这里延时10秒*/
//						wc.waitForBackgroundJavaScript(2000);
						HtmlElement video = page.getHtmlElementById("a1");
						for (int i = 0; i < 20; i++) {
				            if (!video.getAttribute("style").equals("display:none;")) {
				            	video = page.getHtmlElementById("a1");
				                break;
				            }
				            synchronized (page) {
				                try {
									page.wait(500);
								} catch (InterruptedException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								}
				            }
				        }
						if(!page.getElementById("a1").getAttribute("style").equals("display:none;")&&!page.getElementById("a1").getAttribute("style").equals("display: none;")){
							if(video.asXml().indexOf("api.47ks.com")>-1){
								UrlCache.delUrl(url);
								return "解析失败，暂不支持此VIP视频，正在修复中";
							}else{
								UrlMap map = new UrlMap();
								map.setUrl(url);
								map.setMap(video.asXml().replace("/player/loading_wap.gif", ""));
								mapDao.add(map);
								UrlCache.delUrl(url);
								return video.asXml();
							}
						}
					} catch (FailingHttpStatusCodeException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} /*catch (InterruptedException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}*/
			        wc.close();
			        UrlCache.delUrl(url);
					return "解析失败，或不支持此网站，请稍后再试";
//				}else{
//					return null;
//				}
			}else{
				UrlCache.delUrl(url);
				return urlMap.getMap();
			}
		}
	}
	

	public UrlMap wxConvert(String url){
		if(UrlCache.findUrl(url)){
			try {
				Thread.sleep(10000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null;
		}else{
			UrlCache.addUrl(url);
			UrlMap urlMap = (UrlMap) mapDao.findByUrl(url);
			if(urlMap==null){
				urlMap = new UrlMap();
				WebClient wc = null;
			
				BrowserVersion bv = new BrowserVersion("Safari", "Mozilla/5.0", "(iPad; CPU OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143 Safari/601.1", 5);
				wc = new WebClient(bv);
				wc.getOptions().setCssEnabled(true);
				wc.getOptions().setJavaScriptEnabled(true);
				wc.getOptions().setThrowExceptionOnScriptError(false);
				wc.getOptions().setThrowExceptionOnFailingStatusCode(false);
				wc.setAjaxController(new NicelyResynchronizingAjaxController());
		        try {
					HtmlPage page = wc.getPage("http://api.47ks.com/webcloud/?v=http://"+url);
					/*ajax等JS加载需要时间 这里延时10秒*/
//						wc.waitForBackgroundJavaScript(2000);
					HtmlElement video = page.getHtmlElementById("a1");
					for (int i = 0; i < 20; i++) {
			            if (!video.getAttribute("style").equals("display:none;")) {
			            	video = page.getHtmlElementById("a1");
			                break;
			            }
			            synchronized (page) {
			                try {
								page.wait(500);
							} catch (InterruptedException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
			            }
			        }
					if(!page.getElementById("a1").getAttribute("style").equals("display:none;")&&!page.getElementById("a1").getAttribute("style").equals("display: none;")){
						if(video.asXml().indexOf("api.47ks.com")>-1){
							UrlCache.delUrl(url);
							wc.close();
							urlMap.setMap("解析失败，可能不支持此VIP视频，正在修复中");
							return urlMap;
						}else{
							urlMap.setUrl(url);
							urlMap.setMap(video.asXml().replace("/player/loading_wap.gif", ""));
							mapDao.add(urlMap);
							UrlCache.delUrl(url);
							wc.close();
							return urlMap;
						}
					}
				} catch (FailingHttpStatusCodeException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} /*catch (InterruptedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}*/
		        wc.close();
		        UrlCache.delUrl(url);
				urlMap.setMap("解析失败，可能不支持此网站，请稍后再试");
				return urlMap;
			}else{
				UrlCache.delUrl(url);
				return urlMap;
			}
		}
	}
	
	
	public UrlMap wxConvert2(String url){
		if(UrlCache.findUrl(url)){
			try {
				Thread.sleep(10000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null;
		}else{
			UrlCache.addUrl(url);
			UrlMap urlMap = (UrlMap) mapDao.findByUrl(url);
			if(urlMap==null){
				urlMap = new UrlMap();
				WebClient wc = null;
					BrowserVersion bv = new BrowserVersion("Safari", "Mozilla/5.0", "(iPad; CPU OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143 Safari/601.1", 5);
					wc = new WebClient(bv);
					wc.getOptions().setCssEnabled(true);
					wc.getOptions().setJavaScriptEnabled(true);
					wc.getOptions().setThrowExceptionOnScriptError(false);
					wc.getOptions().setThrowExceptionOnFailingStatusCode(false);
					wc.setAjaxController(new NicelyResynchronizingAjaxController());
			        try {
						HtmlPage page = wc.getPage("http://000o.cc/jx/ty.php?url=http://"+url);
						/*ajax等JS加载需要时间 这里延时10秒*/
//						wc.waitForBackgroundJavaScript(2000);
						HtmlElement video = page.getHtmlElementById("a1");
						for (int i = 0; i < 20; i++) {
				            if (!video.getAttribute("style").equals("display:none;")) {
				            	video = page.getHtmlElementById("a1");
				                break;
				            }
				            synchronized (page) {
				                try {
									page.wait(500);
								} catch (InterruptedException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								}
				            }
				        }
						if(!page.getElementById("a1").getAttribute("style").equals("display:none;")&&!page.getElementById("a1").getAttribute("style").equals("display: none;")){
							if(video.asXml().indexOf("000o.cc")>-1||video.asXml().indexOf("cloud.video.taobao.com")>-1){
								UrlCache.delUrl(url);
								wc.close();
								urlMap.setMap("解析失败，可能不支持此VIP视频，正在修复中");
								return urlMap;
							}else{
								urlMap.setUrl(url);
								urlMap.setMap(video.asXml().replace("/player/loading_wap.gif", ""));
								mapDao.add(urlMap);
								UrlCache.delUrl(url);
								wc.close();
								return urlMap;
							}
						}
					} catch (FailingHttpStatusCodeException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} /*catch (InterruptedException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}*/
			        wc.close();
			        UrlCache.delUrl(url);
					urlMap.setMap("解析失败，可能不支持此网站，请稍后再试");
					return urlMap;
//				}else{
//					return null;
//				}
			}else{
				UrlCache.delUrl(url);
				return urlMap;
			}
		}
	}
	
	public UrlMap wxConvert3(String url){
		if(UrlCache.findUrl(url)){
			try {
				Thread.sleep(10000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null;
		}else{
			UrlCache.addUrl(url);
			UrlMap urlMap = (UrlMap) mapDao.findByUrl(url);
			if(urlMap==null){
				urlMap = new UrlMap();
				WebClient wc = null;
					BrowserVersion bv = new BrowserVersion("Safari", "Mozilla/5.0", "(iPad; CPU OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143 Safari/601.1", 5);
					wc = new WebClient(bv);
					wc.getOptions().setCssEnabled(true);
					wc.getOptions().setJavaScriptEnabled(true);
					wc.getOptions().setThrowExceptionOnScriptError(false);
					wc.getOptions().setThrowExceptionOnFailingStatusCode(false);
					wc.setAjaxController(new NicelyResynchronizingAjaxController());
			        try {
						HtmlPage page = wc.getPage("http://yun.mt2t.com/yun?url=http://"+url);
						/*ajax等JS加载需要时间 这里延时10秒*/
//						wc.waitForBackgroundJavaScript(2000);
						HtmlElement video = page.getHtmlElementById("a1");
						for (int i = 0; i < 20; i++) {
				            if (!video.getAttribute("style").equals("display:none;")) {
				            	video = page.getHtmlElementById("a1");
				                break;
				            }
				            synchronized (page) {
				                try {
									page.wait(500);
								} catch (InterruptedException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								}
				            }
				        }
						if(!page.getElementById("a1").getAttribute("style").equals("display:none;")&&!page.getElementById("a1").getAttribute("style").equals("display: none;")){
							if(video.asXml().indexOf("yun.mt2t.com")>-1||video.asXml().indexOf("cloud.video.taobao.com")>-1){
								UrlCache.delUrl(url);
								wc.close();
								urlMap.setMap("解析失败，可能不支持此VIP视频，正在修复中");
								return urlMap;
							}else{
								urlMap.setUrl(url);
								urlMap.setMap(video.asXml().replace("/player/loading_wap.gif", ""));
								mapDao.add(urlMap);
								UrlCache.delUrl(url);
								wc.close();
								return urlMap;
							}
						}
					} catch (FailingHttpStatusCodeException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} /*catch (InterruptedException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}*/
			        wc.close();
			        UrlCache.delUrl(url);
					urlMap.setMap("解析失败，可能不支持此网站，请稍后再试");
					return urlMap;
//				}else{
//					return null;
//				}
			}else{
				UrlCache.delUrl(url);
				return urlMap;
			}
		}
	}
	
	public String urlSub(String url){
		
		try {
			url = url.substring(url.indexOf("://")+3);
		}catch (Exception e) {
		}
		
		try {
			url = URLDecoder.decode(url, "utf-8");
		} catch (UnsupportedEncodingException e) {
		}
		
		
		if(url.indexOf("qq")>-1){
			url = url.replaceAll("m\\.", "");
			url = url.replace(".html?vid=", "/").replace("/t/", "/")+".html";
		}
		
		if(url.indexOf("youku")>-1){
			url = url.replaceAll("m\\.", "v.");
			url = url.replace("/video/", "/v_show/");
		}
		
		if(url.indexOf("iqiyi")>-1){
			url = url.replaceAll("m\\.", "www.");
		}
		
		int end = url.indexOf(".html");
		if(end>-1){
			url = url.substring(0, end+5);
		}
		return url;
	}


	public UrlMap reparse(String vi) {
		UrlMap urlMap = mapDao.findById(vi);
		if(urlMap!=null){
			mapDao.deleteVideo(urlMap);
			urlMap = this.wxConvert(urlMap.getUrl());
			String video = urlMap.getMap();
			if(video.indexOf("解析失败")>-1){
				urlMap = this.wxConvert2(urlMap.getUrl());
				return urlMap;
			}
			return urlMap;
		}
		return null;
	}
	
//	public String ufanwConvert(String url){
//		ScriptEngineManager sem=new ScriptEngineManager();
//		ScriptEngine se=sem.getEngineByExtension("js");
//		String s = null;
//		try {
//			se.eval(new FileReader("D:\\STSworkSpaces\\666video\\src\\main\\webapp\\resources\\convert.js"));
//			se.eval(new FileReader("F:\\Program Files\\sts-bundle\\workspace\\666video\\src\\main\\webapp\\resources\\convert.js"));
//			s=(String) se.eval("var a=new bbaa();a.encode('"+url+"');");
//			s= "http://vip.ufanw.com/play/play.html?url=" + s.substring(0, 3) + "1" + s.substring(3);
//		} catch (FileNotFoundException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (ScriptException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		System.out.println(s);
//		return s;
//	}
}
