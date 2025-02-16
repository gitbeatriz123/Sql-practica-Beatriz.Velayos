create schema if not exists keepcoding;

create table keepcoding.ivr_calls (
    calls_ivr_id string,
    calls_phone_number string,
    calls_ivr_result string,
    calls_vdn_label string,
    calls_start_date timestamp,
    calls_start_date_id integer,
    calls_end_date timestamp,
    calls_end_date_id integer,
    calls_total_duration integer,
    calls_customer_segment string,
    calls_ivr_language string,
    calls_steps_module integer,
    calls_module_aggregation string
);

create table keepcoding.ivr_modules (
    ivr_id string,
    module_sequece integer
    module_name string,
    module_duration integer,
    module_result string
);

create table keepcoding.ivr_steps (
    ivr_id string,
    module_sequece integer,
    step_sequence integer,
    step_name string,
    step_result string
    step_description_error string,
    document_type string,
    document_identification string,
    customer_phone string,
    billing_account_id string
);

insert into keepcoding.ivr_calls
select
    ivr_id as calls_ivr_id,
    phone_number as calls_phone_number,
    ivr_result as calls_ivr_result,
    vdn_label as calls_vdn_label,
    timestamp(start_date) as calls_start_date,
    cast(format_timestamp('%Y%m%d', timestamp(start_date)) as integer) as calls_start_date_id,
    timestamp(end_date) as calls_end_date,
    cast(format_Ttimestamp('%Y%m%d', timestamp(end_date)) as integer) as calls_end_date_id,
    total_duration as calls_total_duration,
    customer_segment as calls_customer_segment,
    ivr_language as calls_ivr_language,
    steps_module as calls_steps_module,
    module_aggregation as calls_module_aggregation
from
    `path_to_your_bucket/ivr_calls.csv`;

insert into keepcoding.ivr_modules
select
    ivr_id,
    module_sequece,
    module_name,
    module_duration,
    module_result
from
    `path_to_your_bucket/ivr_modules.csv`;

insert into keepcoding.ivr_steps
select
    ivr_id,
    module_sequece,
    step_sequence,
    step_name,
    step_result,
    step_description_error,
    document_type,
    document_identification,
    customer_phone,
    billing_account_id
from
    `path_to_your_bucket/ivr_steps.csv`;
