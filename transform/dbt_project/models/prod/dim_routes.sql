SELECT route_id,
    gym_quadrant,
    CAST(rcs.route_color AS VARCHAR(10)) AS route_color,
    cg.climbing_grade
FROM {{ref("stg_routes")}} r
JOIN {{ref("stg_climbinggrades")}} cg ON r.route_grade_id = cg.climbing_grade_id
JOIN {{ref("stg_routecolors")}} rcs ON r.route_color = rcs.route_color

