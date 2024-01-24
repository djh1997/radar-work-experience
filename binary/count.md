# binary

## counting

Counting in binary can seem a bit daunting but it not really any different to normal decimal counting.

When you were first learning numbers you'd have been taught about the unit's ten's hundred's columns system.

| hundred's | ten's | unit's |
| --------- | ----- | ------ |
| 1         | 0     | 5      |

Binary is basically the same but instead of have multiple options (0 up to 9 in binary) it on has 2 so each column is basically a tick box for is value.
The values go up in multiples of 2 e.g. 1,2,4,8,16,32,64,128,256,1024,2048...

To convert a number from decimal to binary you can:

- pick the biggest numbers in the table that is smaller than the number your converting and put a 1 in that column.
- then take that number away from your original for example 105-64=41
- repeat this until you reach 0

| 128's | 64's | 32's | 16's | 8's | 4's | 2's | 1's |
| ----- | ---- | ---- | ---- | --- | --- | --- | --- |
| 0     | 1    | 1    | 0    | 1   | 0   | 0   | 1   |

If you add up the values with 1 in there column 1+8+32+64 you get 105

now onto the next lesson.

## Addition

Likely the first way you'd have learnt addition would have been column addition for any non single digit numbers

For example if we wanted to add 105 and 27 we'd end up with a table that looked some thing like this.

|     | hundred's | ten's | unit's |
| --- | --------- | ----- | ------ |
|     | 1         | 0     | 5      |
| +   |           | 2~1~  | 7      |
|     | 1         | 3     | 2      |

in binary where we only have 2 options as 

|     | 128's | 64's | 32's | 16's | 8's | 4's  | 2's  | 1's |
| --- | ----- | ---- | ---- | ---- | --- | ---- | ---- | --- |
|     | 0     | 1    | 1    | 0    | 1   | 0    | 0    | 1   |
|     | 0~1~  | 0~1~ | 0~1~ | 1~1~ | 1   | 0~1~ | 1~1~ | 1   |
|     | 1     | 0    | 0    | 0    | 0   | 1    | 0    | 0   |

As you can see the ripple of carrying the 1 up moves a lot further in binary than it does in decimal.
