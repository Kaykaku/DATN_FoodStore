package com.foodstore.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.ObjectUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.foodstore.dao.CartDAO;
import com.foodstore.model.entity.Customer;
import com.foodstore.model.entity.Food;
import com.foodstore.model.transaction.Cart;
import com.foodstore.service.CartService;
import com.foodstore.service.FoodService;

@Service
public class CartServiceImpl implements CartService {
	@Autowired
	private CartDAO cartDAO;

	@Override
	@Transactional(rollbackFor = { Exception.class, Throwable.class })
	public Cart getById(Long id) {
		return cartDAO.findById(id).orElse(null);
	}

	@Override
	@Transactional(rollbackFor = { Exception.class, Throwable.class })
	public List<Cart> getAll() {
		return cartDAO.findAll();
	}

	@Override
	@Transactional(rollbackFor = { Exception.class, Throwable.class })
	public Cart create(Cart entiy) {
		return cartDAO.save(entiy);
	}

	@Override
	@Transactional(rollbackFor = { Exception.class, Throwable.class })
	public Cart update(Cart entiy) {
		return cartDAO.save(entiy);
	}

	@Override
	@Transactional(rollbackFor = { Exception.class, Throwable.class })
	public void delete(Long id) {
		cartDAO.deleteById(id);
	}

	@Override
	@Transactional(rollbackFor = { Exception.class, Throwable.class })
	public Page<Cart> getAll(Pageable pageable) {
		return cartDAO.findAll(pageable);
	}

	@Override
	@Transactional(rollbackFor = { Exception.class, Throwable.class })
	public Page<Cart> getByCustomerId(Long id, Pageable pageable) {
		return cartDAO.findByCustomerId(id, pageable);
	}

	@Override
	@Transactional(rollbackFor = { Exception.class, Throwable.class })
	public Page<Cart> getByFoodId(Long id, Pageable pageable) {
		return cartDAO.findByFoodId(id, pageable);
	}

	@Override
	@Transactional(rollbackFor = { Exception.class, Throwable.class })
	public Cart getByCustomerIdAndFoodId(Long customerId, Long foodId) {
		return cartDAO.findByCustomerIdAndFoodId(customerId, foodId).orElse(null);
	}

	@Autowired
	private FoodService foodService;

	Map<Long, Cart> item = new HashMap<>();

	@Override
	@Transactional(rollbackFor = { Exception.class, Throwable.class })
	public Cart handleCart(Customer customer, Long id, Integer quantity, boolean isReplace) {

		Cart cart = item.get(id);
		if (!item.containsKey(id) && ObjectUtils.isEmpty(cart)) {
			Food currentFood = foodService.getById(id);

			cart = new Cart();
			cart.setCustomer_cart(customer);
			cart.setFood_cart(currentFood);
			cart.setQuantity(quantity);

			item.put(id, cart);
		} else if (quantity > 0) {
			if (isReplace) {
				cart.setQuantity(quantity);
			} else {
				cart.setQuantity(cart.getQuantity() + 1);
			}
		}

		this.create(cart);
		return cart;
	}

	@Override
	public Integer getTotalQuantity(String username) {
		Integer totalQuantity = 0;
		for (Cart cart : this.getByCustomerName(username)) {
			totalQuantity += cart.getQuantity();
		}
		return totalQuantity;
	}

	@Override
	public Double getTotalPrice(String username) {
		Double totalPrice = 0D;
		for (Cart cart : this.getByCustomerName(username)) {
			totalPrice += (cart.getQuantity() * cart.getFood_cart().getPrice());
		}
		return totalPrice;
	}

	@Override
	@Transactional(rollbackFor = { Exception.class, Throwable.class })
	public void clearAll(Long id) {
		cartDAO.deleteAll(id);
	}

	@Override
	public Page<Cart> getByCustomerName(String username, Pageable pageable) {
		return cartDAO.getByCustomerName(username, pageable);
	}

	@Override
	public List<Cart> getByCustomerName(String username) {
		return cartDAO.getByCustomerName(username);
	}
}
