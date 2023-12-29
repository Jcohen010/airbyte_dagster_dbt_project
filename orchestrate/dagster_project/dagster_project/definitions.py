import os

from dagster import Definitions, AssetOut, define_asset_job, AssetSelection, DefaultScheduleStatus, OpExecutionContext, ScheduleDefinition, ConfigurableResource, multi_asset
from dagster_dbt import DbtCliResource
from dagster_meltano import meltano_resource, meltano_run_op, load_jobs_from_meltano_project

from .assets import dbt_project_dbt_assets, routes
from .constants import dbt_project_dir
from .schedules import schedules

meltano_jobs = load_jobs_from_meltano_project("/Users/justincohen/documents/personal_projects/data_engineering_project")

defs = Definitions(
    assets=[dbt_project_dbt_assets],
    schedules=schedules,
    resources={
        "dbt": DbtCliResource(project_dir=os.fspath(dbt_project_dir)),
    },
    jobs=meltano_jobs
)


