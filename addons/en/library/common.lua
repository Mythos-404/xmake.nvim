---@meta
---xmake version: v2.9.6+20241030

---Supported operation system
----@alias OperationSystem string|"windows"|"linux"|"android"|"macosx"|"ios"

----Supported architecture
----@alias Architecture
----|string
----|"i386"|"x64"|"x86"|"x86_64"
----|"arm"|"arm64"|"arm64-v8a"|"arm64ec"|"armeabi"|"armeabi-v7a"|"armv7"|"armv7k"|"armv7s"
----|"mip64"|"mips"|"mips64"|"mips64el"|"mipsel"
----|"riscv"|"riscv64"
----|"wasm32"|"wasm64"
----|"ppc"|"ppc64"
----|"loong64"
----|"s390x"
----|"sh4"

----Supported platform
----@alias Platform string|"windows"|"linux"|"cross"|"macosx"|"android"|"iphoneos"|"watchos"

----Supported host
----@alias Host string|"windows"|"linux"|"macosx"

----Supported subsystem host
----@alias SubHost string|"msys"|"cygwin"

----Supported subsystem architecture
----@alias SubArch string|"x86_64"|"i386"

----Supported compilation mode
----@alias CompilationMode string|"debug"|"profile"|"release"|"releasedbg"|"asan"|"check"|"coverage"|"lsan"|"minsizerel"|"msan"|"tsan"|"ubsan"|"valgrind"

----Supported target kind
----@alias TargetKind string|"phony"|"static"|"shared"|"object"|"headeronly"|"binary"
