package com.foodstore.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.foodstore.model.entity.Food;
import com.foodstore.util.constraints.Display;

@Repository
public interface FoodDAO extends JpaRepository<Food, Long> {

	@Query("SELECT f FROM Food f WHERE f.is_display = ?1 AND f.quantity_limit > ?2")
	List<Food> findByIsDisplayAndQuantity(Boolean isDisplay, Integer quantityLimit);

	@Query("SELECT f FROM Food f WHERE f.is_display = ?1 AND f.quantity_limit > ?2")
	Page<Food> findByIsDisplayAndQuantity(Boolean isDisplay, Integer quantityLimit, Pageable pageable);

	@Query("SELECT f FROM Food f WHERE f.name LIKE %?1% or f.description LIKE %?1% ")
	Page<Food> findByKeyword2(String keyword, Pageable pageable);
	
	@Query("SELECT f FROM Food f WHERE f.name LIKE %?1%")
	List<Food> findByKeyword2(String keyword);
	
	@Query("SELECT f FROM Food f WHERE f.is_display =" + Display.SHOW)
	List<Food> findByActive();

	@Query("SELECT f FROM Food f WHERE f.name "
			+ "LIKE %?1% AND f.is_display = ?2 AND f.quantity_limit > ?3")
	Page<Food> findByKeyword(String keyword, Boolean isDisplay, Integer quantityLimit, Pageable pageable);
	
	@Modifying(clearAutomatically = true)
	@Query("UPDATE Food f SET f.is_display = ?1 WHERE f.id = ?2")
	void deleteLogical(Boolean isDisplay, Long id);

	@Query("SELECT f FROM Food f WHERE f.is_display = ?1 AND f.quantity_limit > ?2 ORDER BY f.create_date DESC")
	Page<Food> getNewProduct(Boolean isDisplay, Integer quantityLimit, Pageable pageable);
	
	@Query("SELECT f.food_c FROM CategoryFood f WHERE f.category_f.name = ?1")
	Page<Food> findByCategoryName(String name, Pageable pageable);
	
	/*Summary*/
	@Query(value="Select Count(*) from foods f where f.is_display = 1",nativeQuery = true)
	Long getAvailable();

	@Query(value="Select c.display_name, ISNULL(sum(odt.quantity),0) from categories c  "
			+ "inner join category_foods f on c.id = f.category_id "
			+ "inner join order_details odt on f.food_id = odt.food_id "
			+ "inner join orders o on odt.order_id = o.id "
			+ "Where cast(o.order_date as date) >= DateAdd(day,-365,cast(getdate() as date)) "
			+ "group by c.display_name",nativeQuery = true)
	List<Object[]> numberOfProductSoldByType();

	@Query(value="Select c.display_name, ISNULL(sum(odt.quantity),0) from categories c  "
			+ "inner join category_foods f on c.id = f.category_id "
			+ "inner join order_details odt on f.food_id = odt.food_id "
			+ "inner join orders o on odt.order_id = o.id "
			+ "group by c.display_name",nativeQuery = true)
	List<Object[]> getPercentByCate();

	@Query(value = "with table1 as ( "
			+ "	Select c.display_name as catename,  "
			+ "	count(*) as available "
			+ "	from categories c "
			+ "	left join category_foods cf on cf.category_id = c.id "
			+ "	left join foods f on cf.food_id = f.id "
			+ "	where f.is_display = 1 "
			+ "	group by c.display_name "
			+ "), "
			+ "table2 as ( "
			+ "	Select c.display_name as catename,  "
			+ "	count(*) as unavailable "
			+ "	from categories c "
			+ "	left join category_foods cf on cf.category_id = c.id "
			+ "	left join foods f on cf.food_id = f.id "
			+ "	where f.is_display = 0 "
			+ "	group by c.display_name "
			+ ") "
			+ "Select t1.catename,t1.available,t2.unavailable  "
			+ "from table1 t1 left join table2 t2 on t1.catename = t2.catename", nativeQuery = true)
	List<Object[]> availableRate();

	@Query(value="Select top 10 f.name, count(odt.food_id) as mostSold "
			+ "From order_details odt inner join foods f  "
			+ "on odt.food_id = f.id "
			+ "group by f.Name "
			+ "Order by mostSold desc",nativeQuery = true)
	List<Object[]> top10Product();
}
