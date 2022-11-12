package com.foodstore.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.foodstore.model.transaction.Notification;


@Repository
public interface DAO_Notification extends JpaRepository<Notification, Long>{

}
