package com.laptrinhoop.service;

import java.util.List;

import com.laptrinhoop.entity.Job;

public interface IProductService extends IGeneralService<Job, Integer> {
	List<Job> findByKeywords(String keyWords);
	List<Job> findAllProductByCategory(int id);
	List<Job> findByHot(String key);
	List<Job>  getViewProduct(String name, String id); //  get những sản phẩm da xem thông qua mảng id sp trong Cookie
	List<Job>  getFaVoProduct(String name, String id); // get những sản phẩm yêu thích thông qua mảng id sp trong Cookie
	List<Job>  findByIdsInCookie(String ids);

    List<Job> findByCustomerId(String id);
}
