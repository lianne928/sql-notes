# SQL Notes

簡單的 SQL 速查語法筆記，整理給自己與同學使用。  
資料庫範例以 `研蘋果 – 朱克剛老師` 提供的 `AddressBook.sqo` 資料庫為主。

---

## 目錄

1. [建立資料庫與切換 DB](#建立資料庫與切換)
2. [建立資料表 CREATE TABLE](#建立資料表)
3. [基礎查詢 SELECT / FROM / WHERE](#基礎查詢)
4. [多條件查詢 AND / OR / IN](#多條件查詢)
5. [模糊查詢 LIKE](#模糊查詢)

6. [資料參考](#資料參考)

### 建立資料庫與切換

#### 語法： CREATE DATABASE / USE

(01) 在 VS Code 開啟新檔案
(02) 輸入 `CREATE DATABASE database_name` (自行命名資料庫)
(03) 成功後記得切換到新建立的資料庫才能進行編輯
切換資料庫有兩個方法
(03-1) 在 VS Code 視窗右下角點選目前資料庫名稱，選擇新的資料庫
(03-2) 使用指令 `USE database_name`
(00) 指令執行方式：點 VS Code 左上角綠色三角形 ▹
或使用 GO 分隔指令

```sql
-- 建立新的資料庫
CREATE DATABASE database_name ( ← 自行命名資料庫 );
-- 按執行
```

```sql
-- 切換到指定的資料庫
USE database_name ( ← 自行命名資料庫 );
-- 按執行
```

### 建立資料表

#### 語法： CREATE TABLE

資料庫就像 Excel 有表格，目前先把它想像成 物件

```sql
-- 建立資料表:
CREATE TABLE table_name(自行命名表單) (
 column_name1 資料型別*,
 column_name2 資料型別*,
 column_name3 資料型別*,
);
```

📌 column_name 資料型別 → 規範每個欄位允許存放的資料型別

常用資料型別：
(01)數值資料（Numeric Types）
(02)字串資料（String Types）
語法：`NVARCHAR(n)` → 中英文字欄位，需使用單引號 ' '
最多 50 字 → `NVARCHAR(50)`
(03)空值（`NULL`）→ 欄位沒有填資料
(04)布林值（Boolean）語法：`BIT` → 1 (true) / 0 (false)

### 基礎查詢語法

#### 語法： SELECT / FROM / WHERE

```sql
基礎查詢
SELECT -- (01)SELECT 要列出的欄位 （大部分寫 select * → 搜下面 From 資料表所有欄位)
FROM -- (02)FROM   要被查的資料表
WHERE -- (03)WHERE  查詢條件
```

📝 寫法建議（快速理解查詢邏輯）
一般書寫順序：`SELECT → FROM → WHERE`
思考順序：`WHERE → FROM → SELECT`

推薦步驟：
STEP 01.
先寫好查詢骨架（暫不填內容）
`SELECT`
`FROM`
`WHERE`

STEP 02.
依查詢邏輯由下往上填寫條件
(03) `WHERE` 決定資料範圍（最終想要的結果）
(02) `FROM` 找出資料來源
(01) `SELECT` 選擇要顯示的欄位（也可以使用 `SELECT*` → 全部欄位）

原因：

- 先決定資料最終的運行呈現（WHERE）
- 再去找需要哪些資料表 (FROM)
- 最後決定要呈現資料表的哪些欄位 (SELECT)

🧠 先挑結果（WHERE）→ 再找材料（FROM）→ 再顯示資料（SELECT）
💡 小提醒：SQL 實際執行順序是 `FROM → WHERE → SELECT`

```sql
-- 列出 UserInfo 表裡的 王大明所有欄位
SELECT *
FROM UserInfo
WHERE cname = '王大明'

-- 只查出 UserInfo 表裡的 王大明的 uid 和 password
SELECT uid, password
FROM UserInfo
WHERE cname = '王大明'
```

### 多條件查詢

#### 語法： AND / OR / IN

多個查詢條件的使用方式

- `OR`：任一條件成立，就顯示資料
- `IN`：包含多筆指定值（避免重複寫 `OR`）
- `AND`：左右條件都必須成立，否則不顯示資料

##### 多個查詢條件式 - 邏輯合併 OR

`WHERE` 任一條件成立 / 有找到 (true) ，就顯示資料

🔍 查詢條件：
王大明「 或 」李大媽的資料

```sql
SELECT *
FROM UserInfo
WHERE cname = '王大明' OR cname = '李大媽'
-- 運行結果：顯示 '王大明' 和 '李大媽' 的所有資料
```

﹗但是如果有一端條件不滿足，就只顯示滿足的那一端

```sql
SELECT *
FROM UserInfo
WHERE cname = '王大明' OR cname = '李大妹'
-- 運行結果：UserInfo 表內 cname 沒有'李大妹' 所以只顯示 '王大明' 的資料
```

##### 多個查詢條件式 - 包含運算 IN

可以包含兩筆以上的資料 和 邏輯合併的 `OR` 結果是一樣的
差別是不需要再寫重複條件，把等號使用 `IN()`替代

`WHERE column_name IN (value1, value2, value3...)`

```sql
SELECT \*
FROM UserInfo
WHERE cname IN ('王大明', '李大媽', '李小妹')
-- 運行結果：顯示 '王大明', '李大媽' 這兩筆資料，沒有 '李小妹' 就不顯示
```

可以發現 `IN / OR` 這兩種語法是差不多的
只是 `IN` 不需要寫重複條件，只需要 `IN()`

##### 多個查詢條件式 - 邏輯合併 AND

左右條件都必須成立，否則不顯示資料

🔍 查詢條件：
查詢 UserInfo 表內 的 uid='A01'「 且 」password = '1234'
只要任一個條件不達成就不顯示

```sql
SELECT \*
FROM UserInfo
WHERE uid='A01' AND password ='1234'
-- 運行結果：沒有顯示任何一筆資料，因為 UserInfo 沒有任何一筆資料同時滿足這兩個條件
```

那怎麼改呢？
先把 要查的表先調出來

```sql
SELECT *
FROM UserInfo
```

發現 password 都是 Null
那麼改成

```sql
SELECT \*
FROM UserInfo
WHERE uid = 'A01' AND password IS NULL
-- 運行結果：就會顯示 A01 這筆資料
```

---

注意：
`Null` 只有 `IS NULL` / `IS NOT NULL`
沒有 = `Null` 因為 `Null` 不屬於任何型態

---

##### 多個查詢條件式 - 不包含運算 not in

```sql
SELECT *
FROM UserInfo
WHERE cname NOT IN ('王大明', '李大媽')
-- 運行結果： 顯示'王小毛' 和 '朱小妹' 和 空字串
```

﹖問題來了：
資料一共有六筆，扣除掉 '王大明', '李大媽' 應該剩下四筆
那 `NULL` 去哪裡了呢？ 雖然是 `NULL` 但是也會需要使用到該筆資料
因此 `NULL` 也要調出來

---

注意：
`NULL` 是 unknow
而 `WHERE` 只會回傳 True 的資料

所以針對 `NULL` 要使用 `IS NULL` / `IS NOT NULL`
`= / <> / IN / NOT IN` 都會被默認隱藏 `NULL`

---

接續上一題，要怎麼也把 `NULL` 也調出來呢？
用到 邏輯合併 `OR` 把 `NULL` 也調出來

```sql
SELECT *
FROM UserInfo
WHERE cname NOT IN ('王大明', '李大媽') OR cname IS NULL
-- 運行結果： 除了 '王大明', '李大媽' 其他資料都有顯示
```

🧠 多條件語法整理：

- AND → 條件皆需符合，否則不顯示任何資料
- OR → 只要滿足任何一個 True 就回傳
- IN → 指定 / 排除 多筆特定資料 IN / NOT IN - IN 是要 - NOT IN 就是不要

### 模糊查詢

#### 語法：`LIKE '%'`

🧠 記憶點：條件 「 像 」

🔍 查詢條件：查出所有姓王

```sql
SELECT *
FROM UserInfo
WHERE cname LIKE '王%'
-- 運行結果： 顯示 '王大明' '王小毛'
```

---

模糊查詢的缺優點：
當 % 在開頭，變成條件很寬鬆查什麼都可以，使用者輸入什麼都可以查得到
因為資料是一筆一筆由上往下跑，模糊查詢會逐筆掃描資料，當資料量一大，速度就會變慢

解法：模糊查詢單獨自己一個資料庫

---

#### 語法：`LIKE '_'`

一個 `_` 代表一個字符

```sql
SELECT *
FROM UserInfo
WHERE cname LIKE '王__'
-- 運行結果： 顯示 '王大明' '王小毛'
```

🥊 挑戰：模糊 + 反向
🔍 查詢條件：除了姓王的，其他全部都要(包括 NULL)

```sql
SELECT *
FROM UserInfo
WHERE cname NOT LIKE '王%' OR cname IS NULL
```

---

### 資料參考

- [fooish SQL 教學網站](https://www.fooish.com/sql/)
- [ChainHao 資訊科技部落格](https://www.chainhao.com.tw/)

---

## SQL To-Do List-

- [✓] `CREATE DATABASE / USE`
- [✓] `CREATE TABLE`
- [✓] `SELECT / FROM / WHERE`
- [✓] `AND / OR / IN`
- [✓] `LIKE`
- [ ] `BETWEEN / NOT BETWEEN`
- [ ] `JOIN（INNER / LEFT / FULL）`
- [ ] `GROUP BY / HAVING`
- [ ] `ORDER BY`
- [ ] `INSERT / UPDATE / DELETE`
- [ ] `PK / FK`
- [ ] `Subquery`

---

## 🤝 協作邀請 Collaboration

本筆記為 SQL 學習過程與查詢範例整理
如果你注意到哪裡怪怪的，請不要沉默，最好的友情，就是互相糾錯 🤓  
歡迎加入共編、直接提交 Pull Request 🥊

Maintained with curiosity and collaboration — by Lianne.
