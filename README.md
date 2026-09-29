# Superstore Sales & Margin Diagnostic
<img width="1332" height="730" alt="dashboard" src="https://github.com/user-attachments/assets/29c9bfca-a0d9-4524-8c61-f2221eb51434" />

This is an analysis about profit margin by categories and subcategories on **Sample Superstore Dataset** from Kaggle. 

The dataset is actually a kind of simulation, uploaded by Aman Sharma on Kaggle 6 years ago. It simulates as if you were a data analyst of a superstore looking to deliver insights on how the company can increase the profit while minimizing losses.


## Business Questions
- What departments have a revenue that doesn't match the profit ?
- What subcategories have been operating on losses ?
- What is the correlation between agressive discount offers and profit margin destruction ?

## Workflow
<img width="25" height="25" alt="postgresql" src="https://github.com/user-attachments/assets/54474771-c519-48b0-b376-2b22b5c00480"/> **PostgreSQL**
  - Raw Ingestion: Direct Data Load using NUMERIC type.
  - Exploratory SQL Analysis: I used the aggregations SUM, COUNT and filters like WHERE, GROUP BY and HAVING SUM (profit) <0 to identify unprofitable subcategories.
  - Lastly I created a view vw_superstore_clean to encapsulate the logic and serve as clean layer of data.

    

**SQL View Creation Query:**

```
CREATE VIEW vw_superstore_clean AS
    SELECT
	   ship_mode,
	   segment,
	   country,
	   city,
	   state,
	   postal_code,
	   region,
	   category,
	   sub_category,
	   sales,
	   quantity,
	   discount,
	   profit,
    ROUND ((profit / sales *100),2) AS profit_margin_pct
   FROM
	  superstore
```

---  
    
<img width="25" height="25" alt="powerbi" src="https://github.com/user-attachments/assets/bed83c0e-ce35-4e1d-8bda-4af98c10a2b7" /> **Power BI**
  - Native connection to PostreSQL view.
  - Made a dedicated measures table.
  - Created dynamic measures using DAX language for the functions DIVIDE and SUM to recalculate the correct level margin of filter context.
  - Conditional formatting to highlight subcategories in red.
    
**Dymanic DAX Measures:**

```
Total Revenue = SUM('public vw_superstore_clean'[sales])

Total Profit = SUM('public vw_superstore_clean'[profit])

Profit Margin % = DIVIDE([Total Profit],[Total Revenue])
```

**Interactive Dashboard:**


<img width="1475" height="807" alt="gif dashboard 2" src="https://github.com/user-attachments/assets/c90dd560-7789-472b-909e-5bf31aec4dc0" />


## Key Insights
<img width="25" height="25" alt="data-eyes" src="https://github.com/user-attachments/assets/01896d6c-0083-45d7-816c-bce8f83f1945" /> I found some interesting facts here:

- Technology and Office Supplies have been showing healthy overall profit margins, around **17% each**.
  
- Furniture revenue is **almost the same** as Office Supplies, but generates only $18.4K profit (2.49% profit margin).
  
- As Furniture generates only 2,49% profit, **almost a third** of the superstore's revenue isn't bringing any profit for shareholders.
  
- From 17 subcategories, Tables, Bookcases and Supplies are **losing money**, because of over-aggressive discounts.
  
- The loss from Tables sales **wipes out** the profit from thousands of sales on profitable subcategories like Envelopes and Art & Labels together.
  
- Discounts over 20% **kill** all the profit.


## Recommendations
- Discounts must be maximum 15%.
  
  > Any discount over 15% will strangle profits.
   
- No free-freight for Tables.
  
  > Tables are profitable if no discounts are applied or if the customer pays for freight costs.
   
- Discontinue Supplies and Bookcases sales.
  
  > Small gross revenue and constantly in the red.
  
- Aim ad campaings for Technology and Paper/Binders.
  
  > These categories have high volume and consistent profit margins.
  
