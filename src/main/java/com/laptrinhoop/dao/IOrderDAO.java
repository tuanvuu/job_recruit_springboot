package com.laptrinhoop.dao;

import java.util.List;

import com.laptrinhoop.entity.Customer;
import com.laptrinhoop.entity.Apply;
import com.laptrinhoop.service.impl.CartService;

public interface IOrderDAO extends IGeneralDAO<Apply, Integer> {

	void create(Apply o, CartService cart);
	List<Apply> findByUser(Customer user);

    List<Apply> findByOrderId(String recruiId);
}
