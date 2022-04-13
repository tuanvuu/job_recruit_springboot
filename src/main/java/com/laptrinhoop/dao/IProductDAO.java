package com.laptrinhoop.dao;

import java.util.List;

import com.laptrinhoop.entity.Job;

public interface IProductDAO extends IGeneralDAO<Job, Integer> {

     	List<Job> findByKeywords(String keywords);
     	List<Job> findByCategoryId(Integer id);
     	List<Job> findItemByHot(String key);
     	List<Job> findByIdsInCookie(String id);
     	List<Job> findByCustomerId(String id);
	

}
