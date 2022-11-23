package com.foodstore.service.impl;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.foodstore.dao.PermissionDAO;
import com.foodstore.model.entity.Permission;
import com.foodstore.service.PermissionService;
import com.foodstore.util.constraints.Display;
import com.foodstore.util.convert.Convert;

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
	public Page<Permission> getAll(Pageable pageable) {
		return permissionDAO.findAll(pageable);
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public List<Permission> getByIsDisplay() {
		return permissionDAO.findByIsDisplay(Display.SHOW);
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public Permission getByNameAndDisplayName(String name, String displayName) {
		return permissionDAO.findByNameAndDisplayName(name, displayName, Display.SHOW);
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public void deleteLogical(Long id) throws Exception {
		permissionDAO.deleteLogical(Display.HIDE, id);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public Page<Permission> getByFilter(String keyword,Optional<Boolean> is_display, Pageable pageable) {
		List<Permission> list = permissionDAO.findByKeyword(keyword.trim());
		if(is_display.isPresent()) list = list.stream().filter(o-> o.is_display() == is_display.get()).toList();
		Page<Permission> page =(Page<Permission>) Convert.toPage(list, pageable);
		return page ;
	}
	
	@Override
	public List<Permission> getByFilter(String keyword,Optional<Boolean> is_display) {
		List<Permission> list = permissionDAO.findByKeyword(keyword.trim());
		if(is_display.isPresent()) list = list.stream().filter(o-> o.is_display() == is_display.get()).toList();
		return list;
	}
}
