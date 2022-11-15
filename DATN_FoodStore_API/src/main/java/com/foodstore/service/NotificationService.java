package com.foodstore.service;

import java.sql.Date;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.foodstore.model.extend.Notification;


@Service
public interface NotificationService extends IService<Notification> {	
	Page<Notification> getByCustomerId(Pageable pageable,Long id);
	
	Page<Notification> getBySeenStatus(Pageable pageable,boolean isSeen);
	
	Page<Notification> findByTableName(Pageable pageable,String table_name);
	
	Page<Notification> findByKeyword(Pageable pageable,String keyword);
	
	Page<Notification> findByFilter(Pageable pageable,String keyword , String table_name 
			, Optional<Long> customerId , Optional<Date> create_at 
			, Optional<Long> record_id ,Optional<Boolean> is_watched);
}
