-- Retrieve all data from the e-commerce dataset
SELECT *
FROM e_commerce_dataset;

-- Profit Margin (above 30%) by Product Category
WITH profit_margin_cte AS (
    SELECT
        product_category,
        SUM(profit) / SUM(sales) * 100 AS profit_margin
    FROM e_commerce_dataset
    GROUP BY product_category
)
SELECT
    product_category,
    ROUND(profit_margin, 2) AS profit_margin
FROM profit_margin_cte
WHERE profit_margin > 30
ORDER BY profit_margin DESC;

-- Top 3 Products by Sales in Each Category
WITH rank_products AS (
    SELECT
        product,
        product_category,
        SUM(sales) AS total_sales,
        RANK() OVER(PARTITION BY product_category ORDER BY SUM(sales) DESC) AS sales_rank
    FROM e_commerce_dataset
    GROUP BY product, product_category
)
SELECT
    product,
    product_category,
    total_sales
FROM rank_products
WHERE sales_rank <= 3
ORDER BY total_sales DESC;

-- Customer Preference Based on Gender and Device Type
WITH grouped_data AS (
    SELECT
        gender,
        device_type,
        product_category,
        COUNT(*) AS order_count
    FROM e_commerce_dataset
    GROUP BY gender, device_type, product_category
)
SELECT
    e1.gender,
    e1.device_type,
    e1.product_category,
    e1.order_count
FROM grouped_data e1
JOIN grouped_data e2
ON e1.gender = e2.gender
AND e1.device_type = e2.device_type
AND e1.product_category = e2.product_category
GROUP BY
    e1.gender, e1.device_type, e1.product_category
ORDER BY
    order_count DESC;

-- Customer Retention Analysis
WITH returning_customers AS (
    SELECT
        customer_id,
        COUNT(*) AS order_count,
        AVG(sales) AS avg_spending
    FROM e_commerce_dataset
    WHERE customer_id IN (
        SELECT customer_id
        FROM e_commerce_dataset
        GROUP BY customer_id
        HAVING COUNT(*) > 1
    )
    GROUP BY customer_id
)
SELECT
    customer_id,
    order_count,
    ROUND(avg_spending, 2) AS avg_spending
FROM returning_customers
ORDER BY order_count DESC, avg_spending DESC;

-- Revenue Contribution by High Priority Orders
WITH high_priority_orders_cte AS (
    SELECT
        order_priority,
        SUM(sales) AS high_priority_sales
    FROM e_commerce_dataset
    WHERE order_priority = 'High'
    GROUP BY order_priority
),
total_sales_cte AS (
    SELECT
        SUM(sales) AS total_sales
    FROM e_commerce_dataset
)
SELECT
    high_priority_sales,
    total_sales,
    ROUND((high_priority_sales / total_sales) * 100, 2) AS contribution_percentage
FROM
    high_priority_orders_cte, total_sales_cte;
