package com.foodstore.service;

import java.sql.Date;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.foodstore.model.extend.History;


@Service
public interface HistoryService extends IService<History> {
	Page<History> findByUserId(Pageable pageable,Long id);
	
	Page<History> findByTableName(Pageable pageable,String name);
	
	Page<History> findByKeyword(Pageable pageable,String keyword);
	
	Page<History> findByFilter(Pageable pageable,String keyword , String table_name 
			, Optional<Long> userid , Optional<Date> create_date , Optional<Long> record_id);
}
