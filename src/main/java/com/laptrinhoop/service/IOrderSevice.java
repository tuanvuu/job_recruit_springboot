package com.laptrinhoop.service;

import java.util.List;
import java.util.Map;

import com.laptrinhoop.entity.Apply;
import com.laptrinhoop.entity.Job;
import com.laptrinhoop.service.impl.CartService;

public interface IOrderSevice extends IGeneralService<Apply, Integer> {
	Apply createOrder();
	void addOrderAndOrderDetail(Apply o, CartService cart); // thêm mới đơn hàng vào db
	List<Apply> getAllOrderByUser();
	Apply findById(Integer id);
	Map<Integer, Job> getPurchasedItems();

	boolean sendEmailNotifyToCustomer(Apply order);
	List<Apply> getAllApplysByRecruiId(String recruiId);


}
