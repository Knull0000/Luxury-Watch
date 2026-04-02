package DAO;
import Db.connect;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import sanpham.Brands;
import sanpham.Category;
import sanpham.pc;
import sanpham.products;
public class dao {
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public List<products> getAll(){
        List<products> list = new ArrayList<>();
        String query = "SELECT * FROM `products` ";
        try {
            con = new connect().getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                list.add(new products(rs.getInt(1),rs.getString(2),rs.getDouble(3),rs.getString(4),rs.getInt(5),rs.getString(6)));
            }
        } catch (Exception ex) {
            Logger.getLogger(dao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    public List<Category> getCategory(){
        List<Category> list = new ArrayList<>();
        String query = "SELECT * FROM `categories` ";
        try {
            con = new connect().getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                list.add(new Category(rs.getInt(1),rs.getString(2)));
            }
        } catch (Exception ex) {
            Logger.getLogger(dao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    public List<products> getLast() {
        List<products> list = new ArrayList<>();
        String query = "SELECT * FROM products ORDER BY id DESC LIMIT 9";

        try {
            con = new connect().getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new products(rs.getInt(1),rs.getString(2),rs.getDouble(3),rs.getString(4),rs.getInt(5),rs.getString(6)));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return list;
    }
    public List<Brands> getAllBrand() {
        List<Brands> list = new ArrayList<>();
        String query = "SELECT * FROM `brands`";
        try {
            con = new connect().getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                list.add(new Brands(rs.getInt(1),rs.getString(2)));
            }
        } catch (Exception ex) {
            Logger.getLogger(dao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    public List<products> getPbyID(String id){
        List<products> list = new ArrayList<>();
        String query = "SELECT p.* FROM products p " +
                   "JOIN product_categories pc ON p.id = pc.product_id " +
                   "WHERE pc.category_id = ?";
        try {
            con = new connect().getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while(rs.next()){
                list.add(new products(rs.getInt(1),rs.getString(2),rs.getDouble(3),rs.getString(4),rs.getInt(5),rs.getString(6)));
            }
        } catch (Exception ex) {
            Logger.getLogger(dao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    public List<products> getBID(String id){
        List<products> list = new ArrayList<>();
        String query = "SELECT * FROM `products` where brand_id = ?";
        try {
            con = new connect().getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while(rs.next()){
                list.add(new products(rs.getInt(1),rs.getString(2),rs.getDouble(3),rs.getString(4),rs.getInt(5),rs.getString(6)));
            }
        } catch (Exception ex) {
            Logger.getLogger(dao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    public Category getCategoryById(String id){
        String query = "SELECT * FROM categories WHERE id = ?";
        try {
            con = new connect().getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            if(rs.next()){
                return new Category(rs.getInt(1), rs.getString(2));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    public Brands getBById(String id){
        String query = "SELECT * FROM brands WHERE id = ?";
        try {
            con = new connect().getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            if(rs.next()){
                return new Brands(rs.getInt(1), rs.getString(2));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    
    
    
    public static void main(String[] args) {
        dao a = new dao();
        List<products> list = a.getAll();
        List<Category> listC = a.getCategory();
        for(products p:list){
            System.out.println(p);
        }
    }
}
