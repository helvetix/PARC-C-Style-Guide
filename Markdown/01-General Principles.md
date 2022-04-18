# General Principles
## Standards

All code should use follow the C99 standard and use C99 (ISO/IEC 9899:1999) features.

## Naming

Use clear, direct, and descriptive names. It’s worth the time to choose a good name as it is part of vocabulary necessary to express what the software is doing. For example, PARCBuffer is a good, descriptive name. Shortening this to something like `PBuf` loses all descriptive value.

Pro-tip! If you have to explain the name, it’s a bad name.

### Naming as an Alternative to Commenting

Often the choice of a good name makes code clearer and obviates the need to
write ancillary comments.

### Do Not Grunt and Point

Never invent spellings of normal words by dropping letters or making
abbreviations unless those names are part of the extant vocabulary.
For example, if you must have a variable name that points to a C-string,
use a name that describes what it contains, or what it represents: `userName`
is much more descriptive than `str` or `strng`.

### Avoid Too Much Information

Do not include unnecessary or over-specific information in a name about its
implementation or type, unless these are inexorable defining characteristics of the name.
For example, focus on naming a function based on what it does, not how it does it.
Similarly, name a variable or constant based on what it represents, not how it is represented.

Sometimes, how it is represented is, in fact, important.
For example, `uint32_t` is expressing an unsigned integer of 32 bits which is
the defining characteristic of the name.
But the function name `uint32_t PARCBuffer_GetUint32Position()`
includes unnecessary information about the return type and should be
renamed to indicate the utility of the return value rather than its type.

### Use CamelCase Naming
Use ”CamelCase” naming for composite names.

PARC has been a source of several different naming conventions,
arguably as the result of a lack of type checking by compilers and
interpreters and the checking left to the eye of the beholder.
Overtime, modern languages offer sophisticated type checking and the modern
C compiler is no exception.
So there is no need for 'Hungarian Notation,'
or 'Type Last' styles of naming both of which make refactoring code more difficult.

The `Naming Conventions in C Programs` document offers a detailed description
of the use of CamelCase in naming namespaces, files, functions, and constants.
Generally, CamelCase should be used in lieu of underscores as shown below:

| Good           | Not So Good     |
| -------------- |:----------------|
| `bufferLength` | `buffer_length` |
| `PARCBuffer`   | `PARC_buffer`   |

### Do Not Be Vague

Avoid vague names like `handle` or `manager`.
Or, even worse, names like `foo`, `bar` or `junk`.
Instead try to use words that indicate some meaningful representation,
or action with a result or resolution.

### Do Not Use Preprocessor Macros To Remove Code

Almost as confusing as using a block comment to comment-out code, is to
surround code with C preprocessor macros to remove the code from the compilation
unit.
Unless that code is explicitly meant to be optional and is accompanied by a clear preprocessor conditional.
