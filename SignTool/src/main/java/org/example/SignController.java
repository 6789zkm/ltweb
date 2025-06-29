package org.example;

import javax.swing.*;
import javax.swing.filechooser.FileNameExtensionFilter;
import javax.swing.filechooser.FileSystemView;
import java.awt.*;
import java.awt.datatransfer.StringSelection;
import java.io.File;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

public class SignController {
    private SignModel model;
    private SignView view;
    private String inputFileExtension;
    private byte[] lastResult;

    public SignController(SignView signView, SignModel signModel) {


        this.model = signModel;
        this.view = signView;
        initializeUIState();
        init();
    }

    private void init() {

        inputFileExtension = null;
        lastResult = null;


        // Gen Key Pair button
        view.getBtnGenKeyPair().addActionListener(e -> {
            int len = Integer.parseInt((String) view.getKeyLength_field().getSelectedItem());
            try {
                model.genKeyPair(len);
                view.getPublicKey_field().setText(model.getPublicKeyStr());
                view.getOutput().setText("Đã tạo cặp khóa RSA thành công.");
                updateAfterKeyPairGeneration();
                view.getBtnSign().setEnabled(true);
                view.getKeyLength_field().setEnabled(false);
            } catch (NoSuchAlgorithmException ex) {
                JOptionPane.showMessageDialog(view, "Lỗi tạo khóa: " + ex.getMessage(), "Lỗi", JOptionPane.ERROR_MESSAGE);
            }
        });


        // Load Private Key button
//        view.getBtnLoadPrivateKey().addActionListener(e -> {
//            String key = view.getPrivateKey_field().getText().trim();
//            if (key.isEmpty()) {
//                JOptionPane.showMessageDialog(view, "Vui lòng nhập khóa bí mật.", "Lỗi", JOptionPane.ERROR_MESSAGE);
//                return;
//            }
//            if (!model.checkPrivateKey(key)) {
//                return;
//            }
//            String result = model.loadPrivateKey(key);
//            view.getOutput().setText(result);
//            updateAfterPrivateKeyLoad();
//            view.getKeyLength_field().setEnabled(false);
//            view.getBtnSign().setEnabled(true);
//        });

        // Encrypt button
        view.getBtnSign().addActionListener(e -> {
            String input = view.getInput().getText().trim();
            if (input.isEmpty()) {
                JOptionPane.showMessageDialog(view, "Vui lòng nhập input hoặc chọn file.", "Lỗi", JOptionPane.ERROR_MESSAGE);
                return;
            }else{
                byte[] sign = model.sign(input);
                view.getOutput().setText(Base64.getEncoder().encodeToString(sign));
                view.getBtnSaveResult().setEnabled(true);
            }
        });


        // Choose Private Key File button
        view.getBtnLoadPrivateKey().addActionListener(e -> {
            JFileChooser fileChooser = new JFileChooser();
            fileChooser.setDialogTitle("Chọn file khóa bí mật");
            fileChooser.setFileSelectionMode(JFileChooser.FILES_ONLY);
            fileChooser.setFileFilter(new FileNameExtensionFilter("Private Key Files (*.key)", "key"));
            fileChooser.setAcceptAllFileFilterUsed(true);
            fileChooser.setCurrentDirectory(FileSystemView.getFileSystemView().getRoots()[0]);

            int userSelection = fileChooser.showOpenDialog(view);
            if (userSelection == JFileChooser.APPROVE_OPTION) {
                File selectedFile = fileChooser.getSelectedFile();
                try {
                    String keyContent = model.importKey(selectedFile);
                    if (keyContent.trim().isEmpty()) {
                        JOptionPane.showMessageDialog(view, "File khóa bí mật rỗng hoặc không hợp lệ.", "Lỗi", JOptionPane.ERROR_MESSAGE);
                        return;
                    }
//                    view.getPrivateKey_field().setText(keyContent.trim());
                    String result = model.loadPrivateKey(keyContent);
                    view.getOutput().setText(result);
                    updateAfterPrivateKeyLoad();
                } catch (IOException ex) {
                    JOptionPane.showMessageDialog(view, "Lỗi đọc file khóa bí mật: " + ex.getMessage(), "Lỗi", JOptionPane.ERROR_MESSAGE);
                }
            } else {
                view.getOutput().setText("Đã hủy chọn file khóa bí mật.");
            }
        });

        // Save Public Key button
        view.getBtnSavePublicKey().addActionListener(e -> {
            String key = view.getPublicKey_field().getText().trim();
            if (key.isEmpty()) {
                JOptionPane.showMessageDialog(view, "Vui lòng nhập hoặc tạo khóa công khai trước khi lưu.", "Lỗi", JOptionPane.ERROR_MESSAGE);
                return;
            }
            try {
                String result = model.savePublicKey(key, view);
                view.getOutput().setText(result);
//                updateEncryptDecryptButtons();
            } catch (IOException ex) {
                JOptionPane.showMessageDialog(view, "Lỗi lưu khóa công khai: " + ex.getMessage(), "Lỗi", JOptionPane.ERROR_MESSAGE);
            }
        });

        // Save Private Key button
        view.getBtnSavePrivateKey().addActionListener(e -> {
            String key = model.getPrivateKeyStr().trim();
            if (key.isEmpty()) {
                JOptionPane.showMessageDialog(view, "Vui lòng nhập hoặc tạo khóa bí mật trước khi lưu.", "Lỗi", JOptionPane.ERROR_MESSAGE);
                return;
            }
            try {
                String result = model.savePrivateKey(key, view);
                view.getOutput().setText(result);
//                updateEncryptDecryptButtons();
            } catch (IOException ex) {
                JOptionPane.showMessageDialog(view, "Lỗi lưu khóa bí mật: " + ex.getMessage(), "Lỗi", JOptionPane.ERROR_MESSAGE);
            }
        });

        // Save Result button
        view.getBtnSaveResult().addActionListener(e -> {
            String res = view.getOutput().getText().trim();
            if (res.isEmpty()) {
                JOptionPane.showMessageDialog(view, "Không có kết quả để lưu.", "Lỗi", JOptionPane.ERROR_MESSAGE);
                return;
            }
//            try {
//
//            } catch (IOException ex) {
//                JOptionPane.showMessageDialog(view, "Lỗi lưu kết quả: " + ex.getMessage(), "Lỗi", JOptionPane.ERROR_MESSAGE);
//            }

            Toolkit.getDefaultToolkit().getSystemClipboard().setContents(new StringSelection(res), null);
            JOptionPane.showMessageDialog(view, "Dữ liệu đã được copy vào clipboard!");
            updateEncryptDecryptButtons();
        });
    }
    private void initializeUIState() {
        view.getPublicKey_field().setEnabled(true);
        view.getBtnLoadPrivateKey().setEnabled(true);
        view.getBtnGenKeyPair().setEnabled(true);
        view.getBtnSavePublicKey().setEnabled(false);
        view.getBtnSavePrivateKey().setEnabled(false);
        view.getInput().setEnabled(false);
        view.getBtnSign().setEnabled(false);
        view.getBtnSaveResult().setEnabled(false);
        view.getKeyLength_field().setEnabled(true);
    }

    private void updateAfterKeyPairGeneration() {
        view.getPublicKey_field().setEnabled(false);
        view.getBtnLoadPrivateKey().setEnabled(false);
        view.getBtnSavePublicKey().setEnabled(true);
        view.getBtnSavePrivateKey().setEnabled(true);
        view.getInput().setEnabled(true);
        view.getKeyLength_field().setEnabled(false);
        updateEncryptDecryptButtons();
    }

    private void updateAfterPublicKeyLoad() {
        view.getPublicKey_field().setEnabled(false);
        view.getBtnSavePublicKey().setEnabled(true);
        view.getInput().setEnabled(true);
        updateEncryptDecryptButtons();
    }

    private void updateAfterPrivateKeyLoad() {
//        view.getPrivateKey_field().setEnabled(false);
        view.getBtnLoadPrivateKey().setEnabled(false);
        view.getBtnSavePrivateKey().setEnabled(true);
        view.getInput().setEnabled(true);
        view.getBtnSign().setEnabled(true);
        view.getBtnSaveResult().setEnabled(true);
        updateEncryptDecryptButtons();
    }

    private void updateAfterInputSelection() {
        view.getBtnSign().setEnabled(false);
        view.getBtnSaveResult().setEnabled(false);
        if (!view.getPublicKey_field().getText().trim().isEmpty()) {
            view.getBtnSign().setEnabled(true);
        }
    }

    private void updateEncryptDecryptButtons() {
//        String input = view.getInput().getText().trim();
//        boolean hasInput = !input.isEmpty();
        boolean hasInput = true;
        boolean hasPublicKey = !model.getPrivateKeyStr().trim().isEmpty();
        view.getBtnSign().setEnabled(hasInput && hasPublicKey);
    }

    private String getFileExtension(File file) {
        String name = file.getName();
        int lastIndex = name.lastIndexOf('.');
        return lastIndex > 0 ? name.substring(lastIndex) : ".bin";
    }

    public SignView getView() {
        return view;
    }

//    public static void main(String[] args) {
//        new SignController();
//    }
}