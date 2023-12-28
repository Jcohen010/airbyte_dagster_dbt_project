
WITH source AS (
    SELECT * FROM {{source('thehangerdb', 'members')}}
),

staged AS (

    SELECT member_id,
        member_first_name,
        member_last_name,
        member_first_name || ' ' || member_last_name AS member_full_name,
        member_gender,
        member_age,
        member_email,
        member_phone,
        member_joined_datetime,
        member_type,
        member_status
    FROM source
)

SELECT * FROM staged
