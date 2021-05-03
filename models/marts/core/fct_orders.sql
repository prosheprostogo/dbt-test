
{{ config(
    materialized = "table"
)}}

orders as (
    select * from {{ ref ('stg_orders') }}
),

payment as (
    select * from {{ ref ('stg_payments') }}
),

fact_orders as (

    select
        orders.order_id,
        orders.customer_id,
        payment.amount

    from orders

    left join payment using (order_id)

)

select * from fact_orders