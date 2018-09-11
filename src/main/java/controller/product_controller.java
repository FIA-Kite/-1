package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import Service.product_service;
import entity.product;
import utils.SearchInfo;
import utils.jsonInfo;

@Controller
@RequestMapping("Product")
public class product_controller {
	
	@Autowired
	product_service service;
	
//	@RequestMapping("index")//从数据库中获取数据,ModelMap页面传值
//	public String admin_role(ModelMap m) {
//		return null;
//		
//		
//		}
	
	@RequestMapping("index")//条件查询
	public String index(Integer select,String txt,SearchInfo info, ModelMap m) {
		System.out.println("进入了index");
	if(select==null)select=0;
		String where="";
		if(txt!=null&&txt.length()>0){
			switch (select) {
			case 1:
				where=" where product.status ="+txt+" ";
				break;
			case 2:
				where=" where product.type_id="+txt+" ";
				break;
			default:
				where=" where product.fullname like '%"+txt+"%'";
			}
			
		}
		info.setWhere(where);
		m.put("select",select);
		m.put("txt",select==0?"'"+txt+"'":txt);
		
		
		
		
		info.setWhere(where);
		m.put("search", info);
		//info.setCanPage(false);
		m.put("list", service.select(info));
		m.put("pstatus", product.pstatus);
		m.put("ppriority", product.ppriority);
		System.out.println("进入了index");
		return "Product/index";
} 
	@RequestMapping("insert")//新增
	public @ResponseBody jsonInfo insert(product c) {
		service.insert(c);
		return new jsonInfo(1,"");
	}
	@RequestMapping("update")//修改
	public @ResponseBody jsonInfo update(product c) {
		service.update(c);
		return new jsonInfo(1,"");
	}
	@RequestMapping("delete")//删除
	public String delete(int id) {
		service.delete(id);
			return "redirect:index";
	}
	@RequestMapping("deleteall")//批量删除
	public String deleteall(String ids) {
		//SqlHelper.executeUpdate("delete from cla where id in ("+ids+")");
			return "redirect:index";
	}
	@RequestMapping("add")//跳转到添加页面
	public String add(ModelMap m) {
		m.put("pstatus", product.pstatus);
		m.put("ptype_id", service.selectType());
		m.put("ppriority", product.ppriority);
			return "Product/edit";
	}
	
	@RequestMapping("edit")//跳转到修改页面
	public String edit(int id,ModelMap m) {
		
		System.out.println("经过了controller");
		
		m.put("info", service.selectbyID(id));
		return add(m);
	}
	
	
	
	
}
