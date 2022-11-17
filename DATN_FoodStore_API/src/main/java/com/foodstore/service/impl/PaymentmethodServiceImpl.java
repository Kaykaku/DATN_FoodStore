package com.foodstore.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.foodstore.dao.PaymentmethodDAO;
import com.foodstore.model.entity.Paymentmethod;
import com.foodstore.service.PaymentmethodService;
import com.foodstore.util.constraints.Display;

@Service
public class PaymentmethodServiceImpl implements PaymentmethodService {

@Autowired private PaymentmethodDAO paymentmethodDAO;
	
	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Paymentmethod getById(Long id) {
		return paymentmethodDAO.findById(id).orElse(null);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public List<Paymentmethod> getAll() {
		return paymentmethodDAO.findAll();
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Paymentmethod create(Paymentmethod entiy) {
		return paymentmethodDAO.save(entiy);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Paymentmethod update(Paymentmethod entiy) {
		return paymentmethodDAO.save(entiy);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public void delete(Long id) {
		paymentmethodDAO.deleteById(id);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Page<Paymentmethod> getAll(Pageable pageable) {
		return paymentmethodDAO.findAll(pageable);
	}
	
	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public List<Paymentmethod> getByIsDisplay() {
		return paymentmethodDAO.findByIsDisplay(Display.SHOW);
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public void deleteLogical(Long id) throws Exception {
		paymentmethodDAO.deleteLogical(Display.HIDE, id);
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public Paymentmethod getByName(String name) {
		return paymentmethodDAO.findByName(Display.SHOW, name);
	}
}
