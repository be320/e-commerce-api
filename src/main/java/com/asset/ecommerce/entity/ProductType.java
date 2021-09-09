package com.asset.ecommerce.entity;

import javax.persistence.*;
import java.util.List;

public interface ProductType {

    public int getId();
    public void setId(int id);
    public List<Product> getProducts();
    public void setProducts(List<Product> products);
}
