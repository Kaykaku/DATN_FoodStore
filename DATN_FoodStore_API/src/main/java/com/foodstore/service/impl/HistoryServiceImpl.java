package com.foodstore.service.impl;

import java.sql.Date;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.foodstore.dao.HistoryDAO;
import com.foodstore.model.extend.History;
import com.foodstore.service.HistoryService;

@Service
public class HistoryServiceImpl implements HistoryService {

	@Autowired private HistoryDAO historyDAO;
	
	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public History getById(Long id) {
		return historyDAO.findById(id).orElse(null);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public List<History> getAll() {
		return historyDAO.findAll();
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public History create(History entiy) {
		return historyDAO.save(entiy);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public History update(History entiy) {
		return historyDAO.save(entiy);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public void delete(Long id) {
		historyDAO.deleteById(id);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Page<History> getAll(Pageable pageable) {
		return historyDAO.findAll(pageable);
	}

	@Override
	public Page<History> findByKeyword(Pageable pageable, String keyword) {
		return historyDAO.findByKeyword(pageable, keyword);
	}

	@Override
	public Page<History> findByFilter(Pageable pageable,String keyword, String table_name, Optional<Long> userid,
			Optional<Date> create_date, Optional<Long> record_id) {
		List<History> list = historyDAO.findAllByKeyword(keyword);
		if(table_name==null) list = list.stream().filter(o-> o.getTable_name().equalsIgnoreCase(table_name)).toList();
		if(userid.isPresent()) list = list.stream().filter(o-> o.getUser_h().getId() == userid.get()).toList();
		if(create_date.isPresent()) list = list.stream().filter(o-> o.getCreate_date() == create_date.get()).toList();
		if(record_id.isPresent()) list = list.stream().filter(o-> o.getRecord_id() == record_id.get()).toList();
		return new PageImpl<History>(list, pageable, list.size());
	}

	@Override
	public Page<History> findByUserId(Pageable pageable, Long id) {
		return historyDAO.findByUserId(pageable, id);
	}

	@Override
	public Page<History> findByTableName(Pageable pageable, String name) {
		return historyDAO.findByTableName(pageable, name);
	}
}
