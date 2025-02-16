with customer_identification as (
    select
        ivr_id,
        document_identification as billing_account_id
    from 
        ivr_steps
    where 
        document_identification is not null 
        and document_identification != 'unknown'
),
unique_customers as (
    select
        ivr_id,
        min(billing_account_id) as billing_account_id
    from 
        customer_identification
    group by 
        ivr_id
)
select 
    c.ivr_id,
    c.phone_number,
    c.ivr_result,
    c.vdn_label,
    c.start_date,
    c.end_date,
    c.total_duration,
    c.customer_segment,
    c.ivr_language,
    c.steps_module,
    c.module_aggregation,
    u.billing_account_id
from 
    ivr_calls c
left join  
    unique_customers u
on 
    c.ivr_id = u.ivr_id;
