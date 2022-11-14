package com.foodstore.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.foodstore.dao.UserDAO;
import com.foodstore.model.entity.User;
import com.foodstore.service.UserService;
import com.foodstore.util.constraints.Display;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO userDAO;

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public User getById(Long id) {
		return userDAO.findById(id).orElse(null);
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public List<User> getAll() {
		return userDAO.findAll();
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public User create(User entiy) {
		return userDAO.save(entiy);
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public User update(User entiy) {
		return userDAO.save(entiy);
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public void delete(Long id) {
		userDAO.deleteById(id);
	}

	@Override
	public Page<User> getAll(int pageSize, int pageNumber) {
		return userDAO.findAll(PageRequest.of(pageNumber - 1, pageSize));
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public List<User> getByIsDisPlay() {
		return userDAO.findByIsDisplay(Display.SHOW);
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public Page<User> getByIsDisplay(int pageSize, int pageNumber) throws Exception {
		if (pageNumber >= 1) {
			return userDAO.findByIsDisplay(Display.SHOW, PageRequest.of(pageNumber - 1, pageSize));
		} else {
			throw new Exception("Số trang phải lớn hơn 0!");
		}
	}
}
