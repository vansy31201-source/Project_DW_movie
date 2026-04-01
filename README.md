# 🎬 Project Data Warehouse - Movie Analytics

## 📌 Introduction

This project focuses on building a **Data Warehouse system** for movie analytics. The goal is to collect, transform, and analyze movie-related data to support decision-making and business insights.

---

## 🎯 Objectives

* Design a **data warehouse schema** (Star Schema / Snowflake Schema)
* Perform **ETL (Extract - Transform - Load)** processes
* Analyze movie data for insights such as:

  * Revenue trends
  * Popular genres
  * Customer behavior
* Build dashboards for visualization

---

## 🗂️ Project Structure

```
Project_DW_movie/
│── Project_Group_Dat204/        # Source code / ETL scripts
│── Create_Table.sql             # SQL script to create database schema
│── Dashboard_Project_Dat204     # Dashboard (Power BI / Visualization)
│── Report_Project_Dat204        # Final report
│── Report_project.docx          # Documentation
│── README.md                   # Project description
```

---

## 🏗️ Data Warehouse Design

The system is designed using:

* **Fact Table**: Stores transactional data (e.g., sales, revenue)
* **Dimension Tables**:

  * Movie
  * Customer
  * Time
  * Genre

👉 Schema type: **Star Schema**

---

## ⚙️ Technologies Used

* 🐍 Python (Data processing)
* 🗄️ SQL Server / MySQL
* 📊 Power BI (Dashboard)
* 🧰 ETL Tools (SSIS / Pandas)

---

## 🔄 ETL Process

1. **Extract**: Collect raw movie data from source
2. **Transform**:

   * Clean missing values
   * Normalize data
   * Convert formats
3. **Load**:

   * Insert into Data Warehouse

---

## 📊 Key Insights (Example)

* Top 5 highest revenue movies
* Most popular genres by year
* Revenue growth trend over time
* Customer segmentation

---

## 📈 Dashboard

The dashboard provides:

* Revenue overview
* Genre distribution
* Time-based analysis

👉 Built using Power BI

---

## 🚀 How to Run Project

1. Clone repository:

```
git clone https://github.com/your-username/Project_DW_movie.git
```

2. Run SQL script:

```
Create_Table.sql
```

3. Execute ETL scripts

4. Open dashboard file

---

## 👥 Team Members

* Nguyễn Văn Sỹ (Leader)
* Lê Công Toàn
* Ngô Tấn Đạt
* Nguyễn Xuân Hùng

---

## 📌 Conclusion

This project demonstrates the ability to:

* Design and implement a Data Warehouse
* Perform ETL processes
* Analyze and visualize data effectively

---

## 📎 References

* Kimball, R. (Data Warehouse Toolkit)
* Microsoft Power BI Documentation
* SQL Server Documentation
