I introduced a bug by moving
```
if (x == 0)
    return 0;
```
to after
```
else {
        return 1;
    }
```
so the `x==0` branch will never be entered.