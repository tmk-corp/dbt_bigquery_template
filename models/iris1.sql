select
  sepal_length,
  sepal_width,
  petal_length,
  petal_width,
  species,
from
  {{ source('r_dataset', 'iris') }}
