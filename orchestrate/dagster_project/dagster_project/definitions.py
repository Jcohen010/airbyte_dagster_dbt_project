import os

from dagster import Definitions
from dagster_dbt import DbtCliResource

from .assets.dbt_assets import dbt_project_dbt_assets, run_pipeline
from .assets.fivetran_assets import fivetran_assets
from .constants import dbt_project_dir
# from .schedules import schedules



defs = Definitions(
    assets=[dbt_project_dbt_assets, fivetran_assets],
    resources={
        "dbt": DbtCliResource(project_dir=os.fspath(dbt_project_dir)),
    },
    jobs=[run_pipeline],
    # schedules=schedules
)


