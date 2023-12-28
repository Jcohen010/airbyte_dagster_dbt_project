WITH source AS (
    SELECT * FROM {{source('thehangerdb', 'memberstatustypes')}}
),

staged AS (

    SELECT member_status_type_id,
        member_status_type
    FROM source
)

SELECT * FROM staged
