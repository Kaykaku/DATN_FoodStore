package com.foodstore.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.foodstore.model.extend.History;


@Repository
public interface HistoryDAO extends JpaRepository<History, Long>{
	@Query("Select o From History o Where o.user_h.id=?1")
	Page<History> findByUserId(Pageable pageable,Long id);
	
	@Query("Select o From History o Where o.table_name=?1")
	Page<History> findByTableName(Pageable pageable,String name);
	
	@Query("Select o From History o"
			+ " Where o.memo like %?1%")
	Page<History> findByKeyword(Pageable pageable,String keyword);
	
	@Query("Select o From History o"
			+ " Where o.memo like %?1%")
	List<History> findAllByKeyword(String keyword);
}
