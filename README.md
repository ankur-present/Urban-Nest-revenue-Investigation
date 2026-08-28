
# Urban-Nest-revenue-Investigation
In this project i have Investigated why Revenue dropped by 15% in September:
It an end-to-end analytics engineering project on Microsoft Fabric, investigating a 15% September revenue decline for a retail business. (I got this project idea from realanalystjobs.com competition it was there first
competition challenge)
September's revenue decline was driven by a discount rate spike (7% → 62% of orders), likely tied to a late-August payment gateway change — not falling demand (order volume held steady) or refunds (stable throughout).

Recommendation: Investigate the discount/gateway logic before cutting paid social spend by 40%.<img width="1920" height="1080" alt="discount increased" src="https://github.com/user-attachments/assets/1cb881fb-b0c7-4d14-bc55-dc3a75bf9237" />

The Business Problem

UrbanNest's leadership saw September revenue drop ~15% versus August and concluded demand had softened. Their proposed response: cut paid social ad spend by 40%.

Before acting on that assumption, this project verifies whether the decline is real, identifies its actual cause, and evaluates whether the proposed response addresses it.

Architecture

Built entirely on Microsoft Fabric, using a medallion (Bronze → Silver → Gold) architecture:
Bronze layer - Raw CSV ingestion via a Fabric Data Pipeline, landed as Delta tables with _ingested_at / _source_file audit columns for lineage
Silver layer - PySpark notebook: deduplication, type casting, null handling, discount-code standardization, with before/after data-quality logging ( i do not know pyspark yet i used ai for it, and i ivestigated the data using pandas , i know pandas, and python properly)
Gold - Star schema — fact_orders with dim_customer, dim_product, dim_date 
Semantic Model - Fabric semantic model with 11 DAX measures over Gold 
Automation - 	Scheduled pipeline (2 AM daily) chained to the Silver/Gold notebook via success dependencies, followed by a scheduled semantic model refresh (3 AM)

Tech Stack

Microsoft Fabric (Lakehouse, Data Pipelines, Notebooks) · PySpark · Delta Lake · Dimensional Modeling (Star Schema) · Power BI · DAX · Data Quality Validation

<img width="1920" height="1080" alt="urbannestgold star schema" src="https://github.com/user-attachments/assets/8eef36f3-b038-43eb-9259-8498b6e76d31" />
<img width="1920" height="1080" alt="microsoft fabric" src="https://github.com/user-attachments/assets/1ad32a10-c5d8-431f-b3d0-5302f2b8b773" />
Dashboard: 
<img width="1920" height="1080" alt="fabric app screenshot" src="https://github.com/user-attachments/assets/eade08e4-72af-4044-8cfa-0f40f5542f17" />
Bronze layer
<img width="1920" height="1080" alt="urban nest bronze layer" src="https://github.com/user-attachments/assets/b05223e2-dd94-4bee-8765-bf1e98794479" />


