# Statements
Make your statements clear and distinct.
Do not become a contender for the Obfuscated C Code Contest.

#### Avoid the comma operator
The comma operator often camouflages clear intent from the human eye.

#### One Statement Per Line
Each line should only contain one statement.

For example:
```c
{
    argv++;
    argc--;
}
```

Not:

```c
{
    argv++; argc--; // Bad
}
```

## Statement Blocks
A statement block is a list of statements enclosed in braces.

The enclosed statements must be indented one more level than the enclosing compound statement.
The opening brace is at the end of the line that begins the statement block;
the closing brace begins a line and is indented to same level as the brace beginning the statement block.

For example:

```c
{
    for (int i = 0; i < 10; i++) {
        ...
    }

    {
        // A statement block.
        ...
    }
}
```

## Conditionals

### Do not substitute logical values for integer values

Many times functions will be defined as returning `int`
and yet overload a return value with `NULL` or zero to indicate a failure.
Do not conflate the value zero or `NULL` with false in a conditional.
Be explicit about the value.

For example, this:
```c
    if (strcmp(stringA, stringB) == 0) {
        printf("Equal!\n");
    }
```

Not this:

```c
    if (!strcmp(stringA, stringB)) {
        printf("Equal!\n");
    }
```

## Goto Statements

Typically a `goto` statement is used to impose structure on code at runtime,
rather than addressing structure through design.

Instead, invest the time in designing the code to avoid jumping around.

## If Statements
The if-else class of statements has the following form:

```c
    if (condition) {
        ..
    }

    if (condition) {
        ...
    } else {
        ...
    }

    if (condition) {
        ...
    } else if condition) {
        ...
    } else {
        ...
    }
```

If statements should never be of the error-prone form:
```c
    if (condition)
        ...;
```

#### Avoid writing if statements that are long.
If you must write a long `if` statement,
organize the line wrapping to illustrate groups of like terms.
Indent the lines two levels of indentation to avoid making them look like the
body of the if statement.

For example, the indentation below inappropriately requires the reader to properly parse the
grouping visually:
```c
    if ((condition1 && condition2)
        || (condition3 && condition4)
        ||!(condition5 && condition6)) {
        doSomethingAboutIt();
    }
```

Instead use a format like this:
```c
    if ((condition1 && condition2)
            || (condition3 && condition4)
            || !(condition5 && condition6)) {
        doSomethingAboutIt();
    }
```

#### Never Use Side-effects in Logical Operators
It is best to not rely on side-effects as the result of a logical operation.
In addition to detracting from clarity, the right-hand side of the  `&&` and
`||` operators are not evaluated if the left-hand
side is sufficient to determine the logical value,
therefore, the side-effects may not even be what you expect.

## For Statements
A ``for`` statement has the following form:

```c
    for (initialization; condition; update) {
        ...
    }
```

An empty `for` statement
(one in which all the work is done in the initialization, condition, and update clauses)
has the following form:

```c
    for (initialization; condition; update) {
        // empty
    }
```

Avoid using the comma operator within the update clause of a `for` statement.

```c
    for (int i = 0; i < 10; i++, p++) {
        // empty
    }
```

Be clear and make it the body of the `for` statement:

```c
    for (int i = 0; i < 10; i++) {
        p++;
    }

```

### For Loop Iterator Variable

If a `for` loop iterator has no scope outside of the `for` loop,
declare the variable in the `for` loop initializer.

```c
	for (int i = 10; i > 0; i--) {
	  	...
	}
```

## While Statements

A while statement has the following form:

```c
    while (condition) {
        ...
    }
```

An empty while statement has the following form:

```c
    while (condition) {
        // empty
    }
```

## Do Statements

A do-while statement has the following form:

```c
    do {
        ...
    } while (condition);
```

## Switch Statements
A switch statement has the following form:

```c
    switch (condition) {
        case ABC:
            ...
            // falls through

        case EF:
            ...
            break;

        case XYZ: {
            ...
            break;
        }

        default:
            ...
            break;
    }
```

Every time a case falls through (i.e. it doesn't include a break statement),
add a comment where the `break` statement would normally be to show the intent
and not that you just forgot the `break` statement.
This is shown in the preceding code example with the `// falls through` comment.

Every switch statement must include a default case.
The break in the example `default:` case is redundant as it is the
last case in the `switch` statement,
but it prevents a fall-through error if another case is added later.

## Return Statements

A return statement with a value should not use parentheses
unless they are necessary for proper evaluation,
or make the return value more obvious and distinct.

For example:

```c
    return;

    return result;

    return (size + 2) / 3;
```
## Ternary Statements

#### Don't nest ternary statements.
Keep ternary statements simple and don't them as substitutes
for nested if-else statements.

#### Formatting Ternary Expressions
For ternary expressions that cannot fit on one line,
break before the `?` and `:` operators.

```c
    alpha = (aLongBooleanExpression) ? beta : gamma;

    alpha = (aLongBooleanExpression) ? beta
                  : gamma;

    alpha = (aLongBooleanExpression)
          ? beta
          : gamma;
```
# Variables

#### Variable Names Are Nouns
Variable name should be nouns.

#### One Declaration Per Line
There is one constant or variable declaration per line.

#### Always Initialize Variables
Variables and constants should be initialized in their declarations as in:

```c
    char *p = "Hello World";
```

#### Avoid Floating Point Arithmetic
If at all possible, avoid using floating point arithmetic, particularly in loops or where precision is necessary.

#### Do Not Use Float Type
Use the double type instead.

## Declare Variables At First Use
Avoid C89 variable declarations,
and simply declare variables as close as possible to where they are used.
This saves the reader from having to remember the declaration of a variable
prior to its use.
For example, avoid this style of declaring variables:

```c
{
    int i;
	  char *p;
	  bool done;

	  for (i = 10; i > 0; i--) {
		    ...
	  }

	  p = NULL;

	  done = true;
}
```

Instead, reformat to declare the variables where they are used:

```c
{
	  for (int i = 10; i > 0; i--) {
		    ...
	}

	char *p = NULL;

	bool done = true;
}
```

### Set Array Size At Runtime
Avoid allocating memory and use the C99 dynamic array allocation where possible.

For example:

```c
    int size = atoi("10");
    char array[size];

```

Instead of the archaic method:

```c
    int size = atoi("10");
    char *array = calloc(sizeof(char), size);
    ...
    free(array);
```

