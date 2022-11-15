package com.foodstore.dao;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.foodstore.model.transaction.Review;

@Repository
public interface ReviewDAO extends JpaRepository<Review, Long>{
	@Query("Select o From Review o Where o.food_r.id=?1")
	Page<Review> findByFoodId(Pageable pageable,Long id);
	
	@Query("Select o From Review o Where o.customer_r.id=?1")
	Page<Review> findByCustomerId(Pageable pageable,Long id);
	
	@Query("Select o From Review o Where o.food_od.id=?1 and o.order.id=?2")
	Optional<Review> findByCustomerIdAndFoodId(Pageable pageable, Long customerId,Long foodId );
	
	//Fix later
	/*
	 * @Query("Select o From Review o Where " +
	 * "o.is_display=?3 and o.status=?1 and is_favorite = ?2") Page<Review>
	 * findByAllStatus(Pageable pageable,int status ,boolean isFavorite ,boolean
	 * isDisplay);
	 */
}
