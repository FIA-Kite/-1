package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import Service.type_service;
import entity.type;
import entity.type;
import utils.SearchInfo;
import utils.jsonInfo;

@Controller
@RequestMapping("Type")
public class type_controller {
	
	@Autowired
	type_service service;
	
//	@RequestMapping("index")//从数据库中获取数据,ModelMap页面传值
//	public String admin_role(ModelMap m) {
//		return null;
//		
//		
//		}
//	@RequestMapping("index")//条件查询
//	public String index(Integer select,String txt,SearchInfo info, ModelMap m) {
//		System.out.println("进入了index");
//	if(select==null)select=0;
//		String where="";
//		if(txt!=null&&txt.length()>0){
//			switch (select) {
//			case 1:
//				where=" where type.parentid ="+txt+" ";
//				break;
//			default:
//				where=" where type.name like '%"+txt+"%'";
//			}
//			
//		}
//		info.setWhere(where);
//		m.put("select",select);
//		m.put("txt",select==0?"'"+txt+"'":txt);
//		
//		info.setWhere(where);
//		m.put("search", info);
//		//info.setCanPage(false);
//		m.put("list", service.select(info));
//		System.out.println("进入了index");
//		return "Type/index";
//} 
	@RequestMapping("insert")//新增
	public @ResponseBody jsonInfo insert(type t) {
		service.insert(t);
		return new jsonInfo(1,"");
	}
	@RequestMapping("update")//修改
	public @ResponseBody jsonInfo update(type t) {
		service.update(t);
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
	public String add(ModelMap m,int parentid) {
		System.out.println(parentid+"父类id");
		m.put("parentid", parentid);
			return "Type/edit";
	}
	
	@RequestMapping("edit")//跳转到修改页面
	public String edit(int id,ModelMap m) {
		System.out.println("经过了controller");
		m.put("info", service.selectbyID(id));
		return add(m,id);
	}
	
	
	@RequestMapping("type-list")
	public void select(Integer parentid,SearchInfo info,ModelMap m) {
		
		if (parentid==null)
			parentid=0;
		m.put("parentid", parentid);
		System.out.println(parentid+"当前级id");
		if (parentid>0) {
			type t=service.getById(parentid);
			m.put("name",t.getName());
			String path="/<a href=\"type-list?parentid="+t.getId()+"\">"+t.getName()+"</a>";
			while (t.getParentid()>0) {
				t=service.getById(t.getParentid());
				path="/<a href=\"type-list?parentid="+t.getId()+"\">"+t.getName()+"</a>"+path;
			}
			path="<a href=\"type-list?parentid=0\">根节点</a>"+path;
			m.put("path", path);
		}else {
			m.put("name", "根节点");
			m.put("path", "<a href=\"type-list?parentid=0\">根节点</a>");
		}
		info.setCanPage(false);
		info.setWhere(" where type.parentid="+parentid);
		m.put("list", service.tselect(info));
	}
	
}
