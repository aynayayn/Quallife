package edu.zstu.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.zstu.web.dao.ActivityDao;
import edu.zstu.web.entity.Activity;

@Service
public class ActivityService extends CrudService<Activity, ActivityDao> {

	@Autowired
	private ActivityDao activityDao;
	@Autowired
	public void setDao(ActivityDao activityDao){
		this.activityDao = activityDao;
	}
	@Override
	protected ActivityDao getDao() {
		// TODO Auto-generated method stub
		return this.activityDao;
	}

}
