package com.foodstore.service.impl;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.foodstore.dao.ImageDAO;
import com.foodstore.model.extend.Image;
import com.foodstore.service.ImageService;

@Service
public class ImageServiceImpl implements ImageService {

	@Autowired
	private ImageDAO imageDAO;

	@Override
	public Image getById(Long id) {
		Optional<Image> result = imageDAO.findById(id);
		return result.isPresent() ? result.get() : null;
	}

	@Override
	public List<Image> getAll() {
		return imageDAO.findAll();
	}

	@Transactional(rollbackOn = { Throwable.class })
	@Override
	public Image create(Image cart) {
		return imageDAO.save(cart);
	}

	@Transactional(rollbackOn = { Throwable.class })
	@Override
	public Image update(Image cart) {
		return imageDAO.save(cart);
	}

	@Transactional(rollbackOn = { Throwable.class })
	@Override
	public void delete(Long id) {
		if (id != null) {
			imageDAO.deleteById(id);
		}
	}

}
