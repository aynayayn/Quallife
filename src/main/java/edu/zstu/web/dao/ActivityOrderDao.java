package edu.zstu.web.dao;

import java.util.List;

import edu.zstu.web.entity.Activity;
import edu.zstu.web.entity.ActivityOrder;
import edu.zstu.web.entity.User;

public interface ActivityOrderDao extends BaseDao<ActivityOrder> {

	List<ActivityOrder> findByUserAndActivity(User user, Activity activity);

	List<Activity> findByUser(User user);

}
