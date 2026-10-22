###### \# ***Sales Data Analysis*** 



\## 1. Project Title

\*\****Sales Data Analysis Using SQL, Spreadsheets, and Tableau***\*\*



\## 2. SQL Compiler and Dialect

\- \*\*SQL Compiler:\*\* MySQL

\- \*\*SQL Dialect:\*\* MySQL 8



\## 3. Spreadsheet Tool

\- \*\*Spreadsheet Tool:\*\* LibreOffice Calc



\## 4. Tableau Public Dashboard

\- \*\*Built in Tableau Public:\*\* Yes

\- \*\*Dashboard:\*\* Sales Analysis Dashboard

\- \*\*Published Dashboard:\*\* https://public.tableau.com/views/capstone_project_17925193115530/Dashboard1?:language=en-GB&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link



\## 5. Three Most Important Findings

The analysis covered 63 completed orders and recorded total revenue of ₹346,200. North was the highest-revenue region, generating ₹119,300, followed by South at ₹82,500, West at ₹74,900, and East at ₹69,500. Electronics was the highest-revenue category at ₹142,300, followed by Home at ₹126,400 and Apparel at ₹77,500. November recorded the highest monthly revenue at ₹154,800, compared with ₹98,300 in September and ₹93,100 in October. These findings show that revenue was concentrated in the North region and Electronics category, while November was the strongest month in the analyzed period.



\## 6. File Index



| File Path | Part | Description |

|---|---|---|

| `README.md` | All Parts | Project overview, findings, tools, assumptions, and file index |

| `sql/00_schema_and_seed.sql` | Part A | Creates database tables and inserts seed data |

| `sql/q01.sql` | Part A | SQL analysis query 01 |

| `sql/q02.sql` | Part A | SQL analysis query 02 |

| `sql/q03.sql` | Part A | SQL analysis query 03 |

| `sql/q04.sql` | Part A | SQL analysis query 04 |

| `sql/q05.sql` | Part A | SQL analysis query 05 |

| `sql/q06.sql` | Part A | SQL analysis query 06 |

| `sql/q07.sql` | Part A | SQL analysis query 07 |

| `sql/q08.sql` | Part A | SQL analysis query 08 |

| `sql/q09.sql` | Part A | SQL analysis query 09 |

| `sql/q10.sql` | Part A | SQL analysis query 10 |

| `sql/q11.sql` | Part A | SQL analysis query 11 |

| `sql/q12.sql` | Part A | SQL analysis query 12 |

| `sql/q13.sql` | Part A | SQL analysis query 13 |

| `sql/d1_corrected.sql` | Part D | Corrected SQL query after AI-generated query review |

| `results/query_results.md` | Part A | Recorded outputs of SQL queries |

| `data/orders_enriched.csv` | Part B | Enriched order dataset |

| `data/orders_clean.csv` | Part B | Cleaned order dataset used for analysis |

| `docs/spreadsheet_notes.md` | Part B | Spreadsheet cleaning and analysis notes |

| `docs/dashboard_spec.md` | Part C | Dashboard specification, KPIs, visualizations, findings, and recommendations |

| `docs/ai_log.md` | Part D | AI prompts, identified defects, corrected query, validation, and human review |



\## 7. Assumptions

Revenue calculations include only orders whose status is `completed`. Regional revenue is grouped using the customer's region, and total revenue is calculated by summing order amounts. The dashboard uses `data/orders\_clean.csv` as its data source. Recommendations based on revenue patterns are treated as opportunities for further investigation rather than proof of causation. No additional assumptions were made beyond these choices unless documented in the relevant project files.



