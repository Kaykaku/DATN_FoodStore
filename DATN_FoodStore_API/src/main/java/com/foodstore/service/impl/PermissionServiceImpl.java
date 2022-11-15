package com.foodstore.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.foodstore.dao.PermissionDAO;
import com.foodstore.model.entity.Permission;
import com.foodstore.service.PermissionService;

@Service
public class PermissionServiceImpl implements PermissionService {

	@Autowired
	private PermissionDAO permissionDAO;

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public Permission getById(Long id) {
		return permissionDAO.findById(id).orElse(null);
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public List<Permission> getAll() {
		return permissionDAO.findAll();
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public Permission create(Permission entiy) {
		return permissionDAO.save(entiy);
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public Permission update(Permission entiy) {
		return permissionDAO.save(entiy);
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public void delete(Long id) {
		permissionDAO.deleteById(id);
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public Page<Permission> getAll(int pageSize, int pageNumber) {
		return permissionDAO.findAll(PageRequest.of(pageNumber - 1, pageSize));
	}
}
