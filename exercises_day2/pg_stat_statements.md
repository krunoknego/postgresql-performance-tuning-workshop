# pg_stat_statements

## Exercise 1

Find the 5 queries that used the most total execution time in the database.

## Exercise 2

Find the queries that are slowest on average.

## Exercise 3

Clear the statistics, then run different queries manually (on employees, members, sales) and check new stats.

```sql
SELECT pg_stat_statements_reset();
```

Then, run various queries manually like:

```sql
SELECT * FROM employees WHERE employee_id = 5;
SELECT * FROM members WHERE active = true;
SELECT * FROM sales WHERE sale_amount > 1000;
```

After that:

```sql
SELECT query, calls
FROM pg_stat_statements
ORDER BY calls DESC;
```

## Exercise 4

Find the queries that were called the most number of times

## Exercise 5

Find the queries that use the buffer cache the most.
