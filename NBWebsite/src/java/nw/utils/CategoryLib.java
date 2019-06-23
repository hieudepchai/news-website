/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nw.utils;

import nw.dao.CategoryDAO;

/**
 *
 * @author Admin
 */
public class CategoryLib {
    private static MyBiMap<Integer, String> CatBiMap;
    static{
        CategoryDAO catDAO = new CategoryDAO();
        CatBiMap = catDAO.getListCategory();
    }
    public static MyBiMap<Integer, String> getCatBiMap()
    {
        return CatBiMap;
    }
}
