package com.foodstore.service.impl;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.foodstore.dao.ImageDAO;
import com.foodstore.model.extend.Image;
import com.foodstore.service.ImageService;

@Service
public class ImageServiceImpl implements ImageService {

	@Autowired private ImageDAO imageDAO;
	
	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Image getById(Long id) {
		return imageDAO.findById(id).orElse(null);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public List<Image> getAll() {
		return imageDAO.findAll();
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Image create(Image entiy) {
		return imageDAO.save(entiy);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Image update(Image entiy) {
		return imageDAO.save(entiy);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public void delete(Long id) {
		imageDAO.deleteById(id);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Page<Image> getAll(Pageable pageable) {
		return imageDAO.findAll(pageable);
	}

	@Override
	public Page<Image> findByFoodId(Pageable pageable, Long id) {
		return imageDAO.findByFoodId(pageable,id);
	}

	@Override
	public Page<Image> findByKeyword(Pageable pageable, String keyword) {
		return imageDAO.findByKeyword(pageable,keyword);
	}

	@Override
	public Page<Image> findByFilter(Pageable pageable, String keyword, Optional<Long> foodId) {
		List<Image> list = imageDAO.findByKeyword(keyword);
		if(foodId.isPresent()) list = list.stream().filter(o-> o.getFood_i().getId() == foodId.get()).toList();
		return new PageImpl<Image>(list, pageable, list.size());
	}

}