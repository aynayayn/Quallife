package edu.zstu.web.dao;

import java.util.List;

import edu.zstu.web.entity.Food;
import edu.zstu.web.entity.FoodCollect;
import edu.zstu.web.entity.User;

public interface FoodCollectDao extends BaseDao<FoodCollect> {

	List<FoodCollect> findByUserAndFood(User user, Food food);

	List<FoodCollect> findByUser(User user);

}
