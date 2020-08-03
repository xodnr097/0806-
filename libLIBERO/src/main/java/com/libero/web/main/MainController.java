package com.libero.web.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.libero.service.domain.Statistics;
import com.libero.service.statistics.StatisticsService;


@Controller
public class MainController {
	
	//Field
	@Autowired
	@Qualifier("statisticsServiceImpl")
	private StatisticsService statisticsService;
	
	//Constructor
	public MainController(){
		System.out.println(this.getClass());
	}
	
	@RequestMapping("/")
	public ModelAndView main() throws Exception {
	    System.out.println("MainContorller Start");
	    
	    List<Statistics> list = statisticsService.getMainStatistics();
	    
	    ModelAndView modelAndView = new ModelAndView();
	    modelAndView.addObject("list", list);
		modelAndView.setViewName("forward:home.jsp");
		
		return modelAndView;

	}

}
