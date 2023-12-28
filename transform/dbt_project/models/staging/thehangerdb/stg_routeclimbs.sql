WITH source AS (
    SELECT * FROM {{source('thehangerdb', 'routeclimbs')}}
),

staged AS (

    SELECT route_climb_id,
        route_id,
        member_id,
        route_climb_start_datetime,
        route_climb_end_datetime,
        route_climb_rating
    FROM source
)

SELECT * FROM staged
