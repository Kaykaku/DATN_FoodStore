package com.foodstore.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.foodstore.dao.RolePermissionDAO;
import com.foodstore.model.transaction.RolePermission;
import com.foodstore.service.RolePermissionService;

@Service
public class RolePermissionServiceImpl implements RolePermissionService {

	@Autowired 
	private RolePermissionDAO rolePermissionDAO;
	
	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public RolePermission getById(Long id) {
		return rolePermissionDAO.findById(id).orElse(null);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public List<RolePermission> getAll() {
		return rolePermissionDAO.findAll();
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public RolePermission create(RolePermission entiy) {
		return rolePermissionDAO.save(entiy);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public RolePermission update(RolePermission entiy) {
		return rolePermissionDAO.save(entiy);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public void delete(Long id) {
		rolePermissionDAO.deleteById(id);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Page<RolePermission> getAll(Pageable pageable) {
		return rolePermissionDAO.findAll(pageable);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Page<RolePermission> getByPermissionId(Pageable pageable, Long id) {
		return rolePermissionDAO.findByPermissionId(pageable,id);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Page<RolePermission> getByRoleId(Pageable pageable, Long id) {
		return rolePermissionDAO.findByRoleId(pageable,id);
	}
	
	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Page<RolePermission> getByDisplayStatus(Pageable pageable, boolean isDisplay) {
		return rolePermissionDAO.findByDisplayStatus(pageable,isDisplay);
	}

	@Override
	public RolePermission getByRoleIdAndPermissionId(Long roleId, Long permissionId) {
		return rolePermissionDAO.findByRoleIdAndPermissionId(roleId,permissionId).orElse(null);
	}
}
