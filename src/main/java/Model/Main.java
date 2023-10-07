/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class Main {
    public static void main(String[] args) {
        DAO dao = new DAO();
        List<ItemMethod> list = new ArrayList<>();
        list = dao.SearchMethod("T");
        System.out.println(list);
    }
}
