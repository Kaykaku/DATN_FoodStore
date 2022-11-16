package com.foodstore.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.foodstore.model.extend.Comment;


@Repository
public interface CommentDAO extends JpaRepository<Comment, Long>{
	@Query("Select c From Comment c Where c.review.id=?1")
	Page<Comment> findByReviewId(Long id,Pageable pageable);
	
	@Query("Select c From Comment c"
			+ " Where c.review.id like %?1%"
			+ " or title like %?1%"
			+ " or content like %?1%")
	Page<Comment> findByKeyword(String keyword,Pageable pageable);
	
	@Query("Select c From Comment c"
			+ " Where c.review.id like %?1%"
			+ " or title like %?1%"
			+ " or content like %?1%")
	List<Comment> findAllByKeyword(String keyword);
}
