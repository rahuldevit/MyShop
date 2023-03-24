
package com.myshop.entities;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Category {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int categoryId;
    private String categoryTitel;
    @Column(length = 3000)
    private String categoryDescription;
    
    @OneToMany(mappedBy = "category")
    private List<Product> products = new ArrayList<>();

    public Category(int categoryId, String categoryTitel, String categoryDescription) {
        this.categoryId = categoryId;
        this.categoryTitel = categoryTitel;
        this.categoryDescription = categoryDescription;
    }

    public Category(String categoryTitel, String categoryDescription,List<Product> products) {
        this.categoryTitel = categoryTitel;
        this.categoryDescription = categoryDescription;
        this.products = products;
    }

    public Category() {
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryTitel() {
        return categoryTitel;
    }

    public void setCategoryTitel(String categoryTitel) {
        this.categoryTitel = categoryTitel;
    }

    public String getCategoryDescription() {
        return categoryDescription;
    }

    public void setCategoryDescription(String categoryDescription) {
        this.categoryDescription = categoryDescription;
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }
    
    

    @Override
    public String toString() {
        return "Category{" + "categoryId=" + categoryId + ", categoryTitel=" + categoryTitel + ", categoryDescription=" + categoryDescription + '}';
    }
    
    
}
