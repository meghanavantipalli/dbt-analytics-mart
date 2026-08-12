{% macro customer_segment(tot_amount)%}
case when tot_amount>=10 then 'Premium'
     when tot_amount>=5 then 'gold'
     when tot_amount>=1 then 'silver'
     else 'bronze' end 
{% endmacro %}