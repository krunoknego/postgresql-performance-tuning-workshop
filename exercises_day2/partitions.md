# PostgreSQL Table Partitioning

## Exercise 1

Create a `sales` table partitioned by `country`.

There is already a `sales` table in the database. So first you need to drop it.

```sql
DROP TABLE IF EXISTS sales;
```

```sql
CREATE TABLE sales (
  sale_id SERIAL,
  product_name VARCHAR(100),
  country VARCHAR(50),
  sale_amount DECIMAL,
  PRIMARY KEY (sale_id, country)
) PARTITION BY LIST (country);
```

✅ Now the table is ready for partitions.

## Exercise 2

Create partitions for USA and Canada.

```sql
CREATE TABLE sales_usa PARTITION OF sales FOR VALUES IN ('USA');
CREATE TABLE sales_canada PARTITION OF sales FOR VALUES IN ('Canada');
```

✅ Separate tables under the parent `sales`.

## Exercise 3

Insert some data into `sales`.

```sql
INSERT INTO sales (product_name, country, sale_amount) VALUES
('Laptop', 'USA', 1200.00),
('Phone', 'Canada', 800.00);
```

✅ PostgreSQL automatically routes rows to the correct partition.

## Exercise 4

> Query rows from `sales_usa` and `sales_canada` directly.

```sql
SELECT * FROM sales_usa;
SELECT * FROM sales_canada;
```

✅ Verify that the rows were placed correctly.

## Exercise 6

Select only USA sales and check if only `sales_usa` is scanned.

```sql
EXPLAIN SELECT * FROM sales WHERE country = 'USA';
```

✅ In output:
- You should see `Seq Scan on sales_usa`
- NOT a `Seq Scan` on the parent `sales`!

