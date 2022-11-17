package com.foodstore.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.foodstore.model.entity.Permission;

@Repository
public interface PermissionDAO extends JpaRepository<Permission, Long> {

	@Query("SELECT p FROM Permission p WHERE p.is_display = ?1")
	List<Permission> findByIsDisplay(Boolean isDisplay);

	@Query("SELECT p FROM Permission p WHERE p.name = ?1 AND p.display_name = ?2 AND p.is_display = ?3")
	Permission findByNameAndDisplayName(String name, String displayName, Boolean isDisplay);

	@Modifying(clearAutomatically = true)
	@Query("UPDATE Permission p SET p.is_display = ?1 WHERE p.id = ?2")
	void deleteLogical(Boolean isDisplay, Long id);

}
