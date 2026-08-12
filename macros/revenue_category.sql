{% macro revenue_category(total_revenue) %}
case when total_revenue = 0 then 'No revenue'
when total_revenue<50 then 'Low revenue'
when total_revenue between 50 and 200 then 'Medium revenue'
else 'high revenue'
end


{% endmacro%}
