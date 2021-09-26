package edu.zstu.web.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

//实体标注
@Entity
//实体表标注
@Table(name="SYS_USER")
public class User extends BaseEntity {
	private String loginName;
	private String password;
	private String salt;
	
	@Column(name="LOGIN_NAME")
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	@Column(name="PASSWORD")
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Column(name="SALT")
	public String getSalt() {
		return salt;
	}
	public void setSalt(String salt) {
		this.salt = salt;
	}
	
	
}
