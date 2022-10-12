/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ebutler.swp.dto;

/**
 *
 * @author Dang Viet
 */
public class ProductDTO {
    private String product_ID;
    private String category_ID;
    private String name;
    private String image;

    public ProductDTO() {
        this.product_ID = "";
        this.category_ID = "";
        this.name = "";
        this.image = "";
    }

    public ProductDTO(String product_ID, String category_ID, String name, String image) {
        this.product_ID = product_ID;
        this.category_ID = category_ID;
        this.name = name;
        this.image = image;
    }

    public String getProduct_ID() {
        return product_ID;
    }

    public void setProduct_ID(String product_ID) {
        this.product_ID = product_ID;
    }

    public String getCategory_ID() {
        return category_ID;
    }

    public void setCategory_ID(String category_ID) {
        this.category_ID = category_ID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "ProductDTO{" + "product_ID=" + product_ID + ", category_ID=" + category_ID + ", name=" + name + ", image=" + image + '}';
    }

    
    
}
