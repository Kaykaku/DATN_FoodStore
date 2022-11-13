package com.foodstore.service.impl;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.foodstore.dao.PaymentmethodDAO;
import com.foodstore.model.entity.Paymentmethod;
import com.foodstore.service.PaymentmethodService;

@Service
public class PaymentmethodServiceImpl implements PaymentmethodService {

	@Autowired
	private PaymentmethodDAO paymentmethodDAO;

	@Override
	public Paymentmethod getById(Long id) {
		Optional<Paymentmethod> result = paymentmethodDAO.findById(id);
		return result.isPresent() ? result.get() : null;
	}

	@Override
	public List<Paymentmethod> getAll() {
		return paymentmethodDAO.findAll();
	}

	@Transactional(rollbackOn = { Throwable.class })
	@Override
	public Paymentmethod create(Paymentmethod cart) {
		return paymentmethodDAO.save(cart);
	}

	@Transactional(rollbackOn = { Throwable.class })
	@Override
	public Paymentmethod update(Paymentmethod cart) {
		return paymentmethodDAO.save(cart);
	}

	@Transactional(rollbackOn = { Throwable.class })
	@Override
	public void delete(Long id) {
		if (id != null) {
			paymentmethodDAO.deleteById(id);
		}
	}

}
