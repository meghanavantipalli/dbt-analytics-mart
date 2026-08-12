{% snapshot subscriptions_snapshot %}
{{
    config(
        target_schema='snapshots',
        unique_key='subscription_id',
        strategy='timestamp',
        updated_at='updated_at'

    )
}}
    select * from {{ source('stash_raw','subscriptions') }}

{% endsnapshot %}
