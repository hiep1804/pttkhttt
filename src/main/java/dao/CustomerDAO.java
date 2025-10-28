/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.Customer;
import model.Member;

/**
 *
 * @author hn235
 */
public class CustomerDAO extends DAO{
    public Customer getCustomerByIdMember(Member member){
        String sql="select * from tblcustomer where tbl_member_id=?";
        Customer customer=null;
        try(Connection connection = this.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(sql);){
            preparedStatement.setInt(1, member.getId());
            ResultSet resultSet = preparedStatement.executeQuery();
            customer=new Customer();
            while (resultSet.next()) {
                customer.setId(resultSet.getInt(1));
                customer.setUsername(member.getUsername());
                customer.setPassword(member.getPassword());
                customer.setName(member.getName());
                customer.setDateOfBirth(member.getDateOfBirth());
                customer.setAddress(member.getAddress());
                customer.setEmail(member.getEmail());
                customer.setPhoneNumber(member.getPhoneNumber());
                customer.setRole(member.getRole());
                customer.setMemberId(member.getId());
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return customer;
    }
}
