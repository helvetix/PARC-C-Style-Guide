# C Header Files
Every C source file has a single
corresponding C header file that defines all of the necessary information to
use the functionality implemented in the C source file.

## C Modules and Types
A module implementing a type, consisting of a C Header file declaring the functions manipulating the type,
and the C Source file implementing those functions has the following naming convention for its file name.
`namespace`\_`Type`.c

The name of the C header file is exactly the same name as the corresponding
C source file, with the suffix `.h` instead of `.c`.

## File Name and Content Coupling

It must be obvious when looking at a function name,
where the declaration and definition of that function name are to be found.
Use prefixes to function names to group them into meaningful collections.

For example the PARC Library uses the prefix `parc` to distinguish the
functions and their source and header files.
The file named `parc_LinkedList.c` is a file in the PARC Library that
implements a linked list.
The names of the global functions in this C source file are prefixed by
`parcLinkedList` (note the absence of the underscore character in the function name).

This enables a reader of any other C source to know that the function
`parcLinkedList_Append` is implemented in `parc_LinkedList.h` and `parc_LinkedList.c`.

The _Naming Conventions in C Programs_ document offers a detailed
description of the naming conventions for C header and source files.

## C Header File Structure
The general layout of a C header file is:
1. Copyright Notice
2. Include Guard Beginning
3. Module Documentation
4. Preprocessor Include Directives
5. Preprocessor Constant Definitions
6. Global Macro Definitions
7. Global Function Declarations
8. Blank Line
9. Include Guard Ending

## Do Not Use Per-File Editor Configurations

Editors like ‘emacs‘ and ‘vim‘ support the parsing of the first line (or lines) of a file being edited to set attributes in the editor.
This should not be used as it may have confusing consequences for later editors of the code.
Configure your editor for the way you need it through its standard configuration files, not in the source files that you edit.

## Include Guards
Use include guards in every C header file to prevent multiple inclusion which often results in compile or runtime errors. The name of the include guard is composed from the name of the library or application and the file name of the C header/source file.
For example, the library PARC Library contains the module parc_Buffer.o produced from compiling parc_Buffer.c and parc_Buffer.h.

Be consistent in naming the include guards and use names that aren't going to
conflict with another include guard.

For example, the include guards for the PARC Library define preprocessor
variables beginning with `PARCLibrary_`

## Module Documentation
Because C header files typically accompany the distribution of a library without the source files, the right place for documentation is in the C Header file.
A complete description of the functionality provided by the corresponding C source file is written in the C header file directly after the Copyright notice and before any other element in the C header file.

## Preprocessor Include Directives
A C header file must never burden client code with unnecessary includes.
The C header file should include only those external header files necessary for its own successful compilation.

### Include everything that is needed
A header file should include all of the external include files that provide definitions and values it uses.

### Include only what is needed.
A header file should not include files that are used only by the associated C Source file.

For example, an implementation of a Properties module may permit the properties to be saved to a file by calling a function that does the work.
The details of file access and reading and writing are private to the Properties implementation, and not to every client code that includes the Properties header file.  As a result, the Properties header file should not include the system header files for file access, reading and writing.

### Do Not Use ”Magic Numbers”

Do not use unexplained numeric values. Numbers like 0, 1 or 2 might be obvious to you at the moment, but might not be obvious to others, or even to you in the future.

For example, a generally obvious use of a constant would be:
```c
{
    ...
    return array[index + 1];
}
```
But an expression like this is not at all obvious:
```c
{
    ...
    x = ((int) (s & 0xf) << 12) + ((ns / 5 * 8 + 195312) / 390625);
    ...
}
 ```
### Prefer `const` and `enum` to `#define`

Preprocessor defines are a source of a lot of dirty programming.
Improve this by adding precision in type casting and using `enum`
instead of `#define` where possible.

If a constant is one of set of possible simple values, consider using an
`enum` definition instead of a preprocessor define.
This permits the value to be displayed by the debugger and gives clarity when it is used.

If the `enum` namespace is already cluttered with many other definitions,
consider using a `const` variable definition which allows more control over
the scope of the definition.
For example, `const int specialValue = 10;` or `static const _specialValue = 10;`

Avoid using a `#define` to create a constant complex value, over and over.
Instead create a `const` value as a singleton and reference it.

### Global Constant Definitions
If you must use a `#define` to create a constant value,
prefix the name with the project or module to avoid name collisions
and redefinitions.

Constants should be defined with their types cast to add clarity and precision:
```c
#define PARCLibrary_VALUE 10            //  Bad
#define PARCLibrary_VALUE ((short) 10)  //  Better
```

Similarly, compiler command line switches and configuration scripts
should be defined with a type cast if possible. For example:
```sh
% cc ’-DPARCLibrary_VALUE=((short) 10)’ foo.c
```

###  Global Macro Definitions

#### Use inline or static functions instead of macros

Whenever possible, use inline or static functions instead of macros.
This reduces or eliminates unexpected or hidden side effects of a macro expansion,
and permits better compile-time type-checking.

#### Prefix Macro names with the module name-space

Macros defined by a C header file must be prefixed with the name of the project
or the module.

#### Do Not Use Macros to Hide Program Return

Do not use macros to hide return as in:
```c
#define SUCCESS return true;
bool
function(void)
{
    ...
    SUCCESS
}
```

Instead, use an explicit return:
```c
#define SUCCESS true;
bool
function(void)
{
     ...
     return SUCCESS;
}
```

#### Do Not Define Types With Macros
Use `typedef` to define types, not a preprocessor macro.
A typedef definition has scope, debugging information,
and makes use of the type-checking of the compiler.

Do the following:
```c
typedef char * String;

bool
function(void)
{
    String foo = "Hello World";
}

```
Not:
```c
#define String char *

bool
function(void)
{
    String foo = "Hello World";
}
```

### Global Function Declarations
All global functions defined in a C source file must be declared and
documented in the corresponding C header file.

The global function declaration should be on one line:
`Type functionName(parameters...);`

For example:
```
/**
 * Assert that an instance of PARCBuffer is valid.
 *
 * If the instance is not valid, terminate via ‘trapIllegalValue()‘
 *
* Valid means the internal state of the type is consistent with its
* required current or future behaviour.
* This may include the validation of internal instances of types.
*
* param [in] instance A pointer to a ‘PARCBuffer‘ instance.
*/
void parcBuffer_AssertValid(const PARCBuffer *instance);
```

If the single line exceeds the line length, break the function definition across its parameter list.

## Type Definitions
Raw structures and plain intrinsic types should be avoided.
Use `typedef` to name structures and other types to give meaning and establish
context and vocabulary.

Type names are prefaced with the module namespace starting with a capital letter.
If the namespace is an acronym, use the exact capitalization for the acronym.

| Good            | Not So Good |
| --------------- |:---------|:--------- |
| `PARCArrayList` | `ParcArrayList` | PARC is an acronym with specific spelling of all capitals. |
| `CCNxInterest`  | `CcnxInterest`  | CCNx is an acronym with particular spelling convention. |
| `LongBowEvent`  | `LongBow_Event`   | Don't use `_` in a name. |


## Consider Returning a Defined Type
Get the compiler to help you avoid mismatched function calls by returning a defined type, rather than a simple intrinsic type.

## Avoid Plain Intrinsic Types as Parameters
For example, use types like `int` when you are prepared to accept or provide values in the entire domain of `int`,
otherwise use an explicit type name to give meaning to the expected domain of values.

For example, `double coefficient;` is less meaningful than `Coefficient coefficient;`
where `Coefficient` is explicitly defined to be value in the range of [0, 1.0)
