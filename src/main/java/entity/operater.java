package entity;

import java.io.Serializable;

public class operater implements Serializable{
	
	public static String [] opstatus= {"在职","离职"};
	public static String [] opsex= {"男","女"};
	public static String [] oppower= {"管理员","操作员"};
	
	int id;
	String nike;
	String password;
	String name;
	int sex;
	String tel;
	int power;
	int  status;
	String comments;
	
	public operater() {
		// TODO Auto-generated constructor stub
	}
	
	public String[] getOpstatus() {
		return opstatus;
	}
	public void setOpstatus(String[] opstatus) {
		this.opstatus = opstatus;
	}

	public String[] getOpsex() {
		return opsex;
	}

	public void setOpsex(String[] opsex) {
		this.opsex = opsex;
	}

	
	public static String[] getOppower() {
		return oppower;
	}

	public static void setOppower(String[] oppower) {
		operater.oppower = oppower;
	}

	
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNike() {
		return nike;
	}
	public void setNike(String nike) {
		this.nike = nike;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getSex() {
		return sex;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public int getPower() {
		return power;
	}
	public void setPower(int power) {
		this.power = power;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
}
