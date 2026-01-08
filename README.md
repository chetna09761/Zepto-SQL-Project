# Zepto-SQL-Project
📦 Quick Commerce Inventory Analysis: SQL Case Study (Zepto Dataset)

🎯 Project Overview

This project focuses on performing end-to-end data analysis on an inventory dataset from Zepto, a leading player in India's "Quick Commerce" (10-minute delivery) sector. Using PostgreSQL, I simulated the workflow of a Data Analyst by transforming raw, scraped web data into actionable business insights.

The analysis covers inventory health, pricing strategies, and revenue opportunities, providing a deep dive into how Q-Commerce platforms manage thousands of Stock Keeping Units (SKUs) across diverse categories.

📊 The Dataset

The data used in this project is sourced from the Zepto Inventory Dataset on Kaggle.

Schema Breakdown:

sku_id: Unique identifier for each product entry.

name: Consumer-facing product title.

category: Product grouping (e.g., Fresh Produce, Snacks, Beverages).

mrp: Maximum Retail Price (stored as numeric).

discountPercent: Promotional discount applied.

discountedSellingPrice: Final price after discounts.

availableQuantity: Current stock levels.

weightInGms: Physical weight of the SKU.

outOfStock: Boolean indicator of availability.

🛠️ Technical Workflow

1. Database Architecture & ETL

Designed a robust schema to handle high-precision financial data and large inventory counts.

Data Ingestion: Optimized CSV import using COPY commands to handle UTF-8 encoding challenges.

Data Sanitization:

Removed entries with inconsistent pricing (Zero MRP/Selling Price).

Unit Standardization: Converted raw price data (originally in paise) to Rupees (₹) for standard reporting.

2. Exploratory Data Analysis (EDA)

Investigated the "messiness" of real-world data:

Identified duplicate SKUs across different package sizes.

Analyzed the ratio of In-Stock vs. Out-of-Stock items to gauge supply chain health.

Mapped the distribution of products across various categories.

3. Business Analysis & Insights

The project answers critical business questions using advanced SQL techniques (Aggregations, CTEs, and Window Functions):

Pricing Optimization: Identified the top 10 products offering the most aggressive discounts to understand loss-leader strategies.

Revenue Risk Assessment: Detected high-value (High MRP) items that are currently out of stock, representing "lost revenue" opportunities.

Category Performance: Calculated potential revenue and average discount depth per category to identify which segments drive the most value.

Unit Economics: Derived "Price per Gram" metrics to compare value-for-money across different brand tiers.

Inventory Segmentation: Categorized stock into 'Lightweight', 'Medium', and 'Bulk' to assist in delivery logistics planning.

🚀 How to Use This Repository

Environment: Ensure you have a PostgreSQL environment (like pgAdmin 4) installed.

Setup: Run the provided schema.sql to create the tables.

Data: Download the zepto_v2.csv from the Kaggle link and import it into the zepto table.

Analysis: Execute the queries in analysis_queries.sql to reproduce the insights.

📌 Key Findings

Discount Leaders: Certain categories like 'Cleaning Essentials' often carry higher average discounts compared to 'Fresh Produce'.

Stock Issues: Analysis revealed that high-demand SKUs often suffer from stockouts, impacting the platform's reliability.

Pricing Sensitivity: Bulk items often offer a better price-per-gram, suggesting a push towards higher basket values.

✒️ Author

[Chetna Kushwaha]


