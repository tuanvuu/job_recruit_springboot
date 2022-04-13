package com.laptrinhoop.dao.impl;

import com.laptrinhoop.dao.IProductDAO;
import com.laptrinhoop.entity.Job;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ProductDAO extends GeneraDAO<Job, Integer> implements IProductDAO {

	@Override
	public List<Job> findByKeywords(String keywords) {
		String hql = "FROM Job p WHERE p.name LIKE ?0 OR p.category.name " + "LIKE ?1 OR p.category.nameVN LIKE ?2";
		String keyWords = "%" + keywords + "%";
		return getResultListParam(hql, keyWords, keyWords, keyWords);	
	}

	@Override
	public List<Job> findByCategoryId(Integer id) {
		String hql = "FROM Job p WHERE p.category.id = ?0";
		return getResultList(hql, id);
	}

	@Override
	public List<Job> findItemByHot(String key) {
		String hql = "FROM Job";
		switch (key) {
		case "hangmoi":
			hql = "From Job p where year(current_date()) - year(p.JobDate) < 10 ";
			break;
		// sắp xếp chi tiết đơn hàng theo số lượng bán giảm dần
		case "banchay":
			hql = "From Job p order by size (p.orderDetails) DESC";
			break;
		case "xemnhieu":
			hql = "FROM Job p ORDER BY p.viewCount DESC";
			break;
		case "giamgia":
			hql = "From Job p Where p.discount > 0 ORDER BY p.discount DESC";
			break;

		default:
			break;
		}
		return getResultPageOrPagram(hql, 0, 12);
	}


	@Override
	public List<Job> findByIdsInCookie(String id) {
		String hql = "From Job p Where p.id IN ("+ id +")"; 		
		return getResultList(hql);
	}

	@Override
	public List<Job> findByCustomerId(String id) {
		String hql = "From Job p Where p.createBy = ?0";
		return getResultList(hql,id);
	}

}
