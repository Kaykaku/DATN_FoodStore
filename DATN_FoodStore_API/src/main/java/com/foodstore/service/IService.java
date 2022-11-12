package com.foodstore.service;

import java.util.List;

public interface IService<T> {
	T getById(Long id);

	List<T> getAll();

	T create(T cart);

	T update(T cart);

	void delete(Long id);
}
