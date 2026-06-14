package View;

import javax.swing.*;
import java.awt.*;

public class TelaAzul extends JFrame {

    public TelaAzul() {
        setTitle("Blue Screen");
        setSize(1280, 720);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE); // mantém botões de fechar/minimizar
        setResizable(false);
        setLocationRelativeTo(null); // centraliza na tela
        getContentPane().setBackground(Color.BLUE);

        JLabel triste = new JLabel(":(", SwingConstants.CENTER);
        triste.setFont(new Font("Arial", Font.BOLD, 200));
        triste.setForeground(Color.WHITE);

        add(triste, BorderLayout.CENTER);
        setVisible(true);
    }
}
