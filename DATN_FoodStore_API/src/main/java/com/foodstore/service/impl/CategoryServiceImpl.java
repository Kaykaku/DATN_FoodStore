package com.foodstore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.foodstore.dao.CategoryDAO;
import com.foodstore.model.entity.Category;
import com.foodstore.service.CategoryService;
import com.foodstore.util.constraints.Display;

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

}
