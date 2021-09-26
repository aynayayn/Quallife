package edu.zstu.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.zstu.web.dao.FoodDao;
import edu.zstu.web.entity.Food;

@Service
public class FoodService extends CrudService<Food, FoodDao> {

	@Autowired
	private FoodDao foodDao;
	@Autowired
	public void setFoodDao(FoodDao foodDao){
		this.foodDao=foodDao;
	}
	@Override
	protected FoodDao getDao() {
		// TODO Auto-generated method stub
		return this.foodDao;
	}

}
