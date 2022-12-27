package com.foodstore.util.convert;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.foodstore.model.entity.Customer;
import com.foodstore.model.entity.User;
import com.foodstore.model.extend.History;
import com.foodstore.service.CustomerService;
import com.foodstore.service.HistoryService;
import com.foodstore.service.UserService;

@Service
public class RemoteCurrentUser {
	@Autowired
	private HistoryService historyService;
	@Autowired
	private UserService userService;
	@Autowired
	private CustomerService customerService;
	
	public  Customer getCurrentCustomer() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String currentUserName = authentication.getName();
		Customer c = customerService.getByUsername(currentUserName);
		return c==null ? new Customer():c;
	}
	
	public  User getCurrentUser() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if(authentication == null) return null;
		String currentUserName = authentication.getName();
		User u = userService.getByUsername(currentUserName);
		return u==null ? new User():u;
	}
	
	public  void createHistory(String mess,String tableName , long record) {
		History history = new History();
		history.setUser_h(getCurrentUser().getId() != null ? getCurrentUser() : userService.getById(1L));
		history.setRecord_id(record);
		history.setTable_name(tableName);
		history.setMemo(mess);
		historyService.create(history);
	}
}
