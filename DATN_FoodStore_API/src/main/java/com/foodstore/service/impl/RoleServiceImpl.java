package com.foodstore.service.impl;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.foodstore.dao.RoleDAO;
import com.foodstore.model.entity.Role;
import com.foodstore.service.RoleService;

@Service
public class RoleServiceImpl implements RoleService {

	@Autowired
	private RoleDAO roleDAO;

	@Override
	public Role getById(Long id) {
		Optional<Role> result = roleDAO.findById(id);
		return result.isPresent() ? result.get() : null;
	}

	@Override
	public List<Role> getAll() {
		return roleDAO.findAll();
	}

	@Transactional(rollbackOn = { Throwable.class })
	@Override
	public Role create(Role cart) {
		return roleDAO.save(cart);
	}

	@Transactional(rollbackOn = { Throwable.class })
	@Override
	public Role update(Role cart) {
		return roleDAO.save(cart);
	}

	@Transactional(rollbackOn = { Throwable.class })
	@Override
	public void delete(Long id) {
		if (id != null) {
			roleDAO.deleteById(id);
		}
	}

}
