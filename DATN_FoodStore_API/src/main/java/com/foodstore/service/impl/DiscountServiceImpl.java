package com.foodstore.service.impl;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.foodstore.dao.DiscountDAO;
import com.foodstore.model.extend.Discount;
import com.foodstore.service.DiscountService;

@Service
public class DiscountServiceImpl implements DiscountService {

	@Autowired
	private DiscountDAO discountDAO;

	@Override
	public Discount getById(Long id) {
		Optional<Discount> result = discountDAO.findById(id);
		return result.isPresent() ? result.get() : null;
	}

	@Override
	public List<Discount> getAll() {
		return discountDAO.findAll();
	}

	@Transactional(rollbackOn = { Throwable.class })
	@Override
	public Discount create(Discount cart) {
		return discountDAO.save(cart);
	}

	@Transactional(rollbackOn = { Throwable.class })
	@Override
	public Discount update(Discount cart) {
		return discountDAO.save(cart);
	}

	@Transactional(rollbackOn = { Throwable.class })
	@Override
	public void delete(Long id) {
		if (id != null) {
			discountDAO.deleteById(id);
		}
	}

}
