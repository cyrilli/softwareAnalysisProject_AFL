# buggy-regexp1.c
I removed
```
if (re[0] == '\0')
    return 0;
```
in `matchhere` to introduce a bug.

# buggy-regexp2.c
removed `re[0] == '.' || ` on line 32 for the bug.