package com.foodstore.service.impl;

import java.util.List;
import java.util.stream.Collectors;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
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
	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Page<OrderDetail> getByFoodId(Pageable pageable, Long id) {
		return orderDetailDAO.findByOrderId(pageable, id);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Page<OrderDetail> getByOrderId(Pageable pageable, Long id) {
		return orderDetailDAO.findByOrderId(pageable, id);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Page<OrderDetail> getByFoodIdAndOrderId(Pageable pageable, Long customerId, Long paymentmethodId){
		return orderDetailDAO.findByFoodIdAndOrderId(pageable, customerId,paymentmethodId);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Page<OrderDetail> getByAllStatus(Pageable pageable, int status) {
		List<OrderDetail> list = orderDetailDAO.findAll();
		return new PageImpl<OrderDetail>(
				list.stream().filter(c->c.getStatus()==status).collect(Collectors.toList())
				, pageable
				, list.size());
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Page<OrderDetail> getByAllStatus(Pageable pageable, boolean isDislay) {
		List<OrderDetail> list = orderDetailDAO.findAll();
		return new PageImpl<OrderDetail>(
				list.stream().filter(c->c.is_display()==isDislay).collect(Collectors.toList())
				, pageable
				, list.size());
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Page<OrderDetail> getByAllStatus(Pageable pageable, boolean isDislay, int status) {
		List<OrderDetail> list = orderDetailDAO.findAll();
		return new PageImpl<OrderDetail>(
				list.stream().filter(c->c.is_display()==isDislay && c.getStatus()==status).collect(Collectors.toList())
				, pageable
				, list.size());
	}



}
