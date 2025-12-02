--netflix project
drop table if exists netflix1;
create table  netflix1(
show_id varchar(6),
type varchar(10),	
title varchar(150),
director varchar(208),
casts varchar(1000),
country	varchar(150),
date_added varchar(50),
release_year int,
rating	varchar(10),
duration varchar(15),
listed_in varchar(100), 
description varchar(250)
);
select *from netflix1;
select count(*) as total_content from netflix1;
select distinct type from netflix1;
-- 15 business problems
--1.count the number of movies vs Tv shows
select type,count(*) as total_countent from netflix1 group by type;
--2.find the most common rating for movies and tv shows
select type,rating from(
select type,rating,count(*) ,rank() over (partition by type order by count(*) desc) as ranking from netflix1 group by type,rating) as t1
where ranking=1;
--3 list all the movies released in a specific year(e.g.,2020)
select * from netflix1 where type='Movie' and release_year='2020';
--4 find the top 5 countries with the most content on netflix
select unnest(string_to_array(country,','))as new_country,count(show_id) as total_content from netflix1 group by 1 order by 2 desc limit 5
--5 identify the longest movie?
select * from netflix1 where type='Movie'and duration=(select(max(duration)) from netflix1);
--6 find content added in the last 5 years
select * from netflix1 where to_date(date_added,'Month DD,YYYY')>=current_date-interval '5 years';
--7 find all the movies/tv shows by director 'Rajiv chilaka'!
select * from netflix1 where director like '%Rajiv Chilaka%';
--8 list all tv shows with more than 5 seasons
select * from netflix1 where type='TV Show' and split_part(duration,' ',1):: numeric>5;
--9 count the number of content items in each genre
select unnest(string_to_array(listed_in,',')) as genre,count(show_id) as total_content from netflix1 group by 1;
--10 find each year and the average numbers of content release in India on netflix.return top 5 year with highest avg content release!
select extract( year from to_date(date_added,'Month DD,YYYY')) as year ,count(*) as yearly_content ,round( count(*):: numeric/(select count(*) from netflix1 where country='India')::numeric*100,2) as avg_content_per_year  from netflix1 where country='India' group by 1;
--11 list all movies that are documentaries
select * from netflix1 where type='Movie' and listed_in ilike'%Documentaries%';
--12 find all content witout a director
select * from netflix1 where director isnull;
--13 find how many movies actor 'Salman Khan' appeared in last 10 years!
select * from netflix1 where casts ilike '%salman khan%' and release_year>extract(year from current_date)-10;
--14 find the top actors who have appeared in the highest number of movies produced in India.
select count(type) as ok,unnest(string_to_array(casts ,',')) as seperated from netflix1  where type='Movie' and country='India' group by seperated,type order by ok desc limit 10;
--15 categorize the content based on the presence of the keywords 'kill' and 'voilence' in
--the description field.label content containing these keywords as 'bad' and all other
--content as 'good'.count how many items fall into each category.
with new_table as (select *, case when description ilike '%kill%' or description like'%violence%' then 'Bad_content' else 'Good_content' end category from netflix1) select category, count(*) as total_content from new_table group by 1;