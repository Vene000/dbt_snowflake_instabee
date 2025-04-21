{% macro generate_surrogate_key(field_list) %}
    {# Standard implementation matching dbt-utils #}
    {% set fields = [] %}
    {% for field in field_list %}
        {% set _ = fields.append(
            "coalesce(cast(" ~ field ~ " as " ~ dbt.type_string() ~ "), '')"
        ) %}
    {% endfor %}
    {{ return("md5(concat(" ~ fields|join(', ') ~ "))") }}
{% endmacro %}