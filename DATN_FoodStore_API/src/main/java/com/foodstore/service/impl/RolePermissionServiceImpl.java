package com.foodstore.service.impl;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.foodstore.dao.RolePermissionDAO;
import com.foodstore.model.transaction.RolePermission;
import com.foodstore.service.RolePermissionService;

@Service
public class RolePermissionServiceImpl implements RolePermissionService {

	@Autowired
	private RolePermissionDAO rolePermissionDAO;

	@Override
	public RolePermission getById(Long id) {
		Optional<RolePermission> result = rolePermissionDAO.findById(id);
		return result.isPresent() ? result.get() : null;
	}

	@Override
	public List<RolePermission> getAll() {
		return rolePermissionDAO.findAll();
	}

	@Transactional(rollbackOn = { Throwable.class })
	@Override
	public RolePermission create(RolePermission cart) {
		return rolePermissionDAO.save(cart);
	}

	@Transactional(rollbackOn = { Throwable.class })
	@Override
	public RolePermission update(RolePermission cart) {
		return rolePermissionDAO.save(cart);
	}

	@Transactional(rollbackOn = { Throwable.class })
	@Override
	public void delete(Long id) {
		if (id != null) {
			rolePermissionDAO.deleteById(id);
		}
	}
}
