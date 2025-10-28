/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.Employee;
import model.Member;

/**
 *
 * @author hn235
 */
public class EmployeeDAO extends DAO{
    public Employee getEmployeeByIdMember(Member member){
        System.out.println("m:"+member.getId());
        String sql="select * from tblemployee where tbl_member_id=?";
        Employee employee=null;
        try(Connection connection = this.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(sql);){
            preparedStatement.setInt(1, member.getId());
            ResultSet resultSet = preparedStatement.executeQuery();
            employee=new Employee();
            while (resultSet.next()) {
                employee.setId(resultSet.getInt(1));
                employee.setUsername(member.getUsername());
                employee.setPassword(member.getPassword());
                employee.setName(member.getName());
                employee.setDateOfBirth(member.getDateOfBirth());
                employee.setAddress(member.getAddress());
                employee.setEmail(member.getEmail());
                employee.setPhoneNumber(member.getPhoneNumber());
                employee.setRole(member.getRole());
                employee.setMemberId(member.getId());
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return employee;
    }
}
