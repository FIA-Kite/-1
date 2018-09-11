package Service;

import java.util.List;

import entity.operater;
import utils.SearchInfo;

public interface operater_service {
	
	public operater login(operater p);
	
	public List<operater> select(SearchInfo s);
	
	public void insert(operater o);
	
	public void delete(int id);
	
	public void update(operater o);
	
	public operater selectbyID(int id);
}
