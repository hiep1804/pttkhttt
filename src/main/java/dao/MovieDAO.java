/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import model.Movie;

public class MovieDAO extends DAO{
    
    public int addMovie(List<Movie> movies) {
        int count = 0;
        String sql = "INSERT INTO tblmovie (name, category, duration, nation, director, year) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            for (Movie m : movies) {
                stmt.setString(1, m.getName());
                stmt.setString(2, m.getCategory());
                stmt.setInt(3, m.getDuration());
                stmt.setString(4, m.getNation());
                stmt.setString(5, m.getDirector());
                stmt.setInt(6, m.getYear());
                count += stmt.executeUpdate();
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return count;
    }
}

