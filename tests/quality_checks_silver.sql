/*
========================================================================================================================
Quality Checks
========================================================================================================================
Script Purpose:
    This script performs various quality checks for data consistency, accuracy,
    and standardization across the 'silver' schema. It includes checks for:
    - Null or duplicate primary keys.
    - Unwanted space in string fields.
    - Data standardization and consistency.
    - Invalid date ranges and orders.
    - Data consistency between related fields.

Usage Notes:
    - Run these checks after data loading Silver Layer.
    - Investigate and resolve any discrepancies found during the checks.
========================================================================================================================
*/

/* -------------------------------
   TABLE: silver.crm_cust_info
   ------------------------------- */
-- CHECK FOR NULLS OR DUPLICATES IN PRIMARY KEY
-- EXPECTATION : NO RESULT
SELECT cst_id, COUNT(*) 
FROM silver.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id IS NULL;

-- CHECK FOR UNWANTED SPACES
SELECT cst_firstname 
FROM silver.crm_cust_info
WHERE cst_firstname != TRIM(cst_firstname);

SELECT cst_lastname 
FROM silver.crm_cust_info
WHERE cst_lastname != TRIM(cst_lastname);

-- DATA STANDARDIZATION & CONSISTENCY
SELECT DISTINCT cst_gndr 
FROM silver.crm_cust_info;

-- CHECK CUSTOMER CREATION DATE VALIDITY
SELECT * 
FROM silver.crm_cust_info
WHERE cst_create_date > GETDATE();

/* -------------------------------
   TABLE: silver.crm_prd_info
   ------------------------------- */
-- CHECK FOR NULLS OR DUPLICATES IN PRIMARY KEY
SELECT prd_id, COUNT(*) 
FROM silver.crm_prd_info
GROUP BY prd_id
HAVING COUNT(*) > 1 OR prd_id IS NULL;

-- CHECK FOR UNWANTED SPACES
SELECT prd_nm 
FROM silver.crm_prd_info
WHERE prd_nm != TRIM(prd_nm);

-- CHECK FOR INVALID OR ZERO COST VALUES
SELECT prd_cost 
FROM silver.crm_prd_info
WHERE prd_cost = 0 OR prd_cost IS NULL;

-- DATA STANDARDIZATION & CONSISTENCY
SELECT DISTINCT prd_line 
FROM silver.crm_prd_info;

-- CHECK FOR INVALID DATE ORDERS
SELECT * 
FROM silver.crm_prd_info
WHERE prd_end_dt < prd_start_dt;

/* -------------------------------
   TABLE: silver.crm_sales_details
   ------------------------------- */
-- CHECK FOR NULLS OR DUPLICATES IN PRIMARY KEY
SELECT sls_ord_num, COUNT(*) 
FROM silver.crm_sales_details
GROUP BY sls_ord_num
HAVING COUNT(*) > 1 OR sls_ord_num IS NULL;

-- CHECK FOR INVALID DATES
SELECT * 
FROM silver.crm_sales_details
WHERE sls_order_dt IS NULL OR sls_ship_dt IS NULL OR sls_due_dt IS NULL;

-- CHECK FOR INVALID ORDER DATES
SELECT * 
FROM silver.crm_sales_details
WHERE sls_order_dt > sls_ship_dt OR sls_order_dt > sls_due_dt;

-- CHECK DATA CONSISTENCY: Sales = Quantity * Price
SELECT sls_sales, sls_quantity, sls_price 
FROM silver.crm_sales_details
WHERE sls_sales != sls_quantity * sls_price
   OR sls_sales IS NULL OR sls_quantity IS NULL OR sls_price IS NULL
   OR sls_sales <= 0 OR sls_quantity <= 0 OR sls_price <= 0;

-- CHECK REFERENTIAL INTEGRITY: Customer IDs
SELECT sls_cust_id 
FROM silver.crm_sales_details s
LEFT JOIN silver.crm_cust_info c ON s.sls_cust_id = c.cst_id
WHERE c.cst_id IS NULL;

-- CHECK REFERENTIAL INTEGRITY: Product Keys
SELECT sls_prd_key 
FROM silver.crm_sales_details s
LEFT JOIN silver.crm_prd_info p ON s.sls_prd_key = p.prd_key
WHERE p.prd_key IS NULL;

/* -------------------------------
   TABLE: silver.erp_cust_az12
   ------------------------------- */
-- CHECK FOR DUPLICATES
SELECT cid, COUNT(*) 
FROM silver.erp_cust_az12
GROUP BY cid
HAVING COUNT(*) > 1;

-- CHECK ERP CUSTOMER BIRTHDATE VALIDITY
SELECT * 
FROM silver.erp_cust_az12
WHERE bdate IS NULL OR bdate < '1900-01-01' OR bdate > GETDATE();

-- DATA STANDARDIZATION & CONSISTENCY
SELECT DISTINCT gen 
FROM silver.erp_cust_az12
WHERE gen NOT IN ('Male','Female','n/a');

/* -------------------------------
   TABLE: silver.erp_loc_a101
   ------------------------------- */
-- CHECK FOR DUPLICATES
SELECT cid, COUNT(*) 
FROM silver.erp_loc_a101
GROUP BY cid
HAVING COUNT(*) > 1;

-- DATA STANDARDIZATION & CONSISTENCY
SELECT DISTINCT cntry 
FROM silver.erp_loc_a101
WHERE cntry NOT IN ('Germany','United States','n/a');

/* -------------------------------
   TABLE: silver.erp_px_cat_g1v2
   ------------------------------- */
-- CHECK FOR DUPLICATES
SELECT id, COUNT(*) 
FROM silver.erp_px_cat_g1v2
GROUP BY id
HAVING COUNT(*) > 1;

-- CHECK FOR NULLS IN CRITICAL FIELDS
SELECT * 
FROM silver.erp_px_cat_g1v2
WHERE id IS NULL OR cat IS NULL OR subcat IS NULL;
