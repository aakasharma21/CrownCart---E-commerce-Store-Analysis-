# 🛒 CrownCart — Ecommerce Sales Analysis

![CrownCart Banner](crowncart_banner_2.png)

An end-to-end data analytics project built on a simulated Indian e-commerce platform. Raw transactional data was cleaned, queried, and visualized to surface actionable business insights.

---

## 🛠 Tech Stack

| Tool | Usage |
|------|-------|
| **Advanced Excel** | Data cleaning, formatting & pivot analysis |
| **SQL Server (T-SQL)** | Querying, KPI computation & relational joins |
| **Power BI** | Interactive dashboard & data visualization |

---

## 📂 Dataset

> 📦 Available on Kaggle: [Project_Ecom_Dataset](https://www.kaggle.com/datasets/aakasharma21/project-ecom-dataset)

4 relational tables — **5,000 Customers**, **500 Products**, **5,500 Orders**, **5,500 Payments**

---

## 🔍 SQL Analysis

The `Project_Analysis.sql` covers four areas:

- **Customers** — Gender split, membership tiers, device preferences
- **Orders** — Delivery rate, revenue by city, top-selling products
- **Products** — Top rated, top discounted, revenue by category
- **Payments** — Preferred payment modes, success vs failure rates

---

## 📊 Dashboard

### Page 1 — Sales Overview
![Dashboard 1](Dashboard.png)

### Page 2 — Orders & Payments
![Dashboard 2](Dashboard2.png)

### Page 3 — Product & Revenue
![Dashboard 3](Dashboard3.png)

---

## 💡 Key Insights

- **Jaipur** leads in order volume (669), while **Delhi** tops revenue (~₹26M)
- **~79.8% delivery rate** — returns & cancellations are areas for improvement
- **Godrej Furniture Model 426** is the highest revenue product at ₹1.03M
- **COD** is the most preferred payment mode across all cities
- **Sports** is the top-grossing category (21.56% of total revenue)
- **50% of customers are 'New' members** — strong loyalty program opportunity

---

## 📁 Repository Structure

```
CrownCart-Ecommerce-Analysis/
├── Ecommerce_Data.xlsx       # Raw dataset
├── Project_Analysis.sql      # SQL queries
├── Report.pbix               # Power BI dashboard
├── Dashboard.png             # Page 1 snapshot
├── Dashboard2.png            # Page 2 snapshot
├── Dashboard3.png            # Page 3 snapshot
└── README.md
```

---

## 🚀 Getting Started

1. **Excel** — Open `Ecommerce_Data.xlsx` to explore the 4 data sheets
2. **SQL Server** — Create a database, import the flat files(Available on Kaggle), run `Project_Analysis.sql`
3. **Power BI** — Open `Report.pbix`, refresh the data source, explore the dashboard

---

## 👨‍💻 Author

**Aakash Sharma** — Certified Data Analyst

[![LinkedIn](https://img.shields.io/badge/LinkedIn-0A66C2?style=flat&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/aakasharma21/)
[![Kaggle](https://img.shields.io/badge/Kaggle-20BEFF?style=flat&logo=kaggle&logoColor=white)](https://www.kaggle.com/aakasharma21)
[![Gmail](https://img.shields.io/badge/Gmail-D14836?style=flat&logo=gmail&logoColor=white)](mailto:aakashs0101@gmail.com)

---

*Dataset is synthetic and created for portfolio purposes.*
