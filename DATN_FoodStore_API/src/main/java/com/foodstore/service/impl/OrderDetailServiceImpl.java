package com.foodstore.service.impl;

import java.util.List;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.foodstore.dao.OrderDetailDAO;
import com.foodstore.model.transaction.OrderDetail;
import com.foodstore.service.OrderDetailService;

@Service
public class OrderDetailServiceImpl implements OrderDetailService {

	@Autowired private OrderDetailDAO orderDetailDAO;
	
	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public OrderDetail getById(Long id) {
		return orderDetailDAO.findById(id).orElse(null);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public List<OrderDetail> getAll() {
		return orderDetailDAO.findAll();
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public OrderDetail create(OrderDetail entiy) {
		return orderDetailDAO.save(entiy);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public OrderDetail update(OrderDetail entiy) {
		return orderDetailDAO.save(entiy);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public void delete(Long id) {
		orderDetailDAO.deleteById(id);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Page<OrderDetail> getAll(Pageable pageable) {
		return orderDetailDAO.findAll(pageable);
	}

}
