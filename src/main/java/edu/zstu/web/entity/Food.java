package edu.zstu.web.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.springframework.core.annotation.Order;



@Entity
@Table(name="FOOD")
public class Food extends BaseEntity {
	
	private String foodName;
	private Date deployDate;
	private String foodMaterial;
	private Integer steps;
	private Integer likes;
	
	private User user;
	private FileAttach fileAttach;
	private List<FoodSteps> foodSteps;
	
	@Column(name="FOOD_NAME")
	public String getFoodName() {
		return foodName;
	}
	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}
	
	@Column(name="DEPLOY_DATE")
	public Date getDeployDate() {
		return deployDate;
	}
	public void setDeployDate(Date deployDate) {
		this.deployDate = deployDate;
	}
	
	@Column(name="FOOD_MATERIAL")
	public String getFoodMaterial() {
		return foodMaterial;
	}
	public void setFoodMaterial(String foodMaterial) {
		this.foodMaterial = foodMaterial;
	}
	
	@Column(name="STEPS")
	public Integer getSteps() {
		return steps;
	}
	public void setSteps(Integer steps) {
		this.steps = steps;
	}
	
	@Column(name="LIKES")
	public Integer getLikes() {
		return likes;
	}
	public void setLikes(Integer likes) {
		this.likes = likes;
	}
	
	@ManyToOne(targetEntity=User.class)
	@Cascade(value={CascadeType.REFRESH})
	@JoinColumn(name="USER_ID")
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	@ManyToOne(targetEntity=FileAttach.class)
	@Cascade(value={CascadeType.REFRESH})
	@JoinColumn(name="FILE_ID")
	public FileAttach getFileAttach() {
		return fileAttach;
	}
	public void setFileAttach(FileAttach fileAttach) {
		this.fileAttach = fileAttach;
	}
	
	@OneToMany
	@Cascade(value={CascadeType.ALL})
	@JoinColumn(name="FOOD_ID")
	@OrderBy("STEP_NO ASC")
	public List<FoodSteps> getFoodSteps() {
		return foodSteps;
	}
	public void setFoodSteps(List<FoodSteps> foodSteps) {
		this.foodSteps = foodSteps;
	}
}
