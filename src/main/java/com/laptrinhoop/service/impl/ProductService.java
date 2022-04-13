package com.laptrinhoop.service.impl;

import java.util.List;

import com.laptrinhoop.dao.ICustomerDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.laptrinhoop.dao.IProductDAO;
import com.laptrinhoop.entity.Job;
import com.laptrinhoop.service.ICookieService;
import com.laptrinhoop.service.IProductService;

@Service
public class ProductService extends GeneralService<Job, Integer>implements IProductService {

	@Autowired
	private IProductDAO dao;

	@Autowired
	private ICustomerDAO customerDAO;

	@Autowired
	private ICookieService cookieService;

	@Override
	public List<Job> findByKeywords(String keyWords) {
		return dao.findByKeywords(keyWords);
	}


	@Override
	public List<Job> findAllProductByCategory(int id) {
		return dao.findByCategoryId(id);
	}

	@Override
	public List<Job> findByHot(String key) {
		return dao.findItemByHot(key);
	}

	@Override
	public List<Job> getViewProduct(String name, String id) {
		String ids = cookieService.getCookieValue(name, id.toString());
		if (!ids.contains(id.toString())) { 
			ids += "," + id.toString();
		}
		cookieService.createCookie(name, ids, 15);
		return dao.findByIdsInCookie(ids); 
	}

	@Override
	public List<Job> getFaVoProduct(String name, String id) {
		String favos = cookieService.getCookieValue(name, "");
		if (favos.length() > 0) 
		{
			return dao.findByIdsInCookie(favos); 
		} else
			return null;
	}


	@Override
	public List<Job> findByIdsInCookie(String ids) {
		return dao.findByIdsInCookie(ids);
	}

	@Override
	public List<Job> findByCustomerId(String id) {
		return dao.findByCustomerId(id);
	}


}
