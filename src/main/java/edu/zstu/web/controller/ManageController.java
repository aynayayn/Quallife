package edu.zstu.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/wode")
public class ManageController {
	@RequestMapping(method = RequestMethod.GET)  
	public String Wode(){  
		return "wode";  
	}
}
