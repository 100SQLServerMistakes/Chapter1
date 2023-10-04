SELECT
      ProductName
	, ProductDescription AS Description
	, CASE
	    WHEN StockQty >= 10
		    THEN N'In Stock'
		WHEN StockQty > 0 AND StockQty < 10
		    THEN CAST(StockQty AS NVARCHAR) + ' left in stock'
		ELSE 'Out of stock'
	  END
	, ProductImage
FROM dbo.Products WITH (NOLOCK)
WHERE ProductID = @ProductID