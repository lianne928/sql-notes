# SQL Notes

這是一份由實際課程、作業與自學整理而成的 SQL 筆記，用於快速查詢常用語法與理解 SQL 的運作邏輯。內容涵蓋基礎建立資料庫查詢、條件判斷、聚合、分組、排序、JOIN、CASE WHEN 等常見語法，並包含可直接運行的範例。

資料庫範例以 `研蘋果 – 朱克剛老師` 提供的 `AddressBook.sqo` 資料庫為主。

## 適合對象

- 正在學習 SQL 的初學者
- 想快速查找語法的開發者

## 筆記特色

- 每個章節皆附上語法 + 實例
- 重點條列化，便於查找
- 嚴格以 SQL 執行順序與實務邏輯整理
- 包含 CASE WHEN、子查詢等「常見卻易錯」的重點語法說明

---

## 目錄

1. [建立資料庫與切換 DB](#建立資料庫與切換)
2. [建立資料表 CREATE TABLE](#建立資料表)
3. [基礎查詢 SELECT / FROM / WHERE](#基礎查詢)
4. [多條件查詢 AND / OR / IN](#多條件查詢)
5. [模糊查詢 LIKE](#模糊查詢)
6. [範圍運算 BETWEEN AND](#範圍運算)
7. [查詢結果分組 GROUP BY](#查詢結果分組)
8. [分組後條件篩選 HAVING](#分組後條件篩選)
9. [查詢結果排序 ORDER BY](#查詢結果排序)
10. [條件判斷 CASE WHEN](#條件判斷)
11. [集合運算 JOIN](#集合運算)
12. [子查詢 WHERE IN()](#子查詢)
13. [資料異動 INSERT / UPDATE / DELETE](#資料異動)

14. [資料參考](#資料參考)

### 建立資料庫與切換

#### 語法： `CREATE DATABASE / USE`

(01) 在 VS Code 開啟新檔案

(02) 輸入 `CREATE DATABASE database_name`（自行命名資料庫）

(03) 成功後切換到新建立的資料庫才能進行編輯

切換資料庫方法：

(03-1) 在 VS Code 視窗右下角點選目前資料庫名稱，選擇新的資料庫

(03-2) 使用指令 `USE database_name`

(00)指令執行方式：

- 點 VS Code 左上角綠色三角形 ▹
- 或使用 `GO` 分隔指令

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

- 語法：`NVARCHAR(n)` → 中英文字欄位，需使用單引號 ' '
- 最多 50 字 → `NVARCHAR(50)`

(03)空值（`NULL`）→ 欄位沒有填資料

(04)布林值（Boolean）語法：`BIT` → 1 (true) / 0 (false)

---

### 基礎查詢語法

#### 語法： `SELECT / FROM / WHERE`

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

---

### 多條件查詢

#### 語法： `AND / OR / IN`

多個查詢條件的使用方式

- `OR`：任一條件成立，就顯示資料
- `IN`：包含多筆指定值（避免重複寫 `OR`）
- `AND`：左右條件都必須成立，否則不顯示資料

##### 多個查詢條件式 - 邏輯合併 `OR`

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

##### 多個查詢條件式 - 包含運算 `IN`

可以包含兩筆以上的資料 和 邏輯合併的 `OR` 結果是一樣的

差別是不需要再寫重複條件，把等號使用 `IN()`替代

`WHERE column_name IN (value1, value2, value3...)`

```sql
SELECT *
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
SELECT *
FROM UserInfo
WHERE uid='A01' AND password ='1234'
-- 運行結果：沒有顯示任何一筆資料，因為 UserInfo 沒有任何一筆資料同時滿足這兩個條件
```

那怎麼改呢？
先把 要查的表調出來

```sql
SELECT *
FROM UserInfo
```

發現 password 都是 Null
那麼改成

```sql
SELECT *
FROM UserInfo
WHERE uid = 'A01' AND password IS NULL
-- 運行結果：就會顯示 A01 這筆資料
```

🧚‍♂️ 注意：
`Null` 只有 `IS NULL` / `IS NOT NULL`

沒有 = `Null` 因為 `Null` 不屬於任何型態

---

##### 多個查詢條件式 - 不包含運算 `not in`

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

🧚‍♂️ 注意：
`NULL` 是 unknow
而 `WHERE` 只會回傳 True 的資料

所以針對 `NULL` 要使用 `IS NULL` / `IS NOT NULL`
`= / <> / IN / NOT IN` 都會被默認隱藏 `NULL`

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

---

### 範圍運算

#### 範圍運算語法：`BETWEEN AND`

從這裡到那裡全部幫我包起來 🛍️

`WHERE column_name BETWEEN value1 AND value2`

→ 欄位 value1-value2 都列出來

🔍 查詢條件：帳單 200 - 500 元的

```sql
SELECT *
FROM Bill
WHERE fee BETWEEN 200 and 500 -- 包含 200~500 的帳單
```

🔍 查詢條件：查出生日 1992 - 2000（日期陷阱題）

```sql
SELECT *
FROM UserInfo
WHERE birthday BETWEEN '1992' AND '2000'
-- 運行結果：只跑出王大明和李大媽
```

因為 `BETWEEN '1992' AND '2000'`

SQL 判斷是 從 1992 年包含到 2000 年，2000 年後的第一天都不包含在 2000 年

- '1992' → 1992-01-01
- '2000' → 2000-01-01

所以 `BETWEEN '1992' AND '2000'` 這句話的意思是 1992-01-01 到 2000-01-01

那如果想要把 2000 年的朱小妹也一起列出要怎麼辦呢？

```sql
SELECT *
FROM UserInfo
WHERE birthday BETWEEN '1992-01-01' AND '2000-12-31'
-- 運行結果：成功印出朱小妹
```

→ 把條件寫完整，包到 2000 的最後一天就可以了

#### 範圍不包含運算語法：`NOT BETWEEN`

`WHERE column_name NOT BETWEEN value1 AND value2`

除了這個到那個這段不要，其他通通包起來 🛍️

🔍 查詢條件：除了 150 到 500 其他都要

```sql
SELECT *
FROM Bill
WHERE fee NOT BETWEEN 150 and 500
```

🧠 BETWEEN AND 從小寫到大，從上寫到下，如果遇到日期要想一下有沒有完整包含

---

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

模糊查詢的缺優點：

當 % 在開頭，變成條件很寬鬆查什麼都可以，使用者輸入什麼都可以查得到

因為資料是一筆一筆由上往下跑，模糊查詢會逐筆掃描資料，當資料量一大，速度就會變慢

解法：模糊查詢單獨自己一個資料庫

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

### 查詢結果分組

#### 語法： `GROUP BY`

`SELECT` 如果有使用到聚合函數 SUM( 加總 )、AVG( 平均 )、COUNT( 筆數，會排除 NULL )... 就需要搭配使用分組 `GROUP BY`

🔍 查詢條件：找出每隻電話帳單的總和

```sql
select tel, SUM(fee) as sum_fee -- 查詢 tel 欄位，並且將帳單進行加總運算
from Bill -- 從 Bill 這張表去找
GROUP BY tel
```

🧠 記憶點：
只要是出現在 `SELECT` 欄位（ 聚合函數除外 ）就要映射到 `GROUP BY`

### 分組後條件篩選

#### 語法： `HAVING`

針對分組後聚合條件做篩選 也可以想像成 `WHERE`

🔍 查詢條件：找出每隻電話帳單的總和，並且總金額大於一千

```sql
select tel, SUM(fee) as sum_fee -- 查詢 tel 欄位，並且將帳單進行加總運算
from Bill -- 從 Bill 這張表去找
GROUP BY tel -- 把 tel
HAVING sum(fee) > 1000
```

[GROUP BY / HAVING](GROUP%20BY.png)

---

### 查詢結果排序

#### 語法： `ORDER BY`

資料跑完最後一站 SELECT 後，
可以將需要升序或降序的欄位 使用 `ORDER BY` 來進行排列 ( 中英數都適用 )

`ORDER BY` 默認是 升序排列（由小到大）
如果要改成 降序排列（由大到小）在指定的欄位後增加 `DESC`

🔍 查詢條件：查帳單表的金額所有欄位，但是金額由小到大排序

```sql
SELECT*
FROM Bill
ORDER BY fee
-- 運行結果： 顯示所有 帳單欄位，金額欄位由小到大重新排列
```

🔍 查詢條件：查帳單表的金額所有欄位，但是金額由大到小排序

```sql
SELECT*
FROM Bill
ORDER BY fee desc
-- 運行結果： 顯示所有 帳單欄位，金額欄位由大到小重新排列
```

升序排列（由小到大）: `ORDER BY column_name1` (默認升序)

降序排列（由大到小）: `ORDER BY column_name1 DESC`

---

### 條件判斷

#### 語法： `CASE WHEN`

類似 `if(條件)-elseif(條件)-else` 條件語句，資料會遍歷每一條，如果遇到 WHEN 後的真值，就進去 THEN 進行運算或是回傳指定的值，該筆資料就停止往下

```sql
-- 基礎的
SELECT *,
CASE
    WHEN condition1 THEN result1 -- 資料遇到條件一，就進行 THEN 後的要求並且回傳
    WHEN condition2 THEN result2 -- 資料遇到條件二，就進行 THEN 後的要求並且回傳
    ELSE result -- 如果資料沒有符合以上條件，就直接回傳
END
FROM table_name
```

🔍 查詢條件：帳單總金額大於等於 2000 打八折，帳單總金額大於等於 1000 打九五折，其他不打折

```sql
SELECT tel, sum(fee) as sum_fee, -- 因為和 CASE 是同一層，記得要寫逗號
    CASE
    -- 開始寫條件
    WHEN
    sum(fee) >= 2000 then sum(fee)*0.8 -- 資料若滿足 這個條件就進行打八折
    WHEN
    sum(fee) >= 1000 then sum(fee)*0.95 -- 資料若滿足 這個條件就進行打九五折
    -- 其他
    ELSE sum(fee) -- 其他就讓他維持一樣
    END as Discount -- 把上面這些裝起來
FROM Bill
GROUP BY tel
ORDER BY sum_fee desc
```

👹 要注意的地方：

同一層不能使用別名 ( as 後的別名 )，所以 `sum_fee` 在 case 會失效

如果想使用別名來做運算

→ 必須使用子查詢（subquery）

SQL 最先運行的是 `from` 所以將 `select` 別名的聚合函數 塞在裡面，，把內層查詢的別名算出來後，外層就能使用這些欄位。

- 最後運行的是
  (02)`select`
  (01)`order by`

```sql
/*
    先把普通的打好 - 目的：別名
    SELECT tel, sum(fee) AS sum_fee
    from bill
    GROUP BY tel

    -- 之後貼到最先運行的 from 內 並且將它裝起來再給他一個別名，之後就回到 select 進行條件運算
*/

SELECT tel, sum_fee,
    case
    when sum_fee>=2000 then sum_fee*0.8
    when sum_fee>=1000 then sum_fee*0.95
    else sum_fee
    end AS discount_fee
from(
    SELECT tel, sum(fee) AS sum_fee
    from bill
    GROUP BY tel
) AS tel_sum
ORDER BY sum_fee DESC;
```

---

### 關聯查詢

#### 語法：`JOIN`

資料庫通常採用多表設計（避免資料重複、提升一致性），實務查詢常需跨表取得資料，
`JOIN` 用來依照關聯欄位（PK / FK）把多張表拉在一起，讓結果視覺上像一張表。

##### 內部連接 `INNER JOIN`

表和表之間的交集，直接寫 `JOIN` 也可以

```sql
-- 基礎的
SELECT table_column1, table_column2...
FROM table_name1 -- 從 表一的 PK 拉到 （主表）
INNER JOIN table_name2 -- 表二的 FK
ON table_name1.column_name=table_name2.column_name; -- 關聯的 PK / FK 拉起來
```

🔍 查詢條件：找出王大明住在哪裡

```sql
-- 先看 ER 圖找出關聯的地方 (PK / FK)
-- 找到關聯的地方就可以開始串起來

select *
from UserInfo -- 從大表
    inner Join Live -- 把 UserInfo 、 House 拉起來的第二張表
        on UserInfo.uid = Live.uid -- PK 去比對 FK
    inner Join House -- 終點第三張表
        on House.hid = Live.hid -- PK 去比對 FK
where cname = '王大明' -- 老樣子先重結果開始寫
```

##### 左側連接 `LEFT JOIN`

左邊 (`FROM`) 主表有的，全部都要有，其他表有和主表關聯的才列出，如果沒找到就 `NULL`

```sql
SELECT column_name(s)
FROM table1 -- 這張主表有的全部都要有
LEFT JOIN table2 -- 有對到關聯才會列出
ON table1.column_name = table2.column_name; -- 把表連接起來
```

🔍 查詢條件：找全部人的出住址

```sql
select cname, address -- (02) 想一下要什麼欄位 - 找全部人的出住址 → 需要姓名和住址兩個欄位 → 意思是 需要 UserInfo 和 House 這兩張，但是看了 ER 他們兩個需要 Live 這張關聯表才能接起來，所以一共需要三張
from UserInfo -- (01)大表先寫（大表有的人全部都要列出來）
left join Live  -- (03) 先抓中間那張關聯表
    on UserInfo.uid = Live.uid -- (04) 用 uid 接：UserInfo.uid（PK） = Live.uid（FK）
left join House -- (05) 最後處理 地址 這張表
    on Live.hid = House.hid -- (06) 用 hid 接：Live.hid（FK） = House.hid（PK）
-- 運行結果：印出 UserInfo 所有人，而沒有住址的人 address 會是 NULL
```

也可以這樣寫 ⬇

```sql
select cname, address
from UserInfo as u
left join Live as l
    on u.uid = l.uid
left join House as h
    on l.hid = h.hid
-- 運行結果是一樣的，只是資料表使用了別名
```

\*\*
`JOIN` 一定要搭配 `ON` 把關聯連接起來，否則會笛卡兒積

🧠 記憶點：

- 有一個 `JOIN` 就要配一個 `ON`
- `.uid` 只能接 `.uid` / `.hid` 只能接 `.hid` → 屬於同一種編號類型才接得起來
- `.uid = .hid` 這樣是接不到的
  \*\*

---

### 子查詢

#### 語法：`()`

子查詢 = 巢狀查詢
先把「裡面那個查詢」跑完，再把結果丟給外層查詢使用
(可以想像成迴圈，先跑完裡面再跑外面)

子查詢出來的結果：
一個值 / 一個欄位清單 / 一張表

##### `WHERE IN` 子查詢

```sql
select *
from table_name A
where table_column A in(
    select table_column B
    from table_name B
    -- 這裡的查詢結果 要跟 table_name A 的 column 有關聯
)
```

內層會先跑完，變成一份清單，外層 column_A IN 再拿來比對關聯

🔍 查詢條件：有帳單的電話

目前資料庫每一支電話都有帳單，所以先手動插入一支沒有帳單的電話，方便看差異

```sql
insert into Phone
values ('02-888234', 4)
```

插入電話號碼以後，一共會有五筆資料

```sql
select *
from Phone
-- 運行結果：五筆電話
```

那麼，條件是帳單和電話，所以我們先把他們兩張表先做基礎查詢

```sql
-- 帳單
select *
from Bill
-- 電話
select *
from Phone
-- 可以發現關聯性是 hid
```

那麼，開始使用子查詢把，有帳單的電話取出

```sql
select *
from Phone
where hid in (
    select hid
    from Bill
    /*
     把上方基礎查詢的 bill 貼上，並且把欄位改成 hid
     原因
     (01) 子查詢 IN 後的 select 只接受一個欄位
     (02) 要找出 和 Phone 表的關聯性 hid / tel 都可以
     */
-- 成功運行出四筆資料
)
```

🧠 記憶點：WHERE IN 關鍵規則

- 子查詢 `select` 只能有一個欄位，一次塞兩個會報錯
- 內外層要有關聯才有辦法接
  外層是 `Phone.tel` → 內層就要查出 `tel`
  外層是 `UserInfo.uid` → 內層就要查出 `uid`

🔍 進階查詢條件：查出這些帳單電話的地址
做法：
子查詢 + `left join`
為什麼是 `left join` 呢？
因為 不論是否有地址，都要顯示帳單，使用 `inner join` 的話，會變成沒有帳單該筆資料就不顯示

```sql
/*
  先把剛剛成功篩出有帳單的電話挖過來
  select *
  from Phone
  where hid in (
    select hid
    from Bill
    )
*/
-- 查出這些帳單電話的地址 這句話會需要三張表
-- House.address, Phone.tel, Bill.tel(這隻已經用子查詢和 Phone 處理好了，所以 JOIN 的事情交給 House, Phone)
select *
from Phone -- Phone 當主表
left join House -- 加入 House
     on Phone.hid = House.hid
where phone.hid in( -- 人變多了，所以要指定
    select hid
    from Bill
)
-- 運行結果：成功把 有帳單的地址篩出來，但是不需要看那麼多欄位，所以再改一下 ⬇
select tel, address
from Phone -- Phone 當主表
left join House -- 加入 House
     on Phone.hid = House.hid
where phone.hid in( -- 人變多了，所以要指定
    select hid
    from Bill
)
```

---

### 資料異動

#### 語法：`INSERT / UPDATE / DELETE`

##### 新增資料 `INSERT INTO`

插入資料到資料表

```sql
-- 基礎的
INSERT INTO table_name (column1, column2, column3...) -- 資料表（欄1, 欄2, 欄3...）
VALUES (value1, value2, value3...); --（欄1的值, 欄2的值, 欄3的值...）
-- 簡寫的
INSERT INTO table_name -- 資料表全部欄位
VALUES (value1, value2, value3...); -- 資料表有的欄位就都要輸入值，否則會報錯
```

📥 輸入：增加 Lianne 的 password

```sql
insert into UserInfo (uid, cname, password, birthday)
values ('L01', 'Lianne', 888, '1996-10-1')
```

📥 輸入：只增加 anna 的名字（因為 uid 是 PK 而且 NOT NULL 必須寫）

```sql
insert into UserInfo (uid, cname)
values ('L02', 'anna')
```

\*\*
👹 要注意的地方：

- 要將資料插入表之前可以先把表調出來確認有什麼欄位
- `NOT NULL` 的欄位一定要給值
- 遇到自動編號 (IDENTITY) 不需要給值 (`values`)，也不需要寫入欄位 (`insert into`)
- 注意 string 要給單引號

\*\*

Q: 那麼怎麼知道欄位是自動編號呢？

A: 有三個方法可以確認：

- 方法一：把表調出來，看有沒有連號（不跳號）; 如果是 字母＋數字 組合，那麼就不是，必須要寫入並且給值
- 方法二：打開 DBeaver 找到 資料庫 schemas → dbo → 找到 table → 右鍵 view table → 找到 cloumn → 右鍵 view cloumn → 檢查室否有勾選 IDENTITY
- 方法三：直接使用語法查欄位型態

```sql
select name, is_identity
from sys.columns
where object_id = object_id('House') -- 除了 括號內的表可以換，其他都是固定的
-- 回傳 1 = true = is identity = 有自動編號
```

##### 修改資料 `UPDATE SET`

要搭配 `WHERE` 指定改哪一筆資料，如果沒有下 `WHERE` 全部的資料都會被改成一樣的

```sql
-- 基礎的
UPDATE table_name -- 找哪一張表
SET column1 = value1, column2 = value2, ... -- 欄位: 新值; 可以想像成重新賦值，長得差不多
WHERE condition; -- 指定哪一筆
```

📥 修改: Lianne 的 password 改成 666 並且把生日改成 1996/10/22

```sql
/*
    老樣子先把表調出來看一下
    SELECT *
    FROM UserInfo
    確定好就可以開始寫了
*/
update UserInfo -- 抓表
set password = 666, birthday = '1996-10-22' -- 改什麼
WHERE uid = 'L01' -- 改誰
-- 運行結果: Lianne 修改指定欄位
```

##### 刪除資料 `DELETE FROM`

和 `UPDATE` 一樣要搭配 `WHERE` 否則會刪到全部

```sql
-- 基礎的
DELETE FROM table_name -- 從哪一張表刪除
WHERE condition; -- 一定要加！否則刪除整張表!!!!!
```

📤 移除 anna 的資料

```sql
/*
    老樣子先把表調出來看一下
    SELECT *
    FROM UserInfo
    確定好就可以開始寫了
*/
delete from UserInfo
where cname = 'anna'
-- 運行結果：成功刪除 anna
```

再來一個
📤 王小毛不住南京東路了，要移住址

```sql
delete from Live -- 從關聯表刪除
where uid = 'A03' and hid = 2 -- 關聯表只有 uid, hid 所以針對這兩個欄位去做就可以了

/*
    只寫這樣也可以成功刪除，但是上面的寫法比較嚴謹
    delete from Live -- 從關聯表刪除
    where uid = 'A03'
    -- 要是 王小毛 有多間房子並且登記多間地址，直接這樣寫的話會刪除王小毛的所有住址
*/
```

👹 很重要的地方：

- 修改、刪除資料沒有寫 `where` 是絕對不可以ㄉ！！！！！！
- `where` 推薦寫 PK 因為 PK 不會重複，資料的人名、地址等等皆有可能重複

🧚‍♂️ 步驟整理：

(01) 先寫 `select` 找出目標、確認欄位

(02) 移除、修改 補上 `where` 條件 (!import)

(03) 開始把 `select` 換掉，詳細如下方

```sql
新增資料
select from → insert into
              values
              口訣：插進去資料表，並且給值
---
移除
select from → update
重新賦值     → set
補條件       → where
              口訣：更新資料表某欄位，重新設定為某值，只改符合條件的
---
刪除
select from → delete from
補條件       → where
            口訣：從某資料表刪除，並且只刪除符合條件的
```

---

### 資料參考

- [ChainHao 資訊科技部落格](https://www.chainhao.com.tw/)
- [w3schools](https://www.w3schools.com/sql/default.asp)
- [fooish SQL 教學網站](https://www.fooish.com/sql/)

---

## SQL To-Do List

- [✓] `CREATE DATABASE / USE`
- [✓] `CREATE TABLE`
- [✓] `SELECT / FROM / WHERE`
- [✓] `AND / OR / IN`
- [✓] `LIKE`
- [✓] `BETWEEN / NOT BETWEEN`
- [✓] `JOIN（INNER / LEFT）`
- [✓] `GROUP BY / HAVING`
- [✓] `ORDER BY`
- [✓] `CASE WHEN`
- [✓] `INSERT / UPDATE / DELETE`
- [✓] `Subquery`

---

## 🤝 協作邀請 Collaboration

本筆記為 SQL 學習過程與查詢範例整理
如果你注意到哪裡怪怪的，請不要沉默，最好的友情，就是互相糾錯 🤓  
歡迎加入共編、直接提交 Pull Request 🥊

Maintained with curiosity and collaboration — by Lianne.
