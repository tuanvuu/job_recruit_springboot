package com.laptrinhoop.entity;

import javax.persistence.*;

@Entity @Table(name="ApplyDetails")
public class ApplyDetail {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer id;

	@ManyToOne
	@JoinColumn(name = "orderId")
    Apply order;
	
	@ManyToOne
	@JoinColumn(name = "productId")
	Job product;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Apply getOrder() {
		return order;
	}

	public void setOrder(Apply order) {
		this.order = order;
	}

	public Job getProduct() {
		return product;
	}

	public void setProduct(Job product) {
		this.product = product;
	}
}
