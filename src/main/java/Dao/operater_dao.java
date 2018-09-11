package Dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.operater;
import utils.SearchInfo;
@Repository
public interface operater_dao {
	
	@Select("select * from operater where nike=#{nike} and password=#{password}")
	public operater login(operater p);
	
	
	@Select("select * from operater ${where}")
	public List<operater> select(SearchInfo s);

	@Insert("insert into operater (nike,password,name,tel,comments,sex,power,status) values(#{nike},#{password},#{name},#{tel},#{comments},#{sex},#{power},#{status})")
	public void insert(operater o);//������ʱ������ʾ״̬�������

	@Delete("delete from operater where id=#{id}")
	public void delete(int id);//���������Զ�ֲ�����

	@Update("update operater set nike=#{nike},password=#{password}"
			+ ",name=#{name},tel=#{tel},comments=#{comments},"
			+ " sex=#{sex},power=#{power},"
			+ "	status=#{status} where id=#{id}")
	public int update(operater o);


	//��ѯһ����¼
	@Select("select * from operater where id=#{id}")
	public operater selectbyID(int id);

	
}
