package com.foodstore.service.impl;

import java.util.List;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.foodstore.dao.DiscountDAO;
import com.foodstore.model.extend.Comment;
import com.foodstore.model.extend.Discount;
import com.foodstore.service.DiscountService;

@Service
public class DiscountServiceImpl implements DiscountService {

	@Autowired private DiscountDAO discountDAO;
	
	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Discount getById(Long id) {
		return discountDAO.findById(id).orElse(null);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public List<Discount> getAll() {
		return discountDAO.findAll();
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Discount create(Discount entiy) {
		return discountDAO.save(entiy);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Discount update(Discount entiy) {
		return discountDAO.save(entiy);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public void delete(Long id) {
		discountDAO.deleteById(id);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Page<Discount> getAll(Pageable pageable) {
		return discountDAO.findAll(pageable);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Page<Discount> getByFoodId(Pageable pageable, Long id) {
		return discountDAO.findByFoodId(pageable,id);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Page<Comment> getByKeyword(Pageable pageable, String keyword) {
		return discountDAO.findByKeyword(pageable,keyword);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public List<Comment> getByKeyword(String keyword) {
		return discountDAO.findByKeyword(keyword);
	}

}
