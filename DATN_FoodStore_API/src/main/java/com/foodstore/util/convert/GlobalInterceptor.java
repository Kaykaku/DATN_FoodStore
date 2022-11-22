package com.foodstore.util.convert;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.foodstore.service.CategoryService;

@Component
public class GlobalInterceptor implements HandlerInterceptor{
	@Autowired private CategoryService cateService;
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		request.setAttribute("cates", cateService.getAll());
		String username = request.getRemoteUser();
		if(username!=null) {
			request.setAttribute("news",new ArrayList<>());
		}
	}
}
