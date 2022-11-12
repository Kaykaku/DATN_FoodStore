package com.foodstore.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.foodstore.model.transaction.Review;


@Repository
public interface ReviewDAO extends JpaRepository<Review, Long>{

}
