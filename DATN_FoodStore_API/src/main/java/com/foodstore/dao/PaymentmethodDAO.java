package com.foodstore.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.foodstore.model.entity.Paymentmethod;


@Repository
public interface PaymentmethodDAO extends JpaRepository<Paymentmethod, Long>{

	@Query("SELECT p FROM Paymentmethod p WHERE p.is_display = ?1")
	List<Paymentmethod> findByIsDisplay(Boolean isDisplay);

	@Modifying(clearAutomatically = true)
	@Query("UPDATE Paymentmethod p SET p.is_display = ?1 WHERE p.id = ?2")
	void deleteLogical(Boolean isDisplay, Long id);

	@Query("SELECT p FROM Paymentmethod p WHERE p.is_display = ?1 AND p.name = ?2")
	Paymentmethod findByName(Boolean isDisplay, String name);

}
