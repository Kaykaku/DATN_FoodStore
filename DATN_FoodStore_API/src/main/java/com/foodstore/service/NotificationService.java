package com.foodstore.service;

import java.sql.Date;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.foodstore.model.extend.Notification;


@Service
public interface NotificationService extends IService<Notification> {	
	Page<Notification> getByCustomerId(Long id,Pageable pageable);
	
	Page<Notification> getBySeenStatus(boolean isSeen,Pageable pageable);
	
	Page<Notification> findByTableName(String table_name,Pageable pageable);
	
	Page<Notification> findByKeyword(String keyword,Pageable pageable);
	
	Page<Notification> findByFilter(String keyword , String table_name 
			, Optional<Long> customerId , Optional<Date> create_at 
			, Optional<Long> record_id ,Optional<Boolean> is_watched,Pageable pageable);
}
