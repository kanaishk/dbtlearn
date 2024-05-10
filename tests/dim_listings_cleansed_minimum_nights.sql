with dim_listing_cleansed as (
	select * from {{ ref('dim_listings_cleansed') }}
)
select listing_id,
	minimum_nights
from 
	dim_listing_cleansed
where 
	minimum_nights::number <= 0
limit 10