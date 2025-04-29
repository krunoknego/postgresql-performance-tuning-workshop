# pgBench Exercises

## Exercise 1

Create the initial pgbench tables in your test database.

```bash
pgbench -i -s 10 testdb -U testuser
```

**What it does:**
- Creates standard benchmarking tables (`pgbench_accounts`, `pgbench_branches`, `pgbench_tellers`, `pgbench_history`).
- `-s 10` = scale factor of 10 (~1 million rows).

## Exercise 2

Simulate 20 clients over 30 seconds using 4 threads.

```bash
pgbench -c 20 -j 4 -T 30 testdb -U testuser
```

- Measure base TPS and average latency.

## Exercise 4

Create `web_query.sql`:
```sql
\set id random(1, 5)
\set dept random(1, 5)
SELECT * FROM members WHERE id = :id;
SELECT * FROM employees WHERE department_id = :dept;
```

**Hint** to create the file
```bash
cat > web_query.sql
``` 
Paste the contents of `web_query.sql` and to quit it press Ctrl-C

Then run:
```bash
pgbench -c 100 -j 10 -T 60 -f web_query.sql testdb -U testuser
```

- Mimic real application query patterns.


## Exercise 5

Simulate 200 concurrent clients and 10 threads.

```bash
pgbench -c 200 -j 10 -T 60 testdb -U testuser
```

- See how PostgreSQL handles connection saturation.
- May trigger contention.

## Exercise 6

Use `-r` to get timing info per command.

```bash
pgbench -c 20 -j 4 -T 30 -r testdb -U testuser
```

- Understand average latency of each command (e.g. select, update).
