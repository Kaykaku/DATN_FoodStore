package com.foodstore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.foodstore.dao.CategoryDAO;
import com.foodstore.model.entity.Category;
import com.foodstore.service.CategoryService;


@Service
public class CategoryServiceImpl implements CategoryService {
	@Autowired private CategoryDAO categoryDAO;
	
	@Override
	@Transactional(rollbackFor = {Exception.class, Throwable.class})
	public Category getById(Long id) {
		return categoryDAO.findById(id).orElse(null);
	}

	@Override
	@Transactional(rollbackFor = {Exception.class, Throwable.class})
	public List<Category> getAll() {
		return categoryDAO.findAll();
	}

	@Override
	@Transactional(rollbackFor = {Exception.class, Throwable.class})
	public Category create(Category entiy) {
		return categoryDAO.save(entiy);
	}

	@Override
	@Transactional(rollbackFor = {Exception.class, Throwable.class})
	public Category update(Category entiy) {
		return categoryDAO.save(entiy);
	}

	@Override
	@Transactional(rollbackFor = {Exception.class, Throwable.class})
	public void delete(Long id) {
		categoryDAO.deleteById(id);
	}

	@Override
	@Transactional(rollbackFor = {Exception.class, Throwable.class})
	public Page<Category> getAll(int pageSize, int pageNumber) {
		return categoryDAO.findAll(PageRequest.of(pageNumber - 1, pageSize));
	}
}
