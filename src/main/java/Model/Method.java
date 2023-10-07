/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author ASUS
 */
public class Method {
    private int ID;
    private String name;
    private String description;

    public int getID() {
        return ID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Method(int ID, String name, String description) {
        this.ID = ID;
        this.name = name;
        this.description = description;
    }

    public Method() {
    }

    @Override
    public String toString() {
        return "Method{" + "ID=" + ID + ", name=" + name + ", description=" + description + '}';
    }
    
    
}
