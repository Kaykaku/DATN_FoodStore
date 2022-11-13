package com.foodstore.service.impl;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.foodstore.dao.OrderDAO;
import com.foodstore.model.transaction.Order;
import com.foodstore.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderDAO orderDAO;

	@Override
	public Order getById(Long id) {
		Optional<Order> result = orderDAO.findById(id);
		return result.isPresent() ? result.get() : null;
	}

	@Override
	public List<Order> getAll() {
		return orderDAO.findAll();
	}

	@Transactional(rollbackOn = { Throwable.class })
	@Override
	public Order create(Order cart) {
		return orderDAO.save(cart);
	}

	@Transactional(rollbackOn = { Throwable.class })
	@Override
	public Order update(Order cart) {
		return orderDAO.save(cart);
	}

	@Transactional(rollbackOn = { Throwable.class })
	@Override
	public void delete(Long id) {
		if (id != null) {
			orderDAO.deleteById(id);
		}
	}

}
