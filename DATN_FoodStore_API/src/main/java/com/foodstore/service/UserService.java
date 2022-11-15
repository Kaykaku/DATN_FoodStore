package com.foodstore.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import com.foodstore.model.entity.User;

@Service
public interface UserService extends IService<User> {
	List<User> getByIsDisPlay();

	Page<User> getByIsDisplay(int pageSize, int pageNumber) throws Exception;
}
