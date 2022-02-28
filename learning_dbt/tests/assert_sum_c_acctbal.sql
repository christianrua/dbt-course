select 
    sum(c_acctbal) as sum_c_acctbal
from {{ ref('playing_with_test') }}     
having sum(c_acctbal) < 100000000