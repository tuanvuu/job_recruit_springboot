package com.laptrinhoop.service.impl;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import com.laptrinhoop.dao.IProductDAO;
import com.laptrinhoop.entity.Job;
import com.laptrinhoop.service.ICartService;

@SessionScope 
@Service("cart")
public class CartService implements ICartService {

	@Autowired
	private IProductDAO daoProduct;

	Map<Integer, Job> map = new HashMap<Integer, Job>();

	@Override
	public void addCart(Integer id) {
		Job p = map.get(id);
		if (p != null) {
		} else { 
			p = daoProduct.findById(id);
			map.put(id, p);
		}
		System.out.println("Card service method add :" + map.size());
	}


	@Override
	public void removeCart(Integer id) {
		map.remove(id);
	}


	@Override
	public void updateCart(Integer id, int qty) {
		Job product = map.get(id);
	}

	@Override
	public void clear() {
		map.clear();
	}

	@Override
	public int getCountCart() {
		Collection<Job> product = this.getItemsCart();
		int count = 0;
		for (Job p : product) {
			count += 1;
		}
		return count;
	}

	@Override
	public double getAmountCart() {
		Collection<Job> ps = this.getItemsCart();
		double amount = 0;
		for (Job product : ps) {
		//	amount += (product.getQuantity() * (product.getUnitPrice() - (product.getUnitPrice() * product.getDiscount())));
		}
		return amount;
	}


	@Override
	public Collection<Job> getItemsCart() {
		return map.values();
	}

}
