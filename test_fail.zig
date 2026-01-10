const expect = @import("std").testing.expect;

test "always fails" {
    try expect(false);
}
