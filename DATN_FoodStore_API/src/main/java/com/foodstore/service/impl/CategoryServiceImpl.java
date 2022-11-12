package com.foodstore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.foodstore.dao.CategoryDAO;
import com.foodstore.model.entity.Category;
import com.foodstore.service.CategoryService;


@Service
public class CategoryServiceImpl implements CategoryService {
	@Autowired private CategoryDAO categoryDAO;
	
	@Override
	public Category getById(Long id) {
		// TODO Auto-generated method stub
		return categoryDAO.findById(id).get();
	}

	@Override
	public List<Category> getAll() {
		// TODO Auto-generated method stub
		return categoryDAO.findAll();
	}

	@Override
	public Category create(Category cart) {
		// TODO Auto-generated method stub
		return categoryDAO.save(cart);
	}

	@Override
	public Category update(Category cart) {
		// TODO Auto-generated method stub
		return categoryDAO.save(cart);
	}

	@Override
	public void delete(Long id) {
		// TODO Auto-generated method stub
		categoryDAO.deleteById(id);
	}

}
