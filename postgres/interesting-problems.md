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