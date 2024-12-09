---@meta
---xmake version: v2.9.6+20241030

---Supported operating systems
---@alias OperationSystem string|"windows"|"linux"|"android"|"macosx"|"ios"

---Supported compilation architectures
---@alias Architecture
---|string
---|Architecture.x86
---|Architecture.arm
---|Architecture.mips
---|Architecture.riscv
---|Architecture.wasm
---|Architecture.ppc
---|"loong64"
---|"s390x"
---|"sh4"
---@alias Architecture.x86 "i386"|"x64"|"x86"|"x86_64"
---@alias Architecture.arm "arm"|"arm64"|"arm64-v8a"|"arm64ec"|"armeabi"|"armeabi-v7a"|"armv7"|"armv7k"|"armv7s"
---@alias Architecture.mips "mip64"|"mips"|"mips64"|"mips64el"|"mipsel"
---@alias Architecture.riscv "riscv"|"riscv64"
---@alias Architecture.wasm "wasm32"|"wasm64"
---@alias Architecture.ppc "ppc"|"ppc64"

---Supported platforms
---@alias Platform string|"windows"|"linux"|"cross"|"macosx"|"android"|"iphoneos"|"watchos"

---Supported host operating systems
---@alias Host string|"windows"|"linux"|"macosx"

---Supported host subsystem environments
---@alias SubHost string|"msys"|"cygwin"

---Supported host subsystem architectures
---@alias SubArch string|"x86_64"|"i386"

---Supported compilation modes
---@alias CompilationMode string|"debug"|"profile"|"release"|"releasedbg"|"asan"|"check"|"coverage"|"lsan"|"minsizerel"|"msan"|"tsan"|"ubsan"|"valgrind"

---Supported target types
---@alias TargetKind string|"phony"|"static"|"shared"|"object"|"headeronly"|"binary"

---Scope configuration syntax
---@alias ScopeSyntax fun(): nil

---Supported strip modes
---@alias StripMode string|"debug"|"all"

---Supported debugging symbols
---@alias SymbolInfo string|"debug"|"debug,edit"|"debug,embed"|"hidden"

---Supported warning levels
---@alias WarningLevel string|"none"|"less"|"more"|"all"|"allextra"|"everything"|"error"

---Supported optimization levels
---@alias OptimizeLevel string|"none"|"fast"|"faster"|"fastest"|"smallest"|"aggressive"

---Supported language standards
---@alias LanguageStandard string|LanguageStandard.c|LanguageStandard.cxx
---@alias LanguageStandard.c "ansi"|"c89"|"gnu89"|"c99"|"gnu99"|"c11"|"c17"|"clatest"
---@alias LanguageStandard.cxx "cxx98"|"gnuxx98"|"cxx11"|"gnuxx11"|"cxx14"|"gnuxx14"|"cxx1z"|"gnuxx1z"|"cxx17"|"gnuxx17"|"cxx20"|"gnuxx20"|"cxxlatest"|"gnuxxlatest"

---Supported floating-point compilation modes
---@alias FloatPointMode string|"presise"|"fast"|"strict"|"except"|"noexcept"

---Supported vector extension instructions
---@alias VectorextSet string|"all"|"mmx"

---Access modifiers
---@class AccessSpecifier
---@field public public? boolean
---@field public private? boolean
---@field public interface? boolean
---@field public inherit? boolean

---Compilation options
---@class CompilationOpts
---@field rule? string Rule
---@field cflags? string Parameters for the C compiler
---@field mflags? string Parameters for the Objective-C compiler
---@field cxxflags? string Parameters for the C++ compiler
---@field mxxflags? string Parameters for the Objective-C++ compiler
---@field defines? string Macro definitions
---@field languages? LanguageStandard Language standards
---@field includedirs? string Include directories
---@field force? CompilationOpts Force settings

---Configuration for compilation options
---@class CompilationFlagAttr
---@field force? boolean Force settings

---Options for prefix directories
---@class PrefixdirOpts
---@field bindir? string Path for the `bin` directory
---@field libdir? string Path for the `lib` directory
---@field includedir? string Path for the `include` directory

---Template variable configuration
---@class ConfigvarOpts
---@field quote boolean Whether to wrap in quotes
---@field escape boolean Whether to escape automatically

---Supported build behavior policies
---Run `xmake l core.project.policy.policies` for details
---@alias BuildPolicy string

---Supported exception types
---@alias ExceptionType string|"cxx"|"no-cxx"|"objc"|"no-objc"

---Testing configuration
---@class TestOpts
---@field group? string Name of the test group
---@field rundir? string Directory to execute in
---@field runargs? string Arguments for execution
---@field runenvs? table<string, string> Environment variables for execution
---@field trim_output? boolean Whether to trim whitespace from the output
---@field pass_outputs? string|string[] Output patterns that indicate a passing test
---@field fail_outputs? string|string[] Output patterns that indicate a failing test
---@field plain? boolean Whether to disable Lua pattern matching

---Build script hooks
---@alias TargetHook fun(target: Target): nil
---@alias TargetBuildFileHook fun(target: Target, srcfile: string, opts?: TargetBuildOpts): nil
---@alias TargetBuildFilesHook fun(target: Target, srcfiles: TargetBuildSourceBatch, opts?: TargetBuildOpts): nil
---@alias TargetBuildcmdFileHook fun(target: Target, batchcmds: BatchCommand, srcfile: string, opts?: TargetBuildOpts): nil
---@alias TargetBuildcmdFilesHook fun(target: Target, batchcmds: BatchCommand, srcfiles: TargetBuildSourceBatch, opts?: TargetBuildOpts): nil

---@class TargetBuildOpts
---@field progress string Current compilation progress

---@class TargetBuildSourceBatch
---@field rulename string Name of the rule
---@field sourcefiles string[] List of source files

---@alias TargteBatchRunOpts { envs: table<string, string> }

---@class BatchCommand
---@field runv fun(self: self, cmd: string, args: string[], opts?: TargteBatchRunOpts): nil
---@field vrunv fun(self: self, cmd: string, args: string[], opts?: TargteBatchRunOpts): nil
---@field execv fun(self: self, cmd: string, args: string[], opts?: TargteBatchRunOpts): nil
---@field vexecv fun(self: self, cmd: string, args: string[], opts?: TargteBatchRunOpts): nil
---@field compile fun(self: self, source: string, object: string, opts?: { configs: { includedirs: string, languages: string } }): nil
---@field compilv fun(self: self, args: string[], opts?: { configs: { includedirs: string, languages: string } }): nil
---@field link fun(self: self, object: string, target: string, opts?: { configs: { linkdirs: string } }): nil
---@field mkdir fun(self: self, dir: string): nil
---@field rm fun(self: self, path: string): nil
---@field cp fun(self: self, srcpath: string, dstpath: string, opts?: { rootdir: string, symlink: boolean }): nil
---@field mv fun(self: self, srcpath: string, dstpath: string, opts?: { force: boolean }): nil
---@field ln fun(self: self, srcpath: string, dstpath: string, opts?: { force: boolean }): nil
---@field show fun(self: self, format: string, ...: string): nil
---@field show_progress fun(self: self, progress: string, format: string, ...: string): nil
---@field clean_rpath fun(self: self, filepath: string, opt?: table)
---@field insert_rpath fun(self: self, filepath: string, rpath: string, opt?: table)
---@field remove_rpath fun(self: self, filepath: string, rpath: string, opt?: table)
---@field change_rpath fun(self: self, filepath: string, rpath_old: string, rpath_new: string, opt?: table)
---@field add_depfiles fun(self: self, file: string, ...: string): nil
---@field add_depvalues fun(self: self, value: string, ...: string): nil
---@field set_depmtime fun(self: self, time: integer, ...: integer): nil
---@field set_depcache fun(self: self, name: string, ...: string): nil

---@alias ToolsetNames
---|string
---|"cc" C compiler
---|"cxx" C++ compiler
---|"mm" Objective-C compiler
---|"mxx" Objective-C++ compiler
---|"gc" Go compiler
---|"as" Assembler
---|"sc" Swift compiler
---|"fc" Fortran compiler
---|"rust" Rust compiler
---|"strip" Strip tool
---|"ld" Linker for C/C++/Asm/Objective-C/Rust executables
---|"sh" Linker for C/C++/Asm/Objective-C/Rust dynamic libraries
---|"ar" Archiver for C/C++/Asm/Objective-C/Rust static libraries
---|"dcld" Dlang executable linker, similar to `rcld`/`gcld`
---|"dcsh" Dlang dynamic linker, similar to `rcsh`/`gcsh`

---@alias Toolchainon string|"armcc"|"armclang"|"c51"|"circle"|"clang"|"clang-12"|"clang-13"|"clang-14"|"clang-15"|"clang-16"|"clang-17"|"clang-18"|"clang-19"|"clang-20"|"clang-cl"|"cosmocc"|"cross"|"cuda"|"dlang"|"dmd"|"dpcpp"|"emcc"|"envs"|"fasm"|"fpc"|"gcc"|"gcc-10"|"gcc-11"|"gcc-12"|"gcc-13"|"gcc-14"|"gcc-4.8"|"gcc-4.9"|"gcc-8"|"gcc-9"|"gdc"|"gfortran"|"gnu-rm"|"go"|"hdk"|"icc"|"icx"|"ifort"|"ifx"|"iverilog"|"ldc"|"llvm"|"masm32"|"mingw"|"msvc"|"muslcc"|"nasm"|"ndk"|"nim"|"rust"|"sdcc"|"swift"|"tinycc"|"verilator"|"wasi"|"xcode"|"yasm"|"zig"
---@class ToolchainonOpts
---@field plat? string
---@field arch? string

---@class RequireOpts
---@field alias? string Add alias
---@field system? boolean Disable system package
---@field verify? boolean Disable package verification
---@field debug? boolean Enable debug package
---@field private private? boolean Use as a private package
---@field configs? PackageConfig Package configuration

---@class RequireconfsOpts
---@field override? boolean
---@field version? string
---@field system? boolean Disable system package
---@field verify? boolean Disable package verification
---@field debug? boolean Enable debug package
---@field configs? PackageConfig Package configuration

---@class PackageConfig
---@field shared boolean Whether it is a shared library
---@field pic boolean Disable PIC support
---@field lto boolean Enable LTO support
---@field asan boolean Enable address sanitizer
---@field runtime Runtime Runtime support
---@field vs_runtime VSRuntime MSVC runtime support
---@field toolchainon boolean Used only for cross-compilation settings
---@field cflags string|string[] Set C compiler options
---@field cxflags string|string[] Set C/C++ compiler options
---@field cxxflags string|string[] Set C++ compiler options
---@field asflags string|string[] Set assembler options
---@field ldflags string|string[] Set linker options
---@field shflags string|string[] Set dynamic linker options
---@field [string] any Additional configurations

---Supported runtime options
---@alias Runtime string|"MT"|"MD"|"MTd"|"MDd"|"c++_static"|"c++_shared"|"stdc++_static"|"stdc++_shared"

---Supported MSVC runtime options
---@alias VSRuntime string|"MT"|"MD"|"MTd"|"MDd"

---Supported package types
---@alias PackageKind string|"binary"|"toolchain"|"library"|"template"|"headeronly"
---@alias PackagePlatform string|"windows"|"linux"|"cross"|"macosx"|"android"|"iphoneos"|"watchos"

---@alias PackageHook fun(package: Package): nil
---@alias PackageOptsHook fun(package: Package, opts: PackageOpts): nil
---@alias PackageDownloadHook fun(package: Package, opts: PackageDownloadOpts): nil
---@alias PackageComponentHook fun(package: Package, opts: any): nil

---@class PackageUrlOpts
---@field version? fun(version: string): string Convert version
---@field alias? string Add alias for URL
---@field http_headers? string[] Set HTTP headers

---@class LinkGroupOpts
---@field name? string Name of the link group
---@field group? boolean Enable link group
---@field whole? boolean
---@field static? boolean

---@class PackageOpts
---@field system? boolean Is a system package
---@field external? boolean Is an external package
---@field require_version? string Required version

---@class PackageDownloadOpts
---@field sourcedir? string Source directory
---@field url? string
---@field url_alias? string

---@class PackagePatch
---@field url string
---@field sha256 string

---@class PackageCheckSnippet
---@field test string Code snippet to test

---@class HasCheckOpts
---@field includes? string
---@field configs? HasCheckOpts.configs

---@class HasCheckOpts.configs
---@field defines? string
---@field languages? string

---@class Version
local Version = {}
---@return string
function Version:major() end
---@return string
function Version:minor() end
---@return string
function Version:patch() end

---@class TaskMenu
---@field usage string Menu usage
---@field description string Menu description
---@field options TaskMenuOption[] Menu options

---@class TaskMenuOption: string

---@class SourceBatch
---@field sourcekind string Source file type
---@field rulename string Rule name
---@field sourcefiles string[] List of source files
---@field objectfiles string[] List of object files
---@field dependfiles string[] List of dependency files

---@alias XPackFormats string|"nsis"|"zip"|"targz"|"srczip"|"srctargz"|"runself"|"rpm"|"srpm"|"deb"
---@alias XPackHook fun(package: Package): nil
---@alias XPackcmdHook fun(package: Package, batchcmds: BatchCommand): nil

---@alias XPackComponentHook fun(component: table): nil
---@alias XPackComponencmdtHook fun(component: table, batchcmds: BatchCommand): nil
