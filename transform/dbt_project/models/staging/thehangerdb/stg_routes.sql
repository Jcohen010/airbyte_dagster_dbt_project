WITH source AS (
    SELECT * FROM {{source('thehangerdb', 'routes')}}
),

staged AS (

    SELECT route_id,
        gym_quadrant,
        route_color,
        route_grade_id
    FROM source
)

SELECT * FROM staged
