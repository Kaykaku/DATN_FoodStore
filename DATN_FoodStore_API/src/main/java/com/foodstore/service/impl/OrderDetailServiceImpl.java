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
	public Page<OrderDetail> getByFoodId(Long id,Pageable pageable) {
		return orderDetailDAO.findByOrderId(id,pageable);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Page<OrderDetail> getByOrderId(Long id,Pageable pageable) {
		return orderDetailDAO.findByOrderId(id,pageable);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Page<OrderDetail> getByFoodIdAndOrderId(Long customerId, Long paymentmethodId,Pageable pageable){
		return orderDetailDAO.findByFoodIdAndOrderId(customerId,paymentmethodId,pageable);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Page<OrderDetail> getByAllStatus(int status,Pageable pageable) {
		List<OrderDetail> list = orderDetailDAO.findAll();
		return new PageImpl<OrderDetail>(
				list.stream().filter(c->c.getStatus()==status).collect(Collectors.toList())
				, pageable
				, list.size());
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Page<OrderDetail> getByAllStatus(boolean isDislay,Pageable pageable) {
		List<OrderDetail> list = orderDetailDAO.findAll();
		return new PageImpl<OrderDetail>(
				list.stream().filter(c->c.is_display()==isDislay).collect(Collectors.toList())
				, pageable
				, list.size());
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Page<OrderDetail> getByAllStatus(boolean isDislay, int status,Pageable pageable) {
		List<OrderDetail> list = orderDetailDAO.findAll();
		return new PageImpl<OrderDetail>(
				list.stream().filter(c->c.is_display()==isDislay && c.getStatus()==status).collect(Collectors.toList())
				, pageable
				, list.size());
	}



}
