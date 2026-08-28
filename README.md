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

Built entirely on Microsoft Fabric, using a medallion (Bronze → Silver → Gold) architecture:<img width="1920" height="1080" alt="microsoft fabric" src="https://github.com/user-attachments/assets/1ad32a10-c5d8-431f-b3d0-5302f2b8b773" />


