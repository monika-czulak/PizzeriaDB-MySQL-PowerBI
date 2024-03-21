/* Dashboard 1 - Order activity
- total orders
- total sales
- total items
- avg order value
- sales by category
- top selling items
- orders by date
- sales by date
- orders by address
- orders by delivery/pick up 
*/

SELECT
	o.order_id,
    i.item_price,
    o.quantity,
    i.item_cat,
    i.item_name,
    CAST(o.created_at AS DATE) AS created_at,
    a.delivery_address1,
    a.delivery_address2,
    a.delivery_city,
    a.delivery_zipcode,
    o.delivery
FROM orders o
JOIN item i ON o.item_id=i.item_id
JOIN address a ON o.add_id=a.add_id;

/* Dashboard 2 - Inventory management
- total quantity by ingredient
- total cost of ingredients
- calculated cost of pizza
- percentage stock remaining by ingredient
- list of ingredients to re-order based on remaining inventory
 */

SELECT
	s1.item_name,
    s1.ing_id,
    s1.ing_name,
    s1.ing_weight,
    s1.ing_price,
    s1.order_quantity,
    s1.recipe_quantity,
    s1.order_quantity*s1.recipe_quantity AS ordered_weight,
    s1.ing_price/s1.ing_weight AS unit_cost,
    (s1.order_quantity*s1.recipe_quantity)*s1.ing_price/s1.ing_weight AS ingredient_cost
FROM (SELECT
		o.item_id,
		i.sku,
		i.item_name,
		r.ing_id,
		ing.ing_name,
		r.quantity AS recipe_quantity,
		sum(o.quantity) AS order_quantity,
		ing.ing_weight,
		ing.ing_price
	FROM orders o
	JOIN item i ON o.item_id=i.item_id
	JOIN recipe r ON i.sku=r.recipe_id
	JOIN ingredient ing ON ing.ing_id=r.ing_id
	GROUP BY o.item_id, i.sku, i.item_name, r.ing_id, ing.ing_name, r.quantity, ing.ing_weight, ing.ing_price) s1;
    
-- the query above has been saved as the View 'stock1' to calculate the last two points of the dashboard

SELECT
	s2.ing_name,
    s2.ordered_weight,
    ing.ing_weight*inv.quantity as total_inv_weight,
    (ing.ing_weight*inv.quantity)-s2.ordered_weight as remaining_weight
FROM (SELECT
		ing_id,
		ing_name,
		sum(ordered_weight) AS ordered_weight
	FROM stock1
	GROUP BY ing_id, ing_name) s2
JOIN inventory inv ON inv.item_id=s2.ing_id
JOIN ingredient ing ON ing.ing_id=s2.ing_id;

/* Dashboard 3 - Staff management
- which staff member is working when
- staff salary
 */

SELECT
	CAST(r.date AS date) AS date,
    s.first_name,
    s.last_name,
    s.hourly_rate,
    sh.start_time,
    sh.end_time,
    ((hour(timediff(sh.end_time, sh.start_time))*60)+(minute(timediff(sh.end_time, sh.start_time))))/60 AS hours_in_shift,
    ((hour(timediff(sh.end_time, sh.start_time))*60)+(minute(timediff(sh.end_time, sh.start_time))))/60*s.hourly_rate AS staff_cost
FROM rota r
JOIN staff s ON r.staff_id=s.staff_id
JOIN shift sh ON r.shift_id=sh.shift_id;