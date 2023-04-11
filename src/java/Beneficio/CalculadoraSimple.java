/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Beneficio;

import static java.lang.Math.round;
import java.util.List;

/**
 *
 * @author mauri
 */
public class CalculadoraSimple implements CalculadoraBeneficios {

    @Override
    public int calcular(List<Integer> ventas) {
        int ventasTotal = 0;
        int beneficio;

        for (int i = 0; i < ventas.size(); i++) {
            ventasTotal = ventasTotal + ventas.get(i);
        }
        beneficio = (int) round(ventasTotal * 0.03);
        return beneficio;
    }

}
