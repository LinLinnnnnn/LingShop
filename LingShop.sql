USE [master]
GO
/****** Object:  Database [LingShop]    Script Date: 10/4/2024 7:21:51 PM ******/
CREATE DATABASE [LingShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LingShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\LingShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LingShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\LingShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [LingShop] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LingShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LingShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LingShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LingShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LingShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LingShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [LingShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LingShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LingShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LingShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LingShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LingShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LingShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LingShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LingShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LingShop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [LingShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LingShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LingShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LingShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LingShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LingShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LingShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LingShop] SET RECOVERY FULL 
GO
ALTER DATABASE [LingShop] SET  MULTI_USER 
GO
ALTER DATABASE [LingShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LingShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LingShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LingShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LingShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LingShop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'LingShop', N'ON'
GO
ALTER DATABASE [LingShop] SET QUERY_STORE = ON
GO
ALTER DATABASE [LingShop] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [LingShop]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 10/4/2024 7:21:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Brands] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categorys]    Script Date: 10/4/2024 7:21:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorys](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[description] [nvarchar](255) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 10/4/2024 7:21:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[created_at] [date] NOT NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 10/4/2024 7:21:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[f_name] [nvarchar](255) NULL,
	[l_name] [nvarchar](255) NULL,
	[phone] [nvarchar](20) NULL,
	[address] [nvarchar](255) NULL,
	[updated_at] [date] NULL,
	[user_id] [int] NOT NULL,
	[created_at] [date] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductComments]    Script Date: 10/4/2024 7:21:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductComments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NULL,
	[user_id] [int] NULL,
	[content] [nvarchar](255) NOT NULL,
	[rating] [int] NULL,
	[created_at] [date] NOT NULL,
	[updated_at] [date] NOT NULL,
 CONSTRAINT [PK_ProductComments] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductDetail]    Script Date: 10/4/2024 7:21:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductDetail](
	[id] [int] NOT NULL,
	[size] [nchar](10) NULL,
	[tag] [nchar](10) NULL,
	[color] [nchar](10) NULL,
	[product_id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImages]    Script Date: 10/4/2024 7:21:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImages](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[path] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_ProductImage] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 10/4/2024 7:21:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[description] [nvarchar](255) NULL,
	[price] [float] NOT NULL,
	[quantity] [int] NOT NULL,
	[discount] [int] NULL,
	[tag] [nvarchar](255) NULL,
	[color] [nvarchar](255) NULL,
	[size] [nvarchar](10) NULL,
	[brand_id] [int] NOT NULL,
	[product_category_id] [int] NOT NULL,
	[created_at] [date] NOT NULL,
	[updated_at] [date] NOT NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/4/2024 7:21:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](255) NOT NULL,
	[password] [nvarchar](255) NOT NULL,
	[avatar] [nvarchar](255) NULL,
	[role] [int] NULL,
	[description] [nvarchar](255) NULL,
	[created_at] [date] NULL,
	[updated_at] [date] NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Brands] ON 

INSERT [dbo].[Brands] ([id], [name]) VALUES (1, N'Gucci')
INSERT [dbo].[Brands] ([id], [name]) VALUES (2, N'Vans')
SET IDENTITY_INSERT [dbo].[Brands] OFF
GO
SET IDENTITY_INSERT [dbo].[Categorys] ON 

INSERT [dbo].[Categorys] ([id], [name], [description]) VALUES (1, N'Quần dài', N'Quần dài')
INSERT [dbo].[Categorys] ([id], [name], [description]) VALUES (2, N'Váy', N'Chân váy')
INSERT [dbo].[Categorys] ([id], [name], [description]) VALUES (3, N'Đầm', N'Váy dài')
INSERT [dbo].[Categorys] ([id], [name], [description]) VALUES (4, N'Áo', N'Croptop, Thumm')
INSERT [dbo].[Categorys] ([id], [name], [description]) VALUES (5, N'Quần ngắn', N'quần ngắn')
INSERT [dbo].[Categorys] ([id], [name], [description]) VALUES (6, N'Áo Khoác', N'Khoác ấm')
SET IDENTITY_INSERT [dbo].[Categorys] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([id], [f_name], [l_name], [phone], [address], [updated_at], [user_id], [created_at]) VALUES (1, N'Mai', N'Linh', N'0889456201', N'LongAn', CAST(N'2024-04-07' AS Date), 1, CAST(N'2024-04-08' AS Date))
INSERT [dbo].[Orders] ([id], [f_name], [l_name], [phone], [address], [updated_at], [user_id], [created_at]) VALUES (2, N'Linh', N'Linh', N'0889345291', N'LA', CAST(N'2024-10-01' AS Date), 3, CAST(N'2024-02-02' AS Date))
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductImages] ON 

INSERT [dbo].[ProductImages] ([id], [product_id], [path]) VALUES (1, 1, N'lolita_a.jfif')
INSERT [dbo].[ProductImages] ([id], [product_id], [path]) VALUES (2, 1, N'lolita_a1.jfif')
INSERT [dbo].[ProductImages] ([id], [product_id], [path]) VALUES (4, 1, N'lolita_a2.jfif')
INSERT [dbo].[ProductImages] ([id], [product_id], [path]) VALUES (5, 1, N'lolita_a3.jfif')
INSERT [dbo].[ProductImages] ([id], [product_id], [path]) VALUES (6, 8, N'lolita_b.jfif')
INSERT [dbo].[ProductImages] ([id], [product_id], [path]) VALUES (7, 8, N'lolita_b1.jfif')
INSERT [dbo].[ProductImages] ([id], [product_id], [path]) VALUES (8, 8, N'lolita_b2.jfif')
INSERT [dbo].[ProductImages] ([id], [product_id], [path]) VALUES (9, 8, N'lolita_b3.jfif')
INSERT [dbo].[ProductImages] ([id], [product_id], [path]) VALUES (11, 6, N'thunmeo_a.jfif')
INSERT [dbo].[ProductImages] ([id], [product_id], [path]) VALUES (12, 6, N'thunmeo_a1.jfif')
INSERT [dbo].[ProductImages] ([id], [product_id], [path]) VALUES (13, 6, N'thunmeo_a2.jfif')
INSERT [dbo].[ProductImages] ([id], [product_id], [path]) VALUES (14, 6, N'thunmeo_a3.jfif')
INSERT [dbo].[ProductImages] ([id], [product_id], [path]) VALUES (15, 3, N'hs_a.jfif')
INSERT [dbo].[ProductImages] ([id], [product_id], [path]) VALUES (16, 3, N'hs_a1.jfif')
INSERT [dbo].[ProductImages] ([id], [product_id], [path]) VALUES (17, 3, N'hs_a2.jfif')
INSERT [dbo].[ProductImages] ([id], [product_id], [path]) VALUES (18, 3, N'hs_a3.jfif')
INSERT [dbo].[ProductImages] ([id], [product_id], [path]) VALUES (19, 9, N'hoatiet.jfif')
INSERT [dbo].[ProductImages] ([id], [product_id], [path]) VALUES (20, 9, N'hoatiet1.jfif')
INSERT [dbo].[ProductImages] ([id], [product_id], [path]) VALUES (21, 9, N'hoatiet2.jfif')
INSERT [dbo].[ProductImages] ([id], [product_id], [path]) VALUES (22, 9, N'hoatiet3.jfif')
INSERT [dbo].[ProductImages] ([id], [product_id], [path]) VALUES (23, 10, N'jeannu.jfif')
INSERT [dbo].[ProductImages] ([id], [product_id], [path]) VALUES (24, 10, N'jeannu1.jfif')
INSERT [dbo].[ProductImages] ([id], [product_id], [path]) VALUES (25, 10, N'jeannu2.jfif')
INSERT [dbo].[ProductImages] ([id], [product_id], [path]) VALUES (26, 10, N'jeannu3.jfif')
INSERT [dbo].[ProductImages] ([id], [product_id], [path]) VALUES (27, 11, N'nganthethao.jfif')
INSERT [dbo].[ProductImages] ([id], [product_id], [path]) VALUES (28, 11, N'nganthethao1.jfif')
INSERT [dbo].[ProductImages] ([id], [product_id], [path]) VALUES (29, 11, N'nganthethao2.jfif')
INSERT [dbo].[ProductImages] ([id], [product_id], [path]) VALUES (30, 11, N'nganthethao3.jfif')
INSERT [dbo].[ProductImages] ([id], [product_id], [path]) VALUES (31, 12, N'hoodie.jfif')
INSERT [dbo].[ProductImages] ([id], [product_id], [path]) VALUES (32, 12, N'hoodie1.jfif')
INSERT [dbo].[ProductImages] ([id], [product_id], [path]) VALUES (33, 12, N'hoodie2.jfif')
INSERT [dbo].[ProductImages] ([id], [product_id], [path]) VALUES (34, 12, N'hoodie3.jfif')
INSERT [dbo].[ProductImages] ([id], [product_id], [path]) VALUES (53, 26, N'hoatiet2.jfif')
INSERT [dbo].[ProductImages] ([id], [product_id], [path]) VALUES (54, 26, N'hoatiet3.jfif')
INSERT [dbo].[ProductImages] ([id], [product_id], [path]) VALUES (55, 26, N'hoodie.jfif')
INSERT [dbo].[ProductImages] ([id], [product_id], [path]) VALUES (56, 26, N'hoodie1.jfif')
SET IDENTITY_INSERT [dbo].[ProductImages] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([id], [name], [description], [price], [quantity], [discount], [tag], [color], [size], [brand_id], [product_category_id], [created_at], [updated_at], [isActive]) VALUES (1, N'Váy Lolita Xanh', N'Dễ thương', 1000, 100, 0, N'#Loli', N'blue', N'L', 1, 3, CAST(N'2004-01-01' AS Date), CAST(N'2004-01-01' AS Date), 1)
INSERT [dbo].[Products] ([id], [name], [description], [price], [quantity], [discount], [tag], [color], [size], [brand_id], [product_category_id], [created_at], [updated_at], [isActive]) VALUES (3, N'Chân váy tennis', N'Học sinh ', 100, 1000, 10, N'#HS', N'black', N'S', 2, 2, CAST(N'2014-02-02' AS Date), CAST(N'2014-02-02' AS Date), 1)
INSERT [dbo].[Products] ([id], [name], [description], [price], [quantity], [discount], [tag], [color], [size], [brand_id], [product_category_id], [created_at], [updated_at], [isActive]) VALUES (6, N'Áo Thun Con Mèo', N'Thoải mái', 10, 100001, 0, N'#Thun', N'white', N'S', 2, 4, CAST(N'2022-04-04' AS Date), CAST(N'2022-04-04' AS Date), 1)
INSERT [dbo].[Products] ([id], [name], [description], [price], [quantity], [discount], [tag], [color], [size], [brand_id], [product_category_id], [created_at], [updated_at], [isActive]) VALUES (8, N'Váy Lolita Hồng', N'Dễ thương', 2000, 1000, 10, N'#Loli', N'pink', N'S', 1, 3, CAST(N'2004-01-01' AS Date), CAST(N'2004-01-01' AS Date), 1)
INSERT [dbo].[Products] ([id], [name], [description], [price], [quantity], [discount], [tag], [color], [size], [brand_id], [product_category_id], [created_at], [updated_at], [isActive]) VALUES (9, N'Quần hoạ tiết màu', N'Ngầu ', 400, 79, 30, N'#Ngau', N'black', N'L', 1, 1, CAST(N'2022-04-08' AS Date), CAST(N'2022-04-08' AS Date), 1)
INSERT [dbo].[Products] ([id], [name], [description], [price], [quantity], [discount], [tag], [color], [size], [brand_id], [product_category_id], [created_at], [updated_at], [isActive]) VALUES (10, N'Quần Jean ống rộng', N'Ngầu', 300, 10, 40, N'#Ngau', N'blue', N'L', 2, 1, CAST(N'2024-02-01' AS Date), CAST(N'2024-02-01' AS Date), 1)
INSERT [dbo].[Products] ([id], [name], [description], [price], [quantity], [discount], [tag], [color], [size], [brand_id], [product_category_id], [created_at], [updated_at], [isActive]) VALUES (11, N'Quần thể thao 3 vạch', N'Mát mẻ', 20, 109, 0, N'#Thun', N'black', N'M', 1, 5, CAST(N'2019-04-03' AS Date), CAST(N'2019-04-03' AS Date), 1)
INSERT [dbo].[Products] ([id], [name], [description], [price], [quantity], [discount], [tag], [color], [size], [brand_id], [product_category_id], [created_at], [updated_at], [isActive]) VALUES (12, N'Áo hoodie zip Eror', N'Giữ ấm', 200, 300, 20, N'#Khoac', N'black', N'M', 1, 6, CAST(N'2023-06-05' AS Date), CAST(N'2023-06-05' AS Date), 1)
INSERT [dbo].[Products] ([id], [name], [description], [price], [quantity], [discount], [tag], [color], [size], [brand_id], [product_category_id], [created_at], [updated_at], [isActive]) VALUES (26, N'Mới', N'111111', 100, 111, 12, N'#Ngau', N'Black', N'M', 1, 1, CAST(N'2024-04-09' AS Date), CAST(N'2024-04-09' AS Date), 1)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id], [username], [password], [avatar], [role], [description], [created_at], [updated_at], [isActive]) VALUES (1, N'linh', N'1234', N'linh.jpg', 1, N'LinhLinh', CAST(N'2024-04-07' AS Date), CAST(N'2024-04-07' AS Date), 1)
INSERT [dbo].[Users] ([id], [username], [password], [avatar], [role], [description], [created_at], [updated_at], [isActive]) VALUES (3, N'linh2', N'12345', N'linhlinh.jpg', 0, N'linh', CAST(N'2024-04-10' AS Date), CAST(N'2024-04-10' AS Date), 1)
INSERT [dbo].[Users] ([id], [username], [password], [avatar], [role], [description], [created_at], [updated_at], [isActive]) VALUES (5, N'linh11', N'123', NULL, 0, NULL, CAST(N'2024-04-10' AS Date), CAST(N'2024-04-10' AS Date), 1)
INSERT [dbo].[Users] ([id], [username], [password], [avatar], [role], [description], [created_at], [updated_at], [isActive]) VALUES (9, N'111111', N'11111', NULL, 0, NULL, CAST(N'2024-04-10' AS Date), CAST(N'2024-04-10' AS Date), 1)
INSERT [dbo].[Users] ([id], [username], [password], [avatar], [role], [description], [created_at], [updated_at], [isActive]) VALUES (10, N'1', N'1', NULL, 0, NULL, CAST(N'2024-04-10' AS Date), CAST(N'2024-04-10' AS Date), 1)
INSERT [dbo].[Users] ([id], [username], [password], [avatar], [role], [description], [created_at], [updated_at], [isActive]) VALUES (11, N'linhhh', N'1', NULL, 0, NULL, CAST(N'2024-04-10' AS Date), CAST(N'2024-04-10' AS Date), 1)
INSERT [dbo].[Users] ([id], [username], [password], [avatar], [role], [description], [created_at], [updated_at], [isActive]) VALUES (12, N'linh5', N'12', NULL, 0, NULL, CAST(N'2024-04-10' AS Date), CAST(N'2024-04-10' AS Date), 1)
INSERT [dbo].[Users] ([id], [username], [password], [avatar], [role], [description], [created_at], [updated_at], [isActive]) VALUES (13, N'linh8', N'1111', NULL, 0, NULL, CAST(N'2024-04-10' AS Date), CAST(N'2024-04-10' AS Date), 1)
INSERT [dbo].[Users] ([id], [username], [password], [avatar], [role], [description], [created_at], [updated_at], [isActive]) VALUES (14, N'linh9', N'123', NULL, 0, NULL, CAST(N'2024-04-10' AS Date), CAST(N'2024-04-10' AS Date), 1)
INSERT [dbo].[Users] ([id], [username], [password], [avatar], [role], [description], [created_at], [updated_at], [isActive]) VALUES (15, N'linh10', N'1111', NULL, 0, NULL, CAST(N'2024-04-10' AS Date), CAST(N'2024-04-10' AS Date), 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
/****** Object:  Index [UKirx7xi641ew4l0011n1o3det9]    Script Date: 10/4/2024 7:21:52 PM ******/
ALTER TABLE [dbo].[OrderDetail] ADD  CONSTRAINT [UKirx7xi641ew4l0011n1o3det9] UNIQUE NONCLUSTERED 
(
	[order_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UK_Users]    Script Date: 10/4/2024 7:21:52 PM ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [UK_Users] UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF__Orders__created___245D67DE]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Orders] FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Orders]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Products] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Products]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK7kn2p8fks7ft0mnb10i3cklej] FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK7kn2p8fks7ft0mnb10i3cklej]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK7s0rjfquvxmcgp7w0u7fi931i] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK7s0rjfquvxmcgp7w0u7fi931i]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_User]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FKkgnl77uxq20bmh53f3pf1b84b] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FKkgnl77uxq20bmh53f3pf1b84b]
GO
ALTER TABLE [dbo].[ProductComments]  WITH CHECK ADD  CONSTRAINT [FK_ProductComments_Products] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[ProductComments] CHECK CONSTRAINT [FK_ProductComments_Products]
GO
ALTER TABLE [dbo].[ProductComments]  WITH CHECK ADD  CONSTRAINT [FK_ProductComments_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[ProductComments] CHECK CONSTRAINT [FK_ProductComments_User]
GO
ALTER TABLE [dbo].[ProductComments]  WITH CHECK ADD  CONSTRAINT [FKn3qujruy0odepvf40em9ujk47] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[ProductComments] CHECK CONSTRAINT [FKn3qujruy0odepvf40em9ujk47]
GO
ALTER TABLE [dbo].[ProductComments]  WITH CHECK ADD  CONSTRAINT [FKtkqnl3nrd9n05kmc82oj3vn89] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[ProductComments] CHECK CONSTRAINT [FKtkqnl3nrd9n05kmc82oj3vn89]
GO
ALTER TABLE [dbo].[ProductImages]  WITH CHECK ADD  CONSTRAINT [FK_ProductImage_Products] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[ProductImages] CHECK CONSTRAINT [FK_ProductImage_Products]
GO
ALTER TABLE [dbo].[ProductImages]  WITH CHECK ADD  CONSTRAINT [FK7nqsa7mbqymj5ktspvy0xcn0j] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[ProductImages] CHECK CONSTRAINT [FK7nqsa7mbqymj5ktspvy0xcn0j]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Brands] FOREIGN KEY([brand_id])
REFERENCES [dbo].[Brands] ([id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Brands]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Category] FOREIGN KEY([product_category_id])
REFERENCES [dbo].[Categorys] ([id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Category]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK8i3dsm805u3yo9swuduyubd6d] FOREIGN KEY([brand_id])
REFERENCES [dbo].[Brands] ([id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK8i3dsm805u3yo9swuduyubd6d]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FKpssfbqa94wf485url1dvmqkr4] FOREIGN KEY([product_category_id])
REFERENCES [dbo].[Categorys] ([id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FKpssfbqa94wf485url1dvmqkr4]
GO
USE [master]
GO
ALTER DATABASE [LingShop] SET  READ_WRITE 
GO
