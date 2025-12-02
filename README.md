#      Netflix Movies and TV Shows Data Analysis Using SQL 
![netflix logo](netflix_PNG25.png)
## overview 
This project focuses on performing an in-depth analysis of Netflix’s movie and TV show dataset using SQL. The primary objective is to uncover meaningful insights and address key business questions derived from the data.
This README outlines the project goals, problem statements, analytical approach, insights generated, and conclusions drawn from the exploration. Through structured SQL queries, the analysis aims to help understand content trends, regional patterns, and strategic factors influencing Netflix’s catalog.
## 🎯 Project Analysis Objectives
1. Analyze the **distribution** of Movies vs. TV Shows.  
2. Identify the **most common ratings** for both content types.  
3. Examine **release trends** by year, country, and duration.  
4. Explore and **categorize content** using specific keywords and genres.
## Dataset
The data for this project is sourced from kaggle dataset
## Dataset link [Netflix Dataset](https://www.kaggle.com/datasets/shivamb/netflix-shows)
## Shema
1. DROP TABLE IF EXISTS netflix;
2. CREATE TABLE netflix
3.(
4  show_id      VARCHAR(5),
5  type         VARCHAR(10),
6  title        VARCHAR(250),
7  director     VARCHAR(550),
8  casts        VARCHAR(1050),
10 country      VARCHAR(550),
11 date_added   VARCHAR(55),
12 release_year INT,
13 rating       VARCHAR(15),
14 duration     VARCHAR(15),
15 listed_in    VARCHAR(250),
16 description  VARCHAR(550)
17 );


