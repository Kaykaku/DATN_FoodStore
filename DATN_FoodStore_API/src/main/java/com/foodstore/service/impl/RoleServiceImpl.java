package com.foodstore.service.impl;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.foodstore.dao.RoleDAO;
import com.foodstore.model.entity.Role;
import com.foodstore.service.RoleService;
import com.foodstore.util.constraints.Display;
import com.foodstore.util.convert.Convert;

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
	
	@SuppressWarnings("unchecked")
	@Override
	public Page<Role> getByFilter(String keyword, Optional<Long> create_date, Optional<Long> create_by,
			Optional<Boolean> is_display, Pageable pageable) {
		List<Role> list = roleDAO.findByKeyword(keyword.trim());
		if(create_date.isPresent()) list = list.stream().filter(o-> o.getCreate_date()==null || o.getCreate_date().getTime() >= create_date.get()).toList();
		if(create_by.isPresent()) list = list.stream().filter(o->o.getCreate_by()==null || o.getCreate_by() == create_by.get()).toList();
		if(is_display.isPresent()) list = list.stream().filter(o-> o.is_display() == is_display.get()).toList();
		Page<Role> page =(Page<Role>) Convert.toPage(list, pageable);
		return page ;
	}
}
