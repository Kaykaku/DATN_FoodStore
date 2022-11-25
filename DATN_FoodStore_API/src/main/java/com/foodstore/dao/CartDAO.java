package com.foodstore.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.foodstore.model.transaction.Cart;

@Repository
public interface CartDAO extends JpaRepository<Cart, Long> {
	Page<Cart> findAll(Pageable pageable);

	@Query("Select c From Cart c Where c.customer_cart.id=?1")
	Page<Cart> findByCustomerId(Long id, Pageable pageable);

	@Query("Select c From Cart c Where c.food_cart.id=?1")
	Page<Cart> findByFoodId(Long id, Pageable pageable);

	@Query("Select c From Cart c Where c.customer_cart.id=?1 and c.food_cart.id=?2")
	Optional<Cart> findByCustomerIdAndFoodId(Long customerId, Long foodId);

	@Query("Select c From Cart c Where c.customer_cart.username = ?1")
	Page<Cart> getByCustomerName(String username, Pageable pageable);

	@Query("Select c From Cart c Where c.customer_cart.username = ?1")
	List<Cart> getByCustomerName(String username);

	@Modifying(clearAutomatically = true)
	@Query(value = "delete from cart where customer_id = ?1", nativeQuery = true)
	void deleteAll(Long id);
}
