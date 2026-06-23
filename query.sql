with
  combined_training_ranges as (
    select teacher_id, range_agg(tp.range) as combined_training 
    from training_periods tp
    group by teacher_id
  ),
  combined_holiday_ranges as (
    select teacher_id, range_agg(h.range) as combined_holidays
    from holidays h
    group by teacher_id
  ),
  combined_all_ranges as (
    select t.name, ctr.combined_training, chr.combined_holidays
    from teachers t
    inner join combined_training_ranges ctr on t.id = ctr.teacher_id
    left outer join combined_holiday_ranges chr on t.id = chr.teacher_id
  )
select
  *,
  (combined_training * combined_holidays) as training_and_holiday_overlap
from combined_all_ranges;
