package com.foodstore.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.foodstore.dao.NotificationDAO;
import com.foodstore.model.extend.Notification;
import com.foodstore.service.NotificationService;

@Service
public class NotificationServiceImpl implements NotificationService {
	@Autowired
	private NotificationDAO notificationDAO;

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public Notification getById(Long id) {
		return notificationDAO.findById(id).orElse(null);
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public List<Notification> getAll() {
		return notificationDAO.findAll();
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public Notification create(Notification entiy) {
		return notificationDAO.save(entiy);
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public Notification update(Notification entiy) {
		return notificationDAO.save(entiy);
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public void delete(Long id) {
		notificationDAO.deleteById(id);
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public Page<Notification> getAll(int pageSize, int pageNumber) {
		return notificationDAO.findAll(PageRequest.of(pageNumber - 1, pageSize));
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public Page<Notification> getByCustomerId(Pageable pageable, Long id) {
		return notificationDAO.findByCustomerId(pageable, id);
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public Page<Notification> getBySeenStatus(Pageable pageable, boolean isSeen) {
		return notificationDAO.findBySeenStatus(pageable, isSeen);
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public Page<Notification> findByTableName(Pageable pageable, String table_name) {
		return notificationDAO.findByTableName(pageable, table_name);
	}
}
