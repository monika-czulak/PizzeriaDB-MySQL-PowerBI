# PizzeriaDB-MySQL-PowerBI

![image](https://github.com/monika-czulak/PizzeriaDB-MySQL-PowerBI/assets/109820128/1df30bc4-c98d-4ad9-a9ff-8490750287e8)

## Purpose
This is a MySQL-PowerBI project involving creation of SQL database, writing custom SQL queries, and building interactive dashboards.

## Scenario
A client, Ben, is opening a new pizzeria in his town. It won't be a dining, just take out or delivery. He's giving us a project brief. The first part requires to design and build a tailor-made bespoke ralational database for his business that will allow him to cupture and store all of the important information and data that the business generates. This will in turn help Ben to monitor business performance in dashboards. We'll just take a care of the backend, and he's hiring someone else to build a frontend ordering system. There are three main areas that the brief requires to concentrate on:
- customer orders
- stock level
- staff

All of that needs to be a part of an interactive dashboards that allow Ben to manage his business.

## Requirements
### Customer orders
- total orders
- total sales
- total items
- avg order value
- sales by category
- top selling items
- orders by date
- sales by date
- orders by address
- orders by delivery/pick up

### Stock level
- total quantity by ingredient
- total cost of ingredients
- calculated cost of pizza
- percentage stock remaining by ingredient
- list of ingredients to re-order based on remaining inventory

### Staff
- total staff cost
- total hours worked
- hours worked by staff member
- cost per staff member

## Key steps - SQL
- build database and tables using QuickDBD
- insert data into tables with table data import wizard
- join tables
- create subqueries to perform calculation on aggregated columns
- create custom view with new calculated columns for further quering

## Key steps - PowerBI
- check if all of the fields have been attributed the correct data type. Change data type for delivery to true/false, delivery address, city and zip code to location categories accordingly, order_id to text
- apply correct date and number formats
- create calculated columns for total sales, avg order value, concatenate full address for a location visual purposes, cost of pizza, remaining stock percent
- format visuals and adjusted layout
- add slicers synced across pages (date selection)






