
import database.Dao;
import java.time.LocalDate;
import java.util.List;
import model.User;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */

/**
 *
 * @author tramy
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        Dao dao = new Dao();
//        dao.updateLoginCount("002", 3,LocalDate.now(),1);
        User user = dao.getAll("001", "123");
        System.out.print(user);
        
        
    }
}
