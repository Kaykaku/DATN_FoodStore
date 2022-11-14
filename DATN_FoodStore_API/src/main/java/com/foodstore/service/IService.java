package com.foodstore.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface IService<T> {
	T getById(Long id);

	List<T> getAll();
	
	Page<T> getAll(Pageable pageable);

	T create(T cart);

	T update(T cart);

	void delete(Long id);
}
