package edu.zstu.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.zstu.web.dao.ActivityFileDao;
import edu.zstu.web.entity.ActivityFile;
import edu.zstu.web.entity.FileAttach;

@Service
public class ActivityFileService extends CrudService<ActivityFile, ActivityFileDao> {

	@Autowired
	private ActivityFileDao activityFileDao;
	@Autowired
	public void setDao(ActivityFileDao activityFileDao){
		this.activityFileDao = activityFileDao;
	}
	@Override
	protected ActivityFileDao getDao() {
		// TODO Auto-generated method stub
		return this.activityFileDao;
	}

}
