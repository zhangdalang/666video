package top.video.web.entity;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="xml") 
public class XmlMessage {
	private String Content;
	private String ToUserName;
	public String getContent() {
		return Content;
	}
	public void setContent(String content) {
		Content = content;
	}
	public String getToUserName() {
		return ToUserName;
	}
	public void setToUserName(String toUserName) {
		ToUserName = toUserName;
	}
}
