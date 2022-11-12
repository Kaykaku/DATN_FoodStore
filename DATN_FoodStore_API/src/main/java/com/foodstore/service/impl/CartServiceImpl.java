package com.foodstore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.foodstore.dao.CartDAO;
import com.foodstore.model.transaction.Cart;
import com.foodstore.service.CartService;


@Service
public class CartServiceImpl implements CartService {
	@Autowired private CartDAO cartDAO;
	
	@Override
	public Cart getById(Long id) {
		// TODO Auto-generated method stub
		return cartDAO.findById(id).get();
	}

	@Override
	public List<Cart> getAll() {
		// TODO Auto-generated method stub
		return cartDAO.findAll();
	}

	@Override
	public Cart create(Cart cart) {
		// TODO Auto-generated method stub
		return cartDAO.save(cart);
	}

	@Override
	public Cart update(Cart cart) {
		// TODO Auto-generated method stub
		return cartDAO.save(cart);
	}

	@Override
	public void delete(Long id) {
		// TODO Auto-generated method stub
		cartDAO.deleteById(id);
	}

}
