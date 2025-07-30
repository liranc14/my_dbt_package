{% materialization temp_table, adapter='snowflake' %}
  {%- set identifier = model['alias'] -%}
  {% set sql %}
    create or replace temporary table {{ this }} as (
      {{ compiled_code }}
    )
  {% endset %}

  {% call statement('main', fetch_result=True) %}
    {{ sql }}
  {% endcall %}

  {{ return({'relations': [this]}) }}
{% endmaterialization %}
