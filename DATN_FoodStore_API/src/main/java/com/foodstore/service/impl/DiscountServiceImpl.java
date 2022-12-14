package com.foodstore.service.impl;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.foodstore.dao.DiscountDAO;
import com.foodstore.model.extend.Discount;
import com.foodstore.service.DiscountService;
import com.foodstore.util.constraints.Display;
import com.foodstore.util.convert.Convert;

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
	public Page<Discount> getByFoodId( Long id,Pageable pageable) {
		return discountDAO.findByFoodId(id,pageable);
	}

	@Override
	public Page<Discount> getByKeyword( String keyword,Pageable pageable) {
		return discountDAO.findByKeyword(keyword,pageable);
	}

	@Override
	public Page<Discount> getByFilter(String keyword, Optional<Boolean> is_fixed,Optional<Long> create_date  ,Optional<Long> start_date
			, Optional<Long> end_date, Optional<Boolean> isDisplay, Optional<Long> userId,Pageable pageable ) {
		List<Discount> list = getByKeywordEng(keyword);
		if(is_fixed.isPresent()) list = list.stream().filter(o-> o.is_fixed() == is_fixed.get()).collect(Collectors.toList());
		if(create_date.isPresent()) list = list.stream().filter(o-> o.getCreate_date().getTime() >= create_date.get()).collect(Collectors.toList());
		if(start_date.isPresent()) list = list.stream().filter(o-> o.getStart_date().getTime() >= start_date.get()).collect(Collectors.toList());
		if(end_date.isPresent()) list = list.stream().filter(o-> o.getEnd_date().getTime() <= end_date.get()).collect(Collectors.toList());
		if(isDisplay.isPresent()) list = list.stream().filter(o-> o.is_display() == isDisplay.get()).collect(Collectors.toList());
		if(userId.isPresent()) list = list.stream().filter(o-> o.getUser_d().getId() == userId.get()).collect(Collectors.toList());
		return new PageImpl<Discount>(list, pageable, list.size());
	}

	public List<Discount> getByKeywordEng(String keyword) {
		List<Discount> list = discountDAO.findAll();
		list = list.stream()
				.filter(o -> Convert.toEngString(o.getName().toLowerCase()).contains(Convert.toEngString(keyword.toLowerCase())) 
				|| Convert.toEngString(o.getFood_d().getName().toLowerCase()).contains(Convert.toEngString(keyword.toLowerCase()))).toList();
		return list;
	}
}
