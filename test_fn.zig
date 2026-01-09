const std = @import("std");
const expect = std.testing.expect;

// fn -> funcName -> params -> return type
fn addFive(x: u32) u32 {
    return x + 5;
}

test "adding five" {
    const y = addFive(0);
    try expect(@TypeOf(y) == u32);
    try expect(y == 5);
}

fn fibonacci(n: u16) u16 {
    if (n == 0 or n == 1) return n;
    return fibonacci(n - 1) + fibonacci(n - 2);
}

test "recursive function" {
    const x = fibonacci(10);
    try expect(x == 55);
}
