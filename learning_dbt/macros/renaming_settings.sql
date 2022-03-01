{% macro rename_segments(column_name) %}
    CASE
        WHEN {{column_name}} in ('BUILDING','HOUSEHOLD','FURNITURE')
            THEN 'segment_1'
        else 'segment_2'   
    END     
{% endmacro %}    
