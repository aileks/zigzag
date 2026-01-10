const std = @import("std");

pub fn main() void {
    // `{s}` expects a UTF-8 byte slice
    std.debug.print("Hello, {s}!\n", .{"World"});
}
