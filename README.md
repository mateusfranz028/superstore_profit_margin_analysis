# Superstore Sales & Margin Diagnostic
This is an analysis about profit margin by categories and subcategories on **Sample Superstore Dataset** from Kaggle. 

The dataset is actually a kind of simulation, uploaded by Aman Sharma on Kaggle 6 years ago. It simulates as if you were a data analyst of a superstore looking to deliver insights on how the company can increase the profit while minimizing losses.


## Business Questions
- What departments have a revenue that doesn't match the profit ?
- What subcategories have been operating on losses ?
- What is the correlation between agressive discount offers and profit margin destruction ?

## Workflow
**PostgreSQL:**
  - Raw Ingestion: Direct Data Load using NUMERIC type.
  - Exploratory SQL Analysis: I used the aggregations SUM, COUNT and filters like WHERE, GROUP BY and HAVING SUM (profit) <0 to identify unprofitable subcategories.
  - Lastly I created a view vw_superstore_clean to encapsulate the logic and serve as clean layer of data.
    
**Power BI:**
  - Native connection to PostreSQL view.
  - Made a dedicated measures table.
  - Created dynamic measures using DAX language for the functions DIVIDE and SUM to recalculate the correct level margin of filter context.
  - Conditional formatting to highlight subcategories in red.

## Key Insights
I found some interesting facts here:

- Technology and Office Supplies have been showing healthy overall profit margins, around 17% each.
- Furniture revenue is almost the same as Office Supplies, but generates only $18.4K profit (2.49% profit margin).
- As Furniture generates only 2,49% profit, almost a third of the superstore's revenue isn't bringing any profit for shareholders.
- From 17 subcategories, Tables, Bookcases and Supplies are losing money, because of over-aggressive discounts.
- The loss from Tables sales wipes out the profit from thousands of sales on profitable subcategories like Envelopes and Art & Labels together.
- Discounts over 20% kill all the profit.


## Recommendations
- Discounts must be maximum 15%.
  
   - Any discount over 15% will strangle profits.
   
- No free-freight for Tables.
  
   - Tables are profitable if no discounts are applied or if the customer pays for freight costs.
   
- Discontinue Supplies and Bookcases sales.
  
   - Small gross revenue and constantly in the red.
  
- Aim ad campaings for Technology and Paper/Binders.
  
   - These categories have high volume and consistent profit margins.
  
