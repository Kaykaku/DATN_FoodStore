package com.foodstore.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.foodstore.model.entity.Role;

@Repository
public interface RoleDAO extends JpaRepository<Role, Long> {
	@Query("SELECT r FROM Role r WHERE r.is_display = ?1")
	List<Role> findByIsDisplay(Boolean isDisplay);

	@Query("SELECT r FROM Role r WHERE r.name = ?1 AND r.display_name = ?2 AND r.is_display = ?3")
	Role findByNameAndDisplayName(String name, String displayName, Boolean isDisplay);
	
	@Query("SELECT c FROM Role c WHERE c.name LIKE %?1% "
			+ "or c.display_name LIKE %?1%")
	List<Role> findByKeyword(String keyword);

	@Modifying(clearAutomatically = true)
	@Query("UPDATE Role r SET r.is_display = ?1 WHERE r.id = ?2")
	void deleteLogical(Boolean isDisplay, Long id);
}
