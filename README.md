# E-commerce Data Insights

This project contains a series of SQL queries designed to analyze an e-commerce dataset. The analysis covers various aspects of customer behavior, product performance, and sales trends.

## Table of Contents

1. [Introduction](#introduction)
2. [Dataset Overview](#dataset-overview)
3. [Queries](#queries)

## Introduction

The goal of this project is to extract meaningful insights from an e-commerce dataset by examining various metrics such as profit margins, customer preferences, product sales rankings, and revenue contributions. The SQL queries included in this project aim to answer key business questions that can drive strategic decisions.

## Dataset Overview

The project utilizes an e-commerce dataset with the following key columns:

1. **order_date**: The date when the order was placed.
2. **time**: The time of the order.
3. **aging**: The number of days it took to process the order.
4. **customer_id**: A unique identifier for each customer.
5. **gender**: The gender of the customer.
6. **device_type**: The type of device used to place the order.
7. **customer_login_type**: The login type of the customer (e.g., member).
8. **product_category**: The category to which the product belongs.
9. **product**: The specific product that was ordered.
10. **sales**: The total sales amount for the order.
11. **quantity**: The quantity of the product ordered.
12. **discount**: The discount applied to the order.
13. **profit**: The profit generated from the order.
14. **shipping_cost**: The cost incurred for shipping the order.
15. **order_priority**: The priority level of the order (e.g., High, Medium, Critical).
16. **payment_method**: The payment method used for the order.

## Queries

[The SQL file ](https://github.com/trareinaung/E-Commerce-Data-Analysis/blob/main/e_commerce-data_analysis.sql)contains the following queries:

1. **Profit Margin (above 30%) by Product Category**
   - Calculate the profit margin for each product category and filter those with a profit margin above 30%.

2. **Top 3 Products by Sales in Each Category**
   - Identify the top 3 products by sales within each product category.

3. **Customer Preference Based on Gender and Device Type**
   - Analyze customer preferences by gender and device type to determine the most popular product categories.

4. **Customer Retention Analysis**
   - Examine returning customers, their order counts, and average spending to identify retention patterns.

5. **Revenue Contribution by High Priority Orders**
   - Calculate the percentage contribution of high-priority orders to total revenue.

## Author

[Thu Rein Aung](https://github.com/trareinaung)
