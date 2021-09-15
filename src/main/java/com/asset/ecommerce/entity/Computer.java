package com.asset.ecommerce.entity;

import javax.persistence.*;
import java.io.Serializable;

@Table(name = "computer")
@Entity
public class Computer extends ProductType implements Serializable {

    private int id;
    private String cpu;
    private int ram;
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

    @Column(name = "cpu")
    public String getCpu() {
        return cpu;
    }

    public void setCpu(String cpu) {
        this.cpu = cpu;
    }

    @Column(name = "ram")
    public int getRam() {
        return ram;
    }

    public void setRam(int ram) {
        this.ram = ram;
    }

    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "productType_id")
    public ProductType getProductType() {
        return productType;
    }

    public void setProductType(ProductType productType) {
        this.productType = productType;
    }
}
