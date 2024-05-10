with dim_listings_cleansed as (
	select * from {{ ref('dim_listings_cleansed') }}
),
fct_reviews as (
	select * from {{ ref('fct_reviews') }}
)
select 
	review.listing_id,
	review.review_date,
	listing.created_at
from 
	fct_reviews review
left join
	dim_listings_cleansed listing
on 
	review.listing_id = listing.listing_id
where 
	review.review_date <= listing.created_at
limit 10