SELECT 
    m.member_id,
    m.member_first_name,
    m.member_last_name,
    ma.address,
    ma.state,
    ma.postal_code,
    ma.city,
    ma.country,
    a.address_status,
    m.member_gender,
    m.member_age,
    m.member_email,
    m.member_phone,
    m.member_joined_datetime,
    mt.member_type,
    mst.member_status_type
FROM {{ref('stg_members')}} m
JOIN {{ref('stg_memberaddresses')}} ma ON m.member_id = ma.member_id
JOIN {{ref('stg_memberstatustypes')}} mst ON m.member_status = mst.member_status_type_id
JOIN {{ref('stg_addressstati')}} a ON a.address_status_id = ma.address_status
JOIN {{ref('stg_membertypes')}} mt ON m.member_type = mt.member_type_id