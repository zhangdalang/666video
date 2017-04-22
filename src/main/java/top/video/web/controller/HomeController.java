package top.video.web.controller;

import java.io.StringReader;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.HashMap;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import top.video.web.entity.UrlMap;
import top.video.web.service.UrlConvertService;

@Controller
public class HomeController {
	@Autowired
	private UrlConvertService urlConvertService;
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "home";
	}
	
	@RequestMapping("/go")
	public String convert(@RequestBody String url, Model model){
		if(url.equals("url=")||url.equals("")){
			return "home";
		}
		
		url = urlConvertService.urlSub(url);
		String video = urlConvertService.ksConvert(url);
		if(video!=null){
			model.addAttribute("video", video);
			return "watch";
		}else{
			model.addAttribute("video", "����ʧ�ܣ���������ȷ������");
			return "watch";
		}
	}
	
	@RequestMapping(method=RequestMethod.GET, value="/receive")
	public @ResponseBody String receive(@RequestParam String signature, @RequestParam String timestamp, @RequestParam String nonce, @RequestParam String echostr){
		String[] sort = {"666video",timestamp,nonce};
		Arrays.sort(sort);
		String info = "";
		for (String string : sort) {
			info = info + string;
		}
		try {
			 MessageDigest digest = MessageDigest.getInstance("SHA-1");
			 digest.update(info.getBytes());
			 byte messageDigest[] = digest.digest();
			 StringBuffer hexString = new StringBuffer();
			 for (int i = 0; i < messageDigest.length; i++) {
	                String shaHex = Integer.toHexString(messageDigest[i] & 0xFF);
	                if (shaHex.length() < 2) {
	                    hexString.append(0);
	                }
	                hexString.append(shaHex);
	          }
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return echostr;
	}
	@RequestMapping(method=RequestMethod.POST, value="/receive", produces="application/xml; charset=utf-8")
	public @ResponseBody String receive(@RequestBody String message){
		HashMap<String, String> xmlMessage = new HashMap<String, String>();
		try {
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = factory.newDocumentBuilder();
            Document doc = builder.parse(new InputSource(new StringReader(message)));
            Element root = doc.getDocumentElement();
            NodeList books = root.getChildNodes();
            
            
           if (books!=null) {
               for (int i = 0; i < books.getLength(); i++) {
                    Node book = books.item(i);
                    if("#text".equals(book.getNodeName())){
                    	continue;
                    }
                    if(book.getFirstChild()!=null){
                    	xmlMessage.put(book.getNodeName(),book.getFirstChild().getNodeValue());
                    }
                }
            }
          
        } catch (Exception e) {
            e.printStackTrace();
        }
		
		if("text".equals(xmlMessage.get("MsgType"))){
			String url =  xmlMessage.get("Content");
			/*�������ܻظ�*/
			if("1".equals(url)){
				return "<xml>"+
						"<ToUserName><![CDATA["+xmlMessage.get("FromUserName")+"]]></ToUserName>"+
						"<FromUserName><![CDATA["+xmlMessage.get("ToUserName")+"]]></FromUserName>"+
						"<CreateTime>12345678</CreateTime>"+
						"<MsgType><![CDATA[text]]></MsgType>"+
						"<Content><![CDATA[�����������ӣ������͵������ںŹۿ���\n��Ѷ��Ƶ��http://m.v.qq.com\n�ſ���Ƶ��http://m.youku.com\n��������Ƶ��http://m.iqiyi.com]]></Content>"+
						"</xml>";
			}
			if(url.indexOf("���������")>-1){
				return "<xml>"+
						"<ToUserName><![CDATA["+xmlMessage.get("FromUserName")+"]]></ToUserName>"+
						"<FromUserName><![CDATA["+xmlMessage.get("ToUserName")+"]]></FromUserName>"+
						"<CreateTime>12345678</CreateTime>"+
						"<MsgType><![CDATA[text]]></MsgType>"+
						"<Content><![CDATA[������·ּ����ɹۿ�\n<a href=\"http://oorh950a7.bkt.clouddn.com/job_zzz_41.mp4\">��41��</a>"+
													   "\n<a href=\"http://oorh950a7.bkt.clouddn.com/job_zzz_42.mp4\">��42��</a>"+
													   "\n<a href=\"http://oorh950a7.bkt.clouddn.com/job_zzz_43.mp4\">��43��</a>"+
													   "\n<a href=\"http://oorh950a7.bkt.clouddn.com/job_zzz_44.mp4\">��44��</a>"+
													   "\n<a href=\"http://oorh950a7.bkt.clouddn.com/job_zzz_45.mp4\">��45��</a>"+
													   "\n<a href=\"http://oorh950a7.bkt.clouddn.com/job_zzz_46.mp4\">��46��</a>"+
													   "\n<a href=\"http://oorh950a7.bkt.clouddn.com/job_zzz_47.mp4\">��47��</a>"+
													   "\n<a href=\"http://oorh950a7.bkt.clouddn.com/job_zzz_48.mp4\">��48��</a>"+
													   "\n<a href=\"http://oorh950a7.bkt.clouddn.com/job_zzz_49.mp4\">��49��</a>"+
													   "\n<a href=\"http://oorh950a7.bkt.clouddn.com/job_zzz_50.mp4\">��50��</a>"+
													   "\n<a href=\"http://oorh950a7.bkt.clouddn.com/job_zzz_51.mp4\">��51��</a>"+
													   "\n<a href=\"http://oorh950a7.bkt.clouddn.com/job_zzz_52.mp4\">��52��</a>"+
													   "\n<a href=\"http://oorh950a7.bkt.clouddn.com/job_zzz_53.mp4\">��53��</a>"+
													   "\n<a href=\"http://oorh950a7.bkt.clouddn.com/job_zzz_54.mp4\">��54��</a>"+
													   "\n<a href=\"http://oorh950a7.bkt.clouddn.com/job_zzz_55.mp4\">��55��</a>"+
													   "\n<a href=\"http://pan.baidu.com/s/1c2nFh2C\">����������٣�����ʱ���Ž������ɵ�������������ء����룺xjy9</a>"+
						"]]></Content>"+
						"</xml>";
			}
			
			
			url = urlConvertService.urlSub(url);
			UrlMap urlMap = urlConvertService.wxConvert(url);
			String video = urlMap.getMap();
			if(video.indexOf("����ʧ��")>-1){
				urlMap = urlConvertService.wxConvert2(url);
				video = urlMap.getMap();
				if(video.indexOf("����ʧ��")>-1){
					return "<xml>"+
							"<ToUserName><![CDATA["+xmlMessage.get("FromUserName")+"]]></ToUserName>"+
							"<FromUserName><![CDATA["+xmlMessage.get("ToUserName")+"]]></FromUserName>"+
							"<CreateTime>12345678</CreateTime>"+
							"<MsgType><![CDATA[text]]></MsgType>"+
							"<Content><![CDATA["+video+"]]></Content>"+
							"</xml>";
				}
			}
			if(url.indexOf("iqiyi")>-1){
				video = video+"С��ʿ����������վ缯���ǲ��ŵ�һ���������ֻ���  m.iqiyi.com �ƶ�����վ���ֻ�App�������ӡ�";
			}
			if(url.indexOf("qq")>-1){
				video = video+"С��ʿ�������Ѷ�缯���ǲ��ŵ�һ���������ֻ���  m.v.qq.com �ƶ�����վ���ֻ�App�������ӡ�";
			}
			
			
			try {
				video = URLEncoder.encode(video, "UTF-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return "<xml>"+
					"<ToUserName><![CDATA["+xmlMessage.get("FromUserName")+"]]></ToUserName>"+
					"<FromUserName><![CDATA["+xmlMessage.get("ToUserName")+"]]></FromUserName>"+
					"<CreateTime>12345678</CreateTime>"+
					"<MsgType><![CDATA[text]]></MsgType>"+
					"<Content><![CDATA[<a href=\"http://www.666video.top/play?video="+video+"&vi="+urlMap.getId()+"\">���������йۿ�</a>]]></Content>"+
					"</xml>";
		}else if("event".equals(xmlMessage.get("MsgType"))){
			if("subscribe".equals(xmlMessage.get("Event"))){
				return "<xml>"+
						"<ToUserName><![CDATA["+xmlMessage.get("FromUserName")+"]]></ToUserName>"+
						"<FromUserName><![CDATA["+xmlMessage.get("ToUserName")+"]]></FromUserName>"+
						"<CreateTime>12345678</CreateTime>"+
						"<MsgType><![CDATA[news]]></MsgType>"+
						"<ArticleCount>1</ArticleCount>"+
						"<Articles>"+
							"<item>"+
								"<Title><![CDATA[��ӭ��ע����鿴ʹ�÷���]]></Title> "+
								"<Description><![CDATA[�����ں�֧�֣���Ѷ���ſᡢ�����յ�VIP��Ƶ������沥�ţ��������֡�1���򿪿����ڣ�������վ��������Ҫ�ۿ�����Ƶ���ӣ����͵������ںż��ɹۿ���]]></Description>"+
								"<PicUrl><![CDATA[https://mmbiz.qlogo.cn/mmbiz_jpg/dUrg9gQaspl1SKBfSzJxXHTXYxTsXSgj7k6xOduGboo7YatbDCSN6K2ccHyOk482FMMJeJnZe9PomnpEicNUSoA/0?wx_fmt=jpeg]]></PicUrl>"+
								"<Url><![CDATA[http://mp.weixin.qq.com/s/J_2XCaMFZw02lNppSojPcQ]]></Url>"+
							"</item>"+
						"</Articles>"+
						"</xml>";
			}
		}
		return null;
	}
	
	@RequestMapping("/reparse")
	public String reparse(@RequestBody String vi, Model model){
		vi = vi.substring(3);
		UrlMap urlMap = urlConvertService.reparse(vi);
		if(urlMap==null){
			urlMap = new UrlMap();
			urlMap.setMap("����ʧ�ܣ����ܲ�֧�ִ�VIP��Ƶ���޸���");
		}
		model.addAttribute("video", urlMap.getMap());
		model.addAttribute("vi", urlMap.getId());
		return "watch";
	}
	
	@RequestMapping("/play")
	public String play(@RequestParam String video, @RequestParam String vi, Model model){
		model.addAttribute("video", video);
		model.addAttribute("vi", vi);
		return "watch";
	}
	
	@RequestMapping("/test")
	public void test(@RequestParam String url){
		
	}
}
