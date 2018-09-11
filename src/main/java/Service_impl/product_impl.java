package Service_impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import Dao.product_dao;

import Service.product_service;
import entity.product;
import entity.type;
import utils.SearchInfo;
@Service
public class product_impl implements product_service{
@Autowired
product_dao dao;
	public void insert(product p) {//新增
		dao.insert(p);
	}	
	public void delete(int id) {//删除
		dao.delete(id);
	}

	public void update(product p) {//修改
		int rs = dao.update(p);
		System.out.println(rs);
		
	}

	public product selectbyID(int id) {
		
		return dao.selectbyID(id);
	}

	public List<product> select(SearchInfo s) {//查询

		return dao.select(s);
	}

	public List<type> selectType() {
		return dao.selectType();
	}

	
	
}
