package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import Service.operater_service;
import entity.operater;
import utils.SearchInfo;
import utils.jsonInfo;

@Controller
@RequestMapping("Operater")
public class operater_controller {
	
	@Autowired
	operater_service service;
	
//	@RequestMapping("index")//从数据库中获取数据,ModelMap页面传值
//	public String admin_role(ModelMap m) {
//		return null;
//		
//		
//		}
	
	@RequestMapping("login")//登录
		public String login(operater p,String code,HttpSession session) {
				session.removeAttribute("error");
			if(session.getAttribute("randomCode").toString().equalsIgnoreCase(code)) {
				operater user=service.login(p);
				if(user!=null) {
					session.setAttribute("user", user);
					return "redirect:/index.jsp";
				
			}else {
				session.setAttribute("error", "用户名密码错误");
			}} else {
				session.setAttribute("error", "验证码错误");
			}
			return "redirect:/login.jsp";
	}
	
	
	@RequestMapping("index")//条件查询
	public String index(Integer select,String txt,SearchInfo info, ModelMap m) {
		System.out.println("进入了index");
	if(select==null)select=0;
		String where="";
		if(txt!=null&&txt.length()>0){
			switch (select) {
			case 1:
				where=" where operater.status ="+txt+" ";
				break;
			case 2:
				where=" where operater.sex="+txt+" ";
				break;
			default:
				where=" where operater.name like '%"+txt+"%'";
			}
			
		}
		info.setWhere(where);
		m.put("select",select);
		m.put("txt",select==0?"'"+txt+"'":txt);
		
		info.setWhere(where);
		m.put("search", info);
		//info.setCanPage(false);
		m.put("list", service.select(info));
		m.put("opstatus", operater.opstatus);
		m.put("opsex", operater.opsex);
		m.put("oppower", operater.oppower);
		System.out.println("进入了index");
		return "Operater/index";
} 
	@RequestMapping("insert")//新增
	public @ResponseBody jsonInfo insert(operater c) {
		service.insert(c);
		return new jsonInfo(1,"");
	}
	@RequestMapping("update")//修改
	public @ResponseBody jsonInfo update(operater c) {
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
		m.put("opstatus", operater.opstatus);
		m.put("opsex", operater.opsex);
		m.put("oppower", operater.oppower);
			return "Operater/edit";
	}
	
	@RequestMapping("edit")//跳转到修改页面
	public String edit(int id,ModelMap m) {
		
		System.out.println("经过了controller");
		
		m.put("info", service.selectbyID(id));
		return add(m);
	}
	
	
	
	
}
