select
    calls_ivr_id,
    vdn_label,
    case
        when vdn_label like 'ATC%' then 'FRONT'
        when vdn_label like 'TECH%' then 'TECH'
        when vdn_label = 'ABSORPTION' then 'ABSORPTION'
        else 'RESTO'
    end as vdn_aggregation
from
    keepcoding.ivr_calls calls
