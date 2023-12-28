WITH source AS (
    SELECT * FROM {{source('thehangerdb', 'addressstati')}}
),

staged AS (

    SELECT address_status_id,
        address_status
    FROM source
)

SELECT * FROM staged
