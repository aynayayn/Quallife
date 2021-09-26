package edu.zstu.web.service;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.zstu.web.dao.FoodCollectDao;
import edu.zstu.web.entity.Food;
import edu.zstu.web.entity.FoodCollect;
import edu.zstu.web.entity.User;

@Service
public class FoodCollectService extends CrudService<FoodCollect, FoodCollectDao> {

	@Autowired
	private FoodCollectDao foodCollectDao;
	@Autowired
	public void setFoodCollectDao(FoodCollectDao foodCollectDao){
		this.foodCollectDao = foodCollectDao;
	}
	@Override
	protected FoodCollectDao getDao() {
		// TODO Auto-generated method stub
		return this.foodCollectDao;
	}

	public List<FoodCollect> findByUserAndFood(User user,Food food){
		/*List<FoodCollect> list = new ArrayList<FoodCollect>();
		FoodCollect foodCollect = new FoodCollect();
		foodCollect.setUser(user);
		foodCollect.setFood(food);
		list.add(foodCollect);
		return list;*/
		return this.getDao().findByUserAndFood(user,food);
	}
	public List<FoodCollect> findByUser(User user) {
		// TODO Auto-generated method stub
		return this.getDao().findByUser(user);
	}
}
