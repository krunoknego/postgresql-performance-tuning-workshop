# Logging

## Exercise 1
In postgresql.conf:
log_statement = 'all'

or in psql (for the session only)

```sql
SET log_statement = 'all';
```

## Exercise 2

SET log_min_duration_statement = 200;


## Exercise 3

```sql
SHOW log_directory;
SHOW log_filename;
```
## Exercise 4

log_connections = on
log_disconnections = on


## Exercise 5

log_line_prefix = '%u@%d %r %p: '


+logging_collector = on # Enable capturing of stderr, jsonlog,
+log_min_duration_statement = 0	# -1 is disabled, 0 logs all statements
+log_statement = 'all'			# none, ddl, mod, all

In /var/lib/postgresql/data/log
