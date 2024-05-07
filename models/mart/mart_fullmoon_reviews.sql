{{
	config(
		materialized = 'table'
	)
}}
with fct_reviews as (
	select * from {{ ref('fct_reviews') }}
),
fullmoon_dates as (
	select * from {{ ref('seed_full_moon_dates') }}
)
select
	review.*,
	case 
		when fullmoon.full_moon_date is null then 'Not Full Moon'
		else 'Full Moon'
	end as is_full_moon
from 
	fct_reviews review
left join
	fullmoon_dates fullmoon
on (TO_DATE(review.review_date) = DATEADD(DAY, 1, fullmoon.full_moon_date))