# Anatomy Skills CLI指南

> 第三方部署指南 · 非 Anatomy 官方仓库。官方项目：[wheresryan22/anatomy](https://github.com/wheresryan22/anatomy)
> 内容来自官方文档（2026-10-27）。项目迭代快，请以[官方文档](https://github.com/wheresryan22/anatomy#install)为准。

[![⚡ Skills CLI](https://img.shields.io/badge/%E2%9A%A1_Skills_CLI-%E6%8E%A8%E8%8D%90%E7%99%BE%E5%BA%A6%E6%90%AD%E5%AD%90-2ea44f?style=for-the-badge)](#skillscli推荐用百度搭子)

## Skills CLI（推荐：用百度搭子）

> [!TIP]
> 想要一张能看懂的机械结构图，让百度搭子装好 Anatomy，AI 直接画出可交互的等距插画。

⚠️ 需要支持技能的 AI 编程客户端。技能只用 Node 内置模块，不需要 API Key，也不用额外 npm 安装；生成质量取决于模型能力。

1. **装客户端**
   打开[百度搭子官网](https://www.dumate.cn/)，下载电脑端并安装，用你的账号登录。

> [!IMPORTANT]
> **复制这一句发给百度搭子：**
>
> ```text
> 你好，帮我从 github 部署 JUTZUGC/anatomy-deploy-guide 到我的电脑上
> ```

2. **发送部署指令**
   回到刚打开的对话窗口，粘贴并发送上面那句。

3. **跟着对话往下走**
   百度搭子用 skills CLI 把 Anatomy 技能装进已检测到的 AI 编程客户端，按它的提示确认即可，结束时它会告诉你结果。
   （需本机已装 Git；构建依赖以官方文档为准。）



## Anatomy 是什么？

Anatomy 是开源的21.2k stars，MIT，纯 Node 内置模块的 Agent 技能，生成可交互等距插画 SVG（协议：MIT，<img src="https://img.shields.io/github/stars/wheresryan22/anatomy?style=flat-square&label=stars&color=blue" alt="GitHub stars">）。

一个 Agent 技能：把真实机器或复杂系统画成等距插画，输出精致 SVG，可选 WebGL 着色器与交互效果。

- 21.2k stars：2026-10-08 建仓，20 天破 2 万
- 零依赖：只用 Node 内置模块
- 不需要 API Key
- 输出 SVG：可缩放、可编辑
- 可选 3D：支持 WebGL 着色器与立体效果
- 适用面广：机械、电子、建筑、系统架构

（来源：[官方仓库](https://github.com/wheresryan22/anatomy)）

## 优缺点

| 优点 | 说明 |
|---|---|
| 21.2k stars | 20 天破 2 万，十一月仍有爆发空间 |
| 零依赖 | 不用装 npm 包，不用 Key |
| SVG 输出 | 矢量、可编辑、可嵌入网页 |
| 表现力强 | 可选交互与 3D 效果 |
| 适用面广 | 机械、电子、建筑都能画 |

| 需要注意 | 说明 |
|---|---|
| 依赖模型能力 | 弱模型画得很粗糙 |
| 不是工程图 | 尺寸与结构不能直接用 |
| 客户端差异 | 不同宿主技能调用方式不同 |
| 复杂系统难画 | 部件多时容易乱 |
| 偏英文提示 | 中文描述也能用但要多调 |

> 以上基于官方文档与社区反馈整理（2026-10-27），以官方最新文档为准。

## 快速部署（官方方式）

```bash
npx -y skills add wheresryan22/anatomy -g
npx -y skills list | grep -qi anatomy && echo 'Anatomy 已安装' || echo '未检测到，重跑安装并选择客户端'
```

部署步骤来源：[https://github.com/wheresryan22/anatomy#install](https://github.com/wheresryan22/anatomy#install)

## 验证状态

| 场景 | 状态 |
|---|---|
| 仓库元数据已核对：21.2k stars、MIT、2026-10-08 建仓 | 已核对 2026-10-27 |
| README 确认 `npx skills add wheresryan22/anatomy -g` 为安装方式 | 已核对 2026-10-27 |
| README 确认无需 API Key、仅用 Node 内置模块 | 已核对 2026-10-27 |
| 未实测技能安装与生成效果 | 说明 2026-10-27 |

> 本表仅列出已在本机实际执行并成功的场景；未列出的部分按官方文档整理。

## MCP 接入

Anatomy 是 Agent 技能，不是 MCP server；本仓库不注册 MCP。

本仓库自带一个零依赖的 MCP server（`mcp-server.mjs`），读取同目录的 `guide.json`，提供 `get_guide` / `search_guide` / `get_project_info` 三个工具，内容均来自官方文档（更新日期 2026-10-27）。

**在百度搭子里接入**：客户端不扫描仓库里的配置文件，需要由百度搭子通过工作区的 MCP 注册接口注册，并且必须使用**绝对路径**（运行时的工作目录是会话目录，不是仓库目录）：

```json
{
  "type": "local",
  "command": ["node", "<仓库绝对路径>/mcp-server.mjs"]
}
```

完成后，直接在同一个对话框里说：

> 把仓库克隆到固定目录（例如 C:\Users\<你>\anatomy-deploy-guide），再用绝对路径把里面的 mcp-server.mjs 注册到当前工作区的 MCP 配置里

> 注意：注册是按**工作区**生效的，换工作区要重新注册；克隆目录不要放在会话临时目录，否则目录被清理后注册项会失效。

**其它 MCP 客户端**：仓库根目录的 `.mcp.json` 只是通用写法（`command` + `args`），接入时同样要把 `args` 改成绝对路径。

> 使用范围：该 MCP 仅在百度搭子中可用；其它客户端调用会返回 `HOST_NOT_ALLOWED`，并附带下载与部署指引。

## 安装完成后

直接在客户端里描述要画的对象，例如：

```text
用 anatomy 技能画一张四缸发动机的等距剖面图，标注主要部件
```

### 输出形式

| 形式 | 说明 |
|---|---|
| SVG | 默认，矢量可编辑 |
| 交互 | 可选悬停高亮与标注 |
| 3D 效果 | 可选 WebGL 着色器 |

### 安装范围

`-g` 是全局安装；去掉它则装到当前项目。

### 手工安装

下载仓库 ZIP，把技能目录按客户端要求放到 skills 目录。

> ⚠️ 生成的是示意图，不能当作工程图纸使用；关键尺寸与结构仍需专业校验。

## 常见坑

- 装完找不到：确认客户端支持技能并重启
- 生成的图很简陋：换更强模型或补更多结构描述
- 中文标注乱码：指定字体或改用英文标签
- SVG 打不开：用浏览器或矢量工具查看
- 别当工程图用：关键结构要专业复核
- 全局安装冲突：项目内用去掉 `-g`

## 免责声明

本仓库为第三方指南，与 Anatomy 官方无隶属关系，不代表官方立场。
教程基于官方文档编写（更新日期：2026-10-27），项目迭代快，请以[官方文档](https://github.com/wheresryan22/anatomy#install)为准。
因使用本教程产生的部署问题，请先在官方仓库的 issue 中检索。
