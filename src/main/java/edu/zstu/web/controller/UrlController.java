package edu.zstu.web.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springside.modules.security.utils.Digests;
import org.springside.modules.utils.Encodes;

import com.fasterxml.jackson.databind.util.JSONPObject;

import edu.zstu.web.entity.*;
import edu.zstu.web.service.*;
import net.sf.json.JSONObject;

/**
 * 
 * @author ShelterWon
 *
 */
@Controller
public class UrlController{
	@Autowired
	private UserService userService;
	@Autowired
	private FoodService foodService;
	@Autowired
	private ActivityService activityService;
	@Autowired
	private FoodCollectService foodCollectService;
	@Autowired
	private ActivityOrderService activityOrderService;
	
    final static Logger LOGGER = LoggerFactory.getLogger(UrlController.class);
    
    @Autowired
    public void setUserService(UserService userService){
    	this.userService = userService;
    }
	
	@RequestMapping(value="/index",method = RequestMethod.GET)
	public String Index(){
		return "/index";
		//1) jsp为后缀的文件名，真正的显示页面【/这个符号多或少没有关系】；
		//2) 搜索栏里显示的路径由http://localhost:8081/demo【与mvc-config.xml中此设置有关<property name="prefix" value="/WEB-INF/view/"/>,代表到view这个层级是根目录(Demo)】/和根目录下的index.jsp中的value值组合来决定，且Request Mapping中的值组合起来要和index.jsp中的value完全对应【/这个符号多或少没有关系】
		//3) 1）和2）同时正确的基础上，1）和2）没有关系
	}
	
	//下面第一行的food与a标签的href属性值对应起来；return中的内容是找到food页面的路径
	@RequestMapping(value="/food",method = RequestMethod.GET)  
	public String Food(){  
		LOGGER.info("mapping->food");
		return "/food";  
	}
	
	@RequestMapping(value="/activity",method = RequestMethod.GET)  
	public String Activity(){  
		return "/activity";  
	}
	
	@RequestMapping(value="/register",method = RequestMethod.GET)
	public String Register(){
		return "/register";
	}
	
	/**
	 * 获取当前登录用户
	 * 
	 * @return
	 */
	@RequestMapping(value="/getCurrUser",method = RequestMethod.GET)
	public @ResponseBody User getCurrUser(){
		return this.userService.getCurrUser();
	}
	/**
	 * 检查用户名(注册邮箱)是否存在
	 * @return boolean
	 * 存在返回false，不存在返回true
	 */
	@RequestMapping(value="/checkLoginName",method = RequestMethod.GET)
	public @ResponseBody boolean checkLoginName(@RequestParam(value="loginName")String loginName){
		User user=this.userService.findByLoginName(loginName);
		if(user!=null)
			return false;
		return true;
	}
	
	@RequestMapping(value="/userRegister",method = RequestMethod.POST)
	public @ResponseBody String userRegister(@RequestBody User user){
		User oUser = this.userService.findByLoginName(user.getLoginName());
		if(oUser!=null)
			return "{\"success\":false,\"msg\":\"该电子邮件已注册！\"}";
		else{
			byte[] salts=Digests.generateSalt(8);
			String salt = Encodes.encodeHex(salts);
			user.setSalt(salt);
			byte[] hashPassword=Digests.sha1(user.getPassword().getBytes(),salts,1024);
			String password=Encodes.encodeHex(hashPassword);
			user.setPassword(password);
			this.userService.save(user);
			return "{\"success\":true,\"msg\":\"注册成功！\"}";
		}
	}
	
	@RequestMapping(value="changePassword",method = RequestMethod.POST)
	public @ResponseBody String changePassword(@RequestBody String data){
		JSONObject obj = JSONObject.fromObject(data);
		String oPsw = obj.getString("originalPassword");
		String nPsw = obj.getString("newPassword");
		System.out.println(oPsw);
		System.out.println(nPsw);
		User user = this.userService.getCurrUser();
		if(user!=null){
			//校验用户提交过来的originalPassword是否与数据库里保存的密码一致
			String salt = user.getSalt();
			byte[] salts = Encodes.decodeHex(salt);
			byte[] submitHashPsw = Digests.sha1(oPsw.getBytes(),salts,1024);
			String submitPsw = Encodes.encodeHex(submitHashPsw);
			System.out.println(submitPsw);
			String oPswInDatabase = user.getPassword();
			System.out.println(oPswInDatabase);
			
			if(submitPsw.equals(oPswInDatabase)){
				byte[] newSalts=Digests.generateSalt(8);
				String newSalt = Encodes.encodeHex(newSalts);
				user.setSalt(newSalt);
				byte[] hashPassword=Digests.sha1(nPsw.getBytes(),newSalts,1024);
				String newPassword=Encodes.encodeHex(hashPassword);
				user.setPassword(newPassword);
				this.userService.save(user);
				return "{\"success\":true,\"msg\":\"密码修改成功\"}";
			}
			else{
				return "{\"success\":false,\"msg\":\"提交的旧密码与数据库数据不匹配，校验不通过，请重新填写表单\"}";
			}
		}
		return null;
	}
	
    /*
	@RequestMapping(value="/checkIfMatch",method = RequestMethod.POST)
	public @ResponseBody boolean checkIfMatch(User submitInfo){
		User user=this.userService.findByLoginName(submitInfo.getLoginName());
		if(user == null)
			return false;
		else{
			String salt = user.getSalt();
			byte[] salts = Encodes.decodeHex(salt);
			byte[] submitHashPsw = Digests.sha1(submitInfo.getPassword().getBytes(),salts,1024);
			String submitPsw = Encodes.encodeHex(submitHashPsw);
			System.out.println(submitPsw);
			
			String password = user.getPassword();
			System.out.println(password);
			
			if(submitPsw.equals(password))
				return true;
			else
				return false;
		}
	}
	*/
	
	@RequestMapping(value="/food-detail",method = RequestMethod.GET)  
	public String FoodDetail(@RequestParam(value = "id", defaultValue = "0") Long id, Model model){  
		if(id != null && id.longValue() != 0){
			Food food = this.foodService.findOne(id);
			//只有在查询到的food不为空的情况下
			if(food != null){
				model.addAttribute("food", food);
				//获取当前登陆账号
				User user = this.userService.getCurrUser();
				if(user != null){
					//去food_collect表中取对应user_id的收藏美食
					//返回List<FoodCollect>是为了提高容错性
					List<FoodCollect> collects = this.foodCollectService.findByUserAndFood(user,food);
					if(collects != null && collects.size() > 0){
						model.addAttribute("collectFlag",true);
					}
					else{
						model.addAttribute("collectFlag",false);
					}
				}
				//登陆都没有登陆过，收藏肯定为空
				else{
					model.addAttribute("collectFlag",false);
				}
			}
		}
		return "/food-detail";  
	}
	
	@RequestMapping(value="/getFoodCollectList",method = RequestMethod.GET)
	public @ResponseBody List<FoodCollect> getFoodCollectList(){
		User user = this.userService.getCurrUser();
		if(user!=null){
			List<FoodCollect> list = this.foodCollectService.findByUser(user);
			return list;
		}
		return null;
	}
	
	@RequestMapping(value="/getActivityOrderList",method = RequestMethod.GET)
	public @ResponseBody List<Activity> getActivityOrderList(){
		User user = this.userService.getCurrUser();
		if(user!=null){
			List<Activity> list = this.activityOrderService.findByUser(user);
			return list;
		}
		return null;
	}
}