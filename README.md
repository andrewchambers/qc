# Quick C

qc is a c frontend for the awesome [QBE](http://c9x.me/compile/) ssa backend written by Quentin Carbonneaux.

The frontend itself is written in the [Myrddin](https://myrlang.org) programming
language, a language by Ori Bernstein that is under heavy development, and also rocks.

# Project Goals

- Give QBE a serious C frontend to use for testing.
- Make a Myrddin self hosting language, even if it depends on some C code.
- Allow Myrddin programs to embed C code without depending on the system C compiler.
- Spread awareness of the Myrddin programming language

# Status

The compiler itself is nearly complete enough to start compiling real programs. My first target will be my old [self hosting C compiler](https://github.com/andrewchambers/c). There is not much work required to complete that goal, though there will be a steady grind of bug fixes to make it a reality.

# Building

You must have the Myrddin programming language installed, then building is a single command.

`mbld`

The compiler itself should work on linux, macos, freebsd, openbsd and plan9. Though qbe can only target a subset of those platforms.

# Running tests

`mbld test`

# Contact

IRC: irc.eigenstate.org in #myrddin (nick: ac)
