package com.foodstore.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.foodstore.dao.RoleDAO;
import com.foodstore.model.entity.Role;
import com.foodstore.service.RoleService;
import com.foodstore.util.constraints.Display;

@Service
public class RoleServiceImpl implements RoleService {

	@Autowired private RoleDAO roleDAO;
	
	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Role getById(Long id) {
		return roleDAO.findById(id).orElse(null);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public List<Role> getAll() {
		return roleDAO.findAll();
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Role create(Role entiy) {
		return roleDAO.save(entiy);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Role update(Role entiy) {
		return roleDAO.save(entiy);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public void delete(Long id) {
		roleDAO.deleteById(id);
	}
	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Page<Role> getAll(Pageable pageable) {
		return roleDAO.findAll(pageable);
	}
	
	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public List<Role> getByIsDisplay() {
		return roleDAO.findByIsDisplay(Display.SHOW);
	}
	
	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Role getByNameAndDisplayName(String name, String displayName) {
		return roleDAO.findByNameAndDisplayName(name, displayName, Display.SHOW);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public void deleteLogical(Long id) throws Exception {
		roleDAO.deleteLogical(Display.HIDE, id);
	}
}
