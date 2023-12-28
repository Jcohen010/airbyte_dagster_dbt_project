SELECT 
    rc.route_climb_id,
    rc.route_id,
    r.gym_quadrant,
    cg.climbing_grade,
    CAST(rcs.route_color AS VARCHAR(10)) AS route_color,
    rc.member_id,
    m.member_first_name,
    m.member_last_name,
    m.member_gender,
    m.member_age,
    rc.route_climb_start_datetime,
    rc.route_climb_end_datetime,
    rc.route_climb_rating
FROM {{ref("stg_routeclimbs")}} rc
JOIN {{ref("stg_routes")}} r ON rc.route_id = r.route_id
JOIN {{ref("stg_members")}} m ON rc.member_id = m.member_id
JOIN {{ref("stg_climbinggrades")}} cg ON r.route_grade_id = cg.climbing_grade_id
JOIN {{ref("stg_routecolors")}} rcs ON r.route_color = rcs.route_color

