# Python 数据处理基础

## 本节导读

数学建模比赛中，80% 的时间在处理数据，20% 的时间在跑模型。因此，熟练掌握数据处理是编程成员的"看家本领"。

本节将系统学习两大核心库：
- **NumPy**：科学计算基础，处理数组和矩阵运算
- **Pandas**：数据处理利器，处理表格型数据

最后用一个"学生成绩分析"的完整案例串联所有知识点。

---

## 一、NumPy 基础

NumPy（Numerical Python）是 Python 科学计算的基石。几乎所有数据科学库（Pandas、scikit-learn 等）都建立在 NumPy 之上。

### 1.1 导入 NumPy

```python
import numpy as np  # 约定俗成的缩写，所有人都这么写
```

### 1.2 数组创建

NumPy 的核心是 **ndarray**（N-dimensional array），即多维数组。

```python
import numpy as np

# ====== 1. 从列表创建数组 ======
arr1 = np.array([1, 2, 3, 4, 5])
print("一维数组:", arr1)           # [1 2 3 4 5]
print("数据类型:", arr1.dtype)     # int64
print("形状:", arr1.shape)         # (5,)
print("维度:", arr1.ndim)          # 1

# 二维数组（矩阵）
arr2 = np.array([[1, 2, 3],
                 [4, 5, 6]])
print("\n二维数组:\n", arr2)
print("形状:", arr2.shape)         # (2, 3) —— 2行3列
print("维度:", arr2.ndim)          # 2

# ====== 2. 创建特殊数组 ======
zeros_arr = np.zeros((3, 4))       # 3行4列全零矩阵
print("\n全零矩阵:\n", zeros_arr)

ones_arr = np.ones((2, 3))         # 2行3列全一矩阵
print("\n全一矩阵:\n", ones_arr)

eye_arr = np.eye(3)                # 3x3单位矩阵
print("\n单位矩阵:\n", eye_arr)

# ====== 3. 创建等差数组 ======
arr_range = np.arange(0, 10, 2)    # 从0到10（不含），步长为2
print("\n等差数组:", arr_range)     # [0 2 4 6 8]

arr_linspace = np.linspace(0, 1, 5)  # 从0到1，等分5个点
print("linspace:", arr_linspace)     # [0.   0.25 0.5  0.75 1.  ]

# ====== 4. 创建随机数组（建模中常用） ======
np.random.seed(42)  # 设置随机种子，保证结果可复现

rand_arr = np.random.rand(3, 2)       # 3行2列，0~1均匀分布随机数
print("\n均匀分布随机数:\n", rand_arr)

randn_arr = np.random.randn(3, 2)     # 3行2列，标准正态分布随机数
print("\n正态分布随机数:\n", randn_arr)

randint_arr = np.random.randint(0, 100, size=(3, 3))  # 0~100的随机整数
print("\n随机整数:\n", randint_arr)
```

> **小贴士**：`np.random.seed(42)` 非常重要！它保证每次运行代码生成的随机数相同，这样你的实验结果才能复现。比赛时一定要设置随机种子。

### 1.3 数组索引与切片

```python
import numpy as np

arr = np.array([[10, 20, 30],
                [40, 50, 60],
                [70, 80, 90]])

# ====== 1. 取单个元素 ======
print("第0行第1列:", arr[0, 1])       # 20（索引从0开始！）

# ====== 2. 取整行 ======
print("第0行:", arr[0, :])            # [10 20 30]
print("第1行:", arr[1])               # [40 50 60]（省略第二维表示取整行）

# ====== 3. 取整列 ======
print("第1列:", arr[:, 1])            # [20 50 80]

# ====== 4. 切片（取子矩阵） ======
print("前两行前两列:\n", arr[:2, :2])
# [[10 20]
#  [40 50]]

print("第1~2行，第1~2列:\n", arr[1:3, 1:3])
# [[50 60]
#  [80 90]]

# ====== 5. 条件索引（布尔索引） ======
print("大于40的元素:", arr[arr > 40])  # [50 60 70 80 90]
print("大于40的元素位置:", np.where(arr > 40))  # 返回坐标

# ====== 6. 花式索引（用列表取指定行） ======
print("第0行和第2行:\n", arr[[0, 2]])
# [[10 20 30]
#  [70 80 90]]
```

> **避坑指南**：Python 的索引从 **0** 开始，不是 1！如果你学过 MATLAB，MATLAB 索引从 1 开始，这是最大的区别之一。

### 1.4 数组运算

NumPy 的数组运算支持逐元素操作，不需要写循环。

```python
import numpy as np

a = np.array([1, 2, 3, 4])
b = np.array([10, 20, 30, 40])

# ====== 1. 逐元素运算 ======
print("加法:", a + b)           # [11 22 33 44]
print("减法:", b - a)           # [ 9 18 27 36]
print("乘法（逐元素）:", a * b) # [10 40 90 160]
print("除法:", b / a)           # [10. 10. 10. 10.]
print("平方:", a ** 2)          # [ 1  4  9 16]
print("开方:", np.sqrt(a))      # [1. 1.414 1.732 2.]

# ====== 2. 标量运算（每个元素都参与） ======
print("加常数:", a + 100)       # [101 102 103 104]
print("乘常数:", a * 3)         # [3 6 9 12]

# ====== 3. 矩阵乘法 ======
A = np.array([[1, 2],
              [3, 4]])
B = np.array([[5, 6],
              [7, 8]])

# 方法一：@ 运算符（推荐）
print("\n矩阵乘法 @:\n", A @ B)
# [[19 22]
#  [43 50]]

# 方法二：np.dot()
print("矩阵乘法 dot:\n", np.dot(A, B))

# 方法三：A.dot(B)
print("矩阵乘法 A.dot(B):\n", A.dot(B))

# 注意：A * B 是逐元素乘法，不是矩阵乘法！
print("逐元素乘法 *:\n", A * B)
# [[ 5 12]
#  [21 32]]

# ====== 4. 常用数学函数 ======
arr = np.array([0, np.pi/2, np.pi])
print("\nsin:", np.sin(arr))         # [0. 1. 0.]
print("cos:", np.cos(arr))           # [1. 0. -1.]
print("exp:", np.exp(np.array([0, 1, 2])))  # [1. 2.718 7.389]
print("log:", np.log(np.array([1, np.e, np.e**2])))  # [0. 1. 2.]

# ====== 5. 统计运算 ======
data = np.array([[1, 2, 3],
                 [4, 5, 6],
                 [7, 8, 9]])

print("\n求和（所有元素）:", np.sum(data))          # 45
print("按列求和:", np.sum(data, axis=0))           # [12 15 18]
print("按行求和:", np.sum(data, axis=1))           # [6 15 24]
print("均值:", np.mean(data))                      # 5.0
print("按列均值:", np.mean(data, axis=0))          # [4. 5. 6.]
print("最大值:", np.max(data))                      # 9
print("最小值:", np.min(data))                      # 1
print("标准差:", np.std(data))                      # 2.582
print("方差:", np.var(data))                        # 6.667
```

> **小贴士**：`axis` 参数的含义：`axis=0` 表示"沿行的方向操作"（即对每一列操作），`axis=1` 表示"沿列的方向操作"（即对每一行操作）。初学时容易搞混，记住"0消行、1消列"。

### 1.5 广播机制

广播（Broadcasting）是 NumPy 最强大的特性之一。它允许不同形状的数组进行运算，NumPy 会自动"扩展"较小的数组。

```python
import numpy as np

# ====== 1. 数组 + 标量 ======
arr = np.array([1, 2, 3, 4])
print("数组+标量:", arr + 10)  # [11 12 13 14]
# 标量10被"广播"成 [10 10 10 10]，然后逐元素相加

# ====== 2. 一维数组 + 二维数组 ======
matrix = np.array([[1, 2, 3],
                   [4, 5, 6],
                   [7, 8, 9]])

row_vector = np.array([10, 20, 30])  # 形状 (3,)

# row_vector 被广播成 (3,3)，每一行都加上 [10, 20, 30]
print("矩阵 + 行向量:\n", matrix + row_vector)
# [[11 22 33]
#  [14 25 36]
#  [17 28 39]]

col_vector = np.array([[100],
                       [200],
                       [300]])  # 形状 (3,1)

# col_vector 被广播成 (3,3)，每一列都加上对应的值
print("\n矩阵 + 列向量:\n", matrix + col_vector)
# [[101 102 103]
#  [204 205 206]
#  [307 308 309]]

# ====== 3. 实际应用：标准化数据 ======
# 将矩阵的每一列标准化为均值0、标准差1
data = np.array([[1, 10, 100],
                 [2, 20, 200],
                 [3, 30, 300]], dtype=float)

mean = data.mean(axis=0)   # 按列求均值，形状 (3,)
std = data.std(axis=0)     # 按列求标准差，形状 (3,)

# 利用广播机制，一次完成所有列的标准化
normalized = (data - mean) / std
print("\n标准化结果:\n", normalized)
print("标准化后均值:", normalized.mean(axis=0))  # 约等于 [0, 0, 0]
print("标准化后标准差:", normalized.std(axis=0))  # 约等于 [1, 1, 1]
```

> **避坑指南**：广播机制虽然方便，但如果两个数组的形状不兼容，会报 `ValueError: operands could not be broadcast together`。规则是：从右往左对齐维度，每个维度要么相同，要么其中一个是1。

---

## 二、Pandas 基础

Pandas 是 Python 中最流行的数据分析库。它的核心数据结构是 **DataFrame**，你可以把它想象成一个 Excel 表格。

### 2.1 导入 Pandas

```python
import pandas as pd
import numpy as np
```

### 2.2 DataFrame 创建和读取

```python
import pandas as pd
import numpy as np

# ====== 1. 从字典创建 DataFrame ======
data = {
    '姓名': ['张三', '李四', '王五', '赵六', '钱七'],
    '数学': [90, 85, 78, 92, 88],
    '英语': [85, 90, 82, 78, 95],
    '编程': [88, 76, 95, 83, 70]
}
df = pd.DataFrame(data)
print(df)
#    姓名  数学  英语  编程
# 0  张三  90  85  88
# 1  李四  85  90  76
# 2  王五  78  82  95
# 3  赵六  92  78  83
# 4  钱七  88  95  70

# ====== 2. 查看基本信息 ======
print("\n前3行:")
print(df.head(3))  # 默认显示前5行

print("\n基本信息:")
print(df.info())   # 数据类型、非空数量等

print("\n统计描述:")
print(df.describe())  # 均值、标准差、最小值、最大值等

print("\n列名:", df.columns.tolist())  # ['姓名', '数学', '英语', '编程']
print("形状:", df.shape)                # (5, 4) —— 5行4列

# ====== 3. 从列表的列表创建 ======
data2 = [
    ['张三', 90, 85, 88],
    ['李四', 85, 90, 76],
    ['王五', 78, 82, 95]
]
df2 = pd.DataFrame(data2, columns=['姓名', '数学', '英语', '编程'])
print("\n从列表创建:")
print(df2)

# ====== 4. 从 NumPy 数组创建 ======
arr = np.random.randint(60, 100, size=(5, 3))
df3 = pd.DataFrame(arr, columns=['科目A', '科目B', '科目C'])
print("\n从NumPy数组创建:")
print(df3)
```

### 2.3 读取 CSV / Excel 文件

```python
import pandas as pd

# ====== 1. 读取 CSV 文件 ======
# 常用参数：
#   encoding: 文件编码，中文文件常用 'utf-8' 或 'gbk'
#   index_col: 指定哪一列作为行索引
#   usecols: 只读取指定列
#   nrows: 只读取前n行

# df = pd.read_csv('data.csv', encoding='utf-8')

# 读取 CSV 的代码模板
df_csv = pd.read_csv(
    'data.csv',           # 文件路径
    encoding='utf-8',      # 编码（中文文件可能需要 'gbk'）
    index_col=0,           # 第0列作为索引（可选）
    parse_dates=['date'],  # 将 date 列解析为日期（可选）
    usecols=['col1', 'col2', 'col3']  # 只读取指定列（可选）
)

# ====== 2. 读取 Excel 文件 ======
# 需要安装 openpyxl: pip install openpyxl

# df = pd.read_excel('data.xlsx', sheet_name='Sheet1')

# 读取 Excel 的代码模板
df_excel = pd.read_excel(
    'data.xlsx',           # 文件路径
    sheet_name='Sheet1',   # 工作表名（也可以用索引，如 0 表示第一个表）
    header=0,              # 第0行作为列名（默认）
    usecols='A:D'          # 只读取 A 到 D 列（可选）
)

# ====== 3. 读取多个工作表 ======
# 读取所有工作表，返回字典 {表名: DataFrame}
all_sheets = pd.read_excel('data.xlsx', sheet_name=None)
for name, sheet_df in all_sheets.items():
    print(f"工作表 {name}: {sheet_df.shape}")

# ====== 4. 保存文件 ======
# 保存为 CSV
df.to_csv('output.csv', index=False, encoding='utf-8-sig')
# index=False 表示不保存行索引
# encoding='utf-8-sig' 保证中文在 Excel 中不乱码

# 保存为 Excel
df.to_excel('output.xlsx', index=False, sheet_name='结果')
```

> **避坑指南**：保存 CSV 时如果包含中文，一定要用 `encoding='utf-8-sig'`，否则用 Excel 打开会乱码。`utf-8-sig` 比 `utf-8` 多了一个 BOM 头，Excel 才能正确识别。

### 2.4 数据筛选、过滤、排序

```python
import pandas as pd

data = {
    '姓名': ['张三', '李四', '王五', '赵六', '钱七', '孙八'],
    '数学': [90, 85, 78, 92, 88, 65],
    '英语': [85, 90, 82, 78, 95, 70],
    '编程': [88, 76, 95, 83, 70, 60]
}
df = pd.DataFrame(data)

# ====== 1. 选择列 ======
print("选择单列:")
print(df['数学'])  # 返回 Series（一维）
# 0    90
# 1    85
# ...

print("\n选择多列:")
print(df[['姓名', '数学', '编程']])  # 返回 DataFrame

# ====== 2. 条件过滤 ======
# 数学成绩大于 80 的行
print("\n数学>80:")
print(df[df['数学'] > 80])

# 多个条件：数学>80 且 英语>80
print("\n数学>80 且 英语>80:")
print(df[(df['数学'] > 80) & (df['英语'] > 80)])
# 注意：& 表示且，| 表示或，每个条件要用括号括起来！

# 数学>80 或 编程>90
print("\n数学>80 或 编程>90:")
print(df[(df['数学'] > 80) | (df['编程'] > 90)])

# 查找特定姓名
print("\n姓名是张三或李四:")
print(df[df['姓名'].isin(['张三', '李四'])])

# ====== 3. 排序 ======
# 按数学成绩降序
print("\n按数学降序:")
print(df.sort_values('数学', ascending=False))

# 先按数学降序，数学相同的按英语升序
print("\n按数学降序，英语升序:")
print(df.sort_values(['数学', '英语'], ascending=[False, True]))

# ====== 4. 取前N名 ======
print("\n数学前3名:")
print(df.nlargest(3, '数学'))

print("\n编程后2名:")
print(df.nsmallest(2, '编程'))
```

> **小贴士**：多条件过滤时，一定要用 `&` 和 `|`，不能用 Python 的 `and` 和 `or`。而且每个条件必须用括号括起来，否则会报错。

### 2.5 缺失值处理

实际数据中经常有缺失值（空值），需要处理。

```python
import pandas as pd
import numpy as np

# 创建含缺失值的数据（np.nan 表示缺失值）
data = {
    '姓名': ['张三', '李四', '王五', '赵六', '钱七'],
    '数学': [90, np.nan, 78, 92, 88],
    '英语': [85, 90, np.nan, 78, 95],
    '编程': [88, 76, 95, np.nan, 70]
}
df = pd.DataFrame(data)
print("原始数据:")
print(df)
#    姓名   数学   英语   编程
# 0  张三  90.0  85.0  88.0
# 1  李四   NaN  90.0  76.0
# 2  王五  78.0   NaN  95.0
# 3  赵六  92.0  78.0   NaN
# 4  钱七  88.0  95.0  70.0

# ====== 1. 检查缺失值 ======
print("\n缺失值统计:")
print(df.isnull().sum())
# 姓名    0
# 数学    1
# 英语    1
# 编程    1

print("\n是否有缺失值:", df.isnull().any().any())  # True

# ====== 2. 删除缺失值 ======
# 删除含有缺失值的行
print("\n删除缺失行:")
print(df.dropna())
#    姓名   数学   英语   编程
# 0  张三  90.0  85.0  88.0
# 4  钱七  88.0  95.0  70.0

# 删除含有缺失值的列
print("\n删除缺失列:")
print(df.dropna(axis=1))

# ====== 3. 填充缺失值 ======
# 用 0 填充
print("\n用0填充:")
print(df.fillna(0))

# 用每列均值填充（最常用）
print("\n用均值填充:")
df_filled = df.copy()
df_filled['数学'] = df_filled['数学'].fillna(df_filled['数学'].mean())
df_filled['英语'] = df_filled['英语'].fillna(df_filled['英语'].mean())
df_filled['编程'] = df_filled['编程'].fillna(df_filled['编程'].mean())
print(df_filled)

# 用前一个有效值填充（前向填充）
print("\n前向填充:")
print(df.fillna(method='ffill'))

# 用后一个有效值填充（后向填充）
print("\n后向填充:")
print(df.fillna(method='bfill'))

# 用插值法填充（适合时间序列）
print("\n插值填充:")
print(df.interpolate())
```

> **小贴士**：处理缺失值的策略要根据情况选择：
> - 缺失数据少 → 用均值/中位数填充
> - 缺失数据多 → 考虑删除该行或该列
> - 时间序列 → 用插值法或前后值填充

### 2.6 分组聚合（groupby）

```python
import pandas as pd
import numpy as np

# 创建数据：不同班级、不同性别的学生成绩
data = {
    '班级': ['A班', 'A班', 'A班', 'B班', 'B班', 'B班', 'C班', 'C班'],
    '性别': ['男', '女', '男', '女', '男', '女', '男', '女'],
    '数学': [90, 85, 78, 92, 88, 76, 95, 82],
    '英语': [85, 90, 82, 78, 95, 88, 70, 92]
}
df = pd.DataFrame(data)
print("原始数据:")
print(df)

# ====== 1. 按单列分组 ======
print("\n各班数学平均分:")
print(df.groupby('班级')['数学'].mean())
# A班    84.33
# B班    85.33
# C班    88.50

# ====== 2. 按多列分组 ======
print("\n各班男女数学平均分:")
print(df.groupby(['班级', '性别'])['数学'].mean())
# 班级  性别
# A班  男     84.0
#      女     85.0
# B班  男     88.0
#      女     84.0
# C班  男     95.0
#      女     82.0

# ====== 3. 多种聚合函数 ======
print("\n各班各科统计:")
print(df.groupby('班级').agg({
    '数学': ['mean', 'max', 'min', 'std'],
    '英语': ['mean', 'max', 'min']
}))

# ====== 4. 自定义聚合函数 ======
print("\n各班数学分差（最大-最小）:")
print(df.groupby('班级')['数学'].apply(lambda x: x.max() - x.min()))

# ====== 5. 分组后转回 DataFrame ======
result = df.groupby('班级')['数学'].mean().reset_index()
print("\n重置索引后:")
print(result)
#   班级   数学
# 0  A班  84.333333
# 1  B班  85.333333
# 2  C班  88.500000
```

> **小贴士**：`groupby` 后的结果是一个分组对象，需要接聚合函数（如 `mean()`, `sum()`, `count()` 等）才能显示数据。如果想让分组结果变回普通 DataFrame，记得加 `reset_index()`。

### 2.7 数据合并（merge, concat）

```python
import pandas as pd

# ====== 1. merge：类似 SQL 的 JOIN ======
# 学生信息表
students = pd.DataFrame({
    '学号': ['S001', 'S002', 'S003', 'S004'],
    '姓名': ['张三', '李四', '王五', '赵六'],
    '班级': ['A班', 'A班', 'B班', 'B班']
})

# 成绩表
scores = pd.DataFrame({
    '学号': ['S001', 'S002', 'S003', 'S005'],
    '数学': [90, 85, 78, 92],
    '英语': [85, 90, 82, 78]
})

print("学生表:")
print(students)
print("\n成绩表:")
print(scores)

# 内连接（只保留两表都有的学号）
print("\n内连接 (inner):")
print(pd.merge(students, scores, on='学号', how='inner'))

# 左连接（保留左表所有行，右表没有的填NaN）
print("\n左连接 (left):")
print(pd.merge(students, scores, on='学号', how='left'))

# 外连接（保留所有行）
print("\n外连接 (outer):")
print(pd.merge(students, scores, on='学号', how='outer'))

# ====== 2. concat：纵向或横向拼接 ======
df1 = pd.DataFrame({'A': [1, 2], 'B': [3, 4]})
df2 = pd.DataFrame({'A': [5, 6], 'B': [7, 8]})

# 纵向拼接（行增加）
print("\n纵向拼接:")
print(pd.concat([df1, df2], ignore_index=True))
#    A  B
# 0  1  3
# 1  2  4
# 2  5  7
# 3  6  8

# 横向拼接（列增加）
df3 = pd.DataFrame({'C': [9, 10], 'D': [11, 12]})
print("\n横向拼接:")
print(pd.concat([df1, df3], axis=1))
#    A  B   C   D
# 0  1  3   9  11
# 1  2  4  10  12
```

> **避坑指南**：`merge` 时一定要确认连接键（`on` 参数）是否正确，否则可能匹配不上。如果两个表的连接列名不同，可以用 `left_on` 和 `right_on` 分别指定。

---

## 三、完整案例：学生成绩数据分析

下面用一个完整的例子串联上面所有知识点。

```python
import pandas as pd
import numpy as np

# ========================================
# 案例：学生成绩数据分析
# ========================================

# 第一步：生成模拟数据
np.random.seed(42)

n_students = 30
names = [f'同学{i:02d}' for i in range(1, n_students + 1)]
classes = np.random.choice(['A班', 'B班', 'C班'], n_students)
genders = np.random.choice(['男', '女'], n_students)

# 生成成绩，故意加入一些缺失值
math_scores = np.random.randint(50, 100, n_students).astype(float)
english_scores = np.random.randint(50, 100, n_students).astype(float)
programming_scores = np.random.randint(50, 100, n_students).astype(float)

# 随机设置3个缺失值
math_scores[np.random.choice(n_students, 2, replace=False)] = np.nan
english_scores[np.random.choice(n_students, 1)] = np.nan

df = pd.DataFrame({
    '姓名': names,
    '班级': classes,
    '性别': genders,
    '数学': math_scores,
    '英语': english_scores,
    '编程': programming_scores
})

print("=" * 50)
print("第一步：数据概览")
print("=" * 50)
print(df.head(10))
print(f"\n数据形状: {df.shape}")
print(f"\n缺失值:\n{df.isnull().sum()}")

# 第二步：数据清洗
print("\n" + "=" * 50)
print("第二步：数据清洗（用均值填充缺失值）")
print("=" * 50)

df['数学'] = df['数学'].fillna(df['数学'].mean())
df['英语'] = df['英语'].fillna(df['英语'].mean())

print(f"清洗后缺失值:\n{df.isnull().sum()}")

# 第三步：计算总分和平均分
print("\n" + "=" * 50)
print("第三步：计算总分和平均分")
print("=" * 50)

df['总分'] = df['数学'] + df['英语'] + df['编程']
df['平均分'] = df['总分'] / 3

# 添加等级列
def get_grade(score):
    if score >= 90:
        return '优秀'
    elif score >= 80:
        return '良好'
    elif score >= 70:
        return '中等'
    elif score >= 60:
        return '及格'
    else:
        return '不及格'

df['等级'] = df['平均分'].apply(get_grade)

print(df.head(10))

# 第四步：分组分析
print("\n" + "=" * 50)
print("第四步：分组分析")
print("=" * 50)

# 各班各科平均分
print("\n--- 各班各科平均分 ---")
class_stats = df.groupby('班级')[['数学', '英语', '编程', '总分']].mean()
print(class_stats.round(2))

# 各班男女人数
print("\n--- 各班男女人数 ---")
print(df.groupby(['班级', '性别']).size())

# 各等级人数统计
print("\n--- 各等级人数 ---")
print(df['等级'].value_counts())

# 各班各等级人数
print("\n--- 各班各等级人数 ---")
print(df.groupby(['班级', '等级']).size().unstack(fill_value=0))

# 第五步：排名
print("\n" + "=" * 50)
print("第五步：排名")
print("=" * 50)

df['总排名'] = df['总分'].rank(method='dense', ascending=False).astype(int)
print("\n总分前5名:")
print(df.nlargest(5, '总分')[['姓名', '班级', '总分', '总排名']])

print("\n各班第一名:")
print(df.loc[df.groupby('班级')['总分'].idxmax()][['班级', '姓名', '总分']])

# 第六步：导出结果
print("\n" + "=" * 50)
print("第六步：导出结果")
print("=" * 50)

# 保存为 CSV
df.to_csv('学生成绩分析结果.csv', index=False, encoding='utf-8-sig')
print("已保存到 '学生成绩分析结果.csv'")

# 保存各班统计结果
class_stats.to_csv('各班统计.csv', encoding='utf-8-sig')
print("已保存到 '各班统计.csv'")

# 保存为 Excel（多个工作表）
with pd.ExcelWriter('学生成绩报告.xlsx') as writer:
    df.to_excel(writer, sheet_name='详细数据', index=False)
    class_stats.to_excel(writer, sheet_name='班级统计')
    df.groupby('等级').size().to_frame('人数').to_excel(writer, sheet_name='等级分布')
print("已保存到 '学生成绩报告.xlsx'")
```

---

## 四、文件读取实战代码模板

以下是比赛中常用的文件读取代码模板，直接复制修改路径即可使用。

```python
import pandas as pd
import numpy as np

# ========================================
# 模板1：读取 CSV 文件（最常见的场景）
# ========================================
def read_csv_template(filepath):
    """读取CSV文件的通用模板"""
    try:
        df = pd.read_csv(filepath, encoding='utf-8')
        print(f"成功读取 {filepath}")
        print(f"数据形状: {df.shape}")
        print(f"列名: {df.columns.tolist()}")
        print(df.head())
        return df
    except UnicodeDecodeError:
        # 如果 utf-8 失败，尝试 gbk 编码
        df = pd.read_csv(filepath, encoding='gbk')
        print(f"使用gbk编码成功读取 {filepath}")
        return df

# ========================================
# 模板2：读取 Excel 文件
# ========================================
def read_excel_template(filepath, sheet_name=0):
    """读取Excel文件的通用模板"""
    df = pd.read_excel(filepath, sheet_name=sheet_name)
    print(f"成功读取 {filepath}")
    print(f"数据形状: {df.shape}")
    print(df.head())
    return df

# ========================================
# 模板3：读取含有日期的数据
# ========================================
def read_time_series(filepath):
    """读取时间序列数据"""
    df = pd.read_csv(filepath, parse_dates=['date'], index_col='date')
    print(f"时间范围: {df.index.min()} ~ {df.index.max()}")
    print(f"数据形状: {df.shape}")
    return df

# ========================================
# 模板4：处理读取后的数据
# ========================================
def preprocess_data(df):
    """数据预处理模板"""
    print("=== 数据预处理 ===")

    # 1. 检查缺失值
    null_count = df.isnull().sum()
    if null_count.sum() > 0:
        print("缺失值:")
        print(null_count[null_count > 0])
        # 用中位数填充数值列
        numeric_cols = df.select_dtypes(include=[np.number]).columns
        df[numeric_cols] = df[numeric_cols].fillna(df[numeric_cols].median())
        print("已用中位数填充缺失值")
    else:
        print("无缺失值")

    # 2. 检查重复行
    dup_count = df.duplicated().sum()
    if dup_count > 0:
        print(f"发现 {dup_count} 行重复数据，已删除")
        df = df.drop_duplicates()

    # 3. 数据类型检查
    print("\n数据类型:")
    print(df.dtypes)

    # 4. 统计信息
    print("\n统计描述:")
    print(df.describe())

    return df

# 使用示例（取消注释并修改路径即可）
# df = read_csv_template('data.csv')
# df = preprocess_data(df)
```

---

## 小结

本节我们学习了：

1. **NumPy 基础**：数组创建、索引切片、运算、广播机制
2. **Pandas 基础**：DataFrame 创建、读取文件、筛选排序、缺失值处理、分组聚合、数据合并
3. **完整案例**：学生成绩数据分析全流程
4. **文件读取模板**：可直接复用的代码模板

> **避坑指南**：比赛中最常见的错误是数据读取问题（编码错误、路径错误）。拿到数据后第一件事就是 `print(df.head())` 看看数据长什么样，确认读取正确再进行后续操作。

下一节，我们将学习数学建模中最常用的算法的代码实现。
