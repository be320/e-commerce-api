package com.asset.ecommerce.entity;

import java.util.ArrayList;
import java.util.List;

public class Customer extends User {

    private List<Order> orders = new ArrayList<>();

    public List<Order> getOrders() {
        return orders;
    }

    public void setOrders(List<Order> orders) {
        this.orders = orders;
    }
}
