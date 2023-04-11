/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/SQLTemplate.sql to edit this template
 */
/**
 * Author:  mauri
 * Created: 11-04-2023
 */

SELECT last_name, first_name, quantity * list_price as MONTO FROM staffs CROSS JOIN orders CROSS JOIN order_items;