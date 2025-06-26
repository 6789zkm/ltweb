package org.example;

import javax.swing.*;
import javax.swing.border.LineBorder;
import java.awt.*;
import java.awt.datatransfer.StringSelection;

public class SignView extends JFrame {
    private JLabel lb_input, lb_publicKey, lb_privateKey, lb_keyLength;
    private JTextField input, publicKey_field, privateKey_field;
    private JComboBox<String> keyLength_field;
    private JTextArea output;
    private JButton btnSign, btnGenKeyPair, btnLoadPrivateKey, btnSavePublicKey, btnSavePrivateKey, btnSaveResult;

    private JButton copyToClipboard;

    private static final String[] RSAKeyLengths = {
            "512", "1024", "2048", "3072", "4096"
    };

    public SignView() {
        setTitle("SignTool");
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        setSize(850, 600);
        setMinimumSize(new Dimension(600, 400));
        setLocationRelativeTo(null);
        setLayout(new BorderLayout(10, 10));

        JPanel mainPanel = new JPanel(new GridBagLayout());
        mainPanel.setBorder(BorderFactory.createEmptyBorder(10, 10, 10, 10));
        GridBagConstraints gbcMain = new GridBagConstraints();
        gbcMain.insets = new Insets(5, 5, 5, 5);
        gbcMain.fill = GridBagConstraints.HORIZONTAL;
        gbcMain.weightx = 1.0;
        gbcMain.gridwidth = GridBagConstraints.REMAINDER;

        JPanel topPanel = new JPanel(new GridBagLayout());
        topPanel.setBorder(new LineBorder(Color.GRAY, 1));
        GridBagConstraints gbcTop = new GridBagConstraints();
        gbcTop.insets = new Insets(5, 5, 5, 5);
        gbcTop.fill = GridBagConstraints.HORIZONTAL;
        gbcTop.weightx = 1.0;

        gbcTop.gridx = 0;
        gbcTop.gridy = 0;
        gbcTop.weightx = 0.0;
        topPanel.add(lb_input = new JLabel("Dữ liệu cần ký:"), gbcTop);

        gbcTop.gridx = 1;
        gbcTop.weightx = 1.0;
        topPanel.add(input = new JTextField(), gbcTop);

        gbcTop.gridx = 2;
        gbcTop.weightx = 0.0;

        gbcTop.gridx = 0;
        gbcTop.gridy = 1;
        gbcTop.weightx = 0.0;
        topPanel.add(lb_publicKey = new JLabel("Public Key:"), gbcTop);
        

        gbcTop.gridx = 1;
        gbcTop.weightx = 1.0;
        topPanel.add(publicKey_field = new JTextField(), gbcTop);

        gbcTop.gridx = 2;
        gbcTop.weightx = 0.0;

        copyToClipboard = new JButton("Copy vào Clipboard");
        copyToClipboard.setPreferredSize(new Dimension(120, 30));
        copyToClipboard.addActionListener(e -> {
            String publicKey = publicKey_field.getText();
            if (!publicKey.isEmpty()) {
                Toolkit.getDefaultToolkit().getSystemClipboard().setContents(new StringSelection(publicKey), null);
                JOptionPane.showMessageDialog(this, "Public Key đã được copy vào clipboard!");
            } else {
                JOptionPane.showMessageDialog(this, "Public Key không có!");
            }
        });
        topPanel.add(copyToClipboard, gbcTop);

        gbcTop.gridx = 3;
        gbcTop.weightx = 0.0;
        btnSavePublicKey = new JButton("Save Public Key");
        btnSavePublicKey.setPreferredSize(new Dimension(120, 30));
        topPanel.add(btnSavePublicKey, gbcTop);

        gbcTop.gridx = 2;
        gbcTop.gridy = 4;
        gbcTop.weightx = 0.0;

        btnLoadPrivateKey = new JButton("Load Private Key");
        btnLoadPrivateKey.setPreferredSize(new Dimension(120, 30));
        topPanel.add(btnLoadPrivateKey, gbcTop);

        gbcTop.gridx = 3;
        gbcTop.weightx = 0.0;
        btnSavePrivateKey = new JButton("Save Private Key");
        btnSavePrivateKey.setPreferredSize(new Dimension(120, 30));
        topPanel.add(btnSavePrivateKey, gbcTop);

        mainPanel.add(topPanel, gbcMain);

        JPanel middlePanel = new JPanel(new GridBagLayout());
        middlePanel.setBorder(new LineBorder(Color.GRAY, 1));
        GridBagConstraints gbcMiddle = new GridBagConstraints();
        gbcMiddle.insets = new Insets(5, 10, 5, 10);
        gbcMiddle.fill = GridBagConstraints.HORIZONTAL;
        gbcMiddle.weightx = 1.0;
        gbcMiddle.gridwidth = GridBagConstraints.REMAINDER;

        gbcMiddle.gridx = 0;
        gbcMiddle.gridy = 0;
        gbcMiddle.weightx = 0.0;
        gbcMiddle.gridwidth = 1;
        middlePanel.add(lb_keyLength = new JLabel("Key Length:"), gbcMiddle);

        gbcMiddle.gridx = 1;
        gbcMiddle.weightx = 1.0;
        middlePanel.add(keyLength_field = new JComboBox<>(RSAKeyLengths), gbcMiddle);
        keyLength_field.setSelectedItem("2048"); // Default to 2048 bits


        gbcMiddle.gridx = 0;
        gbcMiddle.gridy = 3;
        gbcMiddle.weightx = 0.0;
        gbcMiddle.gridwidth = 1;
        JLabel lb_empty = new JLabel("");
        middlePanel.add(lb_empty, gbcMiddle);



        mainPanel.add(middlePanel, gbcMain);
        middlePanel.setVisible(true);

        JPanel buttonPanel = new JPanel(new FlowLayout(FlowLayout.CENTER, 10, 10));
        buttonPanel.setBorder(new LineBorder(Color.GRAY, 1));

        Dimension buttonSize = new Dimension(120, 30);

        btnGenKeyPair = new JButton("Tạo khóa");
        btnSign = new JButton("Ký");
        btnSaveResult = new JButton("Copy vào Clipboard");

        btnGenKeyPair.setPreferredSize(buttonSize);
        btnSign.setPreferredSize(buttonSize);
//        btnSaveResult.setPreferredSize(buttonSize);

        buttonPanel.add(btnGenKeyPair);
        buttonPanel.add(btnSign);
        buttonPanel.add(btnSaveResult);

        mainPanel.add(buttonPanel, gbcMain);

        add(mainPanel, BorderLayout.NORTH);

        output = new JTextArea();
        output.setLineWrap(true);
        output.setWrapStyleWord(true);
        output.setEditable(false);
        output.setText("Vui lòng tạo hoặc tải khóa để bắt đầu.");

        JScrollPane scrollPane = new JScrollPane(output);
        scrollPane.setPreferredSize(new Dimension(500, 100));

        JPanel outputPanel = new JPanel(new BorderLayout());
        outputPanel.setBorder(BorderFactory.createEmptyBorder(0, 13, 10, 13));
        outputPanel.add(scrollPane, BorderLayout.CENTER);

        add(outputPanel, BorderLayout.CENTER);

        initializeUIState();

        publicKey_field.setEnabled(true);
        setVisible(true);
    }

    private void initializeUIState() {
        input.setEnabled(false);
        btnSign.setEnabled(false);
        btnSaveResult.setEnabled(false);
        btnSavePublicKey.setEnabled(false);
        btnLoadPrivateKey.setEnabled(true);
        btnSavePrivateKey.setEnabled(false);
        btnGenKeyPair.setEnabled(true);
        keyLength_field.setEnabled(true);
    }

    public void disableComponent() {
        input.setEnabled(false);
        btnSign.setEnabled(false);
        btnSaveResult.setEnabled(false);
    }

    public void enableComponent() {
        input.setEnabled(true);
        btnSign.setEnabled(true);
        btnSaveResult.setEnabled(true);
        publicKey_field.setEnabled(true);
    }

    public JButton getBtnSaveResult() { return btnSaveResult; }
    public JButton getBtnGenKeyPair() { return btnGenKeyPair; }
    public JButton getBtnLoadPrivateKey() { return btnLoadPrivateKey; }
    public JButton getBtnSavePublicKey() { return btnSavePublicKey; }
    public JButton getBtnSavePrivateKey() { return btnSavePrivateKey; }
    public JTextArea getOutput() { return output; }
    public JComboBox<String> getKeyLength_field() { return keyLength_field; }
    public JTextField getInput() { return input; }
    public JTextField getPublicKey_field() { return publicKey_field; }
    public JTextField getPrivateKey_field() { return privateKey_field; }

    public JButton getBtnSign() {
        return btnSign;
    }

    public static void main(String[] args) {
        new SignView();
    }
}