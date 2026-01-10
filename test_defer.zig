const expect = @import("std").testing.expect;

test "defer" {
    var x: i16 = 5;
    {
        // `defer` runs when leaving the scope.
        defer x += 2;
        try expect(x == 5);
    }
    try expect(x == 7);
}

test "multi defer" {
    var x: f32 = 5;
    {
        // LIFO: last defer runs first.
        defer x += 2;
        defer x /= 2;
    }
    try expect(x == 4.5);
}
