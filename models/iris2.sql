with t as (
  select
    *,
  from
    {{ ref('iris1') }}
)
select
  petal_width + 10 as petal_width10,
  petal_length + 10 as petal_lenth10,
  sepal_width + 10 as sepal_width10,
  sepal_length + 10 as sepal_length10,
  species,
from
  t
