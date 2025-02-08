-- Retrieve the total number of orders placed.
CREATE VIEW total_placed_orders AS
    SELECT 
        COUNT(order_id) AS total_orders
    FROM
        orders;

-- Calculate the total revenue generated from pizza sales.
CREATE VIEW total_pizza_sales_revenue AS
    SELECT 
        SUM(orders_details.quatity * pizzas.price) AS total_revenue
    FROM
        orders_details
            JOIN
        pizzas ON pizzas.pizza_id = orders_details.pizza_id;
        
     --    Identify the highest-priced pizza
CREATE VIEW highest_price_pizza AS
    SELECT 
        pizza_types.name, pizzas.price AS highest_price_pizza
    FROM
        pizza_types
            JOIN
        pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
    ORDER BY pizzas.price DESC
    LIMIT 1;
    
--     Identify the most common pizza size ordered.
CREATE VIEW most_comman_pizza_size_size_orderderd AS
    SELECT 
        pizzas.size,
        COUNT(orders_details.order_details_id) AS most_comman_pizza_size_size_orderderd
    FROM
        pizzas
            JOIN
        orders_details ON pizzas.pizza_id = orders_details.pizza_id
    GROUP BY pizzas.size
    ORDER BY most_comman_pizza_size_size_orderderd DESC
    LIMIT 1;
    
  --   List the top 5 most ordered pizza types along with their quantities.
CREATE VIEW top5_ordered_pizza AS
    SELECT 
        pizza_types.name, SUM(orders_details.quatity) AS quantity
    FROM
        pizza_types
            JOIN
        pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
            JOIN
        orders_details ON orders_details.pizza_id = pizzas.pizza_id
    GROUP BY pizza_types.name
    ORDER BY quantity DESC
    LIMIT 5;
    
--     Join the necessary tables to find the total quantity of each pizza category ordered.
CREATE VIEW total_quantity_of_each_pizza AS
    SELECT 
        pizza_types.category,
        SUM(orders_details.quatity) AS quantity
    FROM
        pizza_types
            JOIN
        pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
            JOIN
        orders_details ON orders_details.pizza_id = pizzas.pizza_id
    GROUP BY pizza_types.category
    ORDER BY quantity DESC;
    
-- Determine the distribution of orders by hour of the day.
CREATE VIEW ordersby_hour_oftheday AS
    SELECT 
        HOUR(order_time) AS hour, COUNT(order_id) AS order_count
    FROM
        orders
    GROUP BY HOUR(order_time);
    
-- Join relevant tables to find the category-wise distribution of pizzas.
CREATE VIEW category_wise_pizzas AS
    SELECT 
        category, count(name) as name
    FROM
        pizza_types group by category;
	
-- Group the orders by date and calculate the average number of pizzas ordered per day.
CREATE VIEW avg_pizza_ordered_per_day AS
    SELECT 
        ROUND(AVG(quantity), 0) AS avg_pizza_ordered_per_day
    FROM
        (SELECT 
            orders.order_date, SUM(orders_details.quatity) AS quantity
        FROM
            orders
        JOIN orders_details ON orders.order_id = orders_details.order_id
        GROUP BY orders.order_date) AS order_quantity;
        
-- Determine the top 3 most ordered pizza types based on revenue.
CREATE VIEW top3pizza_bassedon_revenue AS
    SELECT 
        pizza_types.name,
        SUM(orders_details.quatity * pizzas.price) AS revenue
    FROM
        pizza_types
            JOIN
        pizzas ON pizzas.pizza_type_id = pizza_types.pizza_type_id
            JOIN
        orders_details ON orders_details.pizza_id = pizzas.pizza_id
    GROUP BY pizza_types.name
    ORDER BY revenue DESC
    LIMIT 3;
    
-- Calculate the percentage contribution of each pizza type to total revenue.
CREATE VIEW prcentage_contribution_ofeach_pizzatype_tototalrevenue AS
    SELECT 
        pizza_types.category,
        ROUND((SUM(orders_details.quatity * pizzas.price) / (SELECT 
                        SUM(orders_details.quatity * pizzas.price) AS total_revenue
                    FROM
                        orders_details
                            JOIN
                        pizzas ON pizzas.pizza_id = orders_details.pizza_id)) * 100,
                2) AS revenue
    FROM
        pizza_types
            JOIN
        pizzas ON pizzas.pizza_type_id = pizza_types.pizza_type_id
            JOIN
        orders_details ON orders_details.pizza_id = pizzas.pizza_id
    GROUP BY pizza_types.category
    ORDER BY revenue DESC;
    
-- Analyze the cumulative revenue generated over time.
create view  cumulative_revenue as
select order_date,
sum(revenue) over(order by order_date) as  cumulative_revenue from
(select orders.order_date, round(sum(orders_details.quatity * pizzas.price),0) as revenue
from orders_details join pizzas
on orders_details.pizza_id = pizzas.pizza_id
join orders
on orders.order_id = orders_details.order_id
group by orders.order_date) as sales;
 
-- Determine the top 3 most ordered pizza types based on revenue for each pizza category.
create view top3_pizzatypes_foreach_pizzacategory as
select  category, name, revenue from
(select category, name, revenue, 
rank() over(partition by category order by revenue desc) as ranking
from
(select pizza_types.category, pizza_types.name,
round(sum(orders_details.quatity * pizzas.price),0) as revenue
from pizza_types join pizzas
on pizza_types.pizza_type_id = pizzas.pizza_type_id
join orders_details
on orders_details.pizza_id = pizzas.pizza_id
group by pizza_types.category, pizza_types.name) as total_revenue) as b
where ranking <=3;
    
    