/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package Beneficio;

import java.util.Arrays;
import java.util.List;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author mauri
 */
public class CalculadoraSimpleTest {
    
    public CalculadoraSimpleTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of calcular method, of class CalculadoraSimple.
     */
    @Test
    public void testCalcular() {
        System.out.println("calcular");
        List<Integer> ventas = Arrays.asList(0);
        CalculadoraSimple instance = new CalculadoraSimple();
        int expResult = 0;
        int result = instance.calcular(ventas);
        assertEquals(expResult, result);
    }
    
}
