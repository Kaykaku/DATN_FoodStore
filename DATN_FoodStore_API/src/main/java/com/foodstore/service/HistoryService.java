package com.foodstore.service;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.foodstore.model.extend.History;


@Service
public interface HistoryService extends IService<History> {
	Page<History> getByUserId(Long id,Pageable pageable);
	
	Page<History> getByTableName(String name,Pageable pageable);
	
	Page<History> getByKeyword(String keyword,Pageable pageable);
	
	Page<History> getByFilter(String keyword , String table_name 
			, Optional<Long> userid , Optional<Long> create_date , Optional<Long> record_id,Pageable pageable);
}
