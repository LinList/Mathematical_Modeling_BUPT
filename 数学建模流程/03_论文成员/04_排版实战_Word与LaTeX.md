# 排版实战：Word与LaTeX

## 本节导读

> 内容写得好，排版也得跟上。一篇排版混乱的论文，就像穿着睡衣去面试——内容再好，第一印象就输了。
>
> 本节分两部分：Word篇（适合新手，快速上手）和LaTeX篇（进阶推荐，公式和排版更专业）。两部分都从零开始讲，给你可直接用的参数和代码。无论你选哪个工具，跟着做就能排出竞赛级的论文。

---

# Word 排版篇（适合新手）

## 一、页面设置

### 页边距

国赛论文一般要求A4纸，页边距建议设置：

| 参数 | 推荐值 |
|------|--------|
| 上边距 | 2.5cm |
| 下边距 | 2.5cm |
| 左边距 | 2.5cm（装订侧可设3cm） |
| 右边距 | 2.2cm |
| 页眉 | 1.5cm |
| 页脚 | 1.75cm |

**设置方法**：布局→页面设置→页边距→自定义页边距

### 行距

- 正文行距：**1.25倍或1.5倍**行距
- 段前段后：0磅或6磅
- 设置方法：选中文字→开始→段落→行距

### 字体规范

| 元素 | 字体 | 字号 |
|------|------|------|
| 论文标题（大标题） | 黑体 | 三号（16pt） |
| 一级标题 | 黑体 | 四号（14pt） |
| 二级标题 | 黑体 | 小四（12pt） |
| 三级标题 | 黑体 | 小四（12pt） |
| 正文 | 宋体 | 小四（12pt） |
| 公式 | Times New Roman / Cambria Math | 小四（12pt） |
| 图表标题 | 宋体 | 五号（10.5pt） |
| 表格内容 | 宋体 | 五号（10.5pt） |
| 摘要正文 | 宋体 | 小四（12pt） |
| 参考文献 | 宋体 | 五号（10.5pt） |

> **小贴士**：数学符号和英文用 Times New Roman，中文用宋体。公式中的变量用斜体。全文字体保持统一，不要一会儿宋体一会儿楷体。

---

## 二、标题样式设置

### 为什么要用"样式"

很多新手直接选中文字改字号字体——这是坏习惯。正确做法是使用Word的**样式功能**：

1. 修改"标题1""标题2""标题3"样式为你需要的格式
2. 写正文时，把光标放在标题行，点一下对应样式即可
3. 好处：格式全篇统一、可以自动生成目录、修改样式时全篇同步更新

### 设置方法

1. 开始→样式→右键"标题1"→修改
2. 设置字体（黑体）、字号（四号）、加粗、段前段后间距
3. 同理设置"标题2""标题3"和"正文"

### 各级标题格式建议

| 样式 | 格式 |
|------|------|
| 标题1 | 黑体四号，加粗，段前24磅段后12磅，居左 |
| 标题2 | 黑体小四，加粗，段前12磅段后6磅，居左 |
| 标题3 | 黑体小四，加粗，段前6磅段后6磅，居左 |
| 正文 | 宋体小四，行距1.25倍，首行缩进2字符 |

---

## 三、公式编辑

### Word自带公式编辑器

**打开方式**：插入→公式（快捷键 `Alt + =`）

**常用公式快捷输入**（在公式框内）：

| 输入 | 显示 |
|------|------|
| `\frac{a}{b}` | 分数 a/b |
| `\sqrt{x}` | 根号 |
| `\sum_{i=1}^{n}` | 求和 |
| `\int_{a}^{b}` | 积分 |
| `\lim_{n \to \infty}` | 极限 |
| `x^{2}` | 上标 |
| `x_{i}` | 下标 |
| `\alpha \beta \gamma` | 希腊字母 |
| `\leq \geq` | ≤ ≥ |
| `\times \cdot` | × · |
| `\begin{matrix} a & b \\ c & d \end{matrix}` | 矩阵 |

> **小贴士**：Word公式编辑器支持 LaTeX 语法输入。在公式框里输入 `\frac` 然后按空格，会自动变成分数模板。熟练后输入公式很快。

### MathType（推荐插件）

如果公式多，建议安装 **MathType** 插件，比Word自带公式编辑器更强大：

- 公式排版更美观
- 支持公式编号自动管理
- 可以批量修改公式格式

**MathType常用技巧**：
- `Alt + Q`：插入行内公式
- `Alt + Shift + Q`：插入独立公式
- 公式编号：MathType→插入公式编号→自动编号

### 公式编号怎么排

竞赛论文中，独立公式需要编号，放在**公式右侧**：

```
                    e_j = -1/ln(n) * Σ p_ij * ln(p_ij)    (1)
```

**Word中实现**：
- 方法1：用表格（一行三列：空、公式、编号），隐藏边框
- 方法2：MathType自动编号
- 方法3：用制表位对齐

> **避坑指南**：公式编号一定要连续，正文中引用时要对应。比如"如式(3)所示"，式(3)的编号确实是3。最后检查时逐个核对。

---

## 四、图表插入与排版

### 图片插入

1. 插入→图片→选择图片
2. 图片格式→文字环绕→**嵌入型**（推荐）
3. 图片居中：选中图片→开始→居中

### 图文混排技巧

- 图片设为"嵌入型"，和文字一样占行，排版最稳定
- 图片大小：宽度不超过页面文本宽度（约15cm）
- 图题在图片下方，居中，五号宋体
- 图片和图题之间不要有空行（段后间距设小一点）

### 表格排版

- 表格居中
- 使用三线表（去掉所有边框，只加顶线、表头线、底线）
- 表题在表格上方，居中，五号宋体
- 表格内容字号比正文小一号（五号）

**三线表制作步骤**：
1. 插入表格
2. 选中整个表格→表格设计→边框→无框框
3. 选中第一行（表头）→边框→上框线（1.5磅）+ 下框线（0.75磅）
4. 选中最后一行→边框→下框线（1.5磅）

---

## 五、自动生成目录

### 前提条件

必须使用了"标题1""标题2""标题3"样式，才能自动生成目录。

### 生成方法

1. 光标放在目录页
2. 引用→目录→自动目录1（或自动目录2）
3. 目录自动生成

### 更新目录

论文修改后，目录需要更新：
- 右键目录→更新域→更新整个目录

> **小贴士**：最后提交前一定要更新一次目录！很多人忘了更新，目录页码和正文对不上，评委翻到目录发现页码错了，印象分大减。

---

## 六、参考文献管理

### 手动管理（简单粗暴）

在论文最后手动写参考文献列表，正文中用 `[1]` `[2]` 标注。

**注意**：手动管理要确保编号连续、正文引用和列表对应。

### 用Word交叉引用（推荐）

1. 论文最后写好参考文献列表，每条用编号列表
2. 正文中需要引用时：引用→交叉引用→引用类型选"编号项"→选择对应文献
3. 好处：文献顺序调整时，正文编号自动更新

---

## 七、Word排版常见问题及解决方案

| 问题 | 原因 | 解决方案 |
|------|------|---------|
| 公式和文字不在一行 | 公式行距问题 | 选中公式行→段落→行距设为"单倍行距" |
| 图片位置乱跑 | 环绕方式不对 | 图片设为"嵌入型" |
| 目录页码不对 | 忘记更新目录 | 右键目录→更新域 |
| 表格跨页断开 | 表格属性设置 | 表格属性→行→允许跨页断行（取消勾选） |
| 公式编号对不齐 | 没用制表位或表格 | 用三列无边框表格对齐 |
| 字体突然变了 | 从其他地方粘贴 | 粘贴时用"只保留文本" |
| 页码不从正文开始 | 没分节 | 插入分节符，取消"链接到前一节" |
| 行间距忽大忽小 | 段落格式不统一 | 全选→统一设置段落格式 |

---

# LaTeX 排版篇（进阶推荐）

## 一、为什么推荐LaTeX

| 对比项 | Word | LaTeX |
|--------|------|-------|
| 公式排版 | 还行，但复杂公式麻烦 | **极其美观**，数学公式是LaTeX的强项 |
| 自动编号 | 需要手动或插件 | **全自动**，公式图表编号自动管理 |
| 交叉引用 | 需要手动或交叉引用功能 | **全自动**，改一个地方全篇更新 |
| 版面质量 | 还行，但总有"手工感" | **极其专业**，像印刷品 |
| 上手难度 | 简单 | **有学习曲线**，但值得 |
| 协作 | 容易冲突 | Overleaf支持多人在线协作 |
| 适合场景 | 简单论文 | **数学建模竞赛强烈推荐** |

> **小贴士**：如果你打算参加多次数学建模竞赛，或者以后要写学术论文，强烈建议学LaTeX。前期投入一两天学习，后面受益无穷。

---

## 二、LaTeX环境安装

### 方案1：Overleaf（在线，推荐新手）

**优点**：无需安装、在线编辑、实时预览、多人协作、免费

**使用步骤**：
1. 打开 [www.overleaf.com](https://www.overleaf.com)
2. 注册账号（免费）
3. 新建项目→选择模板
4. 在线编辑，实时预览
5. 编译→下载PDF

> **避坑指南**：Overleaf免费版有编译时间限制（一般够用）。如果论文很长编译超时，可以删掉一些不需要的包，或者升级付费版。

### 方案2：TeX Live（本地安装）

**Windows**：
1. 下载 TeX Live ISO（约4GB）：https://tug.org/texlive/
2. 挂载ISO，运行 install-tl-windows.bat
3. 等待安装（可能需要1-2小时）
4. 安装编辑器：TeXstudio 或 VS Code + LaTeX Workshop 插件

**编辑器推荐**：
- **TeXstudio**：专为LaTeX设计，功能全面
- **VS Code**：通用编辑器，装 LaTeX Workshop 插件

---

## 三、数学建模论文LaTeX模板

### 模板来源

1. **Overleaf模板库**：搜索"mathematical modeling"或"数学建模"
2. **国赛官方模板**：国赛官网有时提供LaTeX模板
3. **GitHub**：搜索"CUMCM template LaTeX"
4. **美赛模板**：搜索"MCM template LaTeX"

> **小贴士**：直接用现成模板，不要从零写格式。模板已经帮你设好了页面、字体、标题样式，你只需要填内容。

---

## 四、LaTeX基础语法速查

### 文档结构

```latex
\documentclass[12pt, a4paper]{article}  % 文档类型

% 导言区：加载宏包、设置格式
\usepackage[utf8]{inputenc}    % 编码
\usepackage{ctex}               % 中文支持
\usepackage{amsmath, amssymb}   % 数学公式
\usepackage{graphicx}           % 插图
\usepackage{booktabs}           % 三线表
\usepackage{geometry}           % 页面设置
\usepackage{hyperref}           % 超链接和交叉引用

\geometry{top=2.5cm, bottom=2.5cm, left=2.5cm, right=2.2cm}

\title{基于熵权模糊综合评价的城市空气质量评价模型}
\author{队伍编号：XXXXX}
\date{}

\begin{document}

\maketitle

\begin{abstract}
摘要内容...
\end{abstract}

\newpage
\tableofcontents   % 自动生成目录
\newpage

\section{问题重述}
问题重述内容...

\section{问题分析}
问题分析内容...

% ... 其他部分

\end{document}
```

### 常用数学公式代码

**分数**：
```latex
\frac{a}{b}                % a/b
\dfrac{a}{b}               % 大号分数（独立公式中用）
```

**求和与积分**：
```latex
\sum_{i=1}^{n} x_i         % 求和
\prod_{i=1}^{n} x_i        % 乘积
\int_{a}^{b} f(x) dx       % 积分
\iint_{D} f(x,y) dxdy      % 二重积分
```

**矩阵**：
```latex
% 带括号矩阵
\begin{pmatrix}
a & b \\
c & d
\end{pmatrix}

% 带中括号矩阵
\begin{bmatrix}
a & b \\
c & d
\end{bmatrix}

% 无括号矩阵
\begin{matrix}
a & b \\
c & d
\end{matrix}
```

**分段函数**：
```latex
f(x) = \begin{cases}
x^2, & x \geq 0 \\
-x, & x < 0
\end{cases}
```

**多行公式对齐**：
```latex
\begin{align}
y &= a + b + c + d \\
  &= a + (b + c) + d \\
  &= a + e + d
\end{align}
```

**独立公式（带编号）**：
```latex
\begin{equation}
e_j = -\frac{1}{\ln n} \sum_{i=1}^{n} p_{ij} \ln p_{ij}
\label{eq:entropy}
\end{equation}
```

**行内公式**：
```latex
权重 $w_j$ 满足 $\sum w_j = 1$。
```

### 图片插入

```latex
\begin{figure}[htbp]
    \centering
    \includegraphics[width=0.8\textwidth]{fig1_aqi_trend.png}
    \caption{2023年各月份AQI变化趋势}
    \label{fig:aqi_trend}
\end{figure}
```

- `width=0.8\textwidth`：图片宽度为文本宽度的80%
- `\caption`：图题（自动放在图下方）
- `\label`：标签，用于交叉引用
- `[htbp]`：图片位置优先级（here→top→bottom→page）

**正文中引用图片**：
```latex
各月份AQI变化趋势如图\ref{fig:aqi_trend}所示。
```

### 表格制作（三线表）

```latex
\begin{table}[htbp]
    \centering
    \caption{各指标熵权法计算权重}
    \label{tab:weights}
    \begin{tabular}{ccc}
        \toprule
        指标 & 信息熵 & 权重 \\
        \midrule
        PM2.5 & 0.82 & 0.23 \\
        PM10  & 0.85 & 0.19 \\
        SO$_2$ & 0.91 & 0.11 \\
        NO$_2$ & 0.88 & 0.15 \\
        CO    & 0.93 & 0.08 \\
        O$_3$ & 0.86 & 0.24 \\
        \bottomrule
    \end{tabular}
\end{table}
```

- `\toprule`：顶线（粗线）
- `\midrule`：表头线（细线）
- `\bottomrule`：底线（粗线）
- `c` 表示居中，`l` 左对齐，`r` 右对齐

**正文中引用表格**：
```latex
各指标权重计算结果如表\ref{tab:weights}所示。
```

### 交叉引用

LaTeX的交叉引用是全自动的——你给公式、图、表加 `\label`，正文中用 `\ref` 引用，编译时自动填入编号。即使中间插入了新的图表，编号也会自动调整。

```latex
% 定义标签
\label{eq:entropy}      % 公式
\label{fig:aqi_trend}   % 图
\label{tab:weights}     % 表
\label{sec:weight}      % 章节

% 引用
如式(\ref{eq:entropy})所示
如图\ref{fig:aqi_trend}所示
如表\ref{tab:weights}所示
见第\ref{sec:weight}节
```

> **小贴士**：LaTeX通常需要编译两次才能正确显示交叉引用。第一次编译生成辅助文件，第二次编译才能填入编号。Overleaf自动编译两次，本地需要手动编译两次或用 `latexmk`。

---

## 五、最小可编译的LaTeX论文框架

下面是一个完整的、可以直接编译的LaTeX论文框架，你可以在Overleaf中新建项目后粘贴使用：

```latex
\documentclass[12pt, a4paper]{article}

% ===== 宏包 =====
\usepackage[utf8]{inputenc}
\usepackage{ctex}                    % 中文支持
\usepackage{amsmath, amssymb, amsfonts}  % 数学公式
\usepackage{graphicx}                % 插图
\usepackage{booktabs}                % 三线表
\usepackage{geometry}                % 页面设置
\usepackage{hyperref}                % 超链接
\usepackage{xcolor}                  % 颜色
\usepackage{caption}                 % 图表标题格式
\usepackage{subcaption}              % 子图
\usepackage{listings}                % 代码高亮
\usepackage{enumitem}                % 列表格式
\usepackage{fancyhdr}                % 页眉页脚

% ===== 页面设置 =====
\geometry{top=2.5cm, bottom=2.5cm, left=2.5cm, right=2.2cm}

% ===== 页眉页脚 =====
\pagestyle{fancy}
\fancyhf{}
\fancyhead[L]{队伍编号：XXXXX}
\fancyhead[R]{\thepage}
\renewcommand{\headrulewidth}{0.4pt}

% ===== 超链接颜色 =====
\hypersetup{
    colorlinks=true,
    linkcolor=black,
    citecolor=black,
    urlcolor=blue
}

% ===== 图表标题格式 =====
\captionsetup{font=small, labelfont=bf}

% ===== 标题格式 =====
\ctexset{
    section/format = \Large\bfseries\heiti,
    subsection/format = \large\bfseries\heiti,
    subsubsection/format = \normalsize\bfseries\heiti
}

% ===== 文档开始 =====
\begin{document}

% ===== 标题 =====
\title{\textbf{基于熵权模糊综合评价的城市空气质量评价模型}}
\author{}
\date{}
\maketitle
\thispagestyle{empty}

% ===== 摘要 =====
\begin{center}
    \Large\textbf{摘 \quad 要}
\end{center}

\noindent\rule{\textwidth}{0.5pt}

本文针对城市空气质量评价与预测问题，建立了基于熵权模糊综合评价和ARIMA-LSTM组合预测的数学模型……

（摘要正文，约500字）

\noindent\rule{\textwidth}{0.5pt}

\noindent\textbf{关键词：}熵权法；模糊综合评价；ARIMA-LSTM；灰色关联分析；空气质量

\newpage

% ===== 目录 =====
\tableofcontents
\newpage

% ===== 正文 =====
\section{问题重述}

本文针对城市空气质量评价与预测问题展开研究……

\section{问题分析}

\subsection{问题一分析}

空气质量综合评价是一个多指标决策问题……

\section{模型假设}

\begin{enumerate}
    \item 假设题目提供的监测数据真实有效；
    \item 假设评价期内未发生极端天气事件；
    \item ……
\end{enumerate}

\section{符号说明}

\begin{table}[htbp]
    \centering
    \caption{符号说明}
    \begin{tabular}{ccl}
        \toprule
        符号 & 含义 & 单位 \\
        \midrule
        $c_{ij}$ & 第$i$个城市第$j$项污染物浓度 & $\mu g/m^3$ \\
        $x_{ij}$ & 标准化后的指标值 & 无量纲 \\
        $w_j$ & 第$j$项指标权重 & 无量纲 \\
        \bottomrule
    \end{tabular}
\end{table}

\section{模型建立}

\subsection{基于熵权法的权重确定}

某指标的数据差异越大，说明该指标对评价的区分能力越强。熵权法计算权重如下：

\begin{equation}
    p_{ij} = \frac{x_{ij}}{\sum_{i=1}^{n} x_{ij}}
    \label{eq:proportion}
\end{equation}

\begin{equation}
    e_j = -\frac{1}{\ln n} \sum_{i=1}^{n} p_{ij} \ln p_{ij}
    \label{eq:entropy}
\end{equation}

\begin{equation}
    w_j = \frac{1 - e_j}{\sum_{j=1}^{m} (1 - e_j)}
    \label{eq:weight}
\end{equation}

其中，$e_j$ 为第$j$项指标的信息熵，$w_j$ 为权重，满足 $\sum w_j = 1$。

\subsection{模糊综合评价}

采用模糊综合评价法，通过隶属度函数构建模糊关系矩阵 $R$：

\begin{equation}
    B = A \cdot R
    \label{eq:fuzzy}
\end{equation}

\section{模型求解}

各指标权重如表\ref{tab:results}所示，各月评价结果如图\ref{fig:results}所示。

\begin{table}[htbp]
    \centering
    \caption{各指标权重计算结果}
    \label{tab:results}
    \begin{tabular}{ccc}
        \toprule
        指标 & 信息熵 & 权重 \\
        \midrule
        PM2.5 & 0.82 & 0.23 \\
        PM10  & 0.85 & 0.19 \\
        \bottomrule
    \end{tabular}
\end{table}

\begin{figure}[htbp]
    \centering
    \includegraphics[width=0.8\textwidth]{example-image}
    \caption{各月份空气质量综合评价结果}
    \label{fig:results}
\end{figure}

\section{模型检验与分析}

为检验权重对评价结果的敏感性，将各指标权重分别上下浮动$\pm 10\%$……

\section{模型评价与改进}

\textbf{模型优点：}
\begin{enumerate}
    \item 采用熵权法客观赋权，避免主观偏差；
    \item ……
\end{enumerate}

\textbf{模型缺点：}
\begin{enumerate}
    \item 熵权法完全依赖数据，未考虑指标实际重要性；
    \item ……
\end{enumerate}

\section{参考文献}

\begin{thebibliography}{99}
    \bibitem{ref1} 张三, 李四. 基于熵权模糊综合评价的城市空气质量评价[J]. 环境科学, 2022, 43(5): 120-128.
    \bibitem{ref2} 王五. 时间序列分析及其应用[M]. 北京: 科学出版社, 2020.
\end{thebibliography}

\section*{附录}
\addcontentsline{toc}{section}{附录}

\subsection*{附录A：熵权法求权重代码}

\begin{verbatim}
import numpy as np
import pandas as pd

data = pd.read_csv('air_quality.csv')
# 标准化处理
def normalize(data):
    ...
\end{verbatim}

\end{document}
```

> **小贴士**：把上面的代码复制到Overleaf中，替换 `example-image` 为你自己的图片文件名（需要上传图片到Overleaf项目），就能编译出一份排版专业的论文PDF。

---

## 六、Word vs LaTeX 选择建议

| 你的情况 | 推荐选择 |
|---------|---------|
| 第一次参加竞赛，时间紧 | **Word**（快速上手，不用学新工具） |
| 会用Word，排版总出问题 | **Word**（先把Word用好） |
| 打算参加多次竞赛 | **LaTeX**（一劳永逸，越用越快） |
| 队里有会用LaTeX的人 | **LaTeX**（有人带，直接上） |
| 论文公式很多 | **LaTeX**（公式排版是LaTeX的强项） |
| 美赛（MCM/ICM） | **LaTeX**（美赛用LaTeX的队伍多，模板成熟） |
| 国赛且时间紧张 | **Word**（国赛对LaTeX没有偏好，Word够用） |

### 实际建议

1. **如果你是大二、第一次参赛**：先用Word，把精力放在内容和摘要上。排版用Word做到"干净整洁"就够了。
2. **如果你打算长期参加竞赛或走学术路线**：比赛间隙学LaTeX，第二次参赛时切换到LaTeX。
3. **无论选哪个，核心都是内容**：排版再好，内容不行也白搭。排版是锦上添花，不是雪中送炭。

> **避坑指南**：不要在比赛期间现学LaTeX！LaTeX有学习曲线，比赛中现学会浪费大量时间。如果要学，提前在平时练手。比赛中用你已经熟练的工具。

---

## 本节总结

| 要点 | Word | LaTeX |
|------|------|-------|
| 页面设置 | 页面设置→页边距 | `\geometry{...}` |
| 标题样式 | 用"样式"功能 | `\section{}` `\subsection{}` |
| 公式 | Alt+= 或 MathType | `\begin{equation}` |
| 公式编号 | 手动或MathType | 全自动 |
| 图片 | 插入→图片 | `\includegraphics` |
| 三线表 | 去边框加三线 | `booktabs` 宏包 |
| 目录 | 引用→目录 | `\tableofcontents` |
| 交叉引用 | 交叉引用功能 | `\ref{}` 全自动 |

> **最后一句**：排版是论文的"穿着"。穿得体面，评委觉得你重视这场比赛；穿得邋遢，评委觉得你敷衍。但记住——穿着再好，也得有真才实学。排版服务于内容，内容才是王道。

---

**上一节**：[03_图表制作规范.md](./03_图表制作规范.md)
**下一节**：[05_论文实战_完整案例.md](./05_论文实战_完整案例.md)
