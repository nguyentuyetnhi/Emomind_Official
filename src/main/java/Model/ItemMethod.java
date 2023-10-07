/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author ASUS
 */
public class ItemMethod {
    private int ID;
    private String link;
    private int methodID;
    private String image;
    private String methodName;

    public int getID() {
        return ID;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public int getMethodID() {
        return methodID;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getMethodName() {
        return methodName;
    }

    public void setMethodName(String methodName) {
        this.methodName = methodName;
    }
    public ItemMethod() {
    }

    public ItemMethod(int ID, String link, int methodID, String image, String methodName) {
        this.ID = ID;
        this.link = link;
        this.methodID = methodID;
        this.image = image;
        this.methodName = methodName;
    }

    @Override
    public String toString() {
        return "ItemMethod{" + "ID=" + ID + ", link=" + link + ", methodID=" + methodID + ", image=" + image + '}';
    }
    
    
}
