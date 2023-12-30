> [!WARNING]  
> This is a basic development project. While it does employ several best practices, it was not created as a 1:1 model for projects being deplooyed in a production environment.

# Intro
This is a project to demonstrate the development of a small scale data infrastructure, following a layer based methodology that seems to be emerging as a best-practice approach in the industry. This infrastructure will support the fictional commercial rock climbing chain "The Hanger", and will utilize several open-source (OSS) and cloud tools. The project is aimed at those searching for a way to get their feet wet with emerging technologies in the data world. I hope it can act as a fun and intuitive way to learn the tooling and get comfortable with core data engineering principles. 

Let's first go over a few aspects of the project:

## Cost
This project can be completed with paying a penny. Each of the tools utilized has either a free trial option (which permits users to access all features of the product within the trial period), or is OSS. That being said, if, like me, you're poorer than most in computing power (im developing on a measly 2020 MacBook Air) you can choose to cloud host certain resources, such as the PostgreSQL OLTP server.

## Prerequisites
Possessing these prereqs will lead to less friction in building the project, however this project can also act as a way to move towards these experience levels.
- Basic experience with AWS platform
- Intermediate Python Expereince
- Intermediate SQL experience
- Basic experience and understanding of Docker

## Task Management
As I was building this project, I used Notion to keep track of my tasks. I realized it could act as a pretty usefull guide for others carrying out the project, so I publically published the notion page as a static site. Head to [the site](https://sparkly-boat-650.notion.site/The-Hanger-Data-Project-44c06800698b4bedbe9958c1d719de17?pvs=4) and click the copy icon in top right corner to duplicate the page into one of your own notion workspaces (if you don't have an account, you should be prompted to create one first). Then change the status to all of the Epics, Tasks, and Sub-tasks to `Not-Started` and start working! (Ignore, filer out or even, if you want, delete the tasks related to documentation.)

## Concepts Involved
This project employs the following data engineering concepts and principles:
- Version Control
- Continuous Integration & Continuous Delivery/Deployment (CI/CD)
- Dimensional Data Modelling
- ***MORE***

## Teaching Approach
Unlike a lot of other “follow along” data engineering projects, I’m actually going to encourage you not to clone this repo onto your local machine. As this project emphasizes the development process of the infrastructure of a small scale data platform, I wrote the guide in a way that allows you to essentially start from scratch with your own blank project repo and execute the steps I myself followed that ultimately yielded this very repository. Another important note: the guide section below is not a step by step walkthrough; I find that projects that hold your hand throughout the development process greatly limit the value you can get from them. Expect to run into some errors or moments of uncertainty; the extra depth of understanding you will gain about the tools from the act of debugging their issues, consulting their documentation, etc., will be well worth it.

With all that out of the way, let’s get started with the project outline.

---

# Project Outline

`Diagram`


## Storage
### OLTP

### OLAP


## Integration Layer
For the integration layer we are going to utilize a tool called Meltano. While they offer a fully managed *Meltano Cloud* product, we are going to take advantage of the OSS version of the product.

## Transformation Layer
For the transformation layer, we're going with dbt. 


## Orchestration

## Analytics









## Project Guide

> [!NOTE]  
> As mentioned in the introduction, this guide is not a step by step walkthrough. Sections of the project are logically partitioned, and the major tasks and sub-tasks that must be 
> ticked before moving from one section to the next are clearly described.



### Storage
Before getting to the good stuff, we have to provision and configure the cloud resources to host the OLTP database as well as the OLAP datawarehouse for our fictional rock climbing gym business. 

#### OLTP Database
We're going to set up an EC2 server on AWS using a PostgreSQL-specific Amazon Machine Image (AMI), which can be equated to a docker image, for our operational database for The Hanger. 

In the EC2 configuration, search for the AMI using the ID below.
- `ami-0d9f3eba66e776ff0`

Then, once the instance is deployed, connect in and follow [this](https://cloudinfrastructureservices.co.uk/how-to-setup-install-postgresql-server-on-azure-aws-gcp) *awesome* guide to configure the PostgreSQL server within the instance and set up pgadmin.

***NOTE:*** In step labeled "Create a database and user roles", use this sql instead.

```sql
CREATE DATABASE thehangerdb;

CREATE USER extraction WITH ENCRYPTED PASSWORD 'MyStr0ngP@SS';

GRANT USAGE ON SCHEMA public TO extraction;

GRANT SELECT ON ALL TABLES IN SCHEMA public TO extraction;

ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON TABLES TO extraction;
```

While we're in the postgres shell on the EC2 instance, let's configure the settings that will enable us to use CDC as our replication method later on in Airbyte. [This Airbyte docs section](https://docs.airbyte.com/integrations/sources/postgres#setup-using-cdc) will walk you through the process of getting this set up.


#### OLAP Datawarehouse
For the datawarehouse, we're going with Snowflake. Go [here](https://signup.snowflake.com/?utm_cta=trial-en-www-homepage-top-right-nav-ss-evg&_ga=2.74406678.547897382.1657561304-1006975775.1656432605&_gac=1.254279162.1656541671.Cj0KCQjw8O-VBhCpARIsACMvVLPE7vSFoPt6gqlowxPDlHT6waZ2_Kd3-4926XLVs0QvlzvTvIKg7pgaAqd2EALw_wcB) and create a free account (good for 30 days).

### Create Project Repo



### Setting up the Integration Layer 
#### Create Fivetran Account
Head over to [Fivetran](https://fivetran.com/signup) and create an account for a free 14-day trial. 
#### Create Source Connection
#### Create Destination Connection
#### Run Initial Sync

### Setting up the Transformation Layer
#### Install
#### Init
#### Test Connection
#### Re-organize Models folder
#### Build Models

##### override database targets for staging and prod models.

[workshop this] 
The design construction of these models is typically a joint effort between the data team and the stakeholders, so in this case just try and be creative and think of some questions that the fictional stakeholder might want to answer about the gym 
- How many members visit daily weekly etc
- What member has the highest visit rate 
- What route has the highest rating on 


#### Test dbt-run
#### Create Environments/Targets


### Setting up Orchestration
#### Install
#### Init Dagster Project
#### Import dbt models as assets 
#### Import fivetran integrations as assets
#### Create dependency link between fivetran assets and dbt assets
##### Change dbt assets group name
#### Create Job and Schedule of pipeline

### CI/CD
#### SQL Linting
#### Tests

### Setting up Analytics



