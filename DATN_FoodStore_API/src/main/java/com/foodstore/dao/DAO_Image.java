package com.foodstore.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.foodstore.model.extend.Image;


@Repository
public interface DAO_Image extends JpaRepository<Image, Long>{

}
