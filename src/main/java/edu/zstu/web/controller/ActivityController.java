package edu.zstu.web.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import edu.zstu.web.entity.Activity;
import edu.zstu.web.entity.ActivityFile;
import edu.zstu.web.entity.ActivityOrder;
import edu.zstu.web.entity.FileAttach;
import edu.zstu.web.entity.Food;
import edu.zstu.web.entity.User;
import edu.zstu.web.json.JsonReaderResponse;
import edu.zstu.web.service.ActivityFileService;
import edu.zstu.web.service.ActivityOrderService;
import edu.zstu.web.service.ActivityService;
import edu.zstu.web.service.FileAttachService;
import edu.zstu.web.service.UserService;

@Controller
@RequestMapping(value="/activity")
public class ActivityController {
	@Autowired
	private ActivityService activityService;
	@Autowired
	private ActivityFileService activityFileService;
	@Autowired
	private ActivityOrderService activityOrderService;
	@Autowired
	private UserService userService;
	@Autowired
	private FileAttachService fileAttachService;
	
	@RequestMapping(value="/deploy",method=RequestMethod.POST)
	public String deploy(
			@RequestParam("picFile")CommonsMultipartFile[] files,@RequestParam("activityName")String activityName,
			@RequestParam("activityDesc")String activityDesc,@RequestParam("province")String province,
			@RequestParam("city")String city,@RequestParam("country")String country,
			@RequestParam("activityAddress")String activityAddress,@RequestParam("activityStartTime")String activityStartTime,
			@RequestParam("activityEndTime")String activityEndTime,HttpServletRequest request
			) throws ParseException{
		System.out.println(files.length);
		System.out.println(activityName);
		System.out.println(activityDesc);
		System.out.println(province);
		System.out.println(city);
		System.out.println(country);
		System.out.println(activityAddress);
		System.out.println(activityStartTime);
		System.out.println(activityEndTime);
		
		Activity activity = new Activity();
		activity.setActivityName(activityName);
		activity.setActivityArea(city+country);
		activity.setDelpoyUser(this.userService.getCurrUser());
		activity.setDeployDate(new Date());
		//处理上传至后台的活动开始时间
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String sourceStartTime = activityStartTime.replace("T"," ");
		Date newStartTime = null;
		try {
			newStartTime = sdf.parse(sourceStartTime);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		activity.setStartDate(newStartTime);
		//处理上传至后台的活动结束时间
		//SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String sourceEndTime = activityEndTime.replace("T"," ");
		Date newEndTime = null;
		try {
			newEndTime = sdf.parse(sourceEndTime);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		activity.setEndDate(newEndTime);
		
		activity.setActivityDesc(activityDesc);
		activity.setActivityAddress(activityAddress);
		
		this.activityService.save(activity);
		
		FileAttach fileAttach = new FileAttach();
		String fileName;
		String ext;
		String destFileName;
		String path = "";
		File destFile = new File(path);
		ActivityFile activityFile = new ActivityFile();
		for(int i=0;i<files.length;i++){
			fileName = files[i].getOriginalFilename();
			ext = fileName.substring(fileName.indexOf("."));
			destFileName = System.currentTimeMillis()+ext;
			path = request.getSession().getServletContext().getRealPath("/static/uploadForActivity/"+destFileName);
			destFile = new File(path);
			
			try{
				FileUtils.copyInputStreamToFile(files[i].getInputStream(), destFile);
			}catch(IOException e){
				e.printStackTrace();
			}
			
			fileAttach = new FileAttach();
			fileAttach.setFileName(fileName);
			fileAttach.setExt(ext);
			fileAttach.setFilePath("/static/uploadForActivity/"+destFileName);
			this.fileAttachService.save(fileAttach);
			
			activityFile = new ActivityFile();
			activityFile.setActivity(activity);
			activityFile.setFileAttach(fileAttach);
			this.activityFileService.save(activityFile);
		}
		
		return "redirect:../activity";
	}
	
	@RequestMapping(value="showActivities",method=RequestMethod.GET)
	public @ResponseBody JsonReaderResponse<Activity> showActivities(
			@RequestParam(value="pageNumber",defaultValue="1") int pageNumber,
			@RequestParam(value="pageSize",defaultValue="6") int pageSize,
			@RequestParam(value="sort", defaultValue="") String sort,
			@RequestParam(value="activityName", defaultValue="") String activityName,
			@RequestParam(value="activityArea", defaultValue="") String activityArea,
			@RequestParam(value="startDate", defaultValue="") String startDate,
			@RequestParam(value="deployUser", defaultValue="") String deployUser,
			@RequestParam(value="id", defaultValue="") String id
			)throws ParseException{
		Map<String,Object> searchParams = new HashMap<String,Object>();
		if(StringUtils.isNotBlank(activityName)){
			searchParams.put("LIKE_activityName",activityName);
		}
		if(StringUtils.isNotBlank(activityArea)){
			searchParams.put("LIKE_activityArea",activityArea);
		}
		if(StringUtils.isNotBlank(startDate)){
			searchParams.put("LT_startDate", startDate);
		}
		if(StringUtils.isNotBlank(deployUser)){
			searchParams.put("LIKE_user.loginName", deployUser);
		}
		if(StringUtils.isNotBlank(id)){
			searchParams.put("EQ_id", id);
		}
		
		Page<Activity> list = this.activityService.getList(searchParams,pageNumber,pageSize,sort,Activity.class);
		//list.getContent();
		
		return new JsonReaderResponse<Activity>(list,pageSize,pageNumber);
	}

	/*@RequestMapping(value="/activity-image",method = RequestMethod.GET)
	public List<FileAttach> getAvtivityImage(@RequestParam(value = "id", defaultValue = "0") Long id){
		List<FileAttach> list = new ArrayList<FileAttach>();
		ActivityFile item = this.activityFileService.findOne(id);
		FileAttach e = this.fileAttachService.findOne(item.getId());
		list.add(e);
		return list;
	}*/
	
	@RequestMapping(value="/judgeOrder",method=RequestMethod.GET)
	public @ResponseBody boolean judgeIfOrder(@RequestParam(value="id",defaultValue="0")Long id){
		if(id!=null&&id.longValue()!=0){
			Activity activity = this.activityService.findOne(id);
			if(activity!=null){
				User user = this.userService.getCurrUser();
				if(user!=null){
					List<ActivityOrder> order = this.activityOrderService.findByUserAndActivity(user,activity);
					//判断order.size()是否大于0是必须的
					if(order!=null && order.size() > 0){
						return true;
					}
					else{
						return false;
					}
				}
			}
		}
		return false;	
	}
	
	@RequestMapping(value="addOrder")
	public @ResponseBody boolean addOrder(@RequestParam("id")Long id){
		User user = this.userService.getCurrUser();
		if(user!=null){
			Activity activity = this.activityService.findOne(id);
			if(activity!=null){
				ActivityOrder activityOrder = new ActivityOrder();
				activityOrder.setActivity(activity);
				activityOrder.setUser(user);
				this.activityOrderService.save(activityOrder);
				return true;
			}
		}
		return false;
	}
	
	@RequestMapping(value="cancelOrder")
	public @ResponseBody boolean cancelOrder(@RequestParam("id")Long id){
		User user = this.userService.getCurrUser();
		if(user!=null){
			Activity activity = this.activityService.findOne(id);
			if(activity!=null){
				List<ActivityOrder> orders = this.activityOrderService.findByUserAndActivity(user, activity);
				this.activityOrderService.delete(orders.get(0).getId());
				return true;
			}
		}
		return false;
	}
}
