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
    case 
        when module_aggregation like '%AVERIA_MASIVA%' then 1
        else 0
    end as masiva_lg
from 
    ivr_calls;
