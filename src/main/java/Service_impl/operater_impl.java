package Service_impl;

import java.util.List;

import org.aspectj.apache.bcel.generic.ReturnaddressType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Dao.operater_dao;
import Service.operater_service;
import entity.operater;
import utils.SearchInfo;
@Service
public class operater_impl implements operater_service{
@Autowired
operater_dao dao;

	public operater login(operater p) {
		return dao.login(p);
	}
		
	
	
	public void insert(operater o) {
		dao.insert(o);
	}	
	public void delete(int id) {
		dao.delete(id);
	}

	public void update(operater o) {
		int rs = dao.update(o);
		System.out.println(rs);
		
	}

	public operater selectbyID(int id) {
		
		return dao.selectbyID(id);
	}

	public List<operater> select(SearchInfo s) {

		return dao.select(s);
	}

}
