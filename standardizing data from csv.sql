select * from layoffs_no_duplicates;

select distinct(company)
from layoffs_no_duplicates;

update layoffs_no_duplicates
set company = trim(company);

select distinct(industry)
from layoffs_no_duplicates
order by 1;

update layoffs_no_duplicates
set industry ='Crypto'
where industry Like 'Crypto%';

select distinct(country)
from layoffs_no_duplicates
order by 1;

update layoffs_no_duplicates
set country ='United States'
where country Like 'United States%';

select `date`,
str_to_date(`date`,'%m/%d/%Y')
from layoffs_no_duplicates;

update layoffs_no_duplicates
set `date` = str_to_date(`date`,'%m/%d/%Y');

alter table layoffs_no_duplicates
modify column `date` Date;
