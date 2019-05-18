/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nw.bean;

/**
 *
 * @author Admin
 */
public class CategoryBean {
    private int CategoryID;
    private String Name;
    private int ParentCategoryID;

    public CategoryBean() {
    }

    public CategoryBean(int CategoryID, String Name, int ParentCategoryID) {
        this.CategoryID = CategoryID;
        this.Name = Name;
        this.ParentCategoryID = ParentCategoryID;
    }

    public int getCategoryID() {
        return CategoryID;
    }

    public void setCategoryID(int CategoryID) {
        this.CategoryID = CategoryID;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public int getParentCategoryID() {
        return ParentCategoryID;
    }

    public void setParentCategoryID(int ParentCategoryID) {
        this.ParentCategoryID = ParentCategoryID;
    }
    
}
