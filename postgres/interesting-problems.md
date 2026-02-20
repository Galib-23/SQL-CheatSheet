# 610. Triangle Judgement

```sql
SELECT *,
  CASE 
    WHEN x + y > z AND y + z > x AND x + z > y THEN 'Yes'
    ELSE 'No'
  END AS triangle
FROM Triangle;
```

**Q: Example?**

Input:
| x  | y  | z  |
|----|----|----|
| 13 | 15 | 30 |
| 10 | 20 | 15 |

Output:
| x  | y  | z  | triangle |
|----|----|----|----------|
| 13 | 15 | 30 | No       |
| 10 | 20 | 15 | Yes      |

`13+15=28` which is not `> 30` → No. `10+15=25 > 20`, `20+15=35 > 10`, `10+20=30 > 15` → Yes.
<br>

# 627. Swap Sex of Employees

**task**  
Swap all `'m'` ↔ `'f'` values in the `sex` column using a single `UPDATE` statement.

**Q: What's the SQL solution?**
```sql
UPDATE Salary
SET sex = 
  CASE
    WHEN sex = 'm' THEN 'f'
    ELSE 'm'
  END;
```

**Q: Example?**

Input:
| id | name | sex | salary |
|----|------|-----|--------|
| 1  | A    | m   | 2500   |
| 2  | B    | f   | 1500   |
| 3  | C    | m   | 5500   |
| 4  | D    | f   | 500    |

Output:
| id | name | sex | salary |
|----|------|-----|--------|
| 1  | A    | f   | 2500   |
| 2  | B    | m   | 1500   |
| 3  | C    | f   | 5500   |
| 4  | D    | m   | 500    |

<br>

# You can group by 1 or more fields:
```sql
select actor_id, director_id
from ActorDirector
group by (actor_id, director_id)
having count(*) >= 3;
```