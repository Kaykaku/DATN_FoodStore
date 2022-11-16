package com.foodstore.service;

import java.sql.Date;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.foodstore.model.extend.History;


@Service
public interface HistoryService extends IService<History> {
	Page<History> findByUserId(Long id,Pageable pageable);
	
	Page<History> findByTableName(String name,Pageable pageable);
	
	Page<History> findByKeyword(String keyword,Pageable pageable);
	
	Page<History> findByFilter(String keyword , String table_name 
			, Optional<Long> userid , Optional<Date> create_date , Optional<Long> record_id,Pageable pageable);
}
