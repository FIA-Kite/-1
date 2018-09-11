package Dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.type;
import utils.SearchInfo;
@Repository
public interface type_dao {
	
	
	
	@Select("select * from type ${where}")
	public List<type> select(SearchInfo s);

	@Insert("insert into type (name,parentid) values(#{name},#{parentid})")
	public void insert(type t);//查询

	@Delete("delete from type where id=#{id}")
	public void delete(int id);//删除

	@Update("update type set name=#{name} where id=#{id}")			
	public int update(type t);//修改

	//获取ID
	@Select("select * from type where id=#{id}")
	public type selectbyID(int id);

	@Select("select type.*,t.name parent_name from type left join type t on type.parentid=t.id ${where}")
	public List<type> tselect(SearchInfo info);
	
	@Select("select * from type where id=#{id}")
	public type getById(int id);
}
