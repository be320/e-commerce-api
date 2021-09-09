package com.asset.ecommerce.entity;

import java.util.ArrayList;
import java.util.List;

public class Shoe implements ProductType {

    private int id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    private List<Product> products = new ArrayList<>();

    @Override
    public List<Product> getProducts() {
        return products;
    }

    @Override
    public void setProducts(List<Product> products) {
        this.products = products;
    }
}
