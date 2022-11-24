package com.foodstore.util.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.foodstore.model.entity.Category;
import com.foodstore.service.CategoryService;

@Service("Utils")
public class ServiceUtil {

	@Autowired
	private CategoryService categoryService;

	public List<Category> getCategories() {
		List<Category> categories = categoryService.getByIsDisPlay();
		return !categories.isEmpty() ? categories : null;
	}
}
