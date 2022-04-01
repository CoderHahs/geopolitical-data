/*ROLL UP operation of the avg population per continent of our data */
SELECT continent, AVG(total_population) as avg_pop
FROM fact_table
GROUP BY continent;

/*Drill down of of population to specific countries*/
SELECT long_name, AVG(total_population) as population
FROM fact_table
GROUP BY long_name;

/*Slice operation*/
SELECT f.countrykey, edu.*
FROM fact_table f, education_dimension edu
where f.educationkey=edu.educationkey and f.year='2008';

/*Dice*/
SELECT DISTINCT f.countrykey, edu.literacy_rate_youth_male_15_to_24
FROM fact_table f, education_dimension edu
where f.educationkey=edu.educationkey and f.year='2008' and edu.literacy_rate_youth_male_15_to_24 is not NULL;

/*Dice 2*/
SELECT DISTINCT f.countrykey, health.number_of_maternal_deaths, health.lifetime_risk_of_maternal_death_percentage
FROM fact_table f, health_dimension health
where f.healthkey=health.healthkey and f.year='2009';

/*4 OLAP QUERIES*/
/*COmparring literacy_rate_youth_male_15_to_24 of Mexico in 2005 vs 2008) */
SELECT DISTINCT f.countrykey,f.year, edu.literacy_rate_youth_male_15_to_24
FROM fact_table f, education_dimension edu
where f.educationkey=edu.educationkey and f.countrykey='MEX' and (f.year='2008' or f.year='2005') and edu.literacy_rate_youth_male_15_to_24 is not NULL;

/*Comparing prevalence_of_overweight_adults_percentage_of_adults of canada and USA for every year in dataset*/
SELECT DISTINCT f.countrykey,f.year, health.prevalence_of_overweight_adults_percentage_of_adults
FROM fact_table f, health_dimension health
where f.educationkey=health.healthkey and (f.countrykey='USA' or f.countrykey='CAN') and health.prevalence_of_overweight_adults_percentage_of_adults is not NULL
ORDER BY f.year ASC;

/*Compairison of avgerage human development index between mexico canada adn usa through 2000 to 2018 with the total number of politial events in that year. */
SELECT f.countrykey, f.year, avg(f.human_development_index) as human_development_index, sum(p.sumevents) as tot_events
FROM fact_table f, politicalevent_dimension p
WHERE f.politicaleventkey=p.politicaleventkey and f.year>2000 and f.year<2018 and (f.countrykey='MEX' or f.countrykey='CAN' or f.countrykey='USA') and f.human_development_index is not null
GROUP BY f.countrykey, f.year
ORDER BY f.year ASC

/*Total population compairison of all countries with the total number of deaths of that year due to natural disaters*/
SELECT f.countrykey, f.year, avg(f.total_population) as avg_population, sum(d.total_deaths) as sum_of_deaths
FROM fact_table f, naturaldisaster_dimension d
WHERE f.naturaldisastereventkey=d.naturaldisastereventkey and f.year>2000 and f.year<2018  
GROUP BY f.countrykey, f.year
ORDER BY f.year ASC

/*Iceberg query
Viweing the 5 largest increases of net primary school enrollement of all countries between 2015 and 2008. In our DB there are only 8 countries but if we kept all countries in the world this query would be very large and keepting the top 5 would make more sense.*/
SELECT DISTINCT f.countrykey, MAX(edu2.school_enrollment_primary_net)-Max(edu1.school_enrollment_primary_net)  as Diff
from fact_table f, fact_table f2, education_dimension edu1, education_dimension edu2
where f.educationkey = edu1.educationkey and f2.educationkey = edu2.educationkey and f.year = 2008 and f2.year = 2015 and f.facttablekey <> f2.facttablekey and edu2.school_enrollment_primary_net is not null and edu1.school_enrollment_primary_net is not null
Group by f.countrykey
ORDER BY Diff DESC
FETCH FIRST 5 ROWS ONLY

/*Windowing query*/
SELECT c.longname, f.year, avg(p.urban_population) as avg_urban_pop, ROW_NUMBER() OVER (PARTITION BY c.longname) av_rank
FROM fact_table f, country_dimension c,population_dimension p
WHERE f.populationkey=p.populationkey and f.year>2000 and f.year<2018 and f.countrykey=c.countrykey
GROUP BY c.longname, f.year
ORDER BY f.year, c.longname

/*Window clause query
Comparing the percentage of birthds attended by skill health staff in Mexico from 2005 to 2016*/
SELECT DISTINCT f.countrykey, f.year, MAX(health.births_attended_by_skilled_health_staff_percentage_of_total) OVER w
FROM fact_table as f, health_dimension as health
WHERE f.healthkey = health.healthkey and health.births_attended_by_skilled_health_staff_percentage_of_total is not null and f.countrykey='MEX'
WINDOW w AS (PARTITION BY f.countrykey ORDER BY f.year ASC)


