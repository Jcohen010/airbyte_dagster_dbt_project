# Overview
This is a personal project to demonstrate the development of a full stack data infrastructure for the fictional commercial rock climbing chain "The Hanger", utilizing several open-source (OSS) tools.

This project can be carried out by anyone searching for a way to get their feet wet with emerging technologies in the data world for...wait for it...COMPLETELY FREE. Each of the tools used either have a free trial (which permits users to access all features of the product within the trial period), or is OSS. I hope it can act fun and intuitive way to learn and get comfortable with core data engineering principles. 

## Project Outline
### Prep
Before getting to the good stuff, we have to provision and configure the cloud resources to host the OLTP database as well as the OLAP datawarehouse for our fictional rock climbing gym business. 
#### OLTP Database
We're going to set up an EC2 server on AWS using an AMI (AMI ID = ami-0d9f3eba66e776ff0) for our operational database for The Hanger. 

In the EC2 configuration, search for the AMI using the ID above. 

Then, once the instance is deployed, connect in and follow [this](https://cloudinfrastructureservices.co.uk/how-to-setup-install-postgresql-server-on-azure-aws-gcp) *awesome* guide to configure the PostgreSQL server within the instance and set up pgadmin.

***NOTE:*** In step labeled "Create a database and user roles", use this sql instead.

```sql
CREATE DATABASE thehangerdb;

CREATE USER extraction WITH ENCRYPTED PASSWORD 'MyStr0ngP@SS';

ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON TABLES TO extraction;
```


#### OLAP Datawarehouse
For the datawarehouse, we're going with Snowflake. Go [here](https://signup.snowflake.com/?utm_cta=trial-en-www-homepage-top-right-nav-ss-evg&_ga=2.74406678.547897382.1657561304-1006975775.1656432605&_gac=1.254279162.1656541671.Cj0KCQjw8O-VBhCpARIsACMvVLPE7vSFoPt6gqlowxPDlHT6waZ2_Kd3-4926XLVs0QvlzvTvIKg7pgaAqd2EALw_wcB) and create a free account (good for 30 days).

### Data Platform

#### EL

#### T

#### Orchestration

#### Analytics



