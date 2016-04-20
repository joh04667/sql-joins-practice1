—1. Get all customers and their addresses.

      SELECT * FROM addresses JOIN customers ON addresses.customer_id = customers.id

—2. Get all orders and their line items.

      SELECT * FROM orders JOIN line_items ON line_items.order_id = orders.id

—3. Which warehouses have cheetos?

      SELECT warehouse.warehouse, products.description
      FROM warehouse
      JOIN warehouse_product ON warehouse.id = warehouse_product.warehouse_id
      JOIN products ON warehouse_product.product_id = products.id
      WHERE products.description IN ('cheetos');

—4. Which warehouses have diet pepsi?

      SELECT warehouse.warehouse, products.description
      FROM warehouse
      JOIN warehouse_product ON warehouse.id = warehouse_product.warehouse_id
      JOIN products ON warehouse_product.product_id = products.id
      WHERE products.description IN ('diet pepsi');

—5. Get the number of orders for each customer.

      SELECT first_name, last_name, COUNT(line_items.quantity)
      FROM customers
      JOIN addresses ON customers.id = addresses.customer_id
      JOIN orders ON addresses.id = orders.address_id
      JOIN line_items ON orders.id = line_items.order_id
      GROUP BY first_name, last_name;

—6. How many customers do we have?

      SELECT COUNT(*) AS "customer count"
      FROM customers;

—7. How many products do we carry?

      SELECT COUNT(*) AS "product count"
      FROM products;


—8. What is the total available on-hand quantity of diet pepsi?

      SELECT description, SUM(warehouse_product.on_hand)
      FROM products
      JOIN warehouse_product ON products.id = warehouse_product.product_id
      WHERE description IN ('diet pepsi')
      GROUP BY description;
