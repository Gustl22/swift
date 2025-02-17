// RUN: %swift -typecheck %s -verify -target i386-apple-tvos9.0 -parse-stdlib
// RUN: %swift-ide-test -test-input-complete -source-filename=%s -target i386-apple-tvos9.0

#if os(iOS)
// This block should not parse.
// os(tvOS) or os(watchOS) does not imply os(iOS).
let i: Int = "Hello"
#endif

#if arch(i386) && os(tvOS) && _runtime(_ObjC) && _endian(little) && _pointerBitWidth(_32) && _atomicBitWidth(_64)
class C {}
var x = C()
#endif
var y = x
