# Sales Analysis (SQL • Excel • Power BI)

An end‑to‑end analytics project on retail/e‑commerce sales: data modeling in MySQL, cleaning & exploration, Excel KPIs, and an interactive Power BI dashboard.

## 🔧 Tech
- **SQL** (MySQL 8)
- **Excel** (PivotTables, Power Query)
- **Power BI** (DAX, interactive filters)

## 📂 Structure
sales-data-analysis/

├─ data/

│ ├─ data_raw/ # source CSVs (ignored by Git)

│ ├─ data_interim/ # cleaned/joins exported from SQL

│ └─ data_processed/ # final datasets for BI

├─ sql/ # DDL and analysis queries

├─ excel/ # Excel report(s)

├─ powerbi/ # .pbix dashboard

├─ visuals/ # exported PNGs for README

└─ docs/ # notes, decisions, data dictionary

## 🗺️ Roadmap
- [x] Create repo & structure
- [ ] Load sample Superstore dataset
- [ ] Create MySQL schema & load
- [ ] Clean/dedupe & fix dates
- [ ] EDA queries
- [ ] Excel KPIs + pivots
- [ ] Power BI dashboard
- [ ] Publish dashboard & screenshots
- [ ] Write up insights

## 🧰 Getting Started
1. Create the MySQL tables with `sql/01_schema_mysql.sql`
2. Load your CSVs into MySQL (`data/data_raw/`)
3. Run cleaning in `sql/02_cleaning_mysql.sql`
4. Export clean tables → `data/data_interim/`
5. Build Excel & Power BI from those files


