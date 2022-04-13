package com.laptrinhoop.dao.impl;

import org.springframework.stereotype.Service;

import com.laptrinhoop.dao.IOrderDetailDAO;
import com.laptrinhoop.entity.ApplyDetail;
@Service
public class OrderDetailDAO extends GeneraDAO<ApplyDetail, Integer> implements IOrderDetailDAO{

}
