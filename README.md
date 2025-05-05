# Example Data Warehouse for On-Premise Environment with Clickhouse and dbt

A lightweight, local data warehouse implementation for development and testing purposes.

## Overview

This project provides a lightweight, containerized data warehouse environment using ClickHouse as the database engine and dbt for data transformations. It's designed for developers and data engineers who need a local development environment that mimics production data warehousing capabilities without the overhead of cloud infrastructure.

The local-dwh creates a fully functional data pipeline environment where you can:
- Test ETL processes
- Develop and validate dbt models
- Benchmark query performance
- Prototype data workflows
- Practice data warehouse concepts

All components run in Docker containers for easy setup and teardown, making it ideal for development, testing, and educational purposes.

## Prerequisites

- Docker and Docker Compose
- uv
- make

## Components
- **ClickHouse**: Open-source column-oriented DBMS for online analytical processing (OLAP)
- **dbt (data build tool)**: Transformation framework that enables analytics engineers to transform data in their warehouse using SQL
- **Docker**: Containerization platform used to run all services in isolated environments
- **Seed Data Scripts**: Utilities to populate the warehouse with sample data (IMDb) for testing
- **Python Environment**: Managed with uv for dependency management

## Installation

```bash
# Clone the repository
git clone https://github.com/cafeal/local-dwh-clickhouse-dbt.git
cd local-dwh-clickhouse-dbt

# Start the containers
cd clickhouse
docker compose up -d

# Seed data
cd ../scripts/seed_data
make

# Install deps and activate
cd ..
uv sync --frozen
source ./.venv/bin/activate

# Run dbt
cd dbt_ch
dbt build
```
