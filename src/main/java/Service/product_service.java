package Service;

import java.util.List;

import entity.product;
import entity.type;
import utils.SearchInfo;

public interface product_service {
	public List<product> select(SearchInfo s);//查询列表
	
	public void insert(product p);//新增（插入)
	
	public void delete(int id);//删除
	
	public void update(product p);//修改
	
	public product selectbyID(int id);
	
	public List<type> selectType();

}
