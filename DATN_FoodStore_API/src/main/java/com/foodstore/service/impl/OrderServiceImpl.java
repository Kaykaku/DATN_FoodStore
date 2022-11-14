package com.foodstore.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.foodstore.dao.OrderDAO;
import com.foodstore.model.transaction.Order;
import com.foodstore.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderDAO orderDAO;

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public Order getById(Long id) {
		return orderDAO.findById(id).orElse(null);
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public List<Order> getAll() {
		return orderDAO.findAll();
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public Order create(Order entiy) {
		return orderDAO.save(entiy);
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public Order update(Order entiy) {
		return orderDAO.save(entiy);
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public void delete(Long id) {
		orderDAO.deleteById(id);
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public Page<Order> getAll(int pageSize, int pageNumber) {
		return orderDAO.findAll(PageRequest.of(pageNumber - 1, pageSize));
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public Page<Order> getByCustomerId(Pageable pageable, Long id) {
		return orderDAO.findByCustomerId(pageable, id);
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public Page<Order> getByPaymentmethodId(Pageable pageable, Long id) {
		return orderDAO.findByPaymentmethodId(pageable, id);
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public Page<Order> getByCustomerIdAndPaymentmethodId(Pageable pageable, Long customerId, Long paymentmethodId) {
		return orderDAO.findByCustomerIdAndPaymentmethodId(pageable, customerId, paymentmethodId);
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public Page<Order> getByDisplayStatus(Pageable pageable, boolean isDisplay) {
		return orderDAO.findByDisplayStatus(pageable, isDisplay);
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public Page<Order> getByOrderStatus(Pageable pageable, int status) {
		return orderDAO.findByOrderStatus(pageable, status);
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public Page<Order> getByWatchStatus(Pageable pageable, boolean isWatched) {
		return orderDAO.findByWatchStatus(pageable, isWatched);
	}
}
