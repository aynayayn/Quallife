package edu.zstu.web.controller;

import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import edu.zstu.web.service.ShiroDbRealm;

@Controller
@RequestMapping(value="/login")
public class LoginController {	
	@RequestMapping(method = RequestMethod.GET)
	public String Login(){
		ShiroDbRealm.ShiroUser user = (ShiroDbRealm.ShiroUser) SecurityUtils.getSubject().getPrincipal();
		if(user!=null)
			SecurityUtils.getSubject().logout();
		return "/login";
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String Login(@RequestParam String username,Model model){
		Map map = model.asMap();
        for (Object key:map.keySet()){
            System.out.println(map.get(key));
        };
		model.addAttribute("loginName",username);
		return "/login";
		
	}
}
