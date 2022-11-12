package com.foodstore.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.foodstore.model.transaction.Cart;


@Repository
public interface DAO_Cart extends JpaRepository<Cart, Long>{

}
