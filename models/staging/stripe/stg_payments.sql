with payment as (

    select
        orderid as order_id,
        status,
        amount,
        created as created_at
    from dbt-tutorial.stripe.payment

)

select * from payment