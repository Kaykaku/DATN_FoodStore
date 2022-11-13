package com.foodstore.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.foodstore.model.extend.Notification;


@Service
public interface NotificationService extends IService<Notification> {	
	Page<Notification> getByCustomerId(Pageable pageable,Long id);
	
	Page<Notification> getBySeenStatus(Pageable pageable,boolean isSeen);
	
	Page<Notification> findByTableName(Pageable pageable,String table_name);
}
