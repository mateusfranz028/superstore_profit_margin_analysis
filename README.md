# superstore_profit_margin_analysis
This is a analysis about profit margin by categories and subcategories on **Sample Superstore Dataset** from Kaggle. 

The dataset is actually a kind of simulation, uploaded by Aman Sharma on Kaggle 6 years ago. It simulate as if you were a data analyst of a superstore looking for deliver insights on how the company can increase the profit while minimize losses.


## Business Questions
- What departments has a revenue that doesn't match the profit?
- What subcategories has been operating on losses?
- What is the correlation between agressive discounts offers and profit margin destruction?

## Tech Stack & Workflow
**- PostgreSQL:**
  - Raw Ingestion: Direct Data Load using NUMERIC type.
  - Exploratory SQL Analysis: I used the aggregations SUM, COUNT and filters like WHERE, GROUP BY and HAVING SUM (profit) <0 to avoid bottlenecks.
  - Lastly I created a view vw_superstore_clean to encapsulate the logic and serve as clean layer of data.
    
**- Power BI:**
  - Native connection to PostreSQL's view.
  - Made a dedicated measures table.
  - Created dynamic measures using DAX language for the functions DIVIDE and SUM to recalculate the correct level margin of filter context.
  - Conditional formating to label subcategories in red.

## Key Insights
- Furniture revenue is almost the same as Office Supplies, but generates only $18,4K profit (2,49% profit margin).
- Tables, Bookcases and Supplies are losing money, mostly because of aggressive discounts.
- Discounts over 20% kiil all the profit.

  ´´´Discounts must be maximum 15%´´´

  
