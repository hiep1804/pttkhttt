/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.Member;

/**
 *
 * @author hn235
 */
public class MemberDAO extends DAO{
    public Member getMemberByUsernameAndPassword(String username, String password){
        String sql="select * from tblmember where username=? and password=?";
        Member member=null;
        try(Connection connection = this.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(sql);){
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            ResultSet resultSet = preparedStatement.executeQuery();
            member=new Member();
            while (resultSet.next()) {
                member.setId(resultSet.getInt(1));
                member.setUsername(username);
                member.setPassword(password);
                member.setName(resultSet.getString(4));
                member.setDateOfBirth(resultSet.getDate(5).toLocalDate());
                member.setAddress(resultSet.getString(6));
                member.setEmail(resultSet.getString(7));
                member.setPhoneNumber(resultSet.getString(8));
                member.setRole(resultSet.getString(9));
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return member;
    }
}
