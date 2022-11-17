package com.foodstore.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.foodstore.model.entity.Role;

@Service
public interface RoleService extends IService<Role> {
	List<Role> getByIsDisplay();

	Role getByNameAndDisplayName(String name, String displayName);

	void deleteLogical(Long id) throws Exception;
}
