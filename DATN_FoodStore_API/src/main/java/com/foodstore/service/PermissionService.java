package com.foodstore.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.foodstore.model.entity.Permission;


@Service
public interface PermissionService extends IService<Permission> {

	List<Permission> getByIsDisplay();

	Permission getByNameAndDisplayName(String name, String displayName);

	void deleteLogical(Long id) throws Exception;

}
