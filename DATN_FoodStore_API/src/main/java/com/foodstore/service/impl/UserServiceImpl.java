package com.foodstore.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.foodstore.dao.UserDAO;
import com.foodstore.model.entity.User;
import com.foodstore.service.UserService;
import com.foodstore.util.constraints.Display;

@Service
public class UserServiceImpl implements UserService {

	@Autowired private UserDAO userDAO;
	
	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public User getById(Long id) {
		return userDAO.findById(id).orElse(null);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public List<User> getAll() {
		return userDAO.findAll();
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public User create(User entiy) {
		return userDAO.save(entiy);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public User update(User entiy) {
		return userDAO.save(entiy);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public void delete(Long id) {
		userDAO.deleteById(id);
	}

	@Override
	public Page<User> getAll(Pageable pageable) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public List<User> getByIsDisPlay() {
		return userDAO.findByIsDisplay(Display.SHOW);
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public Page<User> getByIsDisplay(Pageable pageable) throws Exception {
		return userDAO.findByIsDisplay(Display.SHOW, pageable);
	}
	
	@Override
	public User getByUsername(String username) {
		return userDAO.findByUsername(username, Display.SHOW);
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public void deleteLogical(Long id) throws Exception {
		userDAO.deleteLogical(Display.HIDE, id);
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public Page<User> getByKeyword(String keyword, Pageable pageable) throws Exception {
		return userDAO.findByKeyword(keyword, Display.SHOW, pageable);
	}
}
