# Business continuity and disaster recovery hands-on lab step-by-step 

In this hands-on lab (HOL), attendees will implement three different environments and use Azure BCDR technologies to achieve three distinct goals for each environment type.  These will include a migration to Azure, Azure region to region failover using Azure Site Recovery (ASR) and a PaaS implementation using BCDR technologies to ensure high availably of an application.

# Environment: On-premises (migrate to Azure)
•	Background: This environment will deploy a Hyper-V Host that will host a Linux VM to simulate a Linux, Apache, PHP and MySQL (LAMP), based web application deployed into an on-premises datacenter on a single VM
•	Goal using Azure BCDR: Your goal for this environment will be to migrate this application to Azure IaaS with a one-direction failover
 
 
# Environment: Azure IaaS (failover region to region)
•	Background: This environment will consist of two Virtual Networks deployed to your Primary and Secondary site with an AD Domain, IIS Web Servers and Microsoft SQL Servers that you will configure into a SQL Always On Availability Group
•	Goal using Azure BCDR: Your goal for this environment is to have the ability to have a one-click failover process using Azure Site Recovery in either direction. The users will have one URL that they will use to connect to your application regardless of where the application is running.
 

 
# Environment: Azure PaaS (high-availably with seamless failover)
•	Background: This environment will deploy an Azure Web App and Azure SQL Server in both the Primary and Secondary locations. You will configure SQL Database Failover groups to allow for seamless failover of the database.
•	Goal using Azure BCDR: Your goal for this environment is never to have the users experience any downtime if issues arise with your Web App or the SQL Database. The users will have one URL that they will use to connect to your application regardless of where the application or database is running.

