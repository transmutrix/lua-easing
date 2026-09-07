
# Lua Easing Functions

Over the years I've adapted [Robert Penner's easing functions](https://easings.net)
numerous times in different programming languages. Despite
the utility of these functions, many implementations I found
in that time were mysteriously overwrought: classes, separate
files _per curve_, lots of added parameters, etc.

This repo attempts to provide a reasonable port of these
easing curves for several Lua dialects and VM versions
without any fluff. I hope they are useful to you!


## LÖVE Example

To run an example that shows all the ease curves in action, run
this _from the repo root_:

```bash
love love2d-example
```

![](/love2d-example/demo.mov)


## How to Use

Just copy the library for your language of choice into your
project and go!

Note that the Fennel version uses kebab-case names, while Lua
and MoonScript use snake_case.

All functions take a single scalar in the range `[0.0, 1.0]`.
**Note:** These functions _do not guard_ against
out-of-range values. If you want that, you'll need to clamp
the values yourself with something like `math.max(0, math.min(1, t))`
or `(math.max 0 (math.min 1 t))`.


### [Lua](https://www.lua.org)

```lua
local ease = require("ease")
print("example:", ease.out_expo(0.5))
```

### [Fennel](https://fennel-lang.org)

```fennel
(local ease (require :ease))
(print "example:" (ease.out-expo 0.5))
```

### [MoonScript](https://moonscript.org)

```moonscript
ease = require "ease"
print "example:", ease.out_expo 0.5
```


## Attribution

In 2001 Robert Penner released the
[now-ubiquitous easing library](https://easings.net)
for JavaScript. It is licensed under the
[MIT license](https://opensource.org/license/mit).

Since then, numerous ports of the curves have been written
in different programming languages, and using different
conventions.

At some point years ago I was working on a game in C, and I
read Warren Moore's port of the library for C, C++, and
Objective-C, called [AHEasing](https://github.com/warrenm/AHEasing).
It is distributed under the [Unlicense](https://unlicense.org).

I wrote my own simplified, single-header version of the
curves based on my reading of Warren's port, and have been
copying and rewriting that header across projects and
programming languages ever since!


## License

This code is licensed under the MIT license.

If you plan to distribute your project, remember to include
a copy of [`LICENSEmd`](/LICENSE.md) as "lua-easing-license.md"
or splat it into a combined license file with everything else,
like [LÖVE](https://love2d.org) itself does.
