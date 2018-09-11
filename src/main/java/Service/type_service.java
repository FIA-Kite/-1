package Service;

import java.util.List;

import entity.type;
import utils.SearchInfo;

public interface type_service {
	public List<type> select(SearchInfo s);//查询列表
	
	public void insert(type t);//新增（插入)
	
	public void delete(int id);//删除
	
	public void update(type t);//修改
	
	public type selectbyID(int id);
	
	public List<type> tselect(SearchInfo info);
	
	public type getById(int id);
}
