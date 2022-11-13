package com.foodstore.service.impl;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.foodstore.dao.PermissionDAO;
import com.foodstore.model.entity.Permission;
import com.foodstore.service.PermissionService;

@Service
public class PermissionServiceImpl implements PermissionService {

	@Autowired
	private PermissionDAO permissionDAO;

	@Override
	public Permission getById(Long id) {
		Optional<Permission> result = permissionDAO.findById(id);
		return result.isPresent() ? result.get() : null;
	}

	@Override
	public List<Permission> getAll() {
		return permissionDAO.findAll();
	}

	@Transactional(rollbackOn = { Throwable.class })
	@Override
	public Permission create(Permission cart) {
		return permissionDAO.save(cart);
	}

	@Transactional(rollbackOn = { Throwable.class })
	@Override
	public Permission update(Permission cart) {
		return permissionDAO.save(cart);
	}

	@Transactional(rollbackOn = { Throwable.class })
	@Override
	public void delete(Long id) {
		if (id != null) {
			permissionDAO.deleteById(id);
		}
	}

}
