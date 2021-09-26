package edu.zstu.web.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;



@Entity
@Table(name="FOOD_COLLECT")
public class FoodCollect extends BaseEntity {
	private User user;
	private Food food;
	
	@ManyToOne(targetEntity=User.class)
	@Cascade(value={CascadeType.REFRESH})
	@JoinColumn(name="USER_ID")
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	@ManyToOne(targetEntity=Food.class)
	@Cascade(value={CascadeType.REFRESH})
	@JoinColumn(name="FOOD_ID")
	public Food getFood() {
		return food;
	}
	public void setFood(Food food) {
		this.food = food;
	}
	
	
}
