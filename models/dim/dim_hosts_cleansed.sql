{{
	config(
		materialized = 'views'
	)
}}
with src_hosts as (
	select * from {{ ref('src_hosts') }}
)
select 
	host_id,
	CASE
		when host_name is not null then host_name
		ELSE NVL(host_name, 'Anonymous')
	end as host_name,
	is_superhost,
	created_at,
	updated_at
from 
	src_hosts;