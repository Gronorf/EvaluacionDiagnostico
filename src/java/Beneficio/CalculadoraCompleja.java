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
public class CalculadoraCompleja implements CalculadoraBeneficios {

    @Override
    public int calcular(List<Integer> ventas) {
        int ventasTotal = 0;
        int beneficioBase = 0;
        int beneficioParcial = 0;
        int beneficioTotal = 0;
        int beneficioGrande = 0;

        for (int i = 0; i < ventas.size(); i++) {
            ventasTotal = ventasTotal + ventas.get(i);
            if (ventas.get(i) > 1000) {
                beneficioParcial = beneficioParcial + (int) (ventas.get(i) * 0.05);
            } else if (ventas.get(i) > 500 && ventas.get(i) < 1000) {
                beneficioParcial = beneficioParcial + (int) (ventas.get(i) * 0.02);
            }
        }

        if (ventasTotal > 5000) {
            beneficioGrande = 100;
        }

        beneficioBase = (int) (ventasTotal * 0.01);

        beneficioTotal = beneficioBase + beneficioGrande + beneficioParcial;

        return beneficioTotal;
    }

}
