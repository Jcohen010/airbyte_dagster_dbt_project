WITH source AS (
    SELECT * FROM {{source('thehangerdb', 'climbingsessions')}}
),

staged AS (

    SELECT climbing_session_id,
        member_id,
        scan_in_datetime,
        scan_out_datetime
    FROM source
)

SELECT * FROM staged
