package org.example;

public class Program {
    public static void main(String[] args) {
        SignView view = new SignView();
        SignModel model = new SignModel();
        new SignController(view, model);
    }
}
