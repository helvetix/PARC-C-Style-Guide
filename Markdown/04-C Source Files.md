# C Source Files

##  C Source File Names
Every C source file has a single corresponding C header file that defines all
of the necessary features necessary to use the functionality implemented in the
C source file.

Names for C Source and Header files must be prefixed with the name of the
associated library or other name space concept with a single character
separating the prefix from the rest of the file name.
This is to visually separate the name-space of a file in a directory listing
or similar.

For example:

| Name                |  |
| --------------- |:---------|
| `parc_LinkedList.c` | A module in the PARC library |
| `LongBow_Buffer.c`| A module in the LongBow library |
| `ccnx_Interest.c` | A module in the CCNx library |

See the _Naming Conventions in C Programs_ document offers a detailed
description of the naming conventions for C header and source files.

## C Source File Structure
The general layout of a C source file is:
1. Copyright Notice
2. Preprocessor Include Directives
3. Private Preprocessor Constant Definitions
4. Private Preprocessor Macro Definitions
5. Static Function Definitions
6. Global Function Definitions

### Copyright Notice
The Copyright notice for PARC C source file is:
```c
/*
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 * Copyright 2014 Palo Alto Research Center (PARC), a Xerox company.
 * All Rights Reserved.
 * The content of this file, whole or in part, is subject to licensing terms
.
* If distributing this software, include this License Header Notice in each
* file and provide the accompanying LICENSE file.
*/
```

### Preprocessor Include Directives
The following outlines the types of preprocessor include directives:

| Include File Kind | Description |
| --------------- |:---------|
| Configuration | `config.h` and other configuration files.|
| System | Files originating in `/usr/include`|
| Third party | Third party libraries and support |
| LongBow | LongBow runtime include files |
| Project | Project include files |
| Private | Private include files|

Each grouping of include files should be separated by a blank line.

### Private Preprocessor Constant Definitions
This is the same as the description for the C Header File.

### Private Preprocessor Macro Definitions

###  Static Function Definitions
#### Avoid forward declarations of static functions

Less is better: Forward declarations are simply more code to maintain.
Defining the function once means you only have to modify the file in one place if you need to change the function’s signature.
```c
static int
_myFunction(void)
{
    return 1;
}
```

As a comparision, a forward declaration may easily get lost if you change the function’s signature.
```c
static int _myFunction(void);

// ...
// possibly many intervening lines of code and comments ;
// ...

static int
_myFunction(void)
{
    return 1;
}
```

### Static Function Documentation

#### Document static functions in place

Static functions need documentation as much as any globally defined function.
Keep in mind that the audience is different.
The global function is intended to be used by arbitrary users of the function,
while a static function is intended to be used and understood by the maintainer
of the module using it internally.

### Global Function Definitions
All global functions declared in the corresponding C Header file are defined
in the C Source file, and vice versa.
The definition of the function always places the function’s storage class and
type on one line and the function name on the following line,
starting in the first column as in:
For example:
```c
size_t
parcBuffer_Limit(const PARCBuffer *buffer)
{
  parcBuffer_AssertValid(buffer);
  return buffer->limit;
}
```

Not:
```c
size_t parcBuffer_Limit(const PARCBuffer *buffer)
{
  parcBuffer_AssertValid(buffer);
  return buffer->limit;
}
```
