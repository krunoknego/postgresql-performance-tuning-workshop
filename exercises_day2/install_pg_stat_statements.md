# Install pg_stat_statements

Set the shared_preload_libraries to the following value
```bash
shared_preload_libraries = 'pg_stat_statements'
```

Restart PostgreSQL:

```bash
make down start
```

In psql:
```sql
CREATE EXTENSION pg_stat_statements;
```
