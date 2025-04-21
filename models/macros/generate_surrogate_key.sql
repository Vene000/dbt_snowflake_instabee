{% macro generate_surrogate_key(columns) %}
    -- This macro generates a surrogate key by hashing the provided columns
    {% set hash_input = columns | join(', ') %}
    md5({{ hash_input }}) as surrogate_key
{% endmacro %}
