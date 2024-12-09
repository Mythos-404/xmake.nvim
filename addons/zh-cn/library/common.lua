---@meta
--- xmake version: v2.9.6+20241030

---支持的操作系统
---@alias OperationSystem string|"windows"|"linux"|"android"|"macosx"|"ios"

---支持的编译架构
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

---支持的平台
---@alias Platform string|"windows"|"linux"|"cross"|"macosx"|"android"|"iphoneos"|"watchos"

---支持的主机操纵系统
---@alias Host string|"windows"|"linux"|"macosx"

---支持的主机子系统环境
---@alias SubHost string|"msys"|"cygwin"

---支持的主机子系统架构
---@alias SubArch string|"x86_64"|"i386"

---支持的编译模式
---@alias CompilationMode string|"debug"|"profile"|"release"|"releasedbg"|"asan"|"check"|"coverage"|"lsan"|"minsizerel"|"msan"|"tsan"|"ubsan"|"valgrind"

---支持的目标类型
---@alias TargetKind string|"phony"|"static"|"shared"|"object"|"headeronly"|"binary"

---范围配置语法
---@alias ScopeSyntax fun(): nil

---支持的 strip 模式
---@alias StripMode string|"debug"|"all"

---支持的调试符号
---@alias SymbolInfo string|"debug"|"debug,edit"|"debug,embed"|"hidden"

---支持的警告等级
---@alias WarningLevel string|"none"|"less"|"more"|"all"|"allextra"|"everything"|"error"

---支持的优化等级
---@alias OptimizeLevel string|"none"|"fast"|"faster"|"fastest"|"smallest"|"aggressive"

---支持的语言标准
---@alias LanguageStandard string|LanguageStandard.c|LanguageStandard.cxx
---@alias LanguageStandard.c "ansi"|"c89"|"gnu89"|"c99"|"gnu99"|"c11"|"c17"|"clatest"
---@alias LanguageStandard.cxx "cxx98"|"gnuxx98"|"cxx11"|"gnuxx11"|"cxx14"|"gnuxx14"|"cxx1z"|"gnuxx1z"|"cxx17"|"gnuxx17"|"cxx20"|"gnuxx20"|"cxxlatest"|"gnuxxlatest"

---支持的浮点数的编译模式
---@alias FloatPointMode string|"presise"|"fast"|"strict"|"except"|"noexcept"

---支持的向量扩展指令
---@alias VectorextSet string|"all"|"mmx"

---访问修饰符
---@class AccessSpecifier
---@field public public? boolean
---@field public private? boolean
---@field public inteface? boolean
---@field public inherit? boolean

---编译选项
---@class CompilationOpts
---@field rule? string 规则
---@field cflags? string c 编译器的参数
---@field mflags? string objc 编译器的参数
---@field cxxflags? string c++ 编译器的参数
---@field mxxflags? string objc++ 编译器的参数
---@field defines? string 声明宏
---@field languages? LanguageStandard 语言版本
---@field includedirs? string 导入的文件夹
---@field force? CompilationOpts 强制设置

---编译选项的配置
---@class CompilationFlagAttr
---@field force? boolean 强制设置

---前缀目录的选项
---@class PrefixdirOpts
---@field bindir? string bin 目录
---@field libdir? string lib 目录
---@field includedir? string included 目录

---模板变量配置
---@class ConfigvarOpts
---@field quote boolean 是否使用引号包裹
---@field escape boolean 是否自动转义

---支持配置的构建行为策略
---请运行`xmake l core.project.policy.policies`查看详情
---@alias BuildPolicy string

---支持的异常类型
---@alias ExceptionType string|"cxx"|"no-cxx"|"objc"|"no-objc"

---测试配置
---@class TestOpts
---@field group? string 测试组名称
---@field rundir? string 运行的文件夹
---@field runargs? string 运行的参数
---@field runenvs? table<string, string> 运行的环境变量
---@field trim_output? boolean 是否对输出截断空白字符
---@field pass_outputs? string|string[] 如果输出匹配, 则测试通过
---@field fail_outputs? string|string[] 如果输出匹配, 则测试失败
---@field plain? boolean 是否禁用 lua 模式匹配

---构建脚本的Hook
---@alias TargetHook fun(target: Target): nil
---@alias TargetBuildFileHook fun(target: Target, srcfile: string, opts?: TargetBuildOpts): nil
---@alias TargetBuildFilesHook fun(target: Target, srcfiles: TargetBuildSourceBatch, opts?: TargetBuildOpts): nil
---@alias TargetBuildcmdFileHook fun(target: Target, batchcmds: BatchCommand, srcfile: string, opts?: TargetBuildOpts): nil
---@alias TargetBuildcmdFilesHook fun(target: Target, batchcmds: BatchCommand, srcfiles: TargetBuildSourceBatch, opts?: TargetBuildOpts): nil

---@class TargetBuildOpts
---@field progress string 当前的编译进度

---@class TargetBuildSourceBatch
---@field rulename string 所在规则的名称
---@field sourcefiles string[] 源文件列表

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
---|"cc" C 编译器
---|"cxx" C++ 编译器
---|"mm" Objc 编译器
---|"mxx" Objc++ 编译器
---|"gc" Go 编译器
---|"as" 汇编器
---|"sc" Swift 编译器
---|"fc" Fortran 编译器
---|"rust" Rust 编译器
---|"strip" Strip 编译器
---|"ld" C/C++/Asm/Objc/Rust 等通用可执行程序链接器
---|"sh" C/C++/Asm/Objc/Rust 等通用动态库链接器
---|"ar" C/C++/Asm/Objc/Rust 等通用静态库归档器
---|"dcld" Dlang可执行链接器, rcld/gcld 等类似
---|"dcsh" Dlang动态库链接器, rcsh/gcsh 等类似

---@alias Toolchainon string|"armcc"|"armclang"|"c51"|"circle"|"clang"|"clang-12"|"clang-13"|"clang-14"|"clang-15"|"clang-16"|"clang-17"|"clang-18"|"clang-19"|"clang-20"|"clang-cl"|"cosmocc"|"cross"|"cuda"|"dlang"|"dmd"|"dpcpp"|"emcc"|"envs"|"fasm"|"fpc"|"gcc"|"gcc-10"|"gcc-11"|"gcc-12"|"gcc-13"|"gcc-14"|"gcc-4.8"|"gcc-4.9"|"gcc-8"|"gcc-9"|"gdc"|"gfortran"|"gnu-rm"|"go"|"hdk"|"icc"|"icx"|"ifort"|"ifx"|"iverilog"|"ldc"|"llvm"|"masm32"|"mingw"|"msvc"|"muslcc"|"nasm"|"ndk"|"nim"|"rust"|"sdcc"|"swift"|"tinycc"|"verilator"|"wasi"|"xcode"|"yasm"|"zig"
---@class ToolchainonOpts
---@field plat? string
---@field arch? string

---@class RequireOpts
---@field alias? string 添加别名
---@field system? boolean 是否禁用系统包
---@field verify? boolean 是否禁用包校验
---@field debug? boolean 是否启用调试包
---@field public private? boolean 是否作为私有包
---@field configs? PackageConfig 包的配置

---@class RequireconfsOpts
---@field override? boolean
---@field version? string
---@field system? boolean 是否禁用系统包
---@field verify? boolean 是否禁用包校验
---@field debug? boolean 是否启用调试包
---@field configs? PackageConfig 包的配置

---@class PackageConfig
---@field shared boolean 是否为动态库
---@field pic boolean 是否禁用 PIC 支持
---@field lto boolean 是否启用 LTO 支持
---@field asan boolean 是否启用地址擦除
---@field runtime Runtime 运行时支持
---@field vs_runtime VSRuntime MSVC 运行时支持
---@field toolchainon boolean 仅作为交叉编译设置
---@field cflags string|string[] 设置 C 编译选项
---@field cxflags string|string[] 设置 C/C++ 编译选项
---@field cxxflags string|string[] 设置 C++ 编译选项
---@field asflags string|string[] 设置汇编器选项
---@field ldflags string|string[] 设置链接器选项
---@field shflags string|string[] 设置动态链接器选项
---@field [string] any 其他配置

---支持的运行时
---@alias Runtime string|"MT"|"MD"|"MTd"|"MDd"|"c++_static"|"c++_shared"|"stdc++_static"|"stdc++_shared"

---支持的 MSVC 运行时
---@alias VSRuntime string|"MT"|"MD"|"MTd"|"MDd"

---支持的包类型
---@alias PackageKind string|"binary"|"toolchain"|"library"|"template"|"headeronly"
---@alias PackagePlatform string|"windows"|"linux"|"cross"|"macosx"|"android"|"iphoneos"|"watchos"

---@alias PackageHook fun(package: Package): nil
---@alias PackageOptsHook fun(package: Package, opts: PackageOpts): nil
---@alias PackageDownloadHook fun(package: Package, opts: PackageDownloadOpts): nil
---@alias PackageComponentHook fun(package: Package, opts: any): nil

---@class PackageUrlOpts
---@field version? fun(version: string): string 转换版本
---@field alias? string 添加连接别名
---@field http_headers? string[] 设置 Http Headers

---@class LinkGroupOpts
---@field name? string 链接组名称
---@field group? boolean 是否开启链接组
---@field whole? boolean
---@field static? boolean

---@class PackageOpts
---@field system? boolean 是否为系统包
---@field external? boolean 是否为外部包
---@field require_version? string 所需版本

---@class PackageDownloadOpts
---@field sourcedir? string 源码目录
---@field url? string
---@field url_alias? string

---@class PackagePatch
---@field url string
---@field sha256 string

---@class PackageCheckSnippet
---@field test string 要测试的片段

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
function Version:major() end
---@return string
function Version:major() end

---@class TaskMenu
---@field usage string 菜单用法
---@field description string 菜单描述
---@field options TaskMenuOption[] 菜单选项

---@class TaskMenuOption: string

---@class SourceBatch
---@field sourcekind string 源文件类型
---@field rulename string 规则名称
---@field sourcefiles string[] 源文件列表
---@field objecetfiles string[] 获取目标文件列表
---@field dependfiles string[] 依赖文件列表

---@alias XPackFormats string|"nsis"|"zip"|"targz"|"srczip"|"srctargz"|"runself"|"rpm"|"srpm"|"deb"
---@alias XPackHook fun(package: Package): nil
---@alias XPackcmdHook fun(package: Package, batchcmds: BatchCommand): nil

---@alias XPackComponentHook fun(component: table): nil
---@alias XPackComponencmdtHook fun(component: table, batchcmds: BatchCommand): nil
