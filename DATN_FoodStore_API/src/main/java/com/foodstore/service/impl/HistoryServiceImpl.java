package com.foodstore.service.impl;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.foodstore.dao.HistoryDAO;
import com.foodstore.model.extend.History;
import com.foodstore.service.HistoryService;

@Service
public class HistoryServiceImpl implements HistoryService {

	@Autowired
	private HistoryDAO historyDAO;

	@Override
	public History getById(Long id) {
		Optional<History> result = historyDAO.findById(id);
		return result.isPresent() ? result.get() : null;
	}

	@Override
	public List<History> getAll() {
		return historyDAO.findAll();
	}

	@Transactional(rollbackOn = { Throwable.class })
	@Override
	public History create(History cart) {
		return historyDAO.save(cart);
	}

	@Transactional(rollbackOn = { Throwable.class })
	@Override
	public History update(History cart) {
		return historyDAO.save(cart);
	}

	@Transactional(rollbackOn = { Throwable.class })
	@Override
	public void delete(Long id) {
		if (id != null) {
			historyDAO.deleteById(id);
		}
	}
}
