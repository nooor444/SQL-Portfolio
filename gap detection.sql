--find all missing invoice IDs in the Invoices table (IDs should be consecutive).
SELECT i1.invoice_id + 1 AS missing_id
FROM Invoices i1
LEFT JOIN Invoices i2 
    ON i1.invoice_id + 1 = i2.invoice_id
WHERE i2.invoice_id IS NULL
AND i1.invoice_id < (SELECT MAX(invoice_id) FROM Invoices);
