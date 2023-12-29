from dagster import AssetExecutionContext, asset
from dagster_dbt import DbtCliResource, dbt_assets

from .constants import dbt_manifest_path


@asset(compute_kind="python")
def routes(context: AssetExecutionContext) -> None:
    print("hello world")



@dbt_assets(manifest=dbt_manifest_path)
def dbt_project_dbt_assets(context: AssetExecutionContext, dbt: DbtCliResource):
    yield from dbt.cli(["build"], context=context).stream()