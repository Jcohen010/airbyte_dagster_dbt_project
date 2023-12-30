from dagster import AssetExecutionContext, asset, define_asset_job, AssetSelection
from dagster_dbt import DbtCliResource, dbt_assets, DagsterDbtTranslator
from typing import Any, Mapping, Optional

from ..constants import dbt_manifest_path

class CustomDagsterDbtTranslator(DagsterDbtTranslator):
    def get_group_name(
        self, dbt_resource_props: Mapping[str, Any]
    ) -> Optional[str]:
        return "snowflake"


@dbt_assets(
    manifest=dbt_manifest_path,
    dagster_dbt_translator=CustomDagsterDbtTranslator(),
)
def dbt_project_dbt_assets(context: AssetExecutionContext, dbt: DbtCliResource):
    yield from dbt.cli(["build"], context=context).stream()

run_pipeline = define_asset_job(
    name="run_pipeline", selection="*"
)

