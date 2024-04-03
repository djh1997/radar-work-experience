### Counting

Counting in binary can seem a bit daunting but it's not really any different to normal decimal counting.
When you were first learning numbers you'd have been taught about the unit's ten's hundred's columns system.

| Hundred's | Ten's | Unit's |
| --------- | ----- | ------ |
| 1         | 0     | 5      |

Binary is basically the same, but instead of have multiple options (0 up to 9 in decimal) it only has 2, so each column is basically a tick box for it's value.
The values go up in powers of 2 e.g. 1,2,4,8,16,32,64,128,256,1024,2048...

To convert a number from decimal to binary you can:

- Pick the biggest power of 2 that is less than or equal to the number you're converting and put a 1 in that column.
- Then take that number away from your original, for example 105-64=41.
- Repeat this until you reach 0.

41-32=9
9-8=1
1-1=0

| Decimal | 128's | 64's | 32's | 16's | 8's | 4's | 2's | 1's |
| ------- | ----- | ---- | ---- | ---- | --- | --- | --- | --- |
| 105     | 0     | 1    | 1    | 0    | 1   | 0   | 0   | 1   |

If you add up the values with 1 in their column 1+8+32+64 you get 105.
Now try converting:

| Decimal  | 128's                   | 64's                    | 32's                    | 16's                    | 8's                     | 4's                     | 2's                     | 1's                     |
| -------- | ----------------------- | ----------------------- | ----------------------- | ----------------------- | ----------------------- | ----------------------- | ----------------------- | ----------------------- |
| 97       | <input type="checkbox"> | <input type="checkbox"> | <input type="checkbox"> | <input type="checkbox"> | <input type="checkbox"> | <input type="checkbox"> | <input type="checkbox"> | <input type="checkbox"> |
| <input > | 1                       | 0                       | 0                       | 1                       | 1                       | 0                       | 1                       | 1                       |
