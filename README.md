# 🛍️ RetailCo Profitability Analysis  
Superstore Dataset | Python + SQL (PostgreSQL) 

<br>

## 📘 Project Overview  

**RetailCo faced inconsistent profitability despite strong sales.** 

Analyzed ~10K orders using **Python for data cleaning** and **SQL in PostgreSQL (aggregations, filtering, CASE)** to diagnose inconsistent profitability, identifying discount, product, region, and time-period drivers with **$200K+ potential profit improvement** through targeted recommendations.

![cheung-yin-8TEj9frsgO0-unsplash (1)](https://github.com/user-attachments/assets/201f504b-dff1-4c90-ab96-8d82896d9721)

## 💼 Business Problem 

RetailCo is a nationwide retailer operating across Furniture, Office Supplies, and Technology categories. In today’s competitive retail market,company seeks to optimize profitability and make data-driven decisions. 

> Despite growing sales, the Superstore faces inconsistent profitability.

Some products, regions, or customer segments generate low or negative profit, while others perform exceptionally. Additionally, discount strategies may be reducing profit margins on high-volume products. 

The company needs actionable insights to identify patterns, reduce losses, and focus on high-impact opportunities. 

<br>

## ❓Business Questions 

To guide the analysis, the project addresses the following questions:
1. Which products and sub-categories are least profitable or losing money?
2. How does discount affect profit?
3. Which products are losing the most profit due to high discounts, and how much revenue is affected?
4. Which customer segments are least profitable?
5. Which regions are underperforming?
6. Which months have the lowest profit, indicating periods that need attention?


<br>

## 🔍 Key Findings 

* Certain products and sub-categories, particularly high-cost Technology items (3D printers) and Office Supplies (Binders), are generating negative profit margins up to –80%, indicating severe loss drivers.
* Discounts above 20% lead to disproportionate losses, with 30%+ discounts generating $135K+ in total losses and severely eroding margin efficiency.
* High-ticket, low-volume products (e.g., 3D printers, videoconferencing units) with discounts ≥20% are responsible for the largest absolute losses ($3–9K per product), despite low sales volume.
* The Consumer segment generates the highest total profit ($134K) but has the lowest margin (12%), indicating efficiency issues and potential over-discounting.
* The Central region has the lowest margin (8%), underperforming despite moderate sales volume, likely due to high costs or inefficient discounting.
* Q2 and Q3 show the lowest profit margins (12%) despite higher sales volume, indicating mid-year efficiency losses likely due to discounts, cost pressures, or product mix.  

📄 For complete insights, see `sql/sql_queries.sql` and `/sql_analysis_insights.md`.

<br>

## 📈 Business Recommendations

1. Least profitable products and sub-categories
    * Cap discounts on loss-making products at ≤20%.
    * Stop selling products with profit margin < –30% unless part of strategic loss-leader plan.
  
✅Expected impact: Reduce losses from top unprofitable SKUs by $50–60K per year.

<br>

2. Impact of discount on profit
    * Set a 20% discount threshold; avoid discounts above this level.
    * Monitor high-discount products monthly and flag any discount >20% for approval.
        
✅Expected impact: Prevent $135K+ in losses from 30%+ discount products; increase overall profit margin by 2–3%.  

<br>

3. Products losing profit due to high discounts
    * Implement approval workflow for high-ticket items with discounts ≥20%.
    * Limit discount on products like 3D printers, videoconferencing units, and high-cost binders to ≤20%.
        
✅Expected impact: Avoid $3–9K losses per high-ticket item, reducing total loss by ~$25–30K annually.

<br>

4. Least profitable customer segments
    * Optimize promotions for Consumer segment to increase margin from 12% → 14% by reducing high-discount offers.
    * Increase sales volume of Home Office segment (highest margin 14%) via targeted campaigns.
  
✅Expected impact: Raise Consumer segment profit by $20–25K and overall segment efficiency by 2–3 percentage points.

<br>

5. Underperforming regions
    * For Central region (8% margin), optimize product mix and discounting, reduce unprofitable SKUs, and replicate West/East best practices.
 
✅Expected impact: Increase Central region margin from 8% → 12–13%, boosting profit by $20–25K without increasing sales volume.

<br>

6. Months/Quarters with lowest profit
     * Focus on Q2 and Q3 (12% margin) by:
        * Reducing high-discount products.
        * Prioritizing higher-margin SKUs in promotions.
        * Adopting Q4 pricing and promotional strategies where feasible.

✅Expected impact: Improve Q2/Q3 margin from 12% → 13%, adding $15–20K additional profit per quarter.

<br>

# 🧰 Technical Details    
This section lists the dataset, tools, and technologies used to perform the analysis.

<br>

## 📊 Dataset

* Source: [Superstore dataset](https://www.kaggle.com/datasets/vivek468/superstore-dataset-final)
* Scope: ~10K orders across multiple years and product categories.
* Key Fields:   
`order_id`, `order_date`, `customer_name`, `segment`, `region`,
`category`, `sub_category`, `sales`, `profit`, `discount`

<br>

## 🛠 Tools & Technologies

* Python (Pandas) – Data cleaning and preprocessing
* SQL - Aggregations, filtering, CASE statements, GROUP BY
* PostgreSQL (pgAdmin) – SQL-based analysis

<br>

## 🔄 Analysis Approach

1. Data Preparation
   * Cleaned and standardized Superstore sales data using Python (Pandas)
   * Corrected date formats and created a derived metric for Profit Margin

2. Profitability Analysis (SQL)
   * Analyzed profit performance by product, sub-category, discount level, customer segment, region, and month
   * Used weighted profit margins to avoid misleading averages

3. Business Insights
   * Identified loss-making products and discount thresholds
   * Highlighted underperforming customer segments, regions, and seasonal periods
   * Converted findings into actionable pricing and promotion recommendations

<br>

## ▶️ How to Run This Project  

#### 1️⃣ Set up Python environment 
```python
pip install -r requirements.txt
```

#### 2️⃣ Load data into PostgreSQL
   1. Create a PostgreSQL database
        ```sql
         CREATE DATABASE superstore_db;
         ```

  2. Create the table schema  
      * Run the schema file located at: `sql/schema.sql`
      * This creates the orders table with the correct column structure.
  
  3. Import the cleaned dataset from `data/superstore_processed.csv`.
     * Import the CSV into the orders table using: pgAdmin Import/Export tool or PostgreSQL COPY command
  
  4. Verify data load
      ```sql
      SELECT COUNT(*) FROM orders;
      ```
<br>  

## 🚀 Future Improvements

* Add discount × product interaction analysis
* Build profit-focused Tableau dashboard story
* Analyze customer lifetime value (CLV) at segment level
* Introduce basic forecasting model

<br>
<br>
If you found this project helpful or insightful, a ⭐ on this repo would make my day !! 😊
