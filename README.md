# Retail Discount Analysis Project

## Overview

This project explores the impact of discounts on retail sales performance using SQL for data processing and Excel for interpretation and visualization. The analysis investigates discount prevalence, effects on sales and revenue, and how impact varies by category, region, seasonality, and competition.

---
## Project Motivation

This analysis investigates the common retail myth that “discounts always increase revenue and sales equally across all product categories and seasons.” By segmenting sales data, the project tests whether discounts truly drive revenue or simply increase volume, and if their effectiveness varies by category, region, or season.
## Workflow

1. **SQL Analysis** (`retail_disct.sql`):
   - Clean and aggregate raw sales data.
   - Flag discounted transactions.
   - Summarize sales by discount status, category, region, seasonality, and competition.

2. **Data Export**:
   - Exported SQL results as CSV files for further analysis and visualization.

3. **Excel Interpretation**:
   - Used pivot tables and charts to interpret trends and segment discount effects.

---

## Key Results & Interpretations

### 1. **Discount Prevalence**
**File:** `discount %.csv`

| Discounted Sales | Total Sales | % Discounted |
|------------------|-------------|--------------|
| 58,438           | 73,100      | 79.94%       |

**Interpretation:**  
Nearly 80% of transactions involved a discount. Discounts are a core feature of the retail strategy, not a rare event.

---

### 2. **Units Sold & Revenue Comparison**
**File:** `avg units sold & revenue.csv`

| Is Discounted | Avg Units Sold | Avg Revenue |
|---------------|---------------|-------------|
| False         | 135.69        | 7,465.53    |
| True          | 136.66        | 5,831.37    |

**Interpretation:**  
Discounted sales have slightly more units sold per transaction, but lower average revenue.  
**Insight:** Discounts increase item movement but reduce revenue per sale, suggesting a trade-off between volume and profit.

---

### 3. **Discount Impact by Category**
**File:** `disct impact.csv`

| Category     | Total Revenue   | Avg Discount | Discounted Sales | Total Sales |
|--------------|----------------|--------------|------------------|-------------|
| Furniture    | 91,118,234.34  | 10.03        | 11,767           | 14,699      |
| Groceries    | 91,095,388.20  | 9.98         | 11,674           | 14,611      |
| Toys         | 89,801,899.19  | 9.99         | 11,684           | 14,643      |
| Clothing     | 89,642,572.00  | 10.01        | 11,680           | 14,626      |
| Electronics  | 88,574,861.18  | 10.04        | 11,633           | 14,521      |

**Interpretation:**  
All categories see high levels of discounting (~80% of sales). Furniture and Groceries lead in total revenue, but average discounts are consistent across categories.  
**Insight:** Discounts are applied evenly but some categories (Furniture, Groceries) yield greater revenue, possibly due to higher prices or demand.

---

### 4. **Discount Impact by Region**
**File:** `disct impact by region.csv`

| Region | Total Revenue    | Discounted Sales | Total Sales |
|--------|------------------|------------------|-------------|
| East   | 113,540,844.33   | 14,668           | 18,349      |
| South  | 113,360,381.84   | 14,649           | 18,297      |
| North  | 112,448,747.35   | 14,569           | 18,228      |
| West   | 110,882,981.39   | 14,552           | 18,226      |

**Interpretation:**  
Discounted sales rates are similar across regions. East and South regions generate the most revenue, suggesting strong customer response or market size.

---

### 5. **Seasonality Impact**
**File:** `seasonality impacts.csv`

| Seasonality | Total Revenue     | Discounted Sales | Total Sales |
|-------------|------------------|------------------|-------------|
| Winter      | 113,105,637.12   | 14,561           | 18,285      |
| Autumn      | 112,855,194.10   | 14,585           | 18,193      |
| Summer      | 112,153,123.45   | 14,663           | 18,305      |
| Spring      | 112,119,000.24   | 14,629           | 18,317      |

**Interpretation:**  
Discounting is consistent year-round, with minor seasonal variation in revenue.  
**Insight:** Discounts are not heavily seasonal, but slightly higher sales/revenue in Winter/Autumn may reflect holiday promotions.

---

### 6. **Competition and Promotion Effect**
**File:** `competition impact.csv`

| Avg Competition | Promo Rate | Avg Discount | Avg Units Sold |
|-----------------|-----------|--------------|----------------|
| 55.16           | 0.50      | 12.52        | 136.66         |

**Interpretation:**  
Discounted transactions tend to occur in moderately competitive settings (avg. competition score ~55) with ~50% promo rate.  
**Insight:** Discounts are likely used both as a competitive tool and in conjunction with promotions.

---

## Conclusions & Recommendations

- **Discounts are widely used (80% of sales), driving higher volume but lower revenue per transaction.**
- **All categories and regions apply discounts at similar rates, but some yield more revenue (Furniture, Groceries, East/South regions).**
- **Seasonality and competition have moderate effects; discounts are not restricted to specific times or competitive conditions.**
- **Business should evaluate if the boost in volume compensates for the lower revenue per sale, especially in high-value categories/regions.**

---

## How to Reproduce

1. Run `retail_disct.sql` on your retail sales database.
2. Export query results as CSV files.
3. Open CSVs in Excel for further pivot table and chart analysis.
4. Interpret findings using the structure above.

---

## File List

- `retail_disct.sql` – SQL scripts used for all analysis.
- `discount %.csv` – % of sales with discounts.
- `avg units sold & revenue.csv` – Average units sold and revenue by discount status.
- `disct impact.csv` – Discount impact by category.
- `disct impact by region.csv` – Discount impact by region.
- `seasonality impacts.csv` – Discount impact by seasonality.
- `competition impact.csv` – Competition and promotion analysis.
- `discount_analysis.xlsx` (not shown) – Pivot tables and visualizations.

---

## Contact

For questions, open an issue or contact [manjotkaur1229](https://github.com/manjotkaur1229).
