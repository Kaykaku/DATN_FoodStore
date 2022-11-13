package com.foodstore.service.impl;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.foodstore.dao.UserRoleDAO;
import com.foodstore.model.transaction.UserRole;
import com.foodstore.service.UserRoleService;

@Service
public class UserRoleServiceImpl implements UserRoleService {
	
	@Autowired
	private UserRoleDAO userRoleDAO;

	@Override
	public UserRole getById(Long id) {
		Optional<UserRole> result = userRoleDAO.findById(id);
		return result.isPresent() ? result.get() : null;
	}

	@Override
	public List<UserRole> getAll() {
		return userRoleDAO.findAll();
	}

	@Transactional(rollbackOn = { Throwable.class })
	@Override
	public UserRole create(UserRole cart) {
		return userRoleDAO.save(cart);
	}

	@Transactional(rollbackOn = { Throwable.class })
	@Override
	public UserRole update(UserRole cart) {
		return userRoleDAO.save(cart);
	}

	@Transactional(rollbackOn = { Throwable.class })
	@Override
	public void delete(Long id) {
		if (id != null) {
			userRoleDAO.deleteById(id);
		}
	}

}
