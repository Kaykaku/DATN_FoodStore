package com.foodstore.service.impl;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.foodstore.dao.NotificationDAO;
import com.foodstore.model.transaction.Notification;
import com.foodstore.service.NotificationService;

@Service
public class NotificationServiceImpl implements NotificationService {

	@Autowired
	private NotificationDAO notificationDAO;

	@Override
	public Notification getById(Long id) {
		Optional<Notification> result = notificationDAO.findById(id);
		return result.isPresent() ? result.get() : null;
	}

	@Override
	public List<Notification> getAll() {
		return notificationDAO.findAll();
	}

	@Transactional(rollbackOn = { Throwable.class })
	@Override
	public Notification create(Notification cart) {
		return notificationDAO.save(cart);
	}

	@Transactional(rollbackOn = { Throwable.class })
	@Override
	public Notification update(Notification cart) {
		return notificationDAO.save(cart);
	}

	@Transactional(rollbackOn = { Throwable.class })
	@Override
	public void delete(Long id) {
		if (id != null) {
			notificationDAO.deleteById(id);
		}
	}
}
