package com.foodstore.service.impl;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.foodstore.dao.OrderDetailDAO;
import com.foodstore.model.transaction.OrderDetail;
import com.foodstore.service.OrderDetailService;

@Service
public class OrderDetailServiceImpl implements OrderDetailService {

	@Autowired
	private OrderDetailDAO orderDetailDAO;

	@Override
	public OrderDetail getById(Long id) {
		Optional<OrderDetail> result = orderDetailDAO.findById(id);
		return result.isPresent() ? result.get() : null;
	}

	@Override
	public List<OrderDetail> getAll() {
		return orderDetailDAO.findAll();
	}

	@Transactional(rollbackOn = { Throwable.class })
	@Override
	public OrderDetail create(OrderDetail cart) {
		return orderDetailDAO.save(cart);
	}

	@Transactional(rollbackOn = { Throwable.class })
	@Override
	public OrderDetail update(OrderDetail cart) {
		return orderDetailDAO.save(cart);
	}

	@Transactional(rollbackOn = { Throwable.class })
	@Override
	public void delete(Long id) {
		if (id != null) {
			orderDetailDAO.deleteById(id);
		}
	}

}
