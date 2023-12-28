WITH source AS (
    SELECT * FROM {{source('thehangerdb', 'routecolors')}}
),

staged AS (

    SELECT route_color_id,
        route_color
    FROM source
)

SELECT * FROM staged
