/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Movie;
import model.ScreeningSchedule;

/**
 *
 * @author hn235
 */
public class ScreeningScheduleDAO extends DAO {

    public List<ScreeningSchedule> getAllScreeningSchedule() {
        List<ScreeningSchedule> screeningSchedules = new ArrayList<>();
        String sql = "select * from tblscreeningschedule";
        try (Connection connection = this.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            // Execute the query
            ResultSet resultSet = preparedStatement.executeQuery();

            // Process the ResultSet object
            while (resultSet.next()) {
                ScreeningSchedule screeningSchedule = new ScreeningSchedule();
                screeningSchedule.setId(resultSet.getInt("id"));
                screeningSchedule.setTime(resultSet.getTimestamp("time").toLocalDateTime());
                int id1 = resultSet.getInt("tbl_movie_id");
                PreparedStatement preparedStatement1 = connection.prepareStatement("select * from tblmovie where id=?");
                preparedStatement1.setInt(1, id1);
                Movie movie = new Movie();
                // Execute the query
                ResultSet resultSet1 = preparedStatement1.executeQuery();

                // Process the ResultSet object
                if (resultSet1.next()) {
                    movie.setId(id1);
                    movie.setCategory(resultSet1.getString("category"));
                    movie.setName(resultSet1.getString("name"));
                    movie.setDuration(resultSet1.getInt("duration"));
                    movie.setDirector(resultSet1.getString("director"));
                    movie.setNation(resultSet1.getString("nation"));
                    movie.setYear(resultSet1.getInt("year"));
                }
                screeningSchedule.setMovie(movie);
                screeningSchedules.add(screeningSchedule);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return screeningSchedules;
    }
}
