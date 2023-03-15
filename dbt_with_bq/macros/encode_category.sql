{# This Macro encode the categorical column to numeric #}

{% macro encode_payment(payment_type) -%}
    case {{ payment_type }}
        when "Cash" then '1'
        when "Credit Card" then  '2'
        when "Dispute" then  '3'
        when "Mobile" then '4'
        when "No charge" then '5'
        when "Pcard" then '6'
        when "Prcard" then '7' 
        when "Prepaid" then '8'
        when "Unknown" then '9'
        when "Way2ride" then '10'
    end
{%- endmacro %}