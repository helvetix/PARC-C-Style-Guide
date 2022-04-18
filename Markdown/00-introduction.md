[General Principles](StyleGuide/01-General Principles.md)

# Introduction
Whether for coding style or in design, why have any kind of programming language conventions?

Consider this:
* 40%-80% of the lifetime cost of a piece of software is spent in maintenance.
* Software is rarely maintained by the original author throughout its lifetime.
* Conventions for programming language usage improve the readability of the software,
allowing engineers to understand it more quickly and thoroughly.
* If computer program (or programs) source code is the product, it should be as well
documented, packaged and clean as any other product.

Underlying all of these points is the fact that having a predictable style and
a set of conventions reduces the amount of time it takes for a developer,
maintainer or user to understand the software.
Like a book, magazine article, or technical paper,
software is typically written by fewer people than those who will read it.
The quality of writing that goes into a book, article or paper has a direct
effect on the reader’s ability to comprehend the ideas conveyed and is one of
the predictors of the impact of the paper or book in its domain.
Likewise the way a program is written has an impact on other developer’s
ability to comprehend the ideas it implements.
The fact that a piece of software can cause a computer to perform some function
is an additional responsibility of the programmer not necessarily shared by the
writer of a book or paper.
A book or paper can be vague or suggest a type of solution without being specific.
A programmer cannot.
A programmer must write precise, complete, readable, and instructive software.

## Perspective
This style guide is for the C programming language,
one of the most widely used programming languages of all time.
During the past 30 years, the language has been modified and updated in a variety of ways,
and has directly inspired many other popular languages.
Over this same course of time, the Software Engineering discipline has also changed.
Other programming models have been developed.
Programming techniques and processes have been refined.
Some techniques that were commonplace or even necessary when programming in
1978 are now considered bad style, if not simply bad design.
Techniques that are commonplace in other languages nowadays,
are oftentimes not readily expressible in C, however,
style and design conventions help us take advantage of these techniques
and improve the quality of software written in C.

This is a collection of guidelines and recommendations that have been derived
over time as the result of experience, best practices, strategic choices and
tradition.
Often organized as a set of ”dos and don’ts”, each recommendation is
accompanied by a description or rationale.

If you think conforming to a style guide is tedious, try writing one.

A guide like this is only a tool. Source conforming to this or any other style
guide is not necessarily guaranteed to be good software - writing software that
conforms to a style guide does not automatically make one a good programmer.
However, the reverse is likely true: Source not conforming to a consistent
style is not good software, and a programmer that does not adhere to a
consistent style is not a good programmer.

All aspects of software development - from architecture to design to
organization to implementation - is about people.
Software does not write itself, maintain itself, or reuse itself.
Hardware running software cares nothing about separation of concerns,
the Liskov substitution principle,
or dependency inversion.
The software professional has the ability to design and implement efficient
software that balances engineering productivity,
machine performance, and cost.
A coding style is one tool to aid in that process,
though it is not a substitute for sound professional judgement.

This set of articles is a work-in-progress and undergoes updates and
reorganization as needed.
