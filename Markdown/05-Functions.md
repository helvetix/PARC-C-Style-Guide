# Functions

#### Deprecate old functions
Do not keep old functions forever. If they are replaced by better functions, mark them deprecated and plan for their eventual removal.

#### Do not use deprecated functions
Similarly, do not write code that you know will need to be fixed later.
Do not use deprecated functions.
If you use a deprecated function, you are guaranteeing future work.

## Function Formatting
A C function is defined according to this pattern:
```c
Type
functionName(parameters...)
{
    ...
}
```
Note that the style for braces is different than the prescribed style of braces everywhere else.

## Braces
Braces follow the Kernighan and Ritchie style (”Egyptian brackets”) for nonempty blocks and block-like constructs:
* No line break before the opening brace, except for function definitions which must have a line break before the opening brace.
* One line break after an opening brace.
* One line break before a closing brace.
* One line break after the closing brace if that brace terminates a statement or the body of a function. For example, there is no line break after the brace if it is followed by else or a comma.

For example:
```c
void
function(void) {
    if (condition()) {
        something();
    } else if (condition()) {
        something();
   }
}
```

#### Braces are Never Optional

Braces are always used with `if`, `else`, `for`, `do` and `while` statements,
even when the body is empty or contains only a single statement.

## White Space
Horizontal and vertical white space are used as visual clues to help group related information.
The uniform use of white space, helps the reader to quickly identify the information needed, just as with spaces between printed words, an extra space after a period, blank lines between paragraphs, or indentation to signal the start of a new paragraph, a uniform use of white space.


### Horizontal White Space
#### Tap Stop is 4 Spaces
Indentation is a multiple of 4 spaces.

#### Do Not Use The Tab Character
Raw tab characters in the source files make the source code difficult to read because different programs treat the tabs differently. As a result the same code can look very different depending on whether it’s printed or displayed.

#### Line Length
Lines are no longer than 132 characters.
Line lengths of 80 characters date back to the era of punched cards. Today we have high
resolution graphical displays and Integrated Development Environments that annotate and color code, support selectable fonts, and pop-up images to describe a function call’s signature or documentation.
Line lengths of 132 characters is just as arbitrary,
but this is better than a punched card.

#### Wrapping Lines
When an expression will not fit on a single line, break it at the highest syntactic level possible:
1. Break after a comma.
2. Break before an operator.
3. Align the new line with the beginning of the expression at the same level on the previous line.

#### Indenting Function Calls

Here are some examples of breaking lines function calls:

```c
    function(longExpression1, longExpression2, longExpression3,
             longExpression4, longExpression5);

    var = function(longExpression1,
                   function2(longExpression2, longExpression3));

    longName1 = longName2 * (longName3 + longName4 - longName5)
            + 4 * longname6;
```

Breaking within a syntactic group requires the reader to stop, mentally regroup,
and proceed with visual parsing.

#### Indenting Arithmetic Expressions
Break outside parenthesized expressions, keeping terms and sub-terms together.

```c
    longName1 = longName2 * (longName3 + longName4
                       - longName5) + 4 * longname6; // Bad

    longName1 = longName2
                * (longName3 + longName4 - longName5)
                + 4 * longname6; // Better
```

#### Indenting Function Declarations

A function definition that cannot fit on one line can break a line following a comma:
```c
int
function(int anArg, int anotherArg, int yetAnotherArg,
         int andStillAnother)
{
     ...
}
```

```c
static const long
veryLongFunctionName(int anArg,
                     int anotherArg,
                     int yetAnotherArg,
                     int andStillAnother)
{
    ...
}
```

For functions that require many arguments (which begs design questions and doubts)
another technique is to put each parameter on a single line, indenting to the
level of the opening parenthesis.

#### Use Columns in initialization Blocks
Lines that are columnar in nature
(highly encouraged for an array initializer, for example)
and are aligned vertically,
should be indented or aligned on columns that are multiples of 4.

#### Single Spaces
A single space is used in the following circumstances:

1. A keyword followed by a parenthesis is separated by a space (See the description of `return` for exceptions).
For example:
```c
    while (true) {
        ...
    }
```

Note that a blank space is not used between a function name and its opening parenthesis. This distinguishes keywords from function calls.

2. After commas in argument lists.

3. Between binary operators
All binary operators are separated from their operands by spaces.
Blank spaces never separate unary operators such as unary minus, increment (‘`++`‘), and decrement (`--`) from their operands.

```c
    a += c + d;
    a = (a + b) / (c * d);

    while (d++ = s++) {
        n++;
    }
}
```

4. The expressions in a for statement are separated by single blank spaces. For example:

5. Casts are followed by a blank space. For example:
```c
    functionA((char) aNum, (int) buffer);

    functionB((int) (cp + 5), ((int) (i + 3)) + 1);
```

### Vertical White Space
Blank lines improve readability by setting off sections of code that are logically related.
One blank line is always be used in the following circumstances:
1. Between function definitions.
2. Before a block or single-line comment.
3. Between logical sections inside a function to improve readability.
