# Part D — AI-Assisted Analysis with Human-in-the-Loop Verification

## Task 1: Five-Part Prompt for Part A Q13

### Role
Act as an experienced MySQL 8 analyst who writes accurate, readable SQL and validates business metrics before reporting them.

### Task
Write a SQL query for Part A Q13 that calculates each sales representative's monthly revenue from completed orders and assigns a performance tier based on their monthly target.

### Context
Use MySQL 8. The database contains these tables and columns:

- `reps`: `rep_id`, `rep_name`, `region`, `monthly_target`
- `customers`: `customer_id`, `first_name`, `last_name`, `city`, `region`, `age`, `rep_id`
- `orders`: `order_id`, `customer_id`, `item`, `quantity`, `amount`, `status`, `order_month`

Join `reps` to `customers` using `rep_id`, and join `customers` to `orders` using `customer_id`.

### Constraints
- Include completed orders only by filtering `orders.status = 'completed'`.
- Calculate monthly revenue using `SUM(orders.amount)`.
- Group by representative name, order month and monthly target.
- Assign `Below Target` when revenue is less than the monthly target.
- Assign `On Target` when revenue is greater than or equal to the target but less than 1.1 times the target.
- Assign `Above Target` when revenue is greater than or equal to 1.1 times the target.
- Do not use any `WITH` clauses.
- Do not use stored procedures.
- Do not place aggregate expressions in `WHERE`.
- Do not filter on a derived alias in `WHERE` or `GROUP BY`.
- Write aggregate and conditional expressions out in full.

### Format
Return raw SQL only, with inline comments explaining the joins, completed-order filter, aggregation and performance-tier calculation.

## Task 2: Inspect Scenario D1

The original assistant query was:

```sql
SELECT region_name, SUM(total_sales) AS sales
FROM sales
WHERE SUM(total_sales) > 80000
GROUP BY region_name
ORDER BY sales DESC;
```

It also claimed: "North is the strongest region, and its revenue grew 38% month over month."

| Defect | Classification | Explanation and correction |
|---|---|---|
| `sales` table does not exist in the supplied schema | Fake method/function | Use the real `orders` table and join it to `customers` to obtain the region. |
| `region_name` and `total_sales` do not exist | Fake method/function | Use `customers.region` and `orders.amount`. |
| `SUM(total_sales)` is placed in `WHERE` | Logic error | Filter the aggregate using `HAVING SUM(o.amount) > 80000` after grouping. |
| North's 38% month-over-month growth is unsupported | Phantom statistic | Calculate the change using verified monthly revenue from Q11; do not repeat the claim without evidence. |

## Task 3: Correct and Verify Scenario D1

### Corrected query

The query is saved separately as `sql/d1_corrected.sql`.

```sql
-- Calculate completed-order revenue by region
SELECT
    c.region,
    SUM(o.amount) AS revenue
FROM orders AS o
INNER JOIN customers AS c
    ON o.customer_id = c.customer_id
WHERE o.status = 'completed'
GROUP BY c.region
HAVING SUM(o.amount) > 80000
ORDER BY SUM(o.amount) DESC;
```

### Execution result

The query was executed against the project database and returned exactly two rows:

| Region | Revenue (INR) |
|---|---:|
| North | 119,300 |
| South | 82,500 |

Both regions exceed the ₹80,000 threshold. East (₹69,500) and West (₹74,900) do not meet it and are excluded.

### North's month-over-month verification

Using the monthly revenue values recorded in Part A Q11:

\[
\text{Percentage change}=
\frac{\text{October revenue}-\text{September revenue}}
{\text{September revenue}}\times100
\]

North's actual September-to-October revenue change is **−22.8%** when rounded to one decimal place. The assistant's claim of 38% growth is contradicted by the data: North's revenue decreased rather than grew.

## Task 4: Human-in-the-Loop Verification Protocol

### Specification
The original request, "which regions sell the most?", was ambiguous. I specified that the metric is revenue from completed orders only, grouped by the real customer region, with an aggregate threshold strictly greater than ₹80,000.

### Execution
I executed the corrected query in MySQL against the project tables `orders` and `customers`. The query returned North at ₹119,300 and South at ₹82,500.

### Inspection
I checked the table names, column names, joins, completed-order filter, grouping, aggregate threshold and descending sort. The corrected query uses real schema fields and places the aggregate condition in `HAVING`, not `WHERE`.

### Verification
I compared the returned values with the region revenue totals in Part C: North ₹119,300 and South ₹82,500. I also checked Q11's monthly revenue and calculated North's September-to-October change as −22.8%, rounded to one decimal place. This contradicts the original 38% growth claim.

### Decision
**Reject the original answer** because it uses a non-existent table and columns, places an aggregate in `WHERE`, and makes a growth claim contradicted by the monthly data. **Accept the corrected query** because it runs successfully, returns exactly the two expected regions above the threshold, and matches the verified regional totals.

## Task 5: Prompt and Correction for Scenario D2

### Five-part prompt

#### Role
Act as a spreadsheet troubleshooting expert who diagnoses lookup errors carefully.

#### Task
Find the root cause of a failed exact-match VLOOKUP and provide a corrected formula.

#### Context
The `products` worksheet has data in `A1:C10`, with headers in row 1, item names in column A and unit prices in column C. On the `orders` worksheet, cell `G2` contains the text ` Smart Watch`, with one leading space. The formula `=VLOOKUP(G2, $A$2:$C$10, 3, FALSE)` returns an error saying the value was not found, even though `Smart Watch` exists in the products table.

#### Constraints
Preserve exact-match lookup behaviour. Do not change the product names or the lookup range unnecessarily. Remove leading and trailing whitespace from the lookup key.

#### Format
Explain the root cause in plain language and provide the repaired spreadsheet formula.

### Root cause
The value in `orders!G2` has a leading space before `Smart Watch`. Because the formula uses `FALSE` for exact matching, the lookup key does not match the product name without that space.

### Repaired formula

```excel
=VLOOKUP(TRIM(G2), $A$2:$C$10, 3, FALSE)
```

`TRIM(G2)` removes the leading space so that the lookup can match `Smart Watch` in the products table.

## Task 6: Skeptical-Analyst Check on Part C

### Prompt to challenge the first recommendation

#### Role
Act as a skeptical business analyst who questions recommendations and distinguishes correlation from evidence of cause.

#### Task
Challenge the recommendation to run a targeted Electronics promotion and maintain adequate stock in the North region.

#### Context
The Part C detail table reports North Electronics revenue of ₹73,400. North's total regional revenue is ₹119,300, and total Electronics revenue across all regions is ₹142,300.

#### Constraints
Do not assume that high revenue proves a promotion is needed or that stock is insufficient. Identify unstated assumptions, request supporting evidence, and distinguish descriptive figures from causal evidence.

#### Format
List each assumption, the data or additional check needed to test it, and what evidence would strengthen or weaken the recommendation.

### Unstated assumptions and verification checks

1. **Assumption: North Electronics has an opportunity for further growth.** North Electronics already generates ₹73,400 out of North's ₹119,300 total revenue. Check the monthly North Electronics trend in Q11 or the monthly-by-category worksheet. Sustained growth or a meaningful recent decline would help determine whether a targeted campaign is justified.

2. **Assumption: Electronics stock in North may be insufficient.** Revenue alone does not show stock availability or lost sales. Check inventory records, stockout frequency and unfulfilled demand for North Electronics. Frequent stockouts would support a stock review; adequate inventory with no stockouts would weaken the assumption.

3. **Assumption: A promotion would increase revenue profitably.** The ₹73,400 figure is historical revenue, not evidence that a promotion caused or will cause growth. Compare units sold, selling prices, margins and campaign results before and after a promotion, ideally against a comparable control period or region. A revenue increase accompanied by acceptable margins would support the recommendation; increased revenue with lower profit would weaken it.

## Final Verification Summary

- The corrected D1 query uses the real schema, includes completed orders only, and applies the ₹80,000 threshold with `HAVING`.
- The execution result contains exactly two rows: North (₹119,300) and South (₹82,500).
- North's verified September-to-October revenue change is −22.8%, contradicting the assistant's 38% growth claim.
- The D2 formula uses `TRIM` to remove the leading space.
- The Part C recommendation is challenged using three explicit assumptions and corresponding checks.