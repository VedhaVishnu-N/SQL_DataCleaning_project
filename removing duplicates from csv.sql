select * 
from layoffs;

create Table Layoffs_staging like layoffs;

select *
from Layoffs_staging;

insert Layoffs_staging
select *
from layoffs;

-- removing duplicates
with duplicates_cte as(
	select *,
    row_number() over(partition by company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) as row_num
    from layoffs
)
select *
from duplicates_cte
where row_num > 1;


CREATE TABLE `layoffs_no_duplicates` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

select *
from layoffs_no_duplicates;

insert layoffs_no_duplicates
select *,
    row_number() over(partition by company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) as row_num
    from layoffs;
    
DELETE
from layoffs_no_duplicates
where row_num > 1;


select *
from layoffs_no_duplicates
where row_num = 1;

alter table layoffs_no_duplicates drop row_num;

select *
from layoffs_no_duplicates;