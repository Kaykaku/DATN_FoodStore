package com.foodstore.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.foodstore.model.entity.History;


@Repository
public interface DAO_History extends JpaRepository<History, Long>{

}
