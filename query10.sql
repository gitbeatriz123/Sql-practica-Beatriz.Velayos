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
        when ivr_steps.step_name = 'CUSTOMERINFOBYDNI.TX' and ivr_steps.step_result = 'OK' then 1
        else 0
    end as info_by_dni_lg
from 
    ivr_calls
left join 
    ivr_steps on ivr_calls.ivr_id = ivr_steps.ivr_id;
