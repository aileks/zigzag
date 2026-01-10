const std = @import("std");
const expect = std.testing.expect;

fn addFive(x: u32) u32 {
    return x + 5;
}

test "adding five" {
    const y = addFive(0);
    try expect(@TypeOf(y) == u32);
    try expect(y == 5);
}

// `!u64` because memoization can allocate.
fn fib(n: u32, memo: *std.AutoHashMap(u32, u64)) !u64 {
    if (n == 0 or n == 1) return n;

    if (memo.get(n)) |v| return v;

    const v: u64 = if (n < 2)
        n
    else
        (try fib(n - 1, memo)) + (try fib(n - 2, memo));

    try memo.put(n, v);
    return v;
}

test "recursive function" {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const alloc = gpa.allocator();

    // AutoHashMap owns heap memory; `deinit` frees it.
    var memo = std.AutoHashMap(u32, u64).init(alloc);
    defer memo.deinit();

    const x = try fib(10, &memo);
    try expect(x == 55);
}
