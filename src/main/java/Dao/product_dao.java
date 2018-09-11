package Dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.operater;
import entity.product;
import entity.type;
import utils.SearchInfo;
@Repository
public interface product_dao {
	
	
	
	@Select("select product.*,type.name type_name from product inner join type on product.type_id=type.id ${where}")
	public List<product> select(SearchInfo s);

	@Insert("insert into product (fullname,type_id,activity,tip,sale,info,price,nowprice,salecount,collectcount,priority,pics,status,comments) values(#{fullname},#{type_id},#{activity},#{tip},#{sale},#{info},#{price},#{nowprice},#{salecount},#{collectcount},#{priority},#{pics},#{status},#{comments})")
	public void insert(product p);//������ʱ������ʾ״̬�������

	@Delete("delete from product where id=#{id}")
	public void delete(int id);//���������Զ�ֲ�����

	@Update("update product set fullname=#{fullname},type_id=#{type_id},activity=#{activity}"
			+ ",tip=#{tip},sale=#{sale},info=#{info},"
			+ " price=#{price},nowprice=#{nowprice},"
			+ "	salecount=#{salecount},collectcount=#{collectcount},priority=#{priority},status=#{status},pics=#{pics},comments=#{comments} where id=#{id}")
	public int update(product p);


	//��ѯһ����¼
	@Select("select * from product where id=#{id}")
	public product selectbyID(int id);

	@Select("select * from type ")
	public List<type> selectType();

	
	
}
