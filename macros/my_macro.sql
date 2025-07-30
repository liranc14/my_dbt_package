{% macro null_column(name) %}

    null as {{name}}

{% endmacro %}



{% macro date_formatter(col) %}
    coalesce(
        try_to_date({{ col }}, 'YYYY-MM-DD'),
        try_to_date({{ col }}, 'MM/DD/YYYY'),
        try_to_date({{ col }}, 'DD-MM-YYYY')
    )
{% endmacro %}