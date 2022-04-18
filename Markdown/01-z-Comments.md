# 2 Comments

Well written source code has judicious and well written comments.
Consistency in the format, type and placement of comments leads to better readability.
We’ve all heard that writing comments is important, but poorly written, unmaintained comments add complexity rather than reduce it.

For example, if you’re writing comments to explain how your code works, then the code itself ought to written in a better, clearer, explanatory way. You may find that you won’t need to write the comment in the first place.
Comments should be be grammatically correct English sentences.
Comments must be indented to indicate scope: All comments are a preamble to the code they are related to and should immediately precede that code, indented identically. See ’Trailing Comments’ for the exception to this policy.

## 2.1 Block Comments

```
1  /*
2   * This is a
3   * multiline
4   * block comment.
5   */
```
A block comment should be indented to the same indentation level as the surrounding code.

## 2.2 Single Line Comments

```
1  // This is a single line comment.
2
3  if (this || that) {    // Some conditional.
4    // This is another single line comment.
5  }
```
A single line comment should be indented to the same indentation level as the surrounding code.

If the comment is a trailing comment on a line, it should have extra whitespace between the last character of the code and the starting `//`.

## 2.3 Documentation Comments

Use JavaDoc style comments for documentation.
```
/**
 * Documentation comment.
 */
```

## 2.4 Commenting Out Code

Comment out code with single line comments.
 Sometimes you need to comment out a section of code when collaborating, testing, or adding new features. Using single line comments makes it easier to tell at a glance which lines are commented out.

```
1  //// This is a single line comment.
2  //
3  // if (this || that) {    // Some conditional.
4  //  // This is another single line comment.
5  //}
```

Do not comment out code and then leave it in the source file as it tends to remain there forever. Other developers normally won’t have the courage to just delete commented-out code so there it will remain like some mystical monument.
