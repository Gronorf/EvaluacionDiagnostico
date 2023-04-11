/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/SQLTemplate.sql to edit this template
 */
/**
 * Author:  mauri
 * Created: 11-04-2023
 */

SELECT * FROM customers
WHERE (city = 'NY') ORDER BY last_name ASC, first_name ASC;