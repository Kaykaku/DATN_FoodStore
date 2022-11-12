package com.foodstore.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.foodstore.model.extend.Comment;


@Repository
public interface DAO_Comment extends JpaRepository<Comment, Long>{

}
