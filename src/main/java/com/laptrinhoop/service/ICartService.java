package com.laptrinhoop.service;

import java.util.Collection;

import com.laptrinhoop.entity.Job;

public interface ICartService {
	void addCart(Integer id);
	void removeCart(Integer id);
	void updateCart(Integer id, int qty);
	void clear();
	int getCountCart();
	double getAmountCart();
	Collection<Job> getItemsCart();
	
	

}
