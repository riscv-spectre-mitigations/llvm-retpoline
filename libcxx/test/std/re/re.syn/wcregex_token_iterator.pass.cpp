//===----------------------------------------------------------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

// <regex>

// typedef regex_token_iterator<const wchar_t*>   wcregex_token_iterator;

// XFAIL: libcpp-has-no-wide-characters

#include <regex>
#include <type_traits>
#include "test_macros.h"

int main(int, char**)
{
    static_assert((std::is_same<std::regex_token_iterator<const wchar_t*>, std::wcregex_token_iterator>::value), "");

  return 0;
}
