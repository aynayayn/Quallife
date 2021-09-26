package edu.zstu.web.entity;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

@Entity
@Table(name="ACTIVITY_ORDER")
public class ActivityOrder extends BaseEntity {
	private Activity activity;
	private User user;
	
	@ManyToOne(targetEntity=Activity.class)
	@Cascade(value={CascadeType.REFRESH})
	@JoinColumn(name="ACTIVITY_ID")
	public Activity getActivity() {
		return activity;
	}
	public void setActivity(Activity activity) {
		this.activity = activity;
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
	
	
}
