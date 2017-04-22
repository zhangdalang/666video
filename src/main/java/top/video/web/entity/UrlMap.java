package top.video.web.entity;
// Generated 2017-4-17 15:17:27 by Hibernate Tools 3.4.0.CR1

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * UrlMap generated by hbm2java
 */
@Entity
@Table(name = "UrlMap", catalog = "video")
public class UrlMap implements java.io.Serializable {

	private Integer id;
	private String url;
	private String map;

	public UrlMap() {
	}

	public UrlMap(String url, String map) {
		this.url = url;
		this.map = map;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "url", nullable = false, length = 65535)
	public String getUrl() {
		return this.url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	@Column(name = "map", nullable = false, length = 65535)
	public String getMap() {
		return this.map;
	}

	public void setMap(String map) {
		this.map = map;
	}

}