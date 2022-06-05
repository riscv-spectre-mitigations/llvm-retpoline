set(LIBCXX_ENABLE_EXPERIMENTAL_LIBRARY OFF CACHE BOOL "")
set(LIBCXX_HAS_WIN32_THREAD_API ON CACHE BOOL "")

set(LIBCXX_CXX_ABI libcxxabi CACHE STRING "")
set(LIBCXXABI_USE_LLVM_UNWINDER ON CACHE BOOL "")

set(LIBCXXABI_ENABLE_SHARED OFF CACHE BOOL "")
set(LIBCXX_ENABLE_STATIC_ABI_LIBRARY ON CACHE BOOL "")

set(LIBCXX_USE_COMPILER_RT ON CACHE BOOL "")
set(LIBCXXABI_USE_COMPILER_RT ON CACHE BOOL "")
set(LIBUNWIND_USE_COMPILER_RT ON CACHE BOOL "")

set(LIBCXX_TARGET_INFO "libcxx.test.target_info.MingwLocalTI" CACHE STRING "")

# Without these flags, 'long double' (which is 80 bit on x86 mingw, but
# 64 bit in MSVC) isn't handled correctly in printf.
set(CMAKE_C_FLAGS "-D__USE_MINGW_ANSI_STDIO=1" CACHE STRING "")
set(CMAKE_CXX_FLAGS "-D__USE_MINGW_ANSI_STDIO=1" CACHE STRING "")
set(LIBCXX_TEST_COMPILER_FLAGS "-D__USE_MINGW_ANSI_STDIO=1" CACHE STRING "")