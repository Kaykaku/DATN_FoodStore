package com.foodstore.service.impl;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.foodstore.dao.UserPermissionDAO;
import com.foodstore.model.transaction.UserPermission;
import com.foodstore.service.UserPermissionService;

@Service
public class UserPermissionServiceImpl implements UserPermissionService {

	@Autowired
	private UserPermissionDAO userPermissionDAO;

	@Override
	public UserPermission getById(Long id) {
		Optional<UserPermission> result = userPermissionDAO.findById(id);
		return result.isPresent() ? result.get() : null;
	}

	@Override
	public List<UserPermission> getAll() {
		return userPermissionDAO.findAll();
	}

	@Transactional(rollbackOn = { Throwable.class })
	@Override
	public UserPermission create(UserPermission cart) {
		return userPermissionDAO.save(cart);
	}

	@Transactional(rollbackOn = { Throwable.class })
	@Override
	public UserPermission update(UserPermission cart) {
		return userPermissionDAO.save(cart);
	}

	@Transactional(rollbackOn = { Throwable.class })
	@Override
	public void delete(Long id) {
		if (id != null) {
			userPermissionDAO.deleteById(id);
		}
	}
}
