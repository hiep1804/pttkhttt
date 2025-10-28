/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.Employee;
import model.Manager;

/**
 *
 * @author hn235
 */
public class ManagerDAO extends DAO{
    public Manager getManagerByIdEmployee(Employee employee){
        System.out.println("e:"+employee.getId());
        String sql="select * from tblmanager where tbl_employee_id=?";
        Manager manager=null;
        try(Connection connection = this.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(sql);){
            preparedStatement.setInt(1, employee.getId());
            ResultSet resultSet = preparedStatement.executeQuery();
            manager=new Manager();
            while (resultSet.next()) {
                manager.setId(resultSet.getInt(1));
                manager.setUsername(employee.getUsername());
                manager.setPassword(employee.getPassword());
                manager.setName(employee.getName());
                manager.setDateOfBirth(employee.getDateOfBirth());
                manager.setAddress(employee.getAddress());
                manager.setEmail(employee.getEmail());
                manager.setPhoneNumber(employee.getPhoneNumber());
                manager.setRole(employee.getRole());
                manager.setEmployeeId(employee.getId());
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return manager;
    }
}
