// RUN: %swift -typecheck %s -verify -target arm64-apple-tvos9.0 -parse-stdlib
// RUN: %swift-ide-test -test-input-complete -source-filename=%s -target arm64-apple-tvos9.0

#if os(iOS)
// This block should not parse.
// os(tvOS) or os(watchOS) does not imply os(iOS).
let i: Int = "Hello"
#endif

#if arch(arm64) && os(tvOS) && _runtime(_ObjC) && _endian(little) && _pointerBitWidth(_64) && _atomicBitWidth(_128)
class C {}
var x = C()
#endif
var y = x
