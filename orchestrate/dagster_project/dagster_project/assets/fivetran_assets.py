from dagster import EnvVar, with_resources
from dagster_fivetran import load_assets_from_fivetran_instance, FivetranResource

FIVETRAN_API_KEY='tZTKMSSWNR8qYOYS'
FIVETRAN_API_SECRET='An4QGp3Nu62kzhiC51iMkH9BSb4qKhRo'

# Pull API key and secret from environment variables
fivetran_instance = FivetranResource(
    api_key=FIVETRAN_API_KEY,
    api_secret=FIVETRAN_API_SECRET,
)

fivetran_assets = load_assets_from_fivetran_instance(fivetran_instance)