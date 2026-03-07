from datetime import datetime
from airflow import DAG
from airflow.operators.bash import BashOperator

DBT_DIR = "/opt/airflow/Macquarie_university_project1/dbt"
PROFILES_DIR = DBT_DIR

with DAG(
    dag_id="mq_university_dbt_pipeline",
    start_date=datetime(2026, 3, 1),
    schedule="@daily",
    catchup=False,
):
    dbt_build_raw = BashOperator(
        task_id="dbt_build_raw",
        bash_command=f"cd {DBT_DIR} && dbt build --select raw --profiles-dir {PROFILES_DIR}",
    )

    dbt_build_staging = BashOperator(
        task_id="dbt_build_staging",
        bash_command=f"cd {DBT_DIR} && dbt build --select staging --profiles-dir {PROFILES_DIR}",
    )

    dbt_build_raw >> dbt_build_staging