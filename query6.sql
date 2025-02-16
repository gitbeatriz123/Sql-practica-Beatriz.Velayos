with customer_identification as (
    select 
        ivr_id,
        customer_phone
    from 
        ivr_steps
    where
        customer_phone is not null
    group by 
        ivr_id, customer_phone
)
select 
    ivr_calls.ivr_id,
    ivr_calls.phone_number,
    ivr_calls.ivr_result,
    ivr_calls.vdn_label,
    ivr_calls.start_date,
    ivr_calls.end_date,
    ivr_calls.total_duration,
    ivr_calls.customer_segment,
    ivr_calls.ivr_language,
    ivr_calls.steps_module,
    ivr_calls.module_aggregation,
    ci.customer_phone
from 
    ivr_calls
left join 
    customer_identification ci
on 
    ivr_calls.ivr_id = ci.ivr_id;
