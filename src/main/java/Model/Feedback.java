/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author ASUS
 */
public class Feedback {
    private int id;
    private String title;
    private String message;
    private int creator;

    public Feedback(int id, String title, String message, int creator) {
        this.id = id;
        this.title = title;
        this.message = message;
        this.creator = creator;
    }

    public Feedback() {
    }

    public int getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public int getCreator() {
        return creator;
    }

    public void setCreator(int creator) {
        this.creator = creator;
    }

    @Override
    public String toString() {
        return "Feedback{" + "id=" + id + ", title=" + title + ", message=" + message + ", creator=" + creator + '}';
    }
    
}
