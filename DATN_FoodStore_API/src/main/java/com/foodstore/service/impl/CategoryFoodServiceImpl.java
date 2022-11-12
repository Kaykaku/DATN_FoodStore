package com.foodstore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.foodstore.dao.CategoryFoodDAO;
import com.foodstore.model.transaction.CategoryFood;
import com.foodstore.service.CategoryFoodService;


@Service
public class CategoryFoodServiceImpl implements CategoryFoodService {
	@Autowired private CategoryFoodDAO categoryFoodDAO;
	
	@Override
	public CategoryFood getById(Long id) {
		// TODO Auto-generated method stub
		return categoryFoodDAO.findById(id).get();
	}

	@Override
	public List<CategoryFood> getAll() {
		// TODO Auto-generated method stub
		return categoryFoodDAO.findAll();
	}

	@Override
	public CategoryFood create(CategoryFood cart) {
		// TODO Auto-generated method stub
		return categoryFoodDAO.save(cart);
	}

	@Override
	public CategoryFood update(CategoryFood cart) {
		// TODO Auto-generated method stub
		return categoryFoodDAO.save(cart);
	}

	@Override
	public void delete(Long id) {
		// TODO Auto-generated method stub
		categoryFoodDAO.deleteById(id);
	}

}
