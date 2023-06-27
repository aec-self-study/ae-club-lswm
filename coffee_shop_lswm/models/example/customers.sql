{{ config(materialized='table') }}

    select customer_id, name, min(created_at) as first_order_at, count(customer_id) as number_of_orders
    from `analytics-engineers-club.coffee_shop.customers` AS customers
    LEFT JOIN `analytics-engineers-club.coffee_shop.orders` AS orders
    ON orders.customer_id = customers.id
    GROUP BY customer_id, name
    ORDER BY first_order_at 
    LIMIT 5
