package com.foodstore.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.foodstore.model.extend.History;


@Repository
public interface HistoryDAO extends JpaRepository<History, Long>{

}
