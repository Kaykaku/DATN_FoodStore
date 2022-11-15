package com.foodstore.service.impl;

import java.sql.Date;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.foodstore.dao.NotificationDAO;
import com.foodstore.model.extend.Notification;
import com.foodstore.service.NotificationService;

@Service
public class NotificationServiceImpl implements NotificationService {
	@Autowired private NotificationDAO notificationDAO;
	
	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Notification getById(Long id) {
		return notificationDAO.findById(id).orElse(null);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public List<Notification> getAll() {
		return notificationDAO.findAll();
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Notification create(Notification entiy) {
		return notificationDAO.save(entiy);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Notification update(Notification entiy) {
		return notificationDAO.save(entiy);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public void delete(Long id) {
		notificationDAO.deleteById(id);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Page<Notification> getAll(Pageable pageable) {
		return notificationDAO.findAll(pageable);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Page<Notification> getByCustomerId(Pageable pageable, Long id) {
		return notificationDAO.findByCustomerId(pageable,id);
	}
	
	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Page<Notification> getBySeenStatus(Pageable pageable, boolean isSeen) {
		return notificationDAO.findBySeenStatus(pageable,isSeen);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Page<Notification> findByTableName(Pageable pageable,String table_name) {
		return notificationDAO.findByTableName(pageable,table_name);
	}

	@Override
	public Page<Notification> findByKeyword(Pageable pageable, String keyword) {
		return notificationDAO.findByKeyword(pageable, keyword);
	}

	@Override
	public Page<Notification> findByFilter(Pageable pageable, String keyword, String table_name,
			Optional<Long> customerId, Optional<Date> create_at, Optional<Long> record_id,
			Optional<Boolean> is_watched) {
		List<Notification> list = notificationDAO.findByKeyword(keyword);
		if(table_name==null) list = list.stream().filter(o-> o.getTable_name().equalsIgnoreCase(table_name)).collect(Collectors.toList());
		if(customerId.isPresent()) list = list.stream().filter(o-> o.getCustomer_n().getId() == customerId.get()).collect(Collectors.toList());
		if(create_at.isPresent()) list = list.stream().filter(o-> o.getCreate_at() == create_at.get()).collect(Collectors.toList());
		if(record_id.isPresent()) list = list.stream().filter(o-> o.getRecord_id() == record_id.get()).collect(Collectors.toList());
		if(is_watched.isPresent()) list = list.stream().filter(o-> o.is_watched() == is_watched.get()).collect(Collectors.toList());
		return new PageImpl<Notification>(list, pageable, list.size());
	}
}
