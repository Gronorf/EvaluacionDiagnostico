/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Beneficio;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.Scanner;

/**
 *
 * @author mauri
 */
public class DemoConsola {

    public static void main(String[] args) {
        ArrayList<Integer> ventas = new ArrayList<Integer>();
        Random random = new Random();
        CalculadoraSimple simple = new CalculadoraSimple();
        CalculadoraBeneficios compleja = new CalculadoraCompleja();

        // Se agregan los 10 elementos random al array list. 
        for (int i = 0; i < 10; i++) {
            ventas.add(100 + random.nextInt(1900));
        }

        System.out.println("-----------------------------------------------");
        System.out.println("Demostracion Calculo Beneficios para Vendedores");
        System.out.println("-----------------------------------------------");
        System.out.println("");
        System.out.println("Tomando 10 valores de montos de venta aleatorios...");
        System.out.println(ventas);
        System.out.println("");
        System.out.println("Beneficio con Algoritmo Simple: " + simple.calcular(ventas) + "US$");
        System.out.println("Beneficio con Algoritmo Complejo: " + compleja.calcular(ventas) + "US$");

    }
}
