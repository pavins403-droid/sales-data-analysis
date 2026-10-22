# Tableau Dashboard Specification

## 1. Data source

**Data source:** `data/orders_clean.csv`

The dashboard uses the 63 completed orders in the cleaned dataset.

| Column | Classification |
|---|---|
| order_id | Dimension |
| order_month | Dimension |
| clean_first_name | Dimension |
| clean_last_name | Dimension |
| region | Dimension |
| rep_name | Dimension |
| item | Dimension |
| category | Dimension |
| status | Dimension |
| unit_price | Measure |
| quantity | Measure |
| amount | Measure |
| revenue_calc | Measure |

The dataset contains **9 Dimensions and 4 Measures**. `order_id` is a Dimension because it identifies an order and should not be added up.

## 2. KPI cards

| KPI card | Calculation | Required value |
|---|---|---:|
| Total Revenue | SUM(amount) | ₹346,200 |
| Total Units Sold | SUM(quantity) | 106 |

The Total Revenue KPI equals Part A's q05 `total_revenue` value of ₹346,200.

## 3. Chart sheets

### 3.1 Revenue by Region

**Chart type:** Bar chart

- Rows shelf: `region`
- Columns shelf: `SUM(amount)`
- Colour shelf: `region`

**Justification:** A bar chart makes it easy to compare revenue across the four regions.

| Region | Revenue (INR) |
|---|---:|
| East | 69,500 |
| North | 119,300 |
| South | 82,500 |
| West | 74,900 |
| **Total** | **346,200** |

### 3.2 Revenue by Category

**Chart type:** Bar chart

- Rows shelf: `category`
- Columns shelf: `SUM(amount)`
- Colour shelf: `category`

**Justification:** A bar chart clearly compares the revenue contributed by each product category.

| Category | Revenue (INR) |
|---|---:|
| Apparel | 77,500 |
| Electronics | 142,300 |
| Home | 126,400 |
| **Total** | **346,200** |

### 3.3 Revenue Trend by Month and Category

**Chart type:** Line chart

- Columns shelf: `order_month`
- Rows shelf: `SUM(amount)`
- Colour shelf: `category`

**Justification:** A line chart shows how revenue changes over time and allows the monthly trends of the three categories to be compared.

| Month | Apparel | Electronics | Home | Monthly Total |
|---|---:|---:|---:|---:|
| 2026-09 | 24,700 | 43,000 | 30,600 | 98,300 |
| 2026-10 | 30,600| 49,900 | 12,600 | 93,100 |
| 2026-11 | 22,200 | 49,400 | 83,200 | 154,800 |
| **Category totals** | **77,500** | **142,300** | **126,400** | **346,200** |

**Data validation required:** Replace every bracketed value with the exact revenue displayed by Tableau for that month and category. Do not submit the placeholders. Each row must equal its monthly total, and each category column must equal its category total.

### 3.4 Region x Category Detail

**Chart type:** Text table

- Rows shelf: `region`
- Columns shelf: `category`
- Text on Marks card: `SUM(amount)`
- Colour shelf: Not required

**Justification:** A text table displays exact revenue values at the intersection of each region and category, making detailed comparisons straightforward.

| Region | Apparel | Electronics | Home | Region Total |
|---|---:|---:|---:|---:|
| East | 10,600 | 21,400 | 37,500 | 69,500 |
| North | 19,400 | 73,400 | 26,500 | 119,300 |
| South | 10,000 | 28,700 | 43,800 | 82,500 |
| West | 37,500 | 18,800 | 18,600 | 74,900 |
| **Category Total** | **77,500** | **142,300** | **126,400** | **346,200** |

## 4. Dashboard layout

### Top-to-bottom placement order

1. KPI cards: Total Revenue and Total Units Sold.
2. `category` filter, directly below the KPI cards in the top band.
3. Revenue Trend by Month and Category.
4. Comparison charts: Revenue by Region and Revenue by Category.
5. Region x Category Detail text table.

### Containers

- Use a **vertical container** as the main dashboard structure to stack the sections from top to bottom.
- Use a **horizontal container** at the top for the two KPI cards.
- Place the `category` filter in the top band directly below the KPI cards.
- Use a **horizontal container** for the two comparison charts, Revenue by Region and Revenue by Category.
- Place the trend chart and detail table in separate sections of the main vertical container.

### Filter and interactivity

- Add `category` as a filter.
- Apply the filter to all four worksheets that use the same data source.
- Turn on **Use as Filter** for Revenue by Region.

When a user clicks a region's bar in Revenue by Region, the other dashboard charts filter to show data for the selected region; clearing the selection restores the unfiltered view.

## 5. Insight and recommendation narrative

### Visualization summary

The dashboard provides an overview of completed-order revenue and units sold. It compares revenue across regions and product categories, tracks monthly revenue trends for Apparel, Electronics and Home, and presents a detailed region-by-category revenue table. KPI cards, category filtering and region selection support interactive analysis.

### Summary analysis

1. **Regional comparison:** North generated the highest revenue at ₹119,300, while East generated ₹69,500. North exceeded East by ₹49,800.
2. **Category performance:** Electronics generated ₹142,300, compared with ₹126,400 for Home and ₹77,500 for Apparel. Electronics was the highest-revenue category.
3. **Monthly change:** Revenue declined from ₹98,300 in September 2026 to ₹93,100 in October, a decrease of ₹5,200. It then increased to ₹154,800 in November, an increase of ₹61,700 from October.
4. **Region-category performance:** North Electronics generated ₹73,400, while West Apparel generated ₹37,500. These values identify specific region-category combinations for further investigation.

### Recommendations

1. **North — Electronics promotion:** Test a targeted promotional campaign and maintain adequate stock for Electronics in North, which currently generates ₹73,400. Measure success by comparing subsequent North Electronics revenue with the ₹73,400 baseline.
2. **West — Apparel stock and sales campaign:** Review stock availability and run a targeted sales campaign for Apparel in West, which generates ₹37,500. Measure success by comparing subsequent West Apparel revenue with ₹37,500 and monitoring units sold.
3. **Monthly revenue improvement:** Investigate which categories and regions contributed to November's ₹154,800 revenue and repeat successful sales activities where appropriate. Measure success by comparing the next month's total revenue with the November baseline of ₹154,800.

## 6. Reconciliation

All revenue totals should match the completed-order revenue total from Part A and Part B.

| Reconciliation item | Revenue (INR) |
|---|---:|
| Total Revenue KPI | 346,200 |
| Sum of Revenue by Region values | 346,200 |
| Sum of Revenue by Category values | 346,200 |
| Part B pivot grand total | 346,200 |

**Reconciliation result:** All four totals equal ₹346,200. The monthly-by-category chart must also reconcile to these totals after its exact values are entered and verified.


## Dashboard Link

**Published Tableau Dashboard:** [Open dashboard]https://public.tableau.com/views/capstone_project_17925193115530/Dashboard1?:language=en-GB&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link

The dashboard includes all four worksheets, two KPI cards, the category filter, and the reconciliation details.
