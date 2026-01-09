const std = @import("std");
const expect = std.testing.expect;

test "for loop" {
    const string = [_]u8{ 'a', 'b', 'c' };

    for (string, 0..) |char, idx| {
        _ = char;
        _ = idx;
    }

    for (string) |char| {
        _ = char;
    }

    for (string, 0..) |_, idx| {
        _ = idx;
    }

    for (string) |_| {}
}
