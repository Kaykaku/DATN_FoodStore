package com.foodstore.service.impl;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.foodstore.dao.HistoryDAO;
import com.foodstore.model.extend.History;
import com.foodstore.service.HistoryService;
import com.foodstore.util.constraints.TableName;
import com.foodstore.util.convert.Convert;

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
	public Page<History> getByKeyword( String keyword,Pageable pageable) {
		return historyDAO.findByKeyword(keyword,pageable);
	}

	@Override
	public Page<History> getByFilter(String keyword, String table_name, Optional<Long> userid,
			Optional<Long> create_date, Optional<Long> record_id,Pageable pageable) {
		List<History> list = historyDAO.findAllByKeyword(keyword);
		if(table_name != null && !table_name.equalsIgnoreCase(TableName.All)) list = list.stream().filter(o-> o.getTable_name().equalsIgnoreCase(table_name)).collect(Collectors.toList());
		if(userid.isPresent()) list = list.stream().filter(o-> o.getUser_h().getId() == userid.get()).collect(Collectors.toList());
		if(create_date.isPresent()) list = list.stream().filter(o-> o.getCreate_date().getTime() >= create_date.get()).collect(Collectors.toList());
		if(record_id.isPresent()) list = list.stream().filter(o-> o.getRecord_id() == record_id.get()).collect(Collectors.toList());
		return (Page<History>) Convert.toPage(list, pageable);
	}

	@Override
	public Page<History> getByUserId(Long id,Pageable pageable) {
		return historyDAO.findByUserId(id,pageable);
	}

	@Override
	public Page<History> getByTableName(String name,Pageable pageable) {
		return historyDAO.findByTableName(name,pageable);
	}
}
