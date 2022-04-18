# Files
All files must have meaningful names that indicate to the reader the context
in which the file exists (library, package, etc), what the content is expected to implement, and the type of file it is (C Source, Header, etc.)

For example, the file named `parc LinkedList.c` indicates (by convention)
that it’s part of the PARC library,
it implements a linked-list and is a C source file.

The `Naming Conventions in C Programs` document offers a detailed description of the naming conventions for files.

## Files Names Are Case Sensitive
Files with the name file.c and File.c are different files without any relationship to each other (apart from the fact they only differ in the semantic meaning of their names).

Note that the Mac OSX filesystem can cause trouble with file names because the file system itself is case-insensitive.

## File Suffixes
By convention the type or kind of a file is indicated by a name suffix. Don’t invent new conventions for file suffixes.
C source files end with the suffix .c. C header files end with the suffix .h.

## Copyright Notices
Every source and header file must contain a positive assertion of Copyright.
A positive assertion of Copyright removes ambiguity and informs the reader of the ownership of the content. Use the notice to provide directions on where to find additional legal information
or instructions.
The Copyright notice is not the place to practice being a lawyer. Keep the notice simple and
very direct.

Use Prescribed Ways to Declare Copyright

Do not use the character construct (C) as a substitute for the word Copyright.

Use A Concise Copyright Notice

Do not be explicit about the licensing details in the notice text.
Instead, refer to another file or location where the licensing details can be found.
This lets you modify those details for different releases,
or if the requirements change,
without having to modify all of your source files.

For example:
 ```c
/*
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 * Copyright 2014 Palo Alto Research Center (PARC), a Xerox company.
 * All Rights Reserved.
 * The content of this file, whole or in part, is subject to licensing terms.
 * If distributing this software, include this License Header Notice in each
 * file and provide the accompanying LICENSE file.
 */
```
