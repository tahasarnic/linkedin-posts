/*markdown
# Chinook Analytics
*/

/*markdown
## Data Model
*/

/*markdown
<img src="datamodel.png">
*/

-- Active: 1694263060716@@127.0.0.1@5432@chinook
/*Top 10 customers who spend the most*/
WITH "top_customers" AS (SELECT "CustomerId", SUM("UnitPrice" * "Quantity") AS "total_spent"
FROM "Invoice"
LEFT JOIN "InvoiceLine"
ON "Invoice"."InvoiceId" = "InvoiceLine"."InvoiceId"
GROUP BY "CustomerId"
ORDER BY total_spent DESC
LIMIT 10)
SELECT "top_customers"."CustomerId", "FirstName", "LastName", "top_customers"."total_spent"
FROM "Customer"
INNER JOIN "top_customers"
ON "top_customers"."CustomerId" = "Customer"."CustomerId";

/*markdown
This is a markdown cell.
*/

/* Continuing with SQL*/
SELECT * FROM "Invoice"
LIMIT 10;