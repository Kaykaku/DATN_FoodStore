package com.foodstore.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.foodstore.model.transaction.Order;

@Repository
public interface OrderDAO extends JpaRepository<Order, Long>{
	@Query("Select o From Order o Where o.customer_o.id=?1")
	Page<Order> findByCustomerId(Long id,Pageable pageable);
	
	@Query("Select o From Order o Where o.customer_o.id like %?1%")
	Page<Order> findAllByOrderIdLike(String id,Pageable pageable);
	
	@Query("Select o From Order o Where o.paymentmethod.id=?1")
	Page<Order> findByPaymentmethodId(Long id,Pageable pageable);
	
	@Query("Select o From Order o Where o.paymentmethod.id=?1 and o.paymentmethod.id=?2")
	Page<Order> findByCustomerIdAndPaymentmethodId(Long customerId , Long paymentmethodId,Pageable pageable);
	
	
	@Query("Select o From Order o Where o.is_display=?1")
	Page<Order> findByDisplayStatus(Boolean isDisplay,Pageable pageable);
	
	@Query("Select o From Order o Where o.status=?1")
	Page<Order> findByOrderStatus(int status,Pageable pageable);
	
	@Query("Select o From Order o Where o.is_watched=?2")
	Page<Order> findByWatchStatus(Boolean isWatched,Pageable pageable);
	
	@Query("Select o From Order o Where o.shipped_address LIKE %?1% or o.shipped_phone LIKE %?1%")
	List<Order> findByFilter(String keyword);
	
	/*Summary*/
	@Query(value = "Select count(*) from Orders where order_date = CAST( GETDATE() AS Date)",nativeQuery= true)
	Long getTodayOrder();

	@Query(value = "Select t.last7Days as 'date', ISNULL(sum(price*quantity),0) as ' totalPayment' "
			+ "From (Select cast(Getdate()as Date) last7Days  "
			+ "	Union all "
			+ "	Select DateAdd(day,-1,cast(getdate()as date)) "
			+ "	Union all "
			+ "	Select DateAdd(day,-2,cast(getdate()as date)) "
			+ "	Union all "
			+ "	Select DateAdd(day,-3,cast(getdate()as date)) "
			+ "	Union all "
			+ "	Select DateAdd(day,-4,cast(getdate()as date)) "
			+ "	Union all "
			+ "	Select DateAdd(day,-5,cast(getdate()as date)) "
			+ "	Union all "
			+ "	Select DateAdd(day,-6,cast(getdate()as date)) "
			+ "	Union all "
			+ "	Select DateAdd(day,-7,cast(getdate()as date)) "
			+ ") t Left Join Orders t1 on cast(t.last7Days as date) = Cast(t1.order_date as date) "
			+ "left join order_details dt on  t1.id = dt.order_id "
			+ "Group by cast(t.last7Days as Date)", nativeQuery = true)
	List<Object[]> getRevenueLast7Days();
}
