WITH source AS (
    SELECT * FROM {{source('thehangerdb', 'climbinggrades')}}
),

staged AS (

    SELECT climbing_grade_id,
        climbing_grade
    FROM source
)

SELECT * FROM staged
