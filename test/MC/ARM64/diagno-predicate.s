// RUN: not llvm-mc  -triple arm64-linux-gnu -mattr=-fp-armv8 < %s 2> %t
// RUN: FileCheck --check-prefix=CHECK-ERROR < %t %s


        fcvt d0, s0
// CHECK-ERROR: error: instruction requires: fp-armv8
// CHECK-ERROR-NEXT:        fcvt d0, s0
// CHECK-ERROR-NEXT:        ^

        fmla v9.2s, v9.2s, v0.2s
// CHECK-ERROR: error: instruction requires: neon
// CHECK-ERROR-NEXT:        fmla v9.2s, v9.2s, v0.2s
// CHECK-ERROR-NEXT:        ^

        pmull v0.1q, v1.1d, v2.1d
// CHECK-ERROR: error: instruction requires: crypto
// CHECK-ERROR-NEXT:        pmull v0.1q, v1.1d, v2.1d
// CHECK-ERROR-NEXT:        ^

