# pg_stat_statements

## Exercise 1

```sql
SELECT query, total_exec_time, calls
FROM pg_stat_statements
ORDER BY total_exec_time DESC
LIMIT 5;
```

## Exercise 2

```sql
SELECT query, mean_exec_time, calls
FROM pg_stat_statements
ORDER BY mean_time DESC
LIMIT 5;
```

## Exercise 3

## Exercise 4
```sql
SELECT query, calls
FROM pg_stat_statements
ORDER BY calls DESC
LIMIT 5;
```

**ORMs** often generate a lot of repetitive traffic.

## Exercise 5

```sql
SELECT query, shared_blks_hit, shared_blks_read
FROM pg_stat_statements
ORDER BY shared_blks_hit DESC
LIMIT 5;
```
