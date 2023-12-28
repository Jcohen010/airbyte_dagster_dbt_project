WITH source AS (
    SELECT * FROM {{source('thehangerdb', 'membertypes')}}
),

staged AS (

    SELECT member_type_id,
        member_type
    FROM source
)

SELECT * FROM staged
