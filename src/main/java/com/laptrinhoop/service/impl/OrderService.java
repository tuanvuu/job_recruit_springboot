package com.laptrinhoop.service.impl;

import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.laptrinhoop.service.IMailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.laptrinhoop.dao.IOrderDAO;
import com.laptrinhoop.dao.IOrderDetailDAO;
import com.laptrinhoop.entity.Customer;
import com.laptrinhoop.entity.Apply;
import com.laptrinhoop.entity.ApplyDetail;
import com.laptrinhoop.entity.Job;
import com.laptrinhoop.service.IOrderSevice;

@Service
public class OrderService extends GeneralService<Apply, Integer> implements IOrderSevice {

    @Autowired
    private CartService cart;

    @Autowired
    private HttpService http;

    @Autowired
    private IOrderDAO orderDAO;

    @Autowired
    private IOrderDetailDAO detailDAO;

    @Autowired
    private IMailService mailService;

    @Override
    public Apply createOrder() {
        Customer customer = http.getSession("user");
        Apply order = new Apply();
        order.setOrderDate(new Date());
        //order.set(cart.getAmountCart());
        order.setCustomer(customer);
        return order;
    }

    @Override
    public void addOrderAndOrderDetail(Apply o, CartService cart) {
        Collection<Job> items = cart.getItemsCart();
        items.forEach(p -> {
            o.setOrderBy(p.getCreateBy());
        });
        o.setStatus(1);
        orderDAO.create(o);

        items.forEach(p -> {
            ApplyDetail detail = new ApplyDetail();

            detail.setOrder(o);
            detail.setProduct(p);
//			detail.setUnitPrice(p.getUnitPrice());
//			detail.setDiscount(p.getDiscount());
//			detail.setQuantity(p.getQuantity());
            detailDAO.create(detail);
        });
    }

    @Override
    public List<Apply> getAllOrderByUser() {
        Customer user = http.getSession("user");
        return orderDAO.findByUser(user);
    }

    @Override
    public Apply findById(Integer id) {
        return orderDAO.findById(id);
    }

    @Override
    public Map<Integer, Job> getPurchasedItems() {
        Customer user = http.getSession("user");
        List<Apply> list = orderDAO.findByUser(user);
        Map<Integer, Job> prods = new HashMap<Integer, Job>();
        list.forEach(order -> {
            order.getOrderDetails().forEach(details -> {
                Job p = details.getProduct();
                prods.put(p.getId(), p);
            });

        });
        return prods;
    }


    @Override
    public boolean sendEmailNotifyToCustomer(Apply order) {
        String to = order.getCustomer().getEmail();

        return false;
    }

    @Override
    public List<Apply> getAllApplysByRecruiId(String recruiId) {
        return orderDAO.findByOrderId(recruiId);
    }

}
