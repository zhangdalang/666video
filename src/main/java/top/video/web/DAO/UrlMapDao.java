package top.video.web.DAO;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;

import top.video.web.entity.UrlMap;
@Repository
public class UrlMapDao {
	@Autowired
	HibernateTemplate hibernateTemplate;
	@SuppressWarnings("unchecked")
	public UrlMap findByUrl(String url) {
		ArrayList<UrlMap> urlMaps = (ArrayList<UrlMap>) hibernateTemplate.find("FROM UrlMap WHERE url = ?", url);
		if(!urlMaps.isEmpty()){
			return urlMaps.get(0);
		}
		return null;
	}

	public void add(UrlMap map) {
		hibernateTemplate.save(map);
	}

	@SuppressWarnings("unchecked")
	public UrlMap findById(String id) {
		ArrayList<UrlMap> urlMaps = (ArrayList<UrlMap>) hibernateTemplate.find("FROM UrlMap WHERE id = "+id);
		if(!urlMaps.isEmpty()){
			return urlMaps.get(0);
		}
		return null;
	}
	
	public void deleteVideo(UrlMap map){
		hibernateTemplate.delete(map);
	}
	
}
