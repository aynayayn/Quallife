package edu.zstu.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.zstu.web.dao.ActivityOrderDao;
import edu.zstu.web.entity.Activity;
import edu.zstu.web.entity.ActivityOrder;
import edu.zstu.web.entity.User;

@Service
public class ActivityOrderService extends CrudService<ActivityOrder, ActivityOrderDao> {

	@Autowired
	private ActivityOrderDao activityOrderDao;
	@Autowired
	public void setDao(ActivityOrderDao activityOrderDao){
		this.activityOrderDao = activityOrderDao;
	}
	@Override
	protected ActivityOrderDao getDao() {
		// TODO Auto-generated method stub
		return this.activityOrderDao;
	}
	public List<ActivityOrder> findByUserAndActivity(User user, Activity activity) {
		// TODO Auto-generated method stub
		return this.getDao().findByUserAndActivity(user,activity);
	}
	public List<Activity> findByUser(User user) {
		// TODO Auto-generated method stub
		return this.getDao().findByUser(user);
	}
}
