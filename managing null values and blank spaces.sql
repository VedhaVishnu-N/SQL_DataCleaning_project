select * from layoffs_no_duplicates;

select * from layoffs_no_duplicates
where industry is null
or industry ='';

update layoffs_no_duplicates
set industry = null
where industry = '' ;

select t1.company,t2.industry
from layoffs_no_duplicates t1
join layoffs_no_duplicates t2
on t1.company=t2.company
where t1.industry is null 
and t2.industry is not null;

update layoffs_no_duplicates t1
join layoffs_no_duplicates t2
on t1.company=t2.company
set t1.industry = t2.industry
where t1.industry is null
and t2.industry is not null;

select * from layoffs_no_duplicates
where total_laid_off is null
and percentage_laid_off is null;

delete from layoffs_no_duplicates
where total_laid_off is null
and percentage_laid_off is null;