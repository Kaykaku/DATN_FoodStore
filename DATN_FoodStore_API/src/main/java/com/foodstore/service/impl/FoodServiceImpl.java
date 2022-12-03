package com.foodstore.service.impl;


import java.util.Date;
import java.util.List;
import java.util.Optional;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.foodstore.dao.FoodDAO;
import com.foodstore.model.entity.Food;
import com.foodstore.service.FoodService;
import com.foodstore.util.constraints.Display;
import com.foodstore.util.constraints.Favorite;
import com.foodstore.util.convert.Convert;

@Service
public class FoodServiceImpl implements FoodService {

	@Autowired
	private FoodDAO foodDAO;

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public Food getById(Long id) {
		return foodDAO.findById(id).orElse(null);
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public List<Food> getAll() {
		return foodDAO.findAll();
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public Food create(Food entiy) {
		return foodDAO.save(entiy);
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public Food update(Food entiy) {
		return foodDAO.save(entiy);
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public void delete(Long id) {
		foodDAO.deleteById(id);
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public Page<Food> getAll(Pageable pageable) {
		return foodDAO.findAll(pageable);
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public List<Food> getByIsDisplayAndQuantity() {
		return foodDAO.findByIsDisplayAndQuantity(Display.SHOW, 0);
	}

	@Override
	public Page<Food> getByIsDisplayAndQuantity(Pageable pageable) throws Exception {

		return foodDAO.findByIsDisplayAndQuantity(Display.SHOW, 0, pageable);
	}

	@Override
	public Page<Food> getByKeyword(String keyword, Pageable pageable)  {
		return foodDAO.findByKeyword2(keyword, pageable);
	}
	
	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public void deleteLogical(Long id) throws Exception {
		foodDAO.deleteLogical(Display.HIDE, id);
	}
	
	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public Page<Food> getNewProduct(Pageable pageable) {
		return foodDAO.getNewProduct(Display.SHOW, 0, pageable);
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public Page<Food> getByFilter(String keyword, Optional<Double> priceMin, Optional<Double> priceMax,
			Optional<Integer> quantity, Optional<Integer> view, Optional<Long> createDate, Optional<Integer> status,
			Optional<Boolean> isDisplay , Optional<Long> category_id, Pageable pageable) {
		List<Food> list = getByKeywordEng(keyword);
		if(priceMin.isPresent()) list = list.stream().filter(o-> o.getPrice() >= priceMin.get()).toList();
		if(priceMax.isPresent()) list = list.stream().filter(o-> o.getPrice() <= priceMax.get()).toList();
		if(quantity.isPresent()) list = list.stream().filter(o-> o.getQuantity_limit() >= quantity.get()).toList();
		if(view.isPresent()) list = list.stream().filter(o-> o.getView_count() >= view.get()).toList();
		if(createDate.isPresent()) list = list.stream().filter(o-> o.getCreate_date().getTime() >=  createDate.get()).toList();
		if(status.isPresent()) list = list.stream().filter(o-> o.getStatus() == status.get()).toList();
		if(isDisplay.isPresent()) list = list.stream().filter(o-> o.is_display() == isDisplay.get()).toList();
		if(category_id.isPresent()) list = list.stream().filter(o-> o.getCategory_foods().stream().anyMatch(c -> c.getCategory_f().getId() == category_id.get()) ).toList();
		return (Page<Food>)Convert.toPage(list, pageable);
	}
	
	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public List<Food> getByFilter(String keyword, Optional<Double> priceMin, Optional<Double> priceMax,
			Optional<Integer> quantity, Optional<Integer> view, Optional<Long> createDate, Optional<Integer> status,
			Optional<Boolean> isDisplay , Optional<Long> category_id) {
		List<Food> list = getByKeywordEng(keyword);
		if(priceMin.isPresent()) list = list.stream().filter(o-> o.getPrice() >= priceMin.get()).toList();
		if(priceMax.isPresent()) list = list.stream().filter(o-> o.getPrice() <= priceMax.get()).toList();
		if(quantity.isPresent()) list = list.stream().filter(o-> o.getQuantity_limit() >= quantity.get()).toList();
		if(view.isPresent()) list = list.stream().filter(o-> o.getView_count() >= view.get()).toList();
		if(createDate.isPresent()) list = list.stream().filter(o-> o.getCreate_date().getTime() >=  createDate.get()).toList();
		if(status.isPresent()) list = list.stream().filter(o-> o.getStatus() == status.get()).toList();
		if(isDisplay.isPresent()) list = list.stream().filter(o-> o.is_display() == isDisplay.get()).toList();
		if(category_id.isPresent()) list = list.stream().filter(o-> o.getCategory_foods().stream().anyMatch(c -> c.getCategory_f().getId() == category_id.get()) ).toList();
		return list;
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public Page<Food> getTopNewProducts(Pageable pageable) {
		List<Food> list = getByKeywordEng("");
		list = list.stream().sorted((o1,o2) -> (o2.getCreate_date()).compareTo(o1.getCreate_date())).toList();
		return (Page<Food>) (Page<Food>)Convert.toPage(list, pageable);
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public Page<Food> getTopDiscountProducts(Pageable pageable) {
		List<Food> list = foodDAO.findByKeyword2("");
		list = list.stream().filter(
				o -> o.getFood_discounts().stream().anyMatch(
						d -> d.is_display()== Display.SHOW 
						&& d.getStart_date().getTime() <= new Date().getTime() 
						&&  d.getEnd_date().getTime() >= new Date().getTime()))
				.filter(o -> o.is_display() == Display.SHOW).toList();
		return new PageImpl<Food>(list, pageable, list.size());
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public Page<Food> getTopSalerProducts(Pageable pageable) {
		List<Food> list = foodDAO.findByKeyword2("");
		list.sort( (o1,o2) ->
				((Integer) o1.getOrder_details().stream().mapToInt(d -> d.getQuantity()).sum())
				.compareTo((Integer) o2.getOrder_details().stream().mapToInt(d -> d.getQuantity()).sum()));
		return new PageImpl<Food>(list.stream().filter(o -> o.is_display() == Display.SHOW).toList(), pageable, list.size());
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public Page<Food> getTopFavoriteProducts(Pageable pageable) {
		List<Food> list = foodDAO.findByKeyword2("");
		list.sort( (o1,o2) ->
				((Long) o1.getFood_reviews().stream().filter(d -> d.is_favorite() == Favorite.YES).count())
				.compareTo((Long) o1.getFood_reviews().stream().filter(d -> d.is_favorite() == Favorite.YES).count()));
		return new PageImpl<Food>(list.stream().filter(o -> o.is_display() == Display.SHOW).toList(), pageable, list.size());
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public Page<Food> getTopViewProducts(Pageable pageable) {
		List<Food> list = getByKeywordEng("");
		list = list.stream().sorted((o1,o2) -> ((Integer)o2.getView_count()).compareTo((Integer)o1.getView_count())).toList();
		return (Page<Food>) (Page<Food>)Convert.toPage(list, pageable);
	}

	@Override
	public Page<Food> findByCategoryName(String name, Pageable pageable) {
		return foodDAO.findByCategoryName(name, pageable);
	}

	@Override
	public List<Food> getByKeyword(String keyword) {
		List<Food> list = foodDAO.findByKeyword2(keyword);

		return list;
	}
	
	@Override
	public List<Food> getByKeywordEng(String keyword) {
		List<Food> list = foodDAO.findAll();
		list = list.stream()
				.filter(o -> o.is_display() == Display.SHOW)
				.filter(o -> Convert.toEngString(o.getName().toLowerCase()).contains(Convert.toEngString(keyword.toLowerCase())) 
				|| Convert.toEngString(o.getDescription().toLowerCase()).contains(Convert.toEngString(keyword.toLowerCase()))).toList();
		return list;
	}

}
