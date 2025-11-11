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
import model.Seat;
import model.Ticket;

/**
 *
 * @author hn235
 */
public class TicketDAO extends DAO{
    public List<Ticket> getAllTicket(int schedule_id){
        List<Ticket> tickets=new ArrayList<>();
        String sql="select * from tblticket where tbl_screening_schedule_id=?";
        try (Connection connection = this.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, schedule_id);
            // Execute the query
            ResultSet resultSet = preparedStatement.executeQuery();
            
            // Process the ResultSet object
            while (resultSet.next()) {
                Ticket ticket=new Ticket();
                ticket.setId(resultSet.getInt("id"));
                ticket.setPrice(resultSet.getFloat("price"));
                int seat_id=resultSet.getInt("tbl_seat_id");
                Seat seat=new Seat();
                PreparedStatement preparedStatement1 = connection.prepareStatement("select * from tblseat where id=?");
                preparedStatement1.setInt(1, seat_id);
                ResultSet resultSet1=preparedStatement1.executeQuery();
                if(resultSet1.next()){
                    seat.setId(resultSet1.getInt("id"));
                    seat.setName(resultSet1.getString("name"));
                    seat.setRow(resultSet1.getInt("row_idx"));
                    seat.setCol(resultSet1.getInt("col"));
                    seat.setStatus(resultSet1.getBoolean("status"));
                }
                ticket.setSeat(seat);
                tickets.add(ticket);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tickets;
    }
}
