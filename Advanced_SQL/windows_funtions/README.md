# Window Functions

## Explanation
- **Window functions** perform calculations across a set of rows related to the current row.
- Unlike aggregate functions, they do **not collapse rows** into a single result — each row retains its identity.
- They are often used for ranking, running totals, moving averages, and partitioned aggregates.

## Key Takeaways
- Use `OVER()` to define the window (scope of rows).
- `PARTITION BY` divides rows into groups for the calculation.
- `ORDER BY` inside the window defines calculation order (e.g., ranking).
- Common window functions:
  - `ROW_NUMBER()` → Assigns a unique number to each row.
  - `RANK()` and `DENSE_RANK()` → Rank rows with handling of ties.
  - `SUM() OVER()` → Running totals.
  - `AVG() OVER()` → Moving averages.
