/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import model.ScreeningSchedule;
import model.Ticket;

/**
 *
 * @author hn235
 */
public class BillDAO extends DAO {
    
    public int addBill(List<Ticket> tickets) {
        int cnt = 0;
        String sql = "INSERT INTO tblbill ( `total`, `date`) VALUES (?,?)";
        float total = 0;
        for (Ticket ticket : tickets) {
            total += ticket.getPrice();
        }
        try (Connection connection = this.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            // Set the parameters
            preparedStatement.setFloat(1, total);
            preparedStatement.setTimestamp(2, Timestamp.valueOf(LocalDateTime.now()));
            // Execute the insert SQL statement
            int rowsInserted = preparedStatement.executeUpdate();
            if (rowsInserted > 0) {
                // BƯỚC 2: Lấy ResultSet chứa các khóa được tạo
                try (ResultSet rs = preparedStatement.getGeneratedKeys()) {
                    if (rs.next()) {
                        // BƯỚC 3: Đọc ID từ ResultSet
                        // Lấy giá trị của cột đầu tiên (đó chính là ID)
                        int generatedId = rs.getInt(1);
                        for(Ticket ticket:tickets){
                            PreparedStatement preparedStatement1 = connection.prepareStatement("UPDATE tblticket SET `tbl_bill_id` = ? WHERE `id` = ?");
                            preparedStatement1.setInt(1, generatedId);
                            preparedStatement1.setInt(2, ticket.getId());
                            preparedStatement1.executeUpdate();
                            PreparedStatement preparedStatement2 = connection.prepareStatement("UPDATE tblseat SET `status` = ? WHERE `id` = ?");
                            preparedStatement2.setInt(1, 1);
                            preparedStatement2.setInt(2, ticket.getSeat().getId());
                            preparedStatement2.executeUpdate();
                        }
                    }
                }
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cnt;
    }
}
