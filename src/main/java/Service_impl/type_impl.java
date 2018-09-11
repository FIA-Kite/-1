package Service_impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import Dao.type_dao;

import Service.type_service;
import entity.type;
import utils.SearchInfo;
@Service
public class type_impl implements type_service{
@Autowired
type_dao dao;
	public void insert(type t) {//新增
		dao.insert(t);
	}	
	public void delete(int id) {//删除
		dao.delete(id);
	}

	public void update(type t) {//修改
		int rs = dao.update(t);
		System.out.println(rs);
		
	}

	public type selectbyID(int id) {
		
		return dao.selectbyID(id);
	}

	public List<type> select(SearchInfo s) {//查询

		return dao.select(s);
	}
	public List<type> tselect(SearchInfo info) {
		// TODO Auto-generated method stub
		return dao.tselect(info);
	}
	public type getById(int id) {
		// TODO Auto-generated method stub
		return dao.getById(id);
	}

}
