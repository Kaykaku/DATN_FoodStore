package com.foodstore.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.foodstore.model.extend.PhoneAddress;


@Repository
public interface PhoneAddressDAO extends JpaRepository<PhoneAddress, Long>{
	@Query("Select n From PhoneAddress n Where n.customer_pa.id=?1")
	Page<PhoneAddress> findByCustomerId(Pageable pageable,Long id);
	
	@Query("Select n From PhoneAddress n Where n.is_address=?1")
	Page<PhoneAddress> findByContactType(Pageable pageable,Boolean contactType);
	
	@Query("Select n From PhoneAddress n Where n.phone_or_address like ?1")
	Page<PhoneAddress> findByKeyword(Pageable pageable,String keyword);
	
	@Query("Select n From PhoneAddress n Where n.phone_or_address like ?1")
	List<PhoneAddress> findByKeyword(String keyword);
}
