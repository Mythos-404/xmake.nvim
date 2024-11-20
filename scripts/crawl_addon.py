# /// script
# requires-python = ">=3.12"
# dependencies = [
#     "requests",
# ]
#
# [[tool.uv.index]]
# url = "https://mirrors.bfsu.edu.cn/pypi/web/simple"
# default = true
# ///

from dataclasses import dataclass
from typing import Literal

import requests

CRAWLING_MANUAL_NAMES = [
    "builtin_modules",
    "conditions",
    "configuration_option",
    "custom_rule",
    "custom_toolchain",
    "global_interfaces",
    "package_dependencies",
    "plugin_task",
    "project_target",
    "xpack",
]
CRAWLING_MANUAL_NAMES_INSTANCE = [
    "option_instance",
    "package_instance",
    "target_instance",
]
LANG_LINK = {
    "en": {
        "source": "https://raw.githubusercontent.com/xmake-io/xmake-docs/master/manual/{0}.md",
        "link": "https://xmake.io/#/manual/{0}",
    },
    "zh-cn": {
        "source": "https://raw.githubusercontent.com/xmake-io/xmake-docs/master/zh-cn/manual/{0}.md",
        "link": "https://xmake.io/#/zh-cn/manual/{0}",
    },
}

type I18 = Literal["zh-cn", "en"]


@dataclass()
class FunctionInfo:
    name: str
    description: str
    link_id: str
    scope: str | None = None


@dataclass()
class ManualData:
    manual_name: str
    functions: list[FunctionInfo]
    lang: I18
    instance: bool

    @staticmethod
    def new(name: str, lang: I18, instance=False):
        res = requests.get(LANG_LINK[lang]["source"].format(name))
        lines = res.text.splitlines()

        functions: list[FunctionInfo] = []
        id_prefix, desc_prefix = ("### ", "#### ") if not instance else ("#### ", "- ")

        current_id = ""
        for line in map(str.strip, lines):
            if line.startswith(id_prefix):
                current_id = line[len(id_prefix) :]
            elif line.startswith(desc_prefix):
                description = line[len(desc_prefix) :]
                ids = current_id.split(":")

                function_name = current_id.capitalize() if instance else (ids[1] if len(ids) == 2 else current_id)
                scope = ids[0] if len(ids) == 2 and not instance else None
                functions.append(FunctionInfo(function_name, description, current_id.replace(":", ""), scope))

        return ManualData(name, functions, lang, instance)


def save_manual_data(data: ManualData):
    as_lang = lambda en, cn: en if data.lang == "en" else cn
    with open(f"./addons/{data.lang}/library/{data.manual_name}.lua", "w", encoding="utf-8") as f:
        f.write("---@meta\n")
        f.write(f"---[{data.manual_name}](")
        f.write(LANG_LINK[data.lang]["link"].format(data.manual_name))
        f.write(")\n")
        for func_info in data.functions:
            if func_info.scope is None:
                f.write(f"""
---
---{func_info.description}
---
---[{as_lang("Open in browser", "在浏览器中打开")}]({LANG_LINK[data.lang]['link'].format(data.manual_name)}?id={func_info.link_id})
---
---@param
---@return
function {func_info.name}() end
                    """)
            else:
                f.write(f"""
---
---**{as_lang("Scoped", "范围")}: {func_info.scope}**
---
---{func_info.description}
---
---[{as_lang("Open in browser", "在浏览器中打开")}]({LANG_LINK[data.lang]['link'].format(data.manual_name)}?id={func_info.link_id})
---
---@param
---@return
function {func_info.name}() end
                    """)


def main():
    for lang in ("zh-cn", "en"):
        manual_datas = [ManualData.new(manual_name, lang) for manual_name in CRAWLING_MANUAL_NAMES]
        manuali_datas = [ManualData.new(manual_name, lang, True) for manual_name in CRAWLING_MANUAL_NAMES_INSTANCE]
        list(map(save_manual_data, manual_datas))
        list(map(save_manual_data, manuali_datas))


if __name__ == "__main__":
    main()
