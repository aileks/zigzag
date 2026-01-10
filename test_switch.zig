const std = @import("std");
const expect = std.testing.expect;

test "switch statement" {
    var x: i8 = 10;
    switch (x) {
        // Range prong uses `a...b` inclusive syntax.
        -1...1 => {
            x = -x;
        },
        10, 100 => {
            // `@divExact` traps if remainder is non-zero.
            x = @divExact(x, 10);
        },
        else => {},
    }

    try expect(x == 1);
}

test "switch expression" {
    var x: i8 = 10;
    // `switch` can be an expression with a result value.
    x = switch (x) {
        -1...1 => -x,
        10, 100 => @divExact(x, 10),
        else => x,
    };
    try expect(x == 1);
}
