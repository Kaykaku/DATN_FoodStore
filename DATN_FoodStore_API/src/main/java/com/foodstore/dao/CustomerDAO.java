package com.foodstore.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.foodstore.model.entity.Customer;

@Repository
public interface CustomerDAO extends JpaRepository<Customer, Long> {

	@Query("SELECT c FROM Customer c WHERE c.is_display = ?1")
	List<Customer> findByIsDisplay(Boolean isDisplay);

	@Query("SELECT c FROM Customer c WHERE c.is_display = ?1")
	Page<Customer> findByIsDisplay(Boolean isDisplay, Pageable pageable);
	
	@Query("SELECT c FROM Customer c WHERE c.username = ?1 AND c.is_display = ?2")
	Customer findByUsername(String username, Boolean isDisplay);
	
	@Query("SELECT c FROM Customer c WHERE c.username = ?1 ")
	Optional<Customer> findByUsername(String username);
	
	@Query("SELECT u FROM Customer u WHERE u.email = ?1")
	Optional<Customer> findByEmail(String email);
	
	@Modifying(clearAutomatically = true)
	@Query("UPDATE Customer c SET c.is_display = ?1 WHERE c.id = ?2")
	void deleteLogical(Boolean isDisplay, Long id);

	@Query("SELECT c FROM Customer c WHERE CONCAT(c.username, c.fullname, c.email) LIKE %?1% AND c.is_display = ?2")
	Page<Customer> findByKeyword(String keyword, Boolean isDisplay, Pageable pageable);
	
	@Query("SELECT u FROM Customer u WHERE u.username LIKE %?1% or u.fullname LIKE %?1% or u.email LIKE %?1%  ")
	Page<Customer> findByKeyword(String keyword, Pageable pageable);
	
	@Query("SELECT u FROM Customer u WHERE u.username LIKE %?1% or u.fullname LIKE %?1% or u.email LIKE %?1%"  )
	List<Customer> findByKeyword(String keyword);
	
	@Query(value="Select a.id,a.username, a.fullname, a.email, a.avatar, "
			+ "sum(odt.price * odt.quantity) as totalPayment "
			+ "From customers a inner join orders o on a.id = o.customer_id "
			+ "inner join order_details odt on o.id = odt.order_id "
			+ "Group by a.id,a.username, a.fullname, a.email, a.avatar "
			+ "order by totalPayment desc",nativeQuery = true)
	List<Object[]> top10Customer();
}
