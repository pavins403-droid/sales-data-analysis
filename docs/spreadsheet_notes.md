# Spreadsheet Cleaning Notes

## 1. Overview
The orders dataset was imported into LibreOffice Calc and cleaned to prepare a completed-orders dataset for analysis.

## 2. Workbook Setup
- Imported the original `orders_enriched.csv` into the `orders` sheet.
- Imported the product lookup data into the `products` sheet (A1:C10).
- The original dataset contained 90 data rows.
- Filtered `status` to include only `completed` orders.
- Sorted the completed orders by `amount` in descending order.
- The final dataset contains 63 completed orders and 13 columns.
- Tested the missing item lookup using `Mystery Item`; the formula returned `UNKNOWN_ITEM`.

## 3. Formulas Used
- Clean first name: `=PROPER(TRIM(C2))`
- Clean last name: `=PROPER(TRIM(D2))`
- Category lookup: `VLOOKUP` with an exact match.
   =VLOOKUP(G2;products.$A$2:$C$10;2;0)

- Unit price lookup: `XLOOKUP` with `UNKNOWN_ITEM` as the fallback result.
=XLOOKUP(G2;products.$A$2:$A$10;products.$C$2:$C$10;"UNKNOWN_ITEM")

Missing-Key Test

Tested the lookup with the item name Mystery Item.

Test formula: =XLOOKUP("Mystery Item";products.$A$2:$A$10;products.$C$2:$C$10;"UNKNOWN_ITEM")

Expected result: UNKNOWN_ITEM

Outcome: The fallback result was returned because the item was not present in the lookup table.

- Calculated revenue: `=unit_price*quantity`
=N2*H2

## 4. Aggregate Results

| Metric | Amount |
|---|---:|
| COUNT | 63 |
| SUM | 346200 |
| AVERAGE | 5495.24 |
| MIN | 1100 |
| MAX | 15600 |

## 5. Pivot Table Results

### Pivot 1: Category by Region — Sum of Amount

| Category | East | North | South | West | Total |
|---|---:|---:|---:|---:|---:|
| Apparel | 10600 | 19400 | 10000 | 37500 | 77500 |
| Electronics | 21400 | 73400 | 28700 | 18800 | 142300 |
| Home | 37500 | 26500 | 43800 | 18600 | 126400 |
| **Grand Total** | **69500** | **119300** | **82500** | **74900** | **346200** |

### Pivot 2: Month-wise Amount and Order Count

| Order Month | Sum of Amount | Count of Orders |
|---|---:|---:|
| 2026-09 | 98300 | 19 |
| 2026-10 | 93100 | 20 |
| 2026-11 | 154800 | 24 |
| **Grand Total** | **346200** | **63** |

## 6. Data Validation and Reconciliation

| Check | Result |
|---|---|
| Completed order count matches Part A Q05 | 63 |
| Total amount matches Part A Q05 | 346200 |
| Average amount matches Part A Q05 | 5495.24 |
| Missing item lookup test | `UNKNOWN_ITEM` |
| Revenue calculation | Matches amount for the displayed completed orders |
| Final output | `data/orders_clean.csv` with 13 columns and 63 data rows |

The completed-order count, total amount, and average amount reconcile with the Part A results.
