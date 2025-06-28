package repository.sign;

import dbConnection.DBConnection;
import entity.PublicKeyStorage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class PublicKeyStorageRepository {

    // Lấy public key theo userID
    public PublicKeyStorage getByUserId(long userId) {
        PublicKeyStorage result = null;
        String sql = "SELECT * FROM publickeystorage WHERE userID = ?";

        try (
                Connection conn = DBConnection.getConection();
                PreparedStatement ps = conn.prepareStatement(sql);
        ) {
            ps.setLong(1, userId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                result = new PublicKeyStorage();
                result.setUserID(rs.getLong("userID"));
                result.setPublicKey(rs.getString("publicKey"));
                result.setUpdateAt(rs.getTimestamp("updateAt"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }
}
