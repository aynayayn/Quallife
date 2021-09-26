package edu.zstu.web.dao;

import org.springframework.stereotype.Component;

import edu.zstu.web.entity.User;

public interface UserDao extends BaseDao<User> {

	User findByLoginName(String loginName);

}
