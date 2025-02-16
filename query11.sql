with ivr_calls_with_flags as (
    select 
        ivr_id,
        phone_number,
        ivr_result,
        vdn_label,
        start_date,
        end_date,
        total_duration,
        customer_segment,
        ivr_language,
        steps_module,
        module_aggregation,
        case 
            when exists (
                select 1 
                from ivr_calls as ic2 
                where ic2.phone_number = ic1.phone_number 
                and ic2.start_date between ic1.start_date - interval '24 HOURS' and ic1.start_date
                and ic2.ivr_id != ic1.ivr_id
            ) then 1 
            else 0 
        end as repeated_phone_24H,
        case
            when exists (
                select 1 
                from ivr_calls as ic3 
                where ic3.phone_number = ic1.phone_number 
                and ic3.start_date between ic1.start_date and ic1.start_date + interval '24 HOURS'
                and ic3.ivr_id != ic1.ivr_id
            ) then 1 
            else 0 
        end as cause_recall_phone_24H
    from ivr_calls as ic1
)
select * from ivr_calls_with_flags;
