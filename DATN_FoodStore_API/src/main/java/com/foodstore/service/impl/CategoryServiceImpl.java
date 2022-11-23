package com.foodstore.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.foodstore.dao.CategoryDAO;
import com.foodstore.model.entity.Category;
import com.foodstore.service.CategoryService;
import com.foodstore.util.constraints.Display;
import com.foodstore.util.convert.Convert;

@Service
public class CategoryServiceImpl implements CategoryService {
	@Autowired
	private CategoryDAO categoryDAO;

	@Override
	@Transactional(rollbackFor = { Exception.class, Throwable.class })
	public Category getById(Long id) {
		return categoryDAO.findById(id).orElse(null);
	}

	@Override
	@Transactional(rollbackFor = { Exception.class, Throwable.class })
	public List<Category> getAll() {
		return categoryDAO.findAll();
	}

	@Override
	@Transactional(rollbackFor = { Exception.class, Throwable.class })
	public Category create(Category entiy) {
		return categoryDAO.save(entiy);
	}

	@Override
	@Transactional(rollbackFor = { Exception.class, Throwable.class })
	public Category update(Category entiy) {
		return categoryDAO.save(entiy);
	}

	@Override
	@Transactional(rollbackFor = { Exception.class, Throwable.class })
	public void delete(Long id) {
		categoryDAO.deleteById(id);
	}

	@Override
	@Transactional(rollbackFor = { Exception.class, Throwable.class })
	public Page<Category> getAll(Pageable pageable) {
		return categoryDAO.findAll(pageable);
	}

	@Override
	@Transactional(rollbackFor = { Exception.class, Throwable.class })
	public List<Category> getByIsDisPlay() {
		return categoryDAO.findByIsDisplay(Display.SHOW);
	}

	@Override
	@Transactional(rollbackFor = { Exception.class, Throwable.class })
	public Page<Category> getByIsDisplay(Pageable pageable) throws Exception {
		return categoryDAO.findByIsDisplay(Display.SHOW, pageable);
	}

	@Override
	public Page<Category> getByKeyword(String keyword, Pageable pageable) throws Exception {
		return categoryDAO.findByKeyword(keyword, Display.SHOW, pageable);
	}
	
	@Override
	@Transactional(rollbackFor = { Exception.class, Throwable.class })
	public void deleteLogical(Long id) throws Exception {
		categoryDAO.deleteLogical(Display.HIDE, id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public Page<Category> getByFilter(String keyword, Optional<Long> create_date, Optional<Long> create_by,
			Optional<Boolean> is_display, Optional<Integer> type, Pageable pageable) {
		List<Category> list = categoryDAO.findByKeyword(keyword.trim());
		if(create_date.isPresent()) list = list.stream().filter(o-> o.getCreate_date().getTime() >= create_date.get()).toList();
		if(create_by.isPresent()) list = list.stream().filter(o-> o.getUser_c().getId() == create_by.get()).toList();
		if(is_display.isPresent()) list = list.stream().filter(o-> o.is_display() == is_display.get()).toList();
		if(type.isPresent()) list = list.stream().filter(o-> o.getType() >= type.get()).toList();
		Page<Category> page =(Page<Category>) Convert.toPage(list, pageable);
		return page ;
	}
}
