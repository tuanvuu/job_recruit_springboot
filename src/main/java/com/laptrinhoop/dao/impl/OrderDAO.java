package com.laptrinhoop.dao.impl;

import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.laptrinhoop.dao.IOrderDAO;
import com.laptrinhoop.dao.IOrderDetailDAO;
import com.laptrinhoop.entity.Customer;
import com.laptrinhoop.entity.Apply;
import com.laptrinhoop.entity.ApplyDetail;
import com.laptrinhoop.entity.Job;
import com.laptrinhoop.service.impl.CartService;
@Repository
public class OrderDAO extends GeneraDAO<Apply, Integer> implements IOrderDAO {

	@Autowired
	private IOrderDetailDAO dao;

	@Override
	public void create(Apply o, CartService cart) {
		this.create(o);
		Collection<Job> items = cart.getItemsCart();
		items.forEach(p -> {
			ApplyDetail detail = new ApplyDetail();
			detail.setOrder(o);
			detail.setProduct(p);
//			detail.setUnitPrice(p.getUnitPrice());
//			detail.setDiscount(p.getDiscount());
//			detail.setQuantity(p.getQuantity());
			dao.create(detail);
		});

	}

	@Override
	public List<Apply> findByUser(Customer user) {
		String sql = "FROM Apply o WHERE o.customer.id=?0 ORDER BY o.orderDate DESC";
		return this.getResultList(sql, user.getId());
	}

	@Override
	public List<Apply> findByOrderId(String recruiId) {
		String sql = "FROM Apply o WHERE o.orderBy=?0 ORDER BY o.orderDate DESC";
		return this.getResultList(sql, recruiId);
	}

}
