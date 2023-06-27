
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

    select customer_id, name, min(created_at) as first_order_at, count(customer_id) as number_of_orders
    from `analytics-engineers-club.coffee_shop.customers` AS customers
    LEFT JOIN `analytics-engineers-club.coffee_shop.orders` AS orders
    ON orders.customer_id = customers.id
    GROUP BY customer_id, name
    ORDER BY first_order_at 
    LIMIT 5

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
