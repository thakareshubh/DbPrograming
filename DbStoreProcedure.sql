SELECT 
	product_name, 
	list_price
FROM 
	production.products
ORDER BY 
	product_name;

--Creating store procedure--

CREATE PROCEDURE uspProductList
as
begin
	SELECT 
	product_name, 
	list_price
FROM 
	production.products
ORDER BY 
	product_name;
end;

Exec uspProductList

---update store proc--

ALTER PROCEDURE uspProductList
    AS
    BEGIN
        SELECT 
            product_name, 
            list_price
        FROM 
            production.products
        ORDER BY 
            list_price 
    END;

---delete store proc--

DROP PROCEDURE uspProductList;

---parameteriesed store proc--

CREATE PROCEDURE uspFindProducts
AS
BEGIN
    SELECT
        product_name,
        list_price
    FROM 
        production.products
    ORDER BY
        list_price;
END;

exec uspFindProducts 150 ,500,'Trek'

ALTER PROCEDURE uspFindProducts(@min_list_price AS DECIMAL)
AS
BEGIN
    SELECT
        product_name,
        list_price
    FROM 
        production.products
    WHERE
        list_price >= @min_list_price
    ORDER BY
        list_price;
END;

ALTER PROCEDURE uspFindProducts(
    @min_list_price AS DECIMAL
    ,@max_list_price AS DECIMAL
)
AS
BEGIN
    SELECT
        product_name,
        list_price
    FROM 
        production.products
    WHERE
        list_price >= @min_list_price AND
        list_price <= @max_list_price
    ORDER BY
        list_price;
END;

ALTER PROCEDURE uspFindProducts(
    @min_list_price AS DECIMAL
    ,@max_list_price AS DECIMAL
    ,@name AS VARCHAR(max)
)
AS
BEGIN
    SELECT
        product_name,
        list_price
    FROM 
        production.products
    WHERE
        list_price >= @min_list_price AND
        list_price <= @max_list_price AND
        product_name LIKE '%' + @name + '%'
    ORDER BY
        list_price;
END;


ALTER PROCEDURE uspFindProducts(
    @min_list_price AS DECIMAL = 0
    ,@max_list_price AS DECIMAL = 999999
    ,@name AS VARCHAR(max)
)
AS
BEGIN
    SELECT
        product_name,
        list_price
    FROM 
        production.products
    WHERE
        list_price >= @min_list_price AND
        list_price <= @max_list_price +AND
        product_name LIKE '%' + @name + '%'
    ORDER BY
        list_price;
END;

EXECUTE uspFindProducts 
    @name = 'Trek';

EXECUTE uspFindProducts 
    @min_list_price = 2000,
    @name = 'Trek';

ALTER PROCEDURE uspFindProducts(
    @min_list_price AS DECIMAL = 0
    ,@max_list_price AS DECIMAL = NULL
    ,@name AS VARCHAR(max)
)
AS
BEGIN
    SELECT
        product_name,
        list_price
    FROM 
        production.products
    WHERE
        list_price >= @min_list_price AND
        (@max_list_price IS NULL OR list_price <= @max_list_price) AND
        product_name LIKE '%' + @name + '%'
    ORDER BY

EXECUTE uspFindProducts 
    @min_list_price = 500,
    @name = 'Haro';

        list_price;
END;


----Store proc// Variables--
DECLARE @model_year AS SMALLINT;

DECLARE @model_year SMALLINT, 
        @product_name VARCHAR(MAX);

DECLARE @model_year AS SMALLINT
SET @model_year = 2018;

SELECT
    product_name,
    model_year,
    list_price 
FROM 
    production.products
WHERE 
    model_year = @model_year
ORDER BY
    product_name;

	--Storing query result in a variable--

DECLARE @product_count INT;
SET @product_count = (
    SELECT 
        COUNT(*) 
    FROM 
        production.products 
);

--SELECT @product_count as total;

--PRINT 'The number of products is ' + CAST(@product_count AS VARCHAR(MAX));
--PRINT @product_count;
SET NOCOUNT ON;  


------Selecting a record into variables------
DECLARE 
    @product_name VARCHAR(MAX),
    @list_price DECIMAL(10,2);
SELECT 
    @product_name = product_name,
    @list_price = list_price
FROM
    production.products
WHERE
    product_id = 100;

	--output-
	SELECT 
    @product_name AS product_name, 
    @list_price AS list_price;


-----Accumulating values into a variable--
CREATE  PROC uspGetProductList(
    @model_year SMALLINT
)as
begin
 
 DECLARE @product_list VARCHAR(MAX);
	SET @product_list = '';

	SELECT
        @product_list = @product_list + product_name 
                        + CHAR(10)
    FROM 
        production.products
    WHERE
        model_year = @model_year
    ORDER BY 
        product_name;

    PRINT @product_list;
END;

EXEC uspGetProductList 2018



				-----------------Stored Procedure Output Parameters--------



CREATE PROCEDURE uspFindProductByModel (
    @model_year SMALLINT,
    @product_count INT OUTPUT
) AS
BEGIN
    SELECT 
        product_name,
        list_price
    FROM
        production.products
    WHERE
        model_year = @model_year;

    SELECT @product_count = @@ROWCOUNT;
END;
--Calling stored procedures with output parameters

DECLARE @count INT;

EXEC uspFindProductByModel
    @model_year = 2018,
    @product_count = @count OUTPUT;

SELECT @count AS 'Number of products found';

DECLARE @count INT;
EXEC uspFindProductByModel 
    @model_year = 2018, 
     @product_count = @count OUTPUT;

EXEC uspFindProductByModel 2018, @count OUTPUT;

SELECT @count AS 'Number of products found';


		----------------SQL Server BEGIN END-----------------

