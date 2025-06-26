package org.example;

import javax.swing.*;
import javax.swing.filechooser.FileNameExtensionFilter;
import javax.swing.filechooser.FileSystemView;
import java.awt.*;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.security.*;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.PKCS8EncodedKeySpec;
import java.util.Base64;

public class SignModel {
    private PublicKey publicKey;
    private PrivateKey privateKey;
    private String lastSavedPublicKey;
    private String lastSavedPrivateKey;
    private String lastSavedFile;
    private static final String mode = "SHA256withRSA";

    public void genKeyPair(int lengthKey) throws NoSuchAlgorithmException {
        if (lengthKey != 1024 && lengthKey != 2048 && lengthKey != 4096) {
            throw new IllegalArgumentException("Độ dài khóa không hợp lệ cho RSA: " + lengthKey + " bit. Phải là 1024, 2048, hoặc 4096 bit.");
        }
        KeyPairGenerator genKey = KeyPairGenerator.getInstance("RSA");
        genKey.initialize(lengthKey);
        KeyPair pair = genKey.generateKeyPair();
        publicKey = pair.getPublic();
        privateKey = pair.getPrivate();
        lastSavedPublicKey = null;
        lastSavedPrivateKey = null;
        lastSavedFile = null;
    }

    public String getPublicKeyStr() {
        return publicKey != null ? Base64.getEncoder().encodeToString(publicKey.getEncoded()) : "";
    }

    public String getPrivateKeyStr() {
        return privateKey != null ? Base64.getEncoder().encodeToString(privateKey.getEncoded()) : "";
    }

    public String loadPrivateKey(String input) {
        File file = new File(input);
        byte[] keyBytes;

        try {
            if (file.exists() && file.isFile()) {
                keyBytes = Base64.getDecoder().decode(Files.readAllBytes(file.toPath()));
            } else {
                keyBytes = Base64.getDecoder().decode(input.getBytes(StandardCharsets.UTF_8));
            }
            PKCS8EncodedKeySpec spec = new PKCS8EncodedKeySpec(keyBytes);
            KeyFactory kf = KeyFactory.getInstance("RSA");
            privateKey = kf.generatePrivate(spec);
            lastSavedPrivateKey = null;
            lastSavedFile = null;
            return "Load khóa bí mật thành công";
        } catch (IOException e) {
            JOptionPane.showMessageDialog(null, "Lỗi khi đọc khóa bí mật: " + e.getMessage());
            return "";
        } catch (IllegalArgumentException e) {
            JOptionPane.showMessageDialog(null, "Chuỗi không hợp lệ (không phải base64): " + e.getMessage());
            return "";
        } catch (NoSuchAlgorithmException | InvalidKeySpecException e) {
            JOptionPane.showMessageDialog(null, "Lỗi tạo khóa bí mật: " + e.getMessage());
            return "";
        }
    }

    public String importKey(File file) throws IOException {
        try (BufferedReader br = new BufferedReader(new FileReader(file))) {
            StringBuilder keyTemp = new StringBuilder();
            String line;
            while ((line = br.readLine()) != null) {
                if (line.contains("KEY")) continue;
                keyTemp.append(line);
            }
            return keyTemp.toString();
        }
    }

    public String savePublicKey(String key, Component parent) throws IOException {
        if (lastSavedPublicKey != null && lastSavedPublicKey.equals(key) && lastSavedFile != null) {
            return "Khóa công khai này đã được lưu tại: " + lastSavedFile + ". Vui lòng tạo khóa mới hoặc chọn nơi lưu khác.";
        }

        int choice = JOptionPane.showConfirmDialog(
                parent,
                "Bạn muốn lưu khóa công khai tự động không?\nChọn 'No' để tự chọn nơi lưu.",
                "Lưu Khóa Công khai",
                JOptionPane.YES_NO_CANCEL_OPTION
        );

        File fileToSave = null;
        String downloadsPath = System.getProperty("user.home") + File.separator + "Downloads";
        File downloadsDir = new File(downloadsPath);
        if (!downloadsDir.exists()) {
            downloadsDir.mkdirs();
        }

        if (choice == JOptionPane.YES_OPTION) {
            String baseName = "publicKeyRSA";
            String extension = ".key";
            fileToSave = new File(downloadsDir, baseName + extension);
            int counter = 1;
            while (fileToSave.exists()) {
                fileToSave = new File(downloadsDir, baseName + " (" + counter + ")" + extension);
                counter++;
            }
        } else if (choice == JOptionPane.NO_OPTION) {
            JFileChooser fileChooser = new JFileChooser();
            fileChooser.setDialogTitle("Chọn nơi lưu khóa công khai");
            fileChooser.setSelectedFile(new File("publicKeyRSA.pub"));
            fileChooser.setFileSelectionMode(JFileChooser.FILES_ONLY);
            fileChooser.setFileFilter(new FileNameExtensionFilter("Public Key Files (*.key)", "key"));
            fileChooser.setAcceptAllFileFilterUsed(true);
            fileChooser.setCurrentDirectory(FileSystemView.getFileSystemView().getRoots()[0]);

            int userSelection = fileChooser.showSaveDialog(parent);
            if (userSelection == JFileChooser.APPROVE_OPTION) {
                fileToSave = fileChooser.getSelectedFile();
                if (fileToSave.exists()) {
                    int overwriteChoice = JOptionPane.showConfirmDialog(
                            parent,
                            "File " + fileToSave.getName() + " đã tồn tại. Bạn có muốn ghi đè?",
                            "Xác nhận ghi đè",
                            JOptionPane.YES_NO_OPTION
                    );
                    if (overwriteChoice != JOptionPane.YES_OPTION) {
                        return "Người dùng đã hủy ghi đè file.";
                    }
                }
            } else {
                return "Người dùng đã hủy lưu file.";
            }
        } else {
            return "Người dùng đã hủy lưu file.";
        }

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(fileToSave))) {
            writer.write("-----BEGIN PUBLIC KEY-----\n");
            writer.write(key + "\n");
            writer.write("-----END PUBLIC KEY-----");
            writer.flush();
            lastSavedPublicKey = key;
            lastSavedFile = fileToSave.getAbsolutePath();
            return "Đã lưu khóa công khai thành công tại: " + lastSavedFile;
        } catch (IOException e) {
            return "Lỗi khi lưu khóa công khai: " + e.getMessage();
        }
    }

    public String savePrivateKey(String key, Component parent) throws IOException {
        if (lastSavedPrivateKey != null && lastSavedPrivateKey.equals(key) && lastSavedFile != null) {
            return "Khóa bí mật này đã được lưu tại: " + lastSavedFile + ". Vui lòng tạo khóa mới hoặc chọn nơi lưu khác.";
        }

        int choice = JOptionPane.showConfirmDialog(
                parent,
                "Bạn muốn lưu khóa bí mật tự động không?\nChọn 'No' để tự chọn nơi lưu.",
                "Lưu Khóa Bí mật",
                JOptionPane.YES_NO_CANCEL_OPTION
        );

        File fileToSave = null;
        String downloadsPath = System.getProperty("user.home") + File.separator + "Downloads";
        File downloadsDir = new File(downloadsPath);
        if (!downloadsDir.exists()) {
            downloadsDir.mkdirs();
        }

        if (choice == JOptionPane.YES_OPTION) {
            String baseName = "privateKeyRSA";
            String extension = ".key";
            fileToSave = new File(downloadsDir, baseName + extension);
            int counter = 1;
            while (fileToSave.exists()) {
                fileToSave = new File(downloadsDir, baseName + " (" + counter + ")" + extension);
                counter++;
            }
        } else if (choice == JOptionPane.NO_OPTION) {
            JFileChooser fileChooser = new JFileChooser();
            fileChooser.setDialogTitle("Chọn nơi lưu khóa bí mật");
            fileChooser.setSelectedFile(new File("privateKeyRSA.key"));
            fileChooser.setFileSelectionMode(JFileChooser.FILES_ONLY);
            fileChooser.setFileFilter(new FileNameExtensionFilter("Private Key Files (*.key)", "key"));
            fileChooser.setAcceptAllFileFilterUsed(true);
            fileChooser.setCurrentDirectory(FileSystemView.getFileSystemView().getRoots()[0]);

            int userSelection = fileChooser.showSaveDialog(parent);
            if (userSelection == JFileChooser.APPROVE_OPTION) {
                fileToSave = fileChooser.getSelectedFile();
                if (fileToSave.exists()) {
                    int overwriteChoice = JOptionPane.showConfirmDialog(
                            parent,
                            "File " + fileToSave.getName() + " đã tồn tại. Bạn có muốn ghi đè?",
                            "Xác nhận ghi đè",
                            JOptionPane.YES_NO_OPTION
                    );
                    if (overwriteChoice != JOptionPane.YES_OPTION) {
                        return "Người dùng đã hủy ghi đè file.";
                    }
                }
            } else {
                return "Người dùng đã hủy lưu file.";
            }
        } else {
            return "Người dùng đã hủy lưu file.";
        }

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(fileToSave))) {
            writer.write("-----BEGIN PRIVATE KEY-----\n");
            writer.write(key + "\n");
            writer.write("-----END PRIVATE KEY-----");
            writer.flush();
            lastSavedPrivateKey = key;
            lastSavedFile = fileToSave.getAbsolutePath();
            return "Đã lưu khóa bí mật thành công tại: " + lastSavedFile;
        } catch (IOException e) {
            return "Lỗi khi lưu khóa bí mật: " + e.getMessage();
        }
    }

    public String saveResult(String input, Component parent, String suggestedExtension) throws IOException {
        if (input == null || input.trim().isEmpty()) {
            return "Không có dữ liệu Base64 để lưu.";
        }

        int choice = JOptionPane.showConfirmDialog(
                parent,
                "Bạn muốn lưu kết quả tự động không?\nChọn 'No' để tự chọn nơi lưu.",
                "Lưu Kết quả",
                JOptionPane.YES_NO_CANCEL_OPTION
        );

        File fileToSave = null;
        String downloadsPath = System.getProperty("user.home") + File.separator + "Downloads";
        File downloadsDir = new File(downloadsPath);
        if (!downloadsDir.exists()) {
            downloadsDir.mkdirs();
        }

        String baseName = "result";
        String extension = suggestedExtension != null ? suggestedExtension : ".txt";

        if (choice == JOptionPane.YES_OPTION) {
            fileToSave = new File(downloadsDir, baseName + extension);
            int counter = 1;
            while (fileToSave.exists()) {
                fileToSave = new File(downloadsDir, baseName + " (" + counter + ")" + extension);
                counter++;
            }
        } else if (choice == JOptionPane.NO_OPTION) {
            JFileChooser fileChooser = new JFileChooser();
            fileChooser.setDialogTitle("Chọn nơi lưu kết quả");
            fileChooser.setSelectedFile(new File(baseName + extension));
            fileChooser.setFileSelectionMode(JFileChooser.FILES_ONLY);
            fileChooser.setFileFilter(new FileNameExtensionFilter("Text Files (*.txt)", "txt"));
            fileChooser.setAcceptAllFileFilterUsed(true);
            fileChooser.setCurrentDirectory(FileSystemView.getFileSystemView().getRoots()[0]);

            int userSelection = fileChooser.showSaveDialog(parent);
            if (userSelection == JFileChooser.APPROVE_OPTION) {
                fileToSave = fileChooser.getSelectedFile();
                if (fileToSave.exists()) {
                    int overwriteChoice = JOptionPane.showConfirmDialog(
                            parent,
                            "File " + fileToSave.getName() + " đã tồn tại. Bạn có muốn ghi đè?",
                            "Xác nhận ghi đè",
                            JOptionPane.YES_NO_OPTION
                    );
                    if (overwriteChoice != JOptionPane.YES_OPTION) {
                        return "Người dùng đã hủy ghi đè file.";
                    }
                }
            } else {
                return "Người dùng đã hủy lưu file.";
            }
        } else {
            return "Người dùng đã hủy lưu file.";
        }

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(fileToSave))) {
            writer.write(input);
            writer.flush();
            lastSavedFile = fileToSave.getAbsolutePath();
            return "Đã lưu kết quả thành công tại: " + lastSavedFile;
        } catch (IOException e) {
            return "Lỗi khi lưu kết quả: " + e.getMessage();
        }
    }

    public String saveMode(String mode, Component parent) throws IOException {
        int choice = JOptionPane.showConfirmDialog(
                parent,
                "Bạn muốn lưu mode tự động không?\nChọn 'No' để tự chọn nơi lưu.",
                "Lưu Mode",
                JOptionPane.YES_NO_CANCEL_OPTION
        );

        File fileToSave = null;
        String downloadsPath = System.getProperty("user.home") + File.separator + "Downloads";
        File downloadsDir = new File(downloadsPath);
        if (!downloadsDir.exists()) {
            downloadsDir.mkdirs();
        }

        if (choice == JOptionPane.YES_OPTION) {
            String baseName = "modeRSA";
            String extension = ".mode";
            fileToSave = new File(downloadsDir, baseName + extension);
            int counter = 1;
            while (fileToSave.exists()) {
                fileToSave = new File(downloadsDir, baseName + " (" + counter + ")" + extension);
                counter++;
            }
        } else if (choice == JOptionPane.NO_OPTION) {
            JFileChooser fileChooser = new JFileChooser();
            fileChooser.setDialogTitle("Chọn nơi lưu mode");
            fileChooser.setSelectedFile(new File("modeRSA.mode"));
            fileChooser.setFileSelectionMode(JFileChooser.FILES_ONLY);
            fileChooser.setFileFilter(new FileNameExtensionFilter("Mode Files (*.mode)", "mode"));
            fileChooser.setAcceptAllFileFilterUsed(true);
            fileChooser.setCurrentDirectory(FileSystemView.getFileSystemView().getRoots()[0]);

            int userSelection = fileChooser.showSaveDialog(parent);
            if (userSelection == JFileChooser.APPROVE_OPTION) {
                fileToSave = fileChooser.getSelectedFile();
                if (fileToSave.exists()) {
                    int overwriteChoice = JOptionPane.showConfirmDialog(
                            parent,
                            "File " + fileToSave.getName() + " đã tồn tại. Bạn có muốn ghi đè?",
                            "Xác nhận ghi đè",
                            JOptionPane.YES_NO_OPTION
                    );
                    if (overwriteChoice != JOptionPane.YES_OPTION) {
                        return "Người dùng đã hủy ghi đè file.";
                    }
                }
            } else {
                return "Người dùng đã hủy lưu file.";
            }
        } else {
            return "Người dùng đã hủy lưu file.";
        }

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(fileToSave))) {
            writer.write(mode);
            writer.flush();
            lastSavedFile = fileToSave.getAbsolutePath();
            return "Đã lưu mode thành công tại: " + lastSavedFile;
        } catch (IOException e) {
            return "Lỗi khi lưu mode: " + e.getMessage();
        }
    }


    public byte[] sign(String input) {
        if (input == null || input.isEmpty()) {
            JOptionPane.showMessageDialog(null, "Dữ liệu đầu vào rỗng hoặc không hợp lệ.");
            return null;
        }
        if (privateKey == null) {
            JOptionPane.showMessageDialog(null, "Khóa bí mật chưa được tải hoặc tạo.");
            return null;
        }
        try {
            Signature signature = Signature.getInstance("SHA256withRSA");
            signature.initSign(privateKey);
            signature.update(input.getBytes(StandardCharsets.UTF_8));
            return signature.sign();
        } catch (NoSuchAlgorithmException | InvalidKeyException | SignatureException e) {
            JOptionPane.showMessageDialog(null, "Lỗi khi tạo chữ ký: " + e.getMessage());
            return null;
        }
    }



    public boolean checkPrivateKey(String input) {
        try {
            if (input == null || input.trim().isEmpty()) {
                JOptionPane.showMessageDialog(null, "Chuỗi khóa bí mật rỗng hoặc không hợp lệ.");
                return false;
            }
            byte[] keyBytes = Base64.getDecoder().decode(input.trim());
            PKCS8EncodedKeySpec spec = new PKCS8EncodedKeySpec(keyBytes);
            KeyFactory kf = KeyFactory.getInstance("RSA");
            kf.generatePrivate(spec);
            return true;
        } catch (IllegalArgumentException e) {
            JOptionPane.showMessageDialog(null, "Khóa bí mật không hợp lệ (không phải base64): " + e.getMessage());
            return false;
        } catch (NoSuchAlgorithmException | InvalidKeySpecException e) {
            JOptionPane.showMessageDialog(null, "Lỗi tạo khóa bí mật: " + e.getMessage());
            return false;
        }
    }

    public void cancelKeys() {
        publicKey = null;
        privateKey = null;
        lastSavedPublicKey = null;
        lastSavedPrivateKey = null;
        lastSavedFile = null;
    }
}