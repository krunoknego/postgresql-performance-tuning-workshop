# EXPLAIN and EXPLAIN ANALYZE

## Exercise 1

Find the query plan for listing all employees.

``` sql
SELECT * FROM employees;
```

What node type do you observer? Why?
How many rows are there?
What is the size of the first record?

## Exercise 2

Disable the Seq Scan node type and run the query plan for the following query:

``` sql
SET enable_seqscan = off;
EXPLAIN ANALYZE SELECT * FROM members WHERE group_id = 1;
RESET enable_seqscan;
```

What Node type is used? Why? Try it with Seq Scan enabled. What node is then used? Why?

## Exercise 3

Find the query plan for listing all active members.

``` sql
SELECT * FROM members WHERE active = true;
```

What Node Type is used? Create an INDEX on active and check the query plan
again.

**Hint:***
To increase the number of rows in the table, you can use the following command:

``` sql
INSERT INTO members (name, group_id, active)
SELECT 'TestUser' || gs, (gs % 4) + 1, (gs % 2)::boolean
FROM generate_series(1, 10000) AS gs;
```

## Exercise 4

Query **sales** filtering by **country**. What 

``` sql
SELECT * FROM sales WHERE country = 'USA';
```

What Node Type is going to be used? Try to force Index Scan.
Try to force Bitmap Index Scan.


**Hint:**
If the table is small, you canuse the following command to increase the number of rows:

``` sql
INSERT INTO sales (country, sale_amount, product_name)
SELECT 'Country' || gs, (gs % 1000) + 1, 'Product' || gs
FROM generate_series(1, 10000) AS gs;
```

## Exercise 5

Get all members and their group names. Which Node Type is used? Nested Loop or Hash Join? Try to force the other Node Type to be used.

``` sql
SELECT m.name, g.name
FROM members m
JOIN groups g ON m.group_id = g.id;
```

## Exercise 6

Force a merge join on the following query:

``` sql
SELECT m.name, g.name
FROM members m
JOIN groups g ON m.group_id = g.id
```

## Exercise 7

Check if the following query is going to be read from cache or from the disk:

```sql
SELECT * FROM sales;
```

## Exercise 8
```sql
SELECT * FROM employees WHERE employee_name LIKE '%li%';
```

Explain why index is not used. Propose a better design.
