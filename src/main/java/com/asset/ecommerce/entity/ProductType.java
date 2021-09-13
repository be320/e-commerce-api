package com.asset.ecommerce.entity;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Table(name = "product_type")
@Entity
public abstract class ProductType {

    private int id;
    private List<Product> products = new ArrayList<>();

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @OneToMany(mappedBy = "product_type", fetch = FetchType.LAZY)
    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }

}
