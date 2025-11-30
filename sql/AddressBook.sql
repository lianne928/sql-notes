CREATE DATABASE [AddressBook]
 COLLATE Chinese_Taiwan_Stroke_90_CI_AI
GO
USE [AddressBook]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 2024/11/26 21:43:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill]
(
    [tel] [nvarchar](20) NOT NULL,
    [fee] [int] NULL,
    [hid] [int] NULL,
    [dd] [datetime2](7) NOT NULL,
    CONSTRAINT [PK_Bill] PRIMARY KEY CLUSTERED 
(
	[tel] ASC,
	[dd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HeadPhoto]    Script Date: 2024/11/26 21:43:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HeadPhoto]
(
    [uid] [nvarchar](20) NOT NULL,
    [photo] [varbinary](max) NULL,
    CONSTRAINT [PK_HeadPhoto] PRIMARY KEY CLUSTERED 
(
	[uid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[House]    Script Date: 2024/11/26 21:43:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[House]
(
    [hid] [int] IDENTITY(1,1) NOT NULL,
    [address] [nvarchar](100) NULL,
    CONSTRAINT [PK_House] PRIMARY KEY CLUSTERED 
(
	[hid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Live]    Script Date: 2024/11/26 21:43:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Live]
(
    [uid] [nvarchar](20) NOT NULL,
    [hid] [int] NOT NULL,
    CONSTRAINT [PK_Live] PRIMARY KEY CLUSTERED 
(
	[uid] ASC,
	[hid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Log]    Script Date: 2024/11/26 21:43:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Log]
(
    [id] [int] IDENTITY(1,1) NOT NULL,
    [body] [nvarchar](200) NULL,
    [dd] [datetime2](7) NULL,
    CONSTRAINT [PK_Log] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phone]    Script Date: 2024/11/26 21:43:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phone]
(
    [tel] [nvarchar](20) NOT NULL,
    [hid] [int] NULL,
    CONSTRAINT [PK_Phone] PRIMARY KEY CLUSTERED 
(
	[tel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 2024/11/26 21:43:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInfo]
(
    [uid] [nvarchar](20) NOT NULL,
    [cname] [nvarchar](50) NULL,
    [password] [nvarchar](64) NULL,
    [birthday] [datetime2](7) NULL,
    CONSTRAINT [PK_UserInfo] PRIMARY KEY CLUSTERED 
(
	[uid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Bill]
    ([tel], [fee], [hid], [dd])
VALUES
    (N'1111', 300, 1, CAST(N'2019-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Bill]
    ([tel], [fee], [hid], [dd])
VALUES
    (N'1111', 700, 1, CAST(N'2019-02-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Bill]
    ([tel], [fee], [hid], [dd])
VALUES
    (N'1111', 900, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Bill]
    ([tel], [fee], [hid], [dd])
VALUES
    (N'1112', 700, 1, CAST(N'2019-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Bill]
    ([tel], [fee], [hid], [dd])
VALUES
    (N'1112', 450, 1, CAST(N'2019-02-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Bill]
    ([tel], [fee], [hid], [dd])
VALUES
    (N'1112', 200, 1, CAST(N'2019-03-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Bill]
    ([tel], [fee], [hid], [dd])
VALUES
    (N'2222', 150, 2, CAST(N'2019-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Bill]
    ([tel], [fee], [hid], [dd])
VALUES
    (N'2222', 400, 2, CAST(N'2019-02-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Bill]
    ([tel], [fee], [hid], [dd])
VALUES
    (N'2222', 300, 2, CAST(N'2019-03-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Bill]
    ([tel], [fee], [hid], [dd])
VALUES
    (N'3333', 500, 3, CAST(N'2019-04-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Bill]
    ([tel], [fee], [hid], [dd])
VALUES
    (N'3333', 350, 3, CAST(N'2019-10-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Bill]
    ([tel], [fee], [hid], [dd])
VALUES
    (N'1111', 150, 3, sysdatetime())
GO
INSERT [dbo].[House]
    ([address])
VALUES
    (N'台北市南京東路1號')
INSERT [dbo].[House]
    ([address])
VALUES
    (N'新竹市光復北路1號')
INSERT [dbo].[House]
    ([address])
VALUES
    (N'台中市公益路二段51號')
INSERT [dbo].[House]
    ([address])
VALUES
    (N'高雄市五福路3號')
INSERT [dbo].[House]
    ([address])
VALUES
    (N'屏東市民生路2號')
GO
INSERT [dbo].[Live]
    ([uid], [hid])
VALUES
    (N'A01', 1)
INSERT [dbo].[Live]
    ([uid], [hid])
VALUES
    (N'A01', 3)
INSERT [dbo].[Live]
    ([uid], [hid])
VALUES
    (N'A02', 1)
INSERT [dbo].[Live]
    ([uid], [hid])
VALUES
    (N'A03', 1)
GO
INSERT [dbo].[Phone]
    ([tel], [hid])
VALUES
    (N'1111', 1)
INSERT [dbo].[Phone]
    ([tel], [hid])
VALUES
    (N'1112', 1)
INSERT [dbo].[Phone]
    ([tel], [hid])
VALUES
    (N'2222', 2)
INSERT [dbo].[Phone]
    ([tel], [hid])
VALUES
    (N'3333', 3)
GO
INSERT [dbo].[UserInfo]
    ([uid], [cname], [password], [birthday])
VALUES
    (N'A01', N'王大明', NULL, CAST(N'1992-05-03T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[UserInfo]
    ([uid], [cname], [password], [birthday])
VALUES
    (N'A02', N'李大媽', NULL, CAST(N'1998-10-02T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[UserInfo]
    ([uid], [cname], [password], [birthday])
VALUES
    (N'A03', N'王小毛', NULL, CAST(N'2013-01-03T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[UserInfo]
    ([uid], [cname], [password], [birthday])
VALUES
    (N'A04', N'朱小妹', NULL, CAST(N'2000-11-12T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[UserInfo]
    ([uid], [cname], [password], [birthday])
VALUES
    (N'A05', NULL, NULL, NULL)
INSERT [dbo].[UserInfo]
    ([uid], [cname], [password], [birthday])
VALUES
    (N'A06', N'', NULL, NULL)
GO
ALTER TABLE [dbo].[Bill] ADD  CONSTRAINT [DF_Bill_dd]  DEFAULT (sysdatetime()) FOR [dd]
GO
ALTER TABLE [dbo].[Log] ADD  CONSTRAINT [DEFAULT_Log_dd]  DEFAULT (sysdatetime()) FOR [dd]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_House] FOREIGN KEY([hid])
REFERENCES [dbo].[House] ([hid])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_House]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Phone] FOREIGN KEY([tel])
REFERENCES [dbo].[Phone] ([tel])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_Phone]
GO
ALTER TABLE [dbo].[HeadPhoto]  WITH CHECK ADD  CONSTRAINT [FK_HeadPhoto_UserInfo] FOREIGN KEY([uid])
REFERENCES [dbo].[UserInfo] ([uid])
GO
ALTER TABLE [dbo].[HeadPhoto] CHECK CONSTRAINT [FK_HeadPhoto_UserInfo]
GO
ALTER TABLE [dbo].[Live]  WITH CHECK ADD  CONSTRAINT [FK_Live_House] FOREIGN KEY([hid])
REFERENCES [dbo].[House] ([hid])
GO
ALTER TABLE [dbo].[Live] CHECK CONSTRAINT [FK_Live_House]
GO
ALTER TABLE [dbo].[Live]  WITH CHECK ADD  CONSTRAINT [FK_Live_UserInfo] FOREIGN KEY([uid])
REFERENCES [dbo].[UserInfo] ([uid])
GO
ALTER TABLE [dbo].[Live] CHECK CONSTRAINT [FK_Live_UserInfo]
GO
ALTER TABLE [dbo].[Phone]  WITH CHECK ADD  CONSTRAINT [FK_Phone_House] FOREIGN KEY([hid])
REFERENCES [dbo].[House] ([hid])
GO
ALTER TABLE [dbo].[Phone] CHECK CONSTRAINT [FK_Phone_House]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'帳單地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Bill', @level2type=N'COLUMN',@level2name=N'hid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'帳單日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Bill', @level2type=N'COLUMN',@level2name=N'dd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'帳單金額' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Bill', @level2type=N'COLUMN',@level2name=N'fee'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'帳號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HeadPhoto', @level2type=N'COLUMN',@level2name=N'uid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'大頭照' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HeadPhoto', @level2type=N'COLUMN',@level2name=N'photo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自動編號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Log', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有預設時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Log', @level2type=N'COLUMN',@level2name=N'dd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'家用電話' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Phone', @level2type=N'COLUMN',@level2name=N'tel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'裝機地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Phone', @level2type=N'COLUMN',@level2name=N'hid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'帳號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserInfo', @level2type=N'COLUMN',@level2name=N'uid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'中文姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserInfo', @level2type=N'COLUMN',@level2name=N'cname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密碼（記得加密）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserInfo', @level2type=N'COLUMN',@level2name=N'password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'屋號（自動編號）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'House', @level2type=N'COLUMN',@level2name=N'hid'
GO
