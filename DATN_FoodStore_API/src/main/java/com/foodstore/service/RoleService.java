package com.foodstore.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.foodstore.model.entity.Role;

@Service
public interface RoleService extends IService<Role> {
	List<Role> getByIsDisplay();

	Role getByNameAndDisplayName(String name, String displayName);

	void deleteLogical(Long id) throws Exception;
	
	Page<Role> getByFilter(String keyword, Optional<Long> create_date, Optional<Long> create_by,
			Optional<Boolean> is_display, Pageable pageable);
}
