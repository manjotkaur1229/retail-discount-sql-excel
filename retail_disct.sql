-- Create Table
CREATE TABLE sales_data (
    date DATE,
    store_id VARCHAR(10),
    product_id VARCHAR(20),
    category VARCHAR(50),
    region VARCHAR(20),
    inventory INT,
    units_sold INT,
    units_ordered INT,
    demand_forecast NUMERIC(10,2),
    price NUMERIC(10,2),
    discount NUMERIC(10,2),
    weather_condition VARCHAR(20),
    holiday_promo INT, -- 0/1
    competition NUMERIC(10,2),
    seasonality VARCHAR(20)
);

-- Import Data
COPY sales_data FROM 'C:\Users\singh\Desktop\Resouce basket\project\retail discount\retail_store_inventory.csv' DELIMITER ',' CSV HEADER;

-- Add Discount Flag
ALTER TABLE sales_data ADD COLUMN is_discount BOOLEAN DEFAULT FALSE;
UPDATE sales_data SET is_discount = TRUE WHERE discount > 0;

-- Key Analysis 

-- 1. What % of sales used a discount?
SELECT 
  COUNT(*) FILTER (WHERE is_discount) AS discounted_sales,
  COUNT(*) AS total_sales,
  ROUND(COUNT(*) FILTER (WHERE is_discount)::decimal / COUNT(*) * 100, 2) AS percent_discounted
FROM sales_data;

-- 2. Average units sold and revenue for discounted vs non-discounted
SELECT
  is_discount,
  ROUND(AVG(units_sold), 2) AS avg_units_sold,
  ROUND(AVG(units_sold * (price - discount)), 2) AS avg_revenue
FROM sales_data
GROUP BY is_discount;

-- 3. Discount impact by Category
SELECT
  category,
  ROUND(SUM(units_sold * (price - discount)), 2) AS total_revenue,
  ROUND(AVG(discount), 2) AS avg_discount,
  COUNT(*) FILTER (WHERE is_discount) AS discounted_sales,
  COUNT(*) AS total_sales
FROM sales_data
GROUP BY category
ORDER BY total_revenue DESC;

-- 4. Discount impact by Region
SELECT
  region,
  ROUND(SUM(units_sold * (price - discount)), 2) AS total_revenue,
  COUNT(*) FILTER (WHERE is_discount) AS discounted_sales,
  COUNT(*) AS total_sales
FROM sales_data
GROUP BY region
ORDER BY total_revenue DESC;

-- 5. Trends over Time (monthly discount usage)
SELECT
  DATE_TRUNC('month', date) AS month,
  COUNT(*) FILTER (WHERE is_discount) AS discounted_sales,
  COUNT(*) AS total_sales,
  ROUND(COUNT(*) FILTER (WHERE is_discount)::decimal / COUNT(*) * 100, 2) AS percent_discounted
FROM sales_data
GROUP BY month
ORDER BY month;

-- 6. Seasonality impact
SELECT
  seasonality,
  ROUND(SUM(units_sold * (price - discount)), 2) AS total_revenue,
  COUNT(*) FILTER (WHERE is_discount) AS discounted_sales,
  COUNT(*) AS total_sales
FROM sales_data
GROUP BY seasonality
ORDER BY total_revenue DESC;

-- 7. Competition & Promotion effect (optional)
SELECT
  AVG(competition) AS avg_competition,
  AVG(holiday_promo) AS promo_rate,
  ROUND(AVG(discount), 2) AS avg_discount,
  ROUND(AVG(units_sold), 2) AS avg_units_sold
FROM sales_data
WHERE is_discount
GROUP BY is_discount;

-- Index and Optimize
CREATE INDEX IF NOT EXISTS idx_is_discount_2 ON sales_data(is_discount);
VACUUM ANALYZE sales_data; 