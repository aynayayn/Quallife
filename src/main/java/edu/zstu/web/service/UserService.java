package edu.zstu.web.service;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springside.modules.security.utils.Digests;
import org.springside.modules.utils.Encodes;

import edu.zstu.web.dao.UserDao;
import edu.zstu.web.entity.User;
import edu.zstu.web.service.ShiroDbRealm.ShiroUser;

@Service
@Transactional
public class UserService extends CrudService<User, UserDao> {

	@Autowired
	private UserDao userDao;
	@Autowired
	public void setUserDao(UserDao userDao){
		this.userDao = userDao;
	}
	@Override
	protected UserDao getDao() {
		// TODO Auto-generated method stub
		return this.userDao;
	}
	
	public User findByLoginName(String loginName) {
		// TODO Auto-generated method stub
		return this.getDao().findByLoginName(loginName);
	}
	
	@Override
	public void save(User user){
		/*super.save(user);*/
		this.userDao.save(user);
	}
	
	public User getCurrUser(){
		ShiroUser user = (ShiroUser)SecurityUtils.getSubject().getPrincipal();
		if(user!=null)
			return this.getDao().findOne(user.getId());
		return null;	
	}
}
