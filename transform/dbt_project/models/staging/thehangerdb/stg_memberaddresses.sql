WITH source AS (
    SELECT * FROM {{source('thehangerdb', 'memberaddresses')}}
),

staged AS (

    SELECT member_id,
        address,
        state,
        postal_code,
        city,
        country,
        address_status
    FROM source
)

SELECT * FROM staged
