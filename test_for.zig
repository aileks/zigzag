const expect = @import("std").testing.expect;

test "for loop" {
    const string = [_]u8{ 'a', 'b', 'c' };

    // `0..` is a range; pairing yields index.
    for (string, 0..) |char, idx| {
        _ = char;
        _ = idx;
    }

    for (string) |char| {
        _ = char;
    }

    // Use `_` to ignore the item.
    for (string, 0..) |_, idx| {
        _ = idx;
    }

    for (string) |_| {}
}
