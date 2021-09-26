package edu.zstu.web.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OrderBy;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

@Entity
@Table(name="ACTIVITY")
public class Activity extends BaseEntity {
	private String activityName;
	private String activityArea;
	private String activityAddress;
	private String activityDesc;
	private User delpoyUser;
	private Date deployDate;
	private Date startDate;
	private Date endDate;
	private List<FileAttach> files;
	
	@Column(name="ACTIVITY_NAME")
	public String getActivityName() {
		return activityName;
	}
	public void setActivityName(String activityName) {
		this.activityName = activityName;
	}
	
	@Column(name="ACTIVITY_AREA")
	public String getActivityArea() {
		return activityArea;
	}
	public void setActivityArea(String activityArea) {
		this.activityArea = activityArea;
	}
	
	@ManyToOne(targetEntity=User.class)
	@Cascade(value={CascadeType.REFRESH})
	@JoinColumn(name="DEPLOY_USER_ID")
	public User getDelpoyUser() {
		return delpoyUser;
	}
	public void setDelpoyUser(User delpoyUser) {
		this.delpoyUser = delpoyUser;
	}
	
	@Column(name="DEPLOY_DATE")
	public Date getDeployDate() {
		return deployDate;
	}
	public void setDeployDate(Date deployDate) {
		this.deployDate = deployDate;
	}
	
	@Column(name="START_DATE")
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	
	@Column(name="END_DATE")
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	@Column(name="ACTIVITY_DESC")
	public String getActivityDesc() {
		return activityDesc;
	}
	public void setActivityDesc(String activityDesc) {
		this.activityDesc = activityDesc;
	}
	@Column(name="ACTIVITY_ADDRESS")
	public String getActivityAddress() {
		return activityAddress;
	}
	public void setActivityAddress(String activityAddress) {
		this.activityAddress = activityAddress;
	}
	@ManyToMany
	@JoinTable(name="ACTIVITY_FILE",joinColumns=@JoinColumn(name="ACTIVITY_ID"),inverseJoinColumns=@JoinColumn(name="FILE_ID"))
	@OrderBy("id asc")
	public List<FileAttach> getFiles() {
		return files;
	}
	public void setFiles(List<FileAttach> files) {
		this.files = files;
	}
}
