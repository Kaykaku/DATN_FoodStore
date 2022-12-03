package com.foodstore.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.foodstore.model.extend.Notification;


@Repository
public interface NotificationDAO extends JpaRepository<Notification, Long>{	
	@Query("Select n From Notification n Where n.customer_n.id=?1")
	Page<Notification> findByCustomerId(Long id,Pageable pageable);
	
	@Query("Select n From Notification n Where n.customer_n.id=?1")
	List<Notification> findByCustomerId(Long id);
	
	@Query("Select n From Notification n Where n.is_watched=?1")
	Page<Notification> findBySeenStatus(boolean isSeen,Pageable pageable);
	
	@Query("Select n From Notification n Where n.table_name like ?1")
	Page<Notification> findByTableName(String table_name,Pageable pageable);
	
	@Query("Select n From Notification n Where n.content like ?1")
	Page<Notification> findByKeyword(String keyword,Pageable pageable);
	
	@Query("Select n From Notification n Where n.content like ?1")
	List<Notification> findByKeyword(String keyword);
}
