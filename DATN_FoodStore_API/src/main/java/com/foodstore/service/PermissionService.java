package com.foodstore.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.foodstore.model.entity.Permission;


@Service
public interface PermissionService extends IService<Permission> {

	List<Permission> getByIsDisplay();

	Permission getByNameAndDisplayName(String name, String displayName);

	void deleteLogical(Long id) throws Exception;

	Page<Permission> getByFilter(String keyword,Optional<Boolean> is_display, Pageable pageable);
	
	List<Permission> getByFilter(String keyword,Optional<Boolean> is_display);
}
