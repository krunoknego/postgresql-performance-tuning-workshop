# psql

## Exercise 1
Show all available databases on the server.

```sql
\l
```

## Exercise 2
Find all tables in the current database

```sql
\dt
```

## Exercise 3
See the columns and types inside the `employees` table.

```sql
\d employees
```
✅ You'll see column names, data types (e.g., id, employee_name, department_id, details (jsonb)).


## Exercise 4
List all indexes in the database.

```sql
\di
```
✅ Indexes like idx_members_group_id should appear.

## Exercise 5
List all installed extensions

```sql
\dx
```


## Exercise 6
Ask psql for help about the SELECT command syntax.

```sql
\h SELECT
```


## Exercise 7
Switch output format to vertical display.

```sql
\x
```

✅ Very helpful when selecting rows with many columns (like from employees with JSONB).

```sql
SELECT * FROM employees WHERE employee_id = 1;
```

## Exercise 8
Check what node types are enabled
```sql
SELECT name, setting FROM pg_settings WHERE name LIKE 'enable_%';
```

## Exercise 9
Exit psql

```sql
\q
```
