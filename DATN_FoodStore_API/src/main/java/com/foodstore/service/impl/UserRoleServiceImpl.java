package com.foodstore.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.foodstore.dao.UserRoleDAO;
import com.foodstore.model.transaction.UserRole;
import com.foodstore.service.UserRoleService;

@Service
public class UserRoleServiceImpl implements UserRoleService {
	
	@Autowired 
	private UserRoleDAO userRoleDAO;
	
	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public UserRole getById(Long id) {
		return userRoleDAO.findById(id).orElse(null);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public List<UserRole> getAll() {
		return userRoleDAO.findAll();
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public UserRole create(UserRole entiy) {
		return userRoleDAO.save(entiy);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public UserRole update(UserRole entiy) {
		return userRoleDAO.save(entiy);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public void delete(Long id) {
		userRoleDAO.deleteById(id);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Page<UserRole> getAll(Pageable pageable) {
		return userRoleDAO.findAll(pageable);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Page<UserRole> getByUserId(Pageable pageable, Long id) {
		return userRoleDAO.findByUserId(pageable,id);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Page<UserRole> getByRoleId(Pageable pageable, Long id) {
		return userRoleDAO.findByRoleId(pageable,id);
	}
	
	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Page<UserRole> getByDisplayStatus(Pageable pageable, boolean isDisplay) {
		return userRoleDAO.findByDisplayStatus(pageable,isDisplay);
	}

	@Override
	public UserRole getByUserIdAndRoleId(Long userId, Long roleId) {
		return userRoleDAO.findByUserIdAndRoleId(userId,roleId).orElse(null);
	}

}
