package com.foodstore.util.constraints;

public class OrderStatus {
	public static final int WAITING = 0;
	public static final int PICK = 1;
	public static final int PACK = 2;
	public static final int SHIP = 3;
	public static final int SUCCESS= 4;
	public static final int CANCEL = 5;
	
	private OrderStatus() {}
}
