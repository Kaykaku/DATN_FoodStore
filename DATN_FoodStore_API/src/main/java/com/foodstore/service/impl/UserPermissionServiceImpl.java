package com.foodstore.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.foodstore.dao.UserPermissionDAO;
import com.foodstore.model.transaction.UserPermission;
import com.foodstore.service.UserPermissionService;

@Service
public class UserPermissionServiceImpl implements UserPermissionService {

	@Autowired 
	private UserPermissionDAO userPermissionDAO;
	
	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public UserPermission getById(Long id) {
		return userPermissionDAO.findById(id).orElse(null);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public List<UserPermission> getAll() {
		return userPermissionDAO.findAll();
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public UserPermission create(UserPermission entiy) {
		return userPermissionDAO.save(entiy);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public UserPermission update(UserPermission entiy) {
		return userPermissionDAO.save(entiy);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public void delete(Long id) {
		userPermissionDAO.deleteById(id);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Page<UserPermission> getAll(Pageable pageable) {
		return userPermissionDAO.findAll(pageable);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Page<UserPermission> getByUserId(Pageable pageable, Long id) {
		return userPermissionDAO.findByUserId(pageable,id);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Page<UserPermission> getByPermissionId(Pageable pageable, Long id) {
		return userPermissionDAO.findByPermissionId(pageable,id);
	}
	
	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Page<UserPermission> getByDisplayStatus(Pageable pageable, boolean isDisplay) {
		return userPermissionDAO.findByDisplayStatus(pageable,isDisplay);
	}

	@Override
	public UserPermission getByUserIdAndPermissionId(Long userId, Long permissionId) {
		return userPermissionDAO.findByUserIdAndPermissionId(userId,permissionId).orElse(null);
	}

}
