/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Main;
import DAO.NhanVienDAO;
import java.util.Map;
/**
 *
 * @author ASUS
 */
public class NewClass {
    public static void main(String[] args) {
        NhanVienDAO dao1= new NhanVienDAO();
        Map<String, String> mapNV= dao1.selectHoTenNV();
        System.out.println(mapNV.get("NV01"));
    }
}
