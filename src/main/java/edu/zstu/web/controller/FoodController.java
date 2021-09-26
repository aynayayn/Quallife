package edu.zstu.web.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import edu.zstu.web.entity.FileAttach;
import edu.zstu.web.entity.Food;
import edu.zstu.web.entity.FoodCollect;
import edu.zstu.web.entity.FoodSteps;
import edu.zstu.web.entity.User;
import edu.zstu.web.json.JsonReaderResponse;
import edu.zstu.web.service.FileAttachService;
import edu.zstu.web.service.FoodCollectService;
import edu.zstu.web.service.FoodService;
import edu.zstu.web.service.UserService;

@Controller
@RequestMapping(value="/food")
public class FoodController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private FoodService foodService;
	@Autowired
	private FileAttachService fileAttachService;
	@Autowired
	private FoodCollectService foodCollectService;
	
	@RequestMapping(value="/deploy",method=RequestMethod.POST)
	public String deploy(
			@RequestParam("picFile")CommonsMultipartFile[] files,@RequestParam("stepDesc")String[] stepDescs,
			@RequestParam("foodName")String foodName,@RequestParam("foodMaterial")String foodMaterial,
			@RequestParam("stepNumber")Integer steps,HttpServletRequest request
			){
		System.out.println(files);
		System.out.println(stepDescs);
		System.out.println(foodName);
		System.out.println(foodMaterial);
		System.out.println(steps);
		
		/*新建Food记录*/
		Food food = new Food();
		food.setFoodName(foodName);
		food.setFoodMaterial(foodMaterial);
		food.setSteps(steps);
		food.setDeployDate(new Date());
		food.setLikes(0);
		food.setUser(this.userService.getCurrUser());
		
		/*处理第一张图片，即美食成品的图片*/
		String fileName = files[0].getOriginalFilename();
		String ext = fileName.substring(fileName.indexOf("."));
		String destFileName = System.currentTimeMillis()+ext;
		String path = request.getSession().getServletContext().getRealPath("/static/upload/"+destFileName);
		File destFile= new File(path);
		/*上传图片(美食成品)*/
		try{
			FileUtils.copyInputStreamToFile(files[0].getInputStream(), destFile);
		}catch(IOException e){
			e.printStackTrace();
		}
		/*保存图片(美食成品)*/
		FileAttach fileAttach = new FileAttach();
		fileAttach.setFileName(fileName);
		fileAttach.setExt(ext);
		//fileAttach.setFilePath(path);
		fileAttach.setFilePath("/static/upload/"+destFileName);
		this.fileAttachService.save(fileAttach);
		
		food.setFileAttach(fileAttach);
		
		/*处理美食步骤*/
		List<FoodSteps> list = new ArrayList<FoodSteps>();
		for(int i= 1;i<=steps;i++){
			FoodSteps item = new FoodSteps();
			item.setStepDesc(stepDescs[i-1]);
			item.setStepNo(i);
			
			/*处理图片*/
			fileName = files[i].getOriginalFilename();
			ext = fileName.substring(fileName.indexOf("."));
			destFileName = System.currentTimeMillis()+ext;
			path = request.getSession().getServletContext().getRealPath("/static/upload/"+destFileName);
			destFile= new File(path);
			/*上传图片*/
			try{
				FileUtils.copyInputStreamToFile(files[i].getInputStream(), destFile);
			}catch(IOException e){
				e.printStackTrace();
			}
			/*保存图片*/
			fileAttach = new FileAttach();
			fileAttach.setFileName(fileName);
			fileAttach.setExt(ext);
			//fileAttach.setFilePath(path);
			fileAttach.setFilePath("/static/upload/"+destFileName);
			this.fileAttachService.save(fileAttach);
			
			item.setFileAttach(fileAttach);
			list.add(item);
        }
		food.setFoodSteps(list);
		
		this.foodService.save(food);
		
		return "redirect:../food";
	}
	
	@RequestMapping(value="getFoodList",method=RequestMethod.GET)
	public @ResponseBody JsonReaderResponse<Food> getFoodList(
			@RequestParam(value="pageNumber",defaultValue="1") int pageNumber,
			@RequestParam(value="pageSize",defaultValue="5") int pageSize,
			@RequestParam(value="sort", defaultValue="") String sort,
			@RequestParam(value="foodName", defaultValue="") String foodName,
			@RequestParam(value="deployUser", defaultValue="") String deployUser,
			@RequestParam(value="startDate", defaultValue="") String startDate,
			@RequestParam(value="endDate", defaultValue="") String endDate
			)throws ParseException{
		Map<String,Object> searchParams = new HashMap<String,Object>();
		if(StringUtils.isNotBlank(foodName)){
			searchParams.put("LIKE_foodName",foodName);
		}
		if(StringUtils.isNotBlank(deployUser)){
			searchParams.put("LIKE_user.loginName", deployUser);
		}
		if(StringUtils.isNotBlank(startDate)){
			searchParams.put("GTE_deployDate", startDate);
		}
		if(StringUtils.isNotBlank(endDate)){
			searchParams.put("LT_deployDate", endDate);
		}
		
		Page<Food> list = this.foodService.getList(searchParams,pageNumber,pageSize,sort,Food.class);
		//list.getContent();
		
		return new JsonReaderResponse<Food>(list,pageSize,pageNumber);
	}
	
	/**
	 * Ajax请求增加点赞数
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "foodLikes")
	public @ResponseBody boolean foodLikes(@RequestParam("id") Long id){
		if(id!=null && id.longValue()!=0){
			Food food = this.foodService.findOne(id);
			if(food!=null){
				Integer likes = food.getLikes();
				if(likes == null){
					likes = new Integer(0);
				}
				food.setLikes(likes+1);
				this.foodService.save(food);
			}
		}
		return true;
	}
	
	/**
	 * Ajax请求添加收藏
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "addCollect")
	public @ResponseBody boolean addCollect(@RequestParam("id")Long id){
		User user = this.userService.getCurrUser();
		if(user!=null){
			Food food = this.foodService.findOne(id);
			if(food!=null){
				FoodCollect collect = new FoodCollect();
				collect.setFood(food);
				collect.setUser(user);
				this.foodCollectService.save(collect);
				return true;
			}
		}
		return false;
	}
	
	/**
	 * Ajax请求取消收藏
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "cancelCollect")
	public @ResponseBody boolean cancelCollect(@RequestParam("id") Long id){
		User user = this.userService.getCurrUser();
		if(user!=null){
			Food food = this.foodService.findOne(id);
			if(food!=null){
				List<FoodCollect> collect = this.foodCollectService.findByUserAndFood(user,food);
				this.foodCollectService.delete(collect.get(0).getId());
				return true;
			}
		}
		return false;
	}
}
