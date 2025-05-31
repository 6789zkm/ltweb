package repository.sign;

import dbConnection.DBConnection;
import dto.response.SignInfo;
import entity.Size;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SignRepository {
    private Connection connection = null;
    private PreparedStatement pst = null;

    public List<SignInfo> getAllSignInfo() throws SQLException {
        connection = DBConnection.getConection();
        List<SignInfo> signInfoList = new ArrayList<>();
        String sql = "SELECT\n" +
                "    u.id,\n" +
                "    u.name,\n" +
                "    u.email,\n" +
                "    u.phone,\n" +
                "    pk.updateAt,\n" +
                "    pk.publicKey,\n" +
                "    pk.isDelete\n" +
                "FROM\n" +
                "    user AS u\n" +
                "JOIN\n" +
                "    publickeystorage AS pk ON u.id = pk.userID\n";
        try {
            pst = connection.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                SignInfo si = new SignInfo(rs.getLong(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getDate(5), rs.getString(6), rs.getBoolean(7));
                signInfoList.add(si);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            if (pst != null) {
                try {
                    pst.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            if (connection != null) {
                try {
                    DBConnection.closeConnection(connection);
                    ;
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return signInfoList;
    }

    public static void main(String[] args) throws SQLException {
        System.out.println(new SignRepository().getAllSignInfo());
    }
}
