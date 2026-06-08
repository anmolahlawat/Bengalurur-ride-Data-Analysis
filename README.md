# Bengalurur-ride-Data-Analysis<div align="center">

<!-- Header Banner -->
<img width="100%" src="https://capsule-render.vercel.app/api?type=waving&color=0:1a2f5e,100:2563EB&height=200&section=header&text=Bengaluru%20Ride%20Data%20Analysis&fontSize=40&fontColor=ffffff&fontAlignY=38&desc=End-to-End%20Data%20Analytics%20Project&descAlignY=58&descSize=18&descColor=BFDBFE" />

<!-- Badges -->
<p>
  <img src="https://img.shields.io/badge/Python-3.10+-3776AB?style=for-the-badge&logo=python&logoColor=white" />
  <img src="https://img.shields.io/badge/SQL-MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white" />
  <img src="https://img.shields.io/badge/Power%20BI-Interactive%20Dashboard-F2C811?style=for-the-badge&logo=powerbi&logoColor=black" />
  <img src="https://img.shields.io/badge/ChatGPT-Data%20Generation-10a37f?style=for-the-badge&logo=openai&logoColor=white" />
  <img src="https://img.shields.io/badge/Status-Complete-22c55e?style=for-the-badge" />
</p>

<p>
  <img src="https://img.shields.io/badge/Records-100%2C000-1a2f5e?style=flat-square" />
  <img src="https://img.shields.io/badge/Success%20Rate-62%25-2563EB?style=flat-square" />
  <img src="https://img.shields.io/badge/Vehicle%20Types-7-F59E0B?style=flat-square" />
  <img src="https://img.shields.io/badge/Pickup%20Zones-50-6366f1?style=flat-square" />
  <img src="https://img.shields.io/badge/Avg%20Rating-4.0%20%E2%AD%90-22c55e?style=flat-square" />
</p>

<br/>

> **A complete data analytics pipeline** — from synthetic data generation to interactive Power BI dashboard —  
> simulating a real-world ride-hailing platform in Bengaluru, India.

<br/>

</div>

---

## 📋 Table of Contents

- [🎯 Project Overview](#-project-overview)
- [⚙️ Tools & Technologies](#️-tools--technologies)
- [📊 Dataset Overview](#-dataset-overview)
- [🧹 Data Cleaning](#-data-cleaning--preprocessing)
- [🛢️ SQL Analysis](#️-sql-analysis)
- [📈 Power BI Dashboard](#-power-bi-dashboard)
- [💡 Key Insights](#-key-insights)
- [✅ Recommendations](#-recommendations)
- [🎓 Skills Demonstrated](#-skills-demonstrated)
- [📁 Project Structure](#-project-structure)
- [🚀 Getting Started](#-getting-started)

---

## 🎯 Project Overview

This project simulates an **end-to-end data analytics workflow** for a ride-hailing platform operating in Bengaluru, India. It covers every phase of a modern analytics pipeline:

```
Data Generation  →  Data Cleaning  →  SQL Analysis  →  Dashboard  →  Insights
     (ChatGPT)        (Python)           (SQL)          (Power BI)     (Report)
```

The primary objective was to extract **actionable business intelligence** from 100,000 synthetic ride booking records — analyzing customer behavior, vehicle performance, cancellation patterns, and location demand.

---

## ⚙️ Tools & Technologies

| Tool | Purpose |
|------|---------|
| ![ChatGPT](https://img.shields.io/badge/ChatGPT-10a37f?style=flat-square&logo=openai&logoColor=white) **ChatGPT** | Synthetic dataset generation via prompt engineering |
| ![Python](https://img.shields.io/badge/Python-3776AB?style=flat-square&logo=python&logoColor=white) **Python (Pandas, NumPy)** | Data manipulation, cleaning, and preprocessing |
| ![SQL](https://img.shields.io/badge/SQL-4479A1?style=flat-square&logo=mysql&logoColor=white) **SQL** | Business-centric querying and insight extraction |
| ![Power BI](https://img.shields.io/badge/Power%20BI-F2C811?style=flat-square&logo=powerbi&logoColor=black) **Power BI** | Interactive KPI dashboard and data visualization |

---

## 📊 Dataset Overview

The dataset was synthetically generated using **ChatGPT** with a carefully engineered prompt to simulate realistic ride-booking transactions.

### Specifications

| Metric | Value |
|--------|-------|
| 📦 Total Records | 100,000 |
| 📅 Time Period | 1 Month |
| 🏙️ City | Bengaluru, India |
| 🚗 Vehicle Types | 7 |
| 📍 Pickup Locations | 50 |
| ✅ Success Rate | 62% |
| 🗂️ Total Columns | 19 |

### Dataset Columns

```
Date | Time | Booking_ID | Booking_Status | Customer_ID | Vehicle_Type
Pickup_Location | Drop_Location | Avg_VTAT | Avg_CTAT
Cancelled_Rides_by_Customer | Reason_for_Cancelling_by_Customer
Cancelled_Rides_by_Driver | Incomplete_Rides | Incomplete_Rides_Reason
Booking_Value | Ride_Distance | Driver_Ratings | Customer_Rating
```

> **Note:** Fare charges, ratings, and ride metrics are only present for **successful bookings** — simulating real-world conditional data availability.

---

## 🧹 Data Cleaning & Preprocessing

The raw dataset underwent rigorous cleaning using **Python (Pandas & NumPy)** before analysis.

### Steps Performed

- [x] **Data Loading** — Imported into Pandas DataFrame for efficient manipulation
- [x] **Data Type Verification** — Corrected numeric and categorical field types
- [x] **Duplicate Removal** — Scanned for and removed all duplicate records
- [x] **Column Standardization** — Renamed to consistent `snake_case` convention
- [x] **Missing Value Analysis** — Identified gaps and assessed downstream impact
- [x] **Logical Consistency Checks** — Validated ratings, values, and status flags

### Outcome

| Check | Result |
|-------|--------|
| Total Records | ✅ 100,000 — no unintended loss |
| Duplicate Records | ✅ 0 found |
| Column Naming | ✅ Fully standardized |
| Dataset Status | ✅ Ready for SQL & Power BI |

---

## 🛢️ SQL Analysis

Ten business-focused queries were executed against the cleaned dataset to extract targeted insights.

### Queries at a Glance

```sql
-- Q1: Retrieve all successful bookings
SELECT booking_id, booking_status
FROM ride_data
WHERE booking_status = 'Success';

-- Q2: Average ride distance per vehicle type
SELECT vehicle_type, AVG(ride_distance) AS avg_ride_distance
FROM ride_data
GROUP BY vehicle_type;

-- Q3: Total cancelled rides by customers
SELECT COUNT(*) FROM ride_data
WHERE booking_status = 'Cancelled by Customer';

-- Q4: Top 5 customers by number of rides
SELECT customer_id, COUNT(booking_id) AS total_rides
FROM ride_data
GROUP BY customer_id
ORDER BY total_rides DESC
LIMIT 5;

-- Q5: Rides cancelled by driver (personal/car issues)
SELECT COUNT(*) FROM ride_data
WHERE cancelled_rides_by_driver = 'Personal & Car related issue';

-- Q6: Min & max driver ratings for Prime Sedan
SELECT MIN(driver_ratings) AS min_rating, MAX(driver_ratings) AS max_rating
FROM ride_data
WHERE vehicle_type = 'Prime Sedan' AND booking_status = 'Success';

-- Q7: All rides dropped at Indiranagar
SELECT * FROM ride_data
WHERE drop_location = 'indiranagar';

-- Q8: Average customer rating per vehicle type
SELECT vehicle_type, AVG(customer_rating) AS avg_cstm_rating
FROM ride_data
GROUP BY vehicle_type;

-- Q9: Total booking value of successful rides
SELECT SUM(booking_value) AS total_booking_value
FROM ride_data
WHERE incomplete_rides = 0;

-- Q10: All incomplete rides with reasons
SELECT booking_id, customer_id, vehicle_type, incomplete_rides_reason
FROM ride_data
WHERE incomplete_rides = 0;
```

---

## 📈 Power BI Dashboard

An interactive **Power BI dashboard** was built to visualize all key metrics and support ongoing business monitoring.

### Dashboard KPIs

| KPI | Value |
|-----|-------|
| 🎫 Total Bookings | **14K** |
| 💰 Total Revenue | **₹11.31M** |
| 🧾 Avg Booking Value | **₹791.26** |
| ⭐ Avg Customer Rating | **4.00** |
| 🚘 Avg Driver Rating | **4.01** |
| 📏 Avg Ride Distance | **17.98 km** |

### Visualizations Included

- 🍩 **Booking Status Distribution** — Successful / Cancelled / Incomplete breakdown
- 📊 **Revenue by Vehicle Type** — Ranked bar chart across all 7 vehicle categories
- 📍 **Top 5 Pickup Locations** — Bellandur, Shivajinagar, Kadugodi, JP Nagar, Indiranagar
- 📉 **Cancellation Analysis** — Reasons and volume breakdown
- 📆 **Total Bookings by Day** — Daily trend line over the analysis period
- 🗃️ **Vehicle Performance Matrix** — Avg distance, ratings, and booking value per type

---

## 💡 Key Insights

### 🟢 Booking Performance
- **62%** of all bookings were successfully completed
- **38%** were unsuccessful — cancellations and incomplete rides represent a major opportunity

### 👤 Customer Behavior
- Top customers show significantly higher ride frequency → strong loyalty program candidates
- Customer cancellations are often tied to wait times, wrong addresses, or plan changes

### 🚗 Vehicle Performance
- **Prime Sedan & Prime SUV** generate the highest revenue per ride
- **Bike** rides have the highest booking volume — dominant in urban short-trip commuting
- Average ride distances vary meaningfully across vehicle categories

### ⭐ Ratings
- Driver rating: **4.0** consistently across the board
- Customer rating: **4.01** — stable regardless of vehicle type
- Prime Sedan showed the widest min-max rating spread among all vehicle types

### ❌ Cancellations
Top reasons identified:
1. **Change of Plans** (customer-driven)
2. **Driver not moving towards pickup** (operational issue)
3. **Wrong Address** (input error / system discrepancy)

### 📍 Location Intelligence
- **Indiranagar, Bellandur, Whitefield** → highest demand drop zones
- Key zones aligned with Bengaluru's major commercial and residential hubs

---

## ✅ Recommendations

| # | Area | Recommendation |
|---|------|----------------|
| 1 | 🚫 **Reduce Cancellations** | Stricter time-based policies, improved location accuracy, flexible ride modification |
| 2 | 🧭 **Driver Experience** | Better navigation systems, real-time traffic updates, pickup incentives |
| 3 | 🚘 **Vehicle Strategy** | Promote Prime Sedan/SUV during peak hours; ensure Bike availability |
| 4 | 📍 **Location Management** | Use high-demand zones for dynamic pricing and targeted driver allocation |
| 5 | 🔄 **Service Reliability** | Deep-dive incomplete ride reasons to reduce operational failures |

---

## 🎓 Skills Demonstrated

```
┌─────────────────────────────────────────────────────────────────┐
│                   SKILL SET SUMMARY                             │
├──────────────┬──────────────────────────────────────────────────┤
│ Python       │ Data loading, cleaning, type conversion,         │
│              │ duplicate removal, missing value handling         │
├──────────────┼──────────────────────────────────────────────────┤
│ SQL          │ Filtering, aggregation, GROUP BY, ORDER BY,      │
│              │ LIMIT, COUNT, SUM, AVG, MIN, MAX                 │
├──────────────┼──────────────────────────────────────────────────┤
│ Power BI     │ KPI cards, bar/pie/line charts, slicers,         │
│              │ interactive drill-down, DAX measures             │
├──────────────┼──────────────────────────────────────────────────┤
│ ChatGPT      │ Prompt engineering for synthetic data at scale   │
└──────────────┴──────────────────────────────────────────────────┘
```

---

## 📁 Project Structure

```
bengaluru-ride-data-analysis/
│
├── 📂 data/
│   ├── raw_ride_data.csv              # Original synthetic dataset
│   └── cleaned_ride_data.csv          # Post-cleaning dataset
│
├── 📂 notebooks/
│   └── data_cleaning.ipynb            # Python cleaning workflow
│
├── 📂 sql/
│   └── business_queries.sql           # All 10 SQL queries
│
├── 📂 dashboard/
│   └── bengaluru_ride_analysis.pbix   # Power BI dashboard file
│
├── 📄 Bengaluru_Ride_Data_Analysis.pdf  # Full project report
└── 📄 README.md
```

---

## 🚀 Getting Started

### Prerequisites

```bash
pip install pandas numpy
```

### Run Data Cleaning

```bash
cd notebooks/
jupyter notebook data_cleaning.ipynb
```

### Run SQL Queries

Import `cleaned_ride_data.csv` into your SQL environment (MySQL / SQLite / PostgreSQL) and run:

```bash
mysql -u root -p ride_db < sql/business_queries.sql
```

### Open Dashboard

Open `dashboard/bengaluru_ride_analysis.pbix` in **Power BI Desktop**.

---

<div align="center">

---

**📄 Full Report**

[![View Report](https://img.shields.io/badge/View%20Full%20PDF%20Report-1a2f5e?style=for-the-badge&logo=adobeacrobatreader&logoColor=white)](./Bengaluru_Ride_Data_Analysis.pdf)

---

<img width="100%" src="https://capsule-render.vercel.app/api?type=waving&color=0:2563EB,100:1a2f5e&height=100&section=footer" />

*Built with Python · SQL · Power BI · ChatGPT*

</div>
