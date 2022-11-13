package com.foodstore.service.impl;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.foodstore.dao.UserDAO;
import com.foodstore.model.entity.User;
import com.foodstore.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO userDAO;

	@Override
	public User getById(Long id) {
		Optional<User> result = userDAO.findById(id);
		return result.isPresent() ? result.get() : null;
	}

	@Override
	public List<User> getAll() {
		return userDAO.findAll();
	}

	@Transactional(rollbackOn = { Throwable.class })
	@Override
	public User create(User cart) {
		return userDAO.save(cart);
	}

	@Transactional(rollbackOn = { Throwable.class })
	@Override
	public User update(User cart) {
		return userDAO.save(cart);
	}

	@Transactional(rollbackOn = { Throwable.class })
	@Override
	public void delete(Long id) {
		if (id != null) {
			userDAO.deleteById(id);
		}
	}

}
