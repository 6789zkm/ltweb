package dao;

import dbConnection.DBConnection;
import entity.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class PublicKeyStorageDB {
    public static void addNewPublicKey(User user, String publicKey) {
        try {
            Connection cnn = DBConnection.getConection();
            String sql = "INSERT INTO `publickeystorage` (`userID`, `publicKey`) VALUES (?, ?)";
            PreparedStatement ps = cnn.prepareStatement(sql);
            ps.setLong(1, user.getId());
            ps.setString(2, publicKey);
            ps.executeUpdate();
            ps.close();
            cnn.close();

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static String getPublicKey(User user) {
        try {
            Connection cnn = DBConnection.getConection();
            String sql = "SELECT publicKey FROM `publickeystorage` WHERE userID = ? ORDER BY updateAt DESC LIMIT 1";
            PreparedStatement ps = cnn.prepareStatement(sql);
            ps.setLong(1, user.getId());
            

            // Assuming you have a method to extract the public key from the ResultSet
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString("publicKey");
            }

            ps.close();
            cnn.close();

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    public  String getPublicKeyF(User user) {
        try {
            Connection cnn = DBConnection.getConection();
            String sql = "SELECT publicKey FROM `publickeystorage` WHERE userID = ? ORDER BY updateAt DESC LIMIT 1";
            PreparedStatement ps = cnn.prepareStatement(sql);
            ps.setLong(1, user.getId());


            // Assuming you have a method to extract the public key from the ResultSet
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString("publicKey");
            }

            ps.close();
            cnn.close();

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return null;
    }
}
