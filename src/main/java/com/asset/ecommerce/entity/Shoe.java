package com.asset.ecommerce.entity;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Table(name = "shoe")
@Entity
public class Shoe extends ProductType {

    private int id;
    private int size;
    private ProductType productType;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    @Override
    public int getId() {
        return id;
    }

    @Override
    public void setId(int id) {
        this.id = id;
    }

    @Column(name = "size")
    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "product_type_id")
    public ProductType getProductType() {
        return productType;
    }

    public void setProductType(ProductType productType) {
        this.productType = productType;
    }
}
