package repository.sign;

import dbConnection.DBConnection;
import dto.response.LostKeyReport;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class LostKeyRepository {
    private Connection connection;
    private PreparedStatement pst;

    public void reportLostKey(Long userID, String publicKey) throws SQLException {
        String sql = "INSERT INTO lostkeyreport(userID, publicKey) VALUES (?, ?)";
        connection = DBConnection.getConection();
        pst = connection.prepareStatement(sql);
        pst.setLong(1, userID);
        pst.setString(2, publicKey);
        pst.executeUpdate();
        DBConnection.closeConnection(connection);
    }

    public List<LostKeyReport> getAllReports() throws SQLException {
        List<LostKeyReport> list = new ArrayList<>();
        String sql = "SELECT l.id, u.id, u.name, u.email, u.phone, l.publicKey, l.reportTime, l.isHandled " +
                "FROM lostkeyreport l JOIN user u ON l.userID = u.id ORDER BY l.reportTime DESC";
        connection = DBConnection.getConection();
        pst = connection.prepareStatement(sql);
        ResultSet rs = pst.executeQuery();
        while (rs.next()) {
            LostKeyReport report = new LostKeyReport(
                    rs.getLong(1),
                    rs.getLong(2),
                    rs.getString(3),
                    rs.getString(4),
                    rs.getString(5),
                    rs.getString(6),
                    rs.getTimestamp(7),
                    rs.getBoolean(8)
            );
            list.add(report);
        }
        DBConnection.closeConnection(connection);
        return list;
    }
}

