# EXPLAIN and EXPLAIN ANALYZE

## Exercise 1
``` sql
EXPLAIN SELECT * FROM employees;
```
Expect a Sequential Scan because the table is small and reading it fully is cheaper than using an index.

## Exercise 2

Disable the Seq Scan node type and run the query plan for the following query:

``` sql
SET enable_seqscan = off;
EXPLAIN ANALYZE SELECT * FROM members WHERE group_id = 1;
RESET enable_seqscan;
```

What Node type is used? Why? Try it with Seq Scan enabled. What node is then used? Why?

Solution:
You should see Index Scan using idx_members_group_id on members. If the table is small then it will be more efficient to use Seq Scan.

## Exercise 3
``` sql
EXPLAIN SELECT * FROM members WHERE active = true;
CREATE INDEX idx_members_active ON members(active);
EXPLAIN SELECT * FROM members WHERE active = true;
```
If the index is not specific enough you may still see a Seq Scan. The planner will choose the most efficient path based on the data distribution and size of the table.

Or you might get Heap Scan if the table is small.


## Exercise 4

``` sql
CREATE INDEX idx_sales_country ON sales(country);
```

If you change the country to 'USA' and run the query again, you should see an Bitmap Index Scan.
``` sql
INSERT INTO sales (country, sale_amount, product_name)
SELECT 'USA', (gs % 1000) + 1, 'Product' || gs
FROM generate_series(1, 400) AS gs;
```

If it is not working don't forget to update the statistics:
``` sql
ANALYZE sales;
```

## Exercise 5

Be more specific with the query, this will trigger Nested Loop.
It will choose Nested Loop over Hash Join because it doesn't have to do too many index lookups.

```sql
EXPLAIN (ANALYZE, BUFFERS)
SELECT m.name, g.name
FROM members m
JOIN groups g ON m.group_id = g.id
WHERE g.id = 1;
```

## Exercise 6

Merge Join is only chosen when the planner believes that Merge Join is cheaper than Nested Loop.
Right now, because groups is very small (4 rows only!), Nested Loop still looks cheaper.

``` sql
INSERT INTO groups(name)
SELECT 'Group ' || generate_series(5, 500);
```

Add order by to the query to help the planner choose Merge Join.
``` sql
EXPLAIN (ANALYZE, VERBOSE)
SELECT m.name, g.name
FROM members m
JOIN groups g ON m.group_id = g.id
ORDER BY m.group_id, g.id;
```

## Exercise 7

```sql
EXPLAIN (ANALYZE BUFFERS VERBOSE) SELECT * FROM sales;
```

## Exercise 8

Fix: Use full-text search for better performance.

```sql
CREATE INDEX idx_employee_details_gin ON employees USING gin (to_tsvector('english', employee_name));
```

to_tsvector() converts your employee_name into searchable tokens.

'english' is the dictionary used:

- It knows to ignore stopwords like “the”, “is”, etc.

- It does stemming (e.g., "said" → "say").
