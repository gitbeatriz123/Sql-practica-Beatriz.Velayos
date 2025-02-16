select 
    ivr_calls.ivr_id,
    case 
        when ivr_steps.step_name = 'CUSTOMERINFOBYPHONE.TX' and ivr_steps.step_result = 'OK' then 1
        else 0
    end as info_by_phone_lg
from 
    ivr_calls
left join  
    ivr_steps on ivr_calls.ivr_id = ivr_steps.ivr_id;
