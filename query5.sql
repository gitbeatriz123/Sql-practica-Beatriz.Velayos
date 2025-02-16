with ivr_steps_identified as (
    select 
        ivr_id,
        document_identification,
        document_type,
        row_number() over (partition by ivr_id order by step_sequence) as rn
    from ivr_steps
    where document_identification is not null and document_type is not null
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
    coalesce(ivr_steps_identified.document_identification, 'unknown') as document_identification,
    coalesce(ivr_steps_identified.document_type, 'unknown') as document_type
from ivr_calls
left join ivr_steps_identified
    on ivr_calls.ivr_id = ivr_steps_identified.ivr_id
    and ivr_steps_identified.rn = 1;
