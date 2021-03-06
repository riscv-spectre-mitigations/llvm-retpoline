// RUN: %clang_cc1 -triple x86_64-pc-linux -std=c++2a -ast-dump=json %s | FileCheck %s

namespace foo {
}

namespace {
}

namespace bar {
inline namespace __1 {
}
}

namespace baz::quux {
}

namespace quux::inline frobble {
}

// NOTE: CHECK lines have been autogenerated by gen_ast_dump_json_test.py
// using --filters=NamespaceDecl

// CHECK-NOT: {{^}}Dumping
// CHECK:  "kind": "NamespaceDecl",
// CHECK-NEXT:  "loc": {
// CHECK-NEXT:   "offset": 98,
// CHECK-NEXT:   "file": "{{.*}}",
// CHECK-NEXT:   "line": 3,
// CHECK-NEXT:   "col": 11,
// CHECK-NEXT:   "tokLen": 3
// CHECK-NEXT:  },
// CHECK-NEXT:  "range": {
// CHECK-NEXT:   "begin": {
// CHECK-NEXT:    "offset": 88,
// CHECK-NEXT:    "col": 1,
// CHECK-NEXT:    "tokLen": 9
// CHECK-NEXT:   },
// CHECK-NEXT:   "end": {
// CHECK-NEXT:    "offset": 104,
// CHECK-NEXT:    "line": 4,
// CHECK-NEXT:    "col": 1,
// CHECK-NEXT:    "tokLen": 1
// CHECK-NEXT:   }
// CHECK-NEXT:  },
// CHECK-NEXT:  "name": "foo"
// CHECK-NEXT: }

// CHECK-NOT: {{^}}Dumping
// CHECK:  "kind": "NamespaceDecl",
// CHECK-NEXT:  "loc": {
// CHECK-NEXT:   "offset": 117,
// CHECK-NEXT:   "line": 6,
// CHECK-NEXT:   "col": 11,
// CHECK-NEXT:   "tokLen": 1
// CHECK-NEXT:  },
// CHECK-NEXT:  "range": {
// CHECK-NEXT:   "begin": {
// CHECK-NEXT:    "offset": 107,
// CHECK-NEXT:    "col": 1,
// CHECK-NEXT:    "tokLen": 9
// CHECK-NEXT:   },
// CHECK-NEXT:   "end": {
// CHECK-NEXT:    "offset": 119,
// CHECK-NEXT:    "line": 7,
// CHECK-NEXT:    "col": 1,
// CHECK-NEXT:    "tokLen": 1
// CHECK-NEXT:   }
// CHECK-NEXT:  }
// CHECK-NEXT: }

// CHECK-NOT: {{^}}Dumping
// CHECK:  "kind": "NamespaceDecl",
// CHECK-NEXT:  "name": ""
// CHECK-NEXT: }

// CHECK-NOT: {{^}}Dumping
// CHECK:  "kind": "NamespaceDecl",
// CHECK-NEXT:  "loc": {
// CHECK-NEXT:   "offset": 132,
// CHECK-NEXT:   "line": 9,
// CHECK-NEXT:   "col": 11,
// CHECK-NEXT:   "tokLen": 3
// CHECK-NEXT:  },
// CHECK-NEXT:  "range": {
// CHECK-NEXT:   "begin": {
// CHECK-NEXT:    "offset": 122,
// CHECK-NEXT:    "col": 1,
// CHECK-NEXT:    "tokLen": 9
// CHECK-NEXT:   },
// CHECK-NEXT:   "end": {
// CHECK-NEXT:    "offset": 163,
// CHECK-NEXT:    "line": 12,
// CHECK-NEXT:    "col": 1,
// CHECK-NEXT:    "tokLen": 1
// CHECK-NEXT:   }
// CHECK-NEXT:  },
// CHECK-NEXT:  "name": "bar",
// CHECK-NEXT:  "inner": [
// CHECK-NEXT:   {
// CHECK-NEXT:    "id": "0x{{.*}}",
// CHECK-NEXT:    "kind": "NamespaceDecl",
// CHECK-NEXT:    "loc": {
// CHECK-NEXT:     "offset": 155,
// CHECK-NEXT:     "line": 10,
// CHECK-NEXT:     "col": 18,
// CHECK-NEXT:     "tokLen": 3
// CHECK-NEXT:    },
// CHECK-NEXT:    "range": {
// CHECK-NEXT:     "begin": {
// CHECK-NEXT:      "offset": 138,
// CHECK-NEXT:      "col": 1,
// CHECK-NEXT:      "tokLen": 6
// CHECK-NEXT:     },
// CHECK-NEXT:     "end": {
// CHECK-NEXT:      "offset": 161,
// CHECK-NEXT:      "line": 11,
// CHECK-NEXT:      "col": 1,
// CHECK-NEXT:      "tokLen": 1
// CHECK-NEXT:     }
// CHECK-NEXT:    },
// CHECK-NEXT:    "name": "__1",
// CHECK-NEXT:    "isInline": true
// CHECK-NEXT:   }
// CHECK-NEXT:  ]
// CHECK-NEXT: }

// CHECK-NOT: {{^}}Dumping
// CHECK:  "kind": "NamespaceDecl",
// CHECK-NEXT:  "loc": {
// CHECK-NEXT:   "offset": 176,
// CHECK-NEXT:   "line": 14,
// CHECK-NEXT:   "col": 11,
// CHECK-NEXT:   "tokLen": 3
// CHECK-NEXT:  },
// CHECK-NEXT:  "range": {
// CHECK-NEXT:   "begin": {
// CHECK-NEXT:    "offset": 166,
// CHECK-NEXT:    "col": 1,
// CHECK-NEXT:    "tokLen": 9
// CHECK-NEXT:   },
// CHECK-NEXT:   "end": {
// CHECK-NEXT:    "offset": 188,
// CHECK-NEXT:    "line": 15,
// CHECK-NEXT:    "col": 1,
// CHECK-NEXT:    "tokLen": 1
// CHECK-NEXT:   }
// CHECK-NEXT:  },
// CHECK-NEXT:  "name": "baz",
// CHECK-NEXT:  "inner": [
// CHECK-NEXT:   {
// CHECK-NEXT:    "id": "0x{{.*}}",
// CHECK-NEXT:    "kind": "NamespaceDecl",
// CHECK-NEXT:    "loc": {
// CHECK-NEXT:     "offset": 181,
// CHECK-NEXT:     "line": 14,
// CHECK-NEXT:     "col": 16,
// CHECK-NEXT:     "tokLen": 4
// CHECK-NEXT:    },
// CHECK-NEXT:    "range": {
// CHECK-NEXT:     "begin": {
// CHECK-NEXT:      "offset": 179,
// CHECK-NEXT:      "col": 14,
// CHECK-NEXT:      "tokLen": 2
// CHECK-NEXT:     },
// CHECK-NEXT:     "end": {
// CHECK-NEXT:      "offset": 188,
// CHECK-NEXT:      "line": 15,
// CHECK-NEXT:      "col": 1,
// CHECK-NEXT:      "tokLen": 1
// CHECK-NEXT:     }
// CHECK-NEXT:    },
// CHECK-NEXT:    "name": "quux"
// CHECK-NEXT:   }
// CHECK-NEXT:  ]
// CHECK-NEXT: }

// CHECK-NOT: {{^}}Dumping
// CHECK:  "kind": "NamespaceDecl",
// CHECK-NEXT:  "loc": {
// CHECK-NEXT:   "offset": 201,
// CHECK-NEXT:   "line": 17,
// CHECK-NEXT:   "col": 11,
// CHECK-NEXT:   "tokLen": 4
// CHECK-NEXT:  },
// CHECK-NEXT:  "range": {
// CHECK-NEXT:   "begin": {
// CHECK-NEXT:    "offset": 191,
// CHECK-NEXT:    "col": 1,
// CHECK-NEXT:    "tokLen": 9
// CHECK-NEXT:   },
// CHECK-NEXT:   "end": {
// CHECK-NEXT:    "offset": 224,
// CHECK-NEXT:    "line": 18,
// CHECK-NEXT:    "col": 1,
// CHECK-NEXT:    "tokLen": 1
// CHECK-NEXT:   }
// CHECK-NEXT:  },
// CHECK-NEXT:  "name": "quux",
// CHECK-NEXT:  "inner": [
// CHECK-NEXT:   {
// CHECK-NEXT:    "id": "0x{{.*}}",
// CHECK-NEXT:    "kind": "NamespaceDecl",
// CHECK-NEXT:    "loc": {
// CHECK-NEXT:     "offset": 214,
// CHECK-NEXT:     "line": 17,
// CHECK-NEXT:     "col": 24,
// CHECK-NEXT:     "tokLen": 7
// CHECK-NEXT:    },
// CHECK-NEXT:    "range": {
// CHECK-NEXT:     "begin": {
// CHECK-NEXT:      "offset": 207,
// CHECK-NEXT:      "col": 17,
// CHECK-NEXT:      "tokLen": 6
// CHECK-NEXT:     },
// CHECK-NEXT:     "end": {
// CHECK-NEXT:      "offset": 224,
// CHECK-NEXT:      "line": 18,
// CHECK-NEXT:      "col": 1,
// CHECK-NEXT:      "tokLen": 1
// CHECK-NEXT:     }
// CHECK-NEXT:    },
// CHECK-NEXT:    "name": "frobble",
// CHECK-NEXT:    "isInline": true
// CHECK-NEXT:   }
// CHECK-NEXT:  ]
// CHECK-NEXT: }
