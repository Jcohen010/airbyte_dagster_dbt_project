SELECT cs.climbing_session_id,
    cs.member_id,
    m.member_first_name,
    m.member_last_name,
    m.member_gender,
    m.member_age,
    cs.scan_in_datetime,
    cs.scan_out_datetime

FROM {{ref("stg_climbingsessions")}} cs
JOIN {{ref("stg_members")}} m ON cs.member_id = m.member_id

