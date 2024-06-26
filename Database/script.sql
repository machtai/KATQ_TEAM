USE [master]
GO
/****** Object:  Database [Qldienthoai]    Script Date: 2024-05-22 12:19:09 PM ******/
CREATE DATABASE [Qldienthoai]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLdienthoai', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\QLdienthoai.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLdienthoai_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\QLdienthoai_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Qldienthoai] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Qldienthoai].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Qldienthoai] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Qldienthoai] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Qldienthoai] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Qldienthoai] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Qldienthoai] SET ARITHABORT OFF 
GO
ALTER DATABASE [Qldienthoai] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Qldienthoai] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Qldienthoai] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Qldienthoai] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Qldienthoai] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Qldienthoai] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Qldienthoai] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Qldienthoai] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Qldienthoai] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Qldienthoai] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Qldienthoai] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Qldienthoai] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Qldienthoai] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Qldienthoai] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Qldienthoai] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Qldienthoai] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Qldienthoai] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Qldienthoai] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Qldienthoai] SET  MULTI_USER 
GO
ALTER DATABASE [Qldienthoai] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Qldienthoai] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Qldienthoai] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Qldienthoai] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Qldienthoai] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Qldienthoai] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Qldienthoai] SET QUERY_STORE = OFF
GO
USE [Qldienthoai]
GO
/****** Object:  User [user]    Script Date: 2024-05-22 12:19:09 PM ******/
CREATE USER [user] FOR LOGIN [user] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [saa]    Script Date: 2024-05-22 12:19:09 PM ******/
CREATE USER [saa] FOR LOGIN [saa] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [user]
GO
ALTER ROLE [db_owner] ADD MEMBER [saa]
GO
/****** Object:  Table [dbo].[Chitietdonhang]    Script Date: 2024-05-22 12:19:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chitietdonhang](
	[Madon] [int] NOT NULL,
	[Masp] [int] NOT NULL,
	[Soluong] [int] NULL,
	[Dongia] [decimal](18, 0) NULL,
	[Thanhtien] [decimal](18, 0) NULL,
	[Phuongthucthanhtoan] [int] NULL,
	[PhuongThuc] [nvarchar](50) NULL,
 CONSTRAINT [PK_Chitietdonhang] PRIMARY KEY CLUSTERED 
(
	[Madon] ASC,
	[Masp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Donhang]    Script Date: 2024-05-22 12:19:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Donhang](
	[Madon] [int] IDENTITY(1,1) NOT NULL,
	[Ngaydat] [datetime] NULL,
	[Tinhtrang] [int] NULL,
	[MaNguoidung] [int] NULL,
	[Thanhtoan] [int] NULL,
	[Diachinhanhang] [nvarchar](100) NULL,
	[Tongtien] [decimal](18, 0) NULL,
	[PhuongThuc] [nvarchar](50) NULL,
 CONSTRAINT [PK_Donhang] PRIMARY KEY CLUSTERED 
(
	[Madon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hangsanxuat]    Script Date: 2024-05-22 12:19:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hangsanxuat](
	[Mahang] [int] IDENTITY(1,1) NOT NULL,
	[Tenhang] [nchar](10) NULL,
 CONSTRAINT [PK_Hangsanxuat] PRIMARY KEY CLUSTERED 
(
	[Mahang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hedieuhanh]    Script Date: 2024-05-22 12:19:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hedieuhanh](
	[Mahdh] [int] IDENTITY(1,1) NOT NULL,
	[Tenhdh] [nchar](10) NULL,
 CONSTRAINT [PK_Hedieuhanh] PRIMARY KEY CLUSTERED 
(
	[Mahdh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nguoidung]    Script Date: 2024-05-22 12:19:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nguoidung](
	[MaNguoiDung] [int] IDENTITY(1,1) NOT NULL,
	[Hoten] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Dienthoai] [nchar](10) NULL,
	[Matkhau] [varchar](50) NULL,
	[IDQuyen] [int] NULL,
	[Diachi] [nvarchar](100) NULL,
	[Anhdaidien] [nchar](30) NULL,
 CONSTRAINT [PK_Khachhang] PRIMARY KEY CLUSTERED 
(
	[MaNguoiDung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanQuyen]    Script Date: 2024-05-22 12:19:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanQuyen](
	[IDQuyen] [int] IDENTITY(1,1) NOT NULL,
	[TenQuyen] [nvarchar](20) NULL,
 CONSTRAINT [PK_PhanQuyen] PRIMARY KEY CLUSTERED 
(
	[IDQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sanpham]    Script Date: 2024-05-22 12:19:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sanpham](
	[Masp] [int] IDENTITY(1,1) NOT NULL,
	[Tensp] [nvarchar](50) NULL,
	[Giatien] [decimal](18, 0) NULL,
	[Soluong] [int] NULL,
	[Mota] [ntext] NULL,
	[Thesim] [int] NULL,
	[Bonhotrong] [int] NULL,
	[Sanphammoi] [bit] NULL,
	[Ram] [int] NULL,
	[Anhbia] [nvarchar](50) NULL,
	[Mahang] [int] NULL,
	[Mahdh] [int] NULL,
 CONSTRAINT [PK_Sanpham] PRIMARY KEY CLUSTERED 
(
	[Masp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Chitietdonhang] ([Madon], [Masp], [Soluong], [Dongia], [Thanhtien], [Phuongthucthanhtoan], [PhuongThuc]) VALUES (48, 5, 1, CAST(2000000 AS Decimal(18, 0)), NULL, NULL, N'COD')
INSERT [dbo].[Chitietdonhang] ([Madon], [Masp], [Soluong], [Dongia], [Thanhtien], [Phuongthucthanhtoan], [PhuongThuc]) VALUES (49, 8, 1, CAST(1000000 AS Decimal(18, 0)), NULL, NULL, N'PayPal')
INSERT [dbo].[Chitietdonhang] ([Madon], [Masp], [Soluong], [Dongia], [Thanhtien], [Phuongthucthanhtoan], [PhuongThuc]) VALUES (50, 2, 1, CAST(2000000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), NULL, N'COD')
INSERT [dbo].[Chitietdonhang] ([Madon], [Masp], [Soluong], [Dongia], [Thanhtien], [Phuongthucthanhtoan], [PhuongThuc]) VALUES (51, 5, 1, CAST(2000000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), NULL, N'COD')
INSERT [dbo].[Chitietdonhang] ([Madon], [Masp], [Soluong], [Dongia], [Thanhtien], [Phuongthucthanhtoan], [PhuongThuc]) VALUES (52, 2, 1, CAST(2000000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), NULL, N'COD')
INSERT [dbo].[Chitietdonhang] ([Madon], [Masp], [Soluong], [Dongia], [Thanhtien], [Phuongthucthanhtoan], [PhuongThuc]) VALUES (53, 5, 1, CAST(2000000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), NULL, N'COD')
INSERT [dbo].[Chitietdonhang] ([Madon], [Masp], [Soluong], [Dongia], [Thanhtien], [Phuongthucthanhtoan], [PhuongThuc]) VALUES (54, 2, 1, CAST(2000000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), NULL, N'PayPal')
INSERT [dbo].[Chitietdonhang] ([Madon], [Masp], [Soluong], [Dongia], [Thanhtien], [Phuongthucthanhtoan], [PhuongThuc]) VALUES (55, 2, 1, CAST(2000000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), NULL, N'COD')
INSERT [dbo].[Chitietdonhang] ([Madon], [Masp], [Soluong], [Dongia], [Thanhtien], [Phuongthucthanhtoan], [PhuongThuc]) VALUES (56, 5, 1, CAST(2000000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), NULL, N'COD')
INSERT [dbo].[Chitietdonhang] ([Madon], [Masp], [Soluong], [Dongia], [Thanhtien], [Phuongthucthanhtoan], [PhuongThuc]) VALUES (57, 2, 1, CAST(2000000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), NULL, N'COD')
INSERT [dbo].[Chitietdonhang] ([Madon], [Masp], [Soluong], [Dongia], [Thanhtien], [Phuongthucthanhtoan], [PhuongThuc]) VALUES (58, 2, 1, CAST(2000000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), NULL, N'PayPal')
INSERT [dbo].[Chitietdonhang] ([Madon], [Masp], [Soluong], [Dongia], [Thanhtien], [Phuongthucthanhtoan], [PhuongThuc]) VALUES (59, 2, 1, CAST(35990000 AS Decimal(18, 0)), CAST(35990000 AS Decimal(18, 0)), NULL, N'COD')
INSERT [dbo].[Chitietdonhang] ([Madon], [Masp], [Soluong], [Dongia], [Thanhtien], [Phuongthucthanhtoan], [PhuongThuc]) VALUES (60, 2, 1, CAST(22222 AS Decimal(18, 0)), CAST(22222 AS Decimal(18, 0)), NULL, N'PayPal')
GO
SET IDENTITY_INSERT [dbo].[Donhang] ON 

INSERT [dbo].[Donhang] ([Madon], [Ngaydat], [Tinhtrang], [MaNguoidung], [Thanhtoan], [Diachinhanhang], [Tongtien], [PhuongThuc]) VALUES (48, CAST(N'2024-05-19T13:47:55.947' AS DateTime), 1, 43, NULL, NULL, CAST(2000000 AS Decimal(18, 0)), N'COD')
INSERT [dbo].[Donhang] ([Madon], [Ngaydat], [Tinhtrang], [MaNguoidung], [Thanhtoan], [Diachinhanhang], [Tongtien], [PhuongThuc]) VALUES (49, CAST(N'2024-05-19T13:48:31.543' AS DateTime), 1, 43, NULL, NULL, CAST(1000000 AS Decimal(18, 0)), N'PayPal')
INSERT [dbo].[Donhang] ([Madon], [Ngaydat], [Tinhtrang], [MaNguoidung], [Thanhtoan], [Diachinhanhang], [Tongtien], [PhuongThuc]) VALUES (50, CAST(N'2024-05-19T14:03:02.770' AS DateTime), 2, 43, NULL, NULL, CAST(2000000 AS Decimal(18, 0)), N'COD')
INSERT [dbo].[Donhang] ([Madon], [Ngaydat], [Tinhtrang], [MaNguoidung], [Thanhtoan], [Diachinhanhang], [Tongtien], [PhuongThuc]) VALUES (51, CAST(N'2024-05-19T14:04:06.643' AS DateTime), 2, 43, NULL, NULL, CAST(2000000 AS Decimal(18, 0)), N'COD')
INSERT [dbo].[Donhang] ([Madon], [Ngaydat], [Tinhtrang], [MaNguoidung], [Thanhtoan], [Diachinhanhang], [Tongtien], [PhuongThuc]) VALUES (52, CAST(N'2024-05-19T14:07:00.967' AS DateTime), 2, 43, NULL, NULL, CAST(2000000 AS Decimal(18, 0)), N'COD')
INSERT [dbo].[Donhang] ([Madon], [Ngaydat], [Tinhtrang], [MaNguoidung], [Thanhtoan], [Diachinhanhang], [Tongtien], [PhuongThuc]) VALUES (53, CAST(N'2024-05-19T14:09:29.650' AS DateTime), 2, 43, NULL, N'dong nai', CAST(2000000 AS Decimal(18, 0)), N'COD')
INSERT [dbo].[Donhang] ([Madon], [Ngaydat], [Tinhtrang], [MaNguoidung], [Thanhtoan], [Diachinhanhang], [Tongtien], [PhuongThuc]) VALUES (54, CAST(N'2024-05-20T09:29:56.340' AS DateTime), 1, 43, NULL, NULL, CAST(2000000 AS Decimal(18, 0)), N'PayPal')
INSERT [dbo].[Donhang] ([Madon], [Ngaydat], [Tinhtrang], [MaNguoidung], [Thanhtoan], [Diachinhanhang], [Tongtien], [PhuongThuc]) VALUES (55, CAST(N'2024-05-20T09:30:15.393' AS DateTime), 1, 43, NULL, NULL, CAST(2000000 AS Decimal(18, 0)), N'COD')
INSERT [dbo].[Donhang] ([Madon], [Ngaydat], [Tinhtrang], [MaNguoidung], [Thanhtoan], [Diachinhanhang], [Tongtien], [PhuongThuc]) VALUES (56, CAST(N'2024-05-20T19:04:34.830' AS DateTime), 2, 43, NULL, N'dong nai', CAST(2000000 AS Decimal(18, 0)), N'COD')
INSERT [dbo].[Donhang] ([Madon], [Ngaydat], [Tinhtrang], [MaNguoidung], [Thanhtoan], [Diachinhanhang], [Tongtien], [PhuongThuc]) VALUES (57, CAST(N'2024-05-20T19:05:58.797' AS DateTime), 2, 43, NULL, N'dong nai', CAST(2000000 AS Decimal(18, 0)), N'COD')
INSERT [dbo].[Donhang] ([Madon], [Ngaydat], [Tinhtrang], [MaNguoidung], [Thanhtoan], [Diachinhanhang], [Tongtien], [PhuongThuc]) VALUES (58, CAST(N'2024-05-21T15:20:01.507' AS DateTime), 1, 43, NULL, N'lon phu yen', CAST(2000000 AS Decimal(18, 0)), N'PayPal')
INSERT [dbo].[Donhang] ([Madon], [Ngaydat], [Tinhtrang], [MaNguoidung], [Thanhtoan], [Diachinhanhang], [Tongtien], [PhuongThuc]) VALUES (59, CAST(N'2024-05-22T10:30:07.220' AS DateTime), 2, 43, NULL, NULL, CAST(35990000 AS Decimal(18, 0)), N'COD')
INSERT [dbo].[Donhang] ([Madon], [Ngaydat], [Tinhtrang], [MaNguoidung], [Thanhtoan], [Diachinhanhang], [Tongtien], [PhuongThuc]) VALUES (60, CAST(N'2024-05-22T11:37:01.697' AS DateTime), 1, 43, NULL, NULL, CAST(22222 AS Decimal(18, 0)), N'PayPal')
SET IDENTITY_INSERT [dbo].[Donhang] OFF
GO
SET IDENTITY_INSERT [dbo].[Hangsanxuat] ON 

INSERT [dbo].[Hangsanxuat] ([Mahang], [Tenhang]) VALUES (1, N'Sam Sung  ')
INSERT [dbo].[Hangsanxuat] ([Mahang], [Tenhang]) VALUES (2, N'Apple     ')
INSERT [dbo].[Hangsanxuat] ([Mahang], [Tenhang]) VALUES (3, N'Khác      ')
SET IDENTITY_INSERT [dbo].[Hangsanxuat] OFF
GO
SET IDENTITY_INSERT [dbo].[Hedieuhanh] ON 

INSERT [dbo].[Hedieuhanh] ([Mahdh], [Tenhdh]) VALUES (1, N'Android   ')
INSERT [dbo].[Hedieuhanh] ([Mahdh], [Tenhdh]) VALUES (2, N'IOS       ')
SET IDENTITY_INSERT [dbo].[Hedieuhanh] OFF
GO
SET IDENTITY_INSERT [dbo].[Nguoidung] ON 

INSERT [dbo].[Nguoidung] ([MaNguoiDung], [Hoten], [Email], [Dienthoai], [Matkhau], [IDQuyen], [Diachi], [Anhdaidien]) VALUES (43, N'tai', N'tai@gmail.com', N'0123456789', N'12345678', 1, N'ap 7 xa thanh phu', NULL)
INSERT [dbo].[Nguoidung] ([MaNguoiDung], [Hoten], [Email], [Dienthoai], [Matkhau], [IDQuyen], [Diachi], [Anhdaidien]) VALUES (44, N'admin', N'admin1@gmail.com', N'0123456789', N'admin', 2, N'dong nai', NULL)
INSERT [dbo].[Nguoidung] ([MaNguoiDung], [Hoten], [Email], [Dienthoai], [Matkhau], [IDQuyen], [Diachi], [Anhdaidien]) VALUES (45, N'tuan anh', N't@ga.cp', N'0123456789', N'12345678', 1, N'tam hiep', NULL)
SET IDENTITY_INSERT [dbo].[Nguoidung] OFF
GO
SET IDENTITY_INSERT [dbo].[PhanQuyen] ON 

INSERT [dbo].[PhanQuyen] ([IDQuyen], [TenQuyen]) VALUES (1, N'Member')
INSERT [dbo].[PhanQuyen] ([IDQuyen], [TenQuyen]) VALUES (2, N'Admin')
SET IDENTITY_INSERT [dbo].[PhanQuyen] OFF
GO
SET IDENTITY_INSERT [dbo].[Sanpham] ON 

INSERT [dbo].[Sanpham] ([Masp], [Tensp], [Giatien], [Soluong], [Mota], [Thesim], [Bonhotrong], [Sanphammoi], [Ram], [Anhbia], [Mahang], [Mahdh]) VALUES (2, N'iPhone 14 Pro Max', CAST(22222 AS Decimal(18, 0)), 9999, N'	iPhone 14 Pro Max với màn hình OLED 6.7 inch, chip A16 Bionic, và camera 3 cảm biến', 2, 8, 0, 8, N'/Images/files/Apple-iPhone-14-test.jpg', 2, 2)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [Giatien], [Soluong], [Mota], [Thesim], [Bonhotrong], [Sanphammoi], [Ram], [Anhbia], [Mahang], [Mahdh]) VALUES (5, N'Samsung Galaxy S22 Ultra', CAST(29990000 AS Decimal(18, 0)), 10, N'Samsung Galaxy S22 Ultra với màn hình Dynamic AMOLED 2X 6.8 inch, chip Exynos 2200, và camera quad 108MP', 2, 16, 0, 1, N'/Images/files/Samsung-Galaxy-S22-Ultra-600x600.jpg', 1, 1)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [Giatien], [Soluong], [Mota], [Thesim], [Bonhotrong], [Sanphammoi], [Ram], [Anhbia], [Mahang], [Mahdh]) VALUES (6, N'Google Pixel 7 Pro', CAST(24490000 AS Decimal(18, 0)), 10, N'Google Pixel 7 Pro với màn hình OLED 6.7 inch, chip Snapdragon 8 Gen 2, và camera dual 50MP', 0, 512, 0, 8, N'/Images/files/Google-Pixel-7-Pro-600x600.jpg', 1, 1)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [Giatien], [Soluong], [Mota], [Thesim], [Bonhotrong], [Sanphammoi], [Ram], [Anhbia], [Mahang], [Mahdh]) VALUES (7, N'OnePlus 10 Pro', CAST(21990000 AS Decimal(18, 0)), 99, N'OnePlus 10 Pro với màn hình Fluid AMOLED 6.7 inch, chip Snapdragon 8 Gen 2, và camera triple 48MP', 2, 8, 0, 8, N'/Images/files/OnePlus-10-Pro-2-600x600.jpg', 1, 1)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [Giatien], [Soluong], [Mota], [Thesim], [Bonhotrong], [Sanphammoi], [Ram], [Anhbia], [Mahang], [Mahdh]) VALUES (8, N'Xiaomi Mi 12 Ultra', CAST(20490000 AS Decimal(18, 0)), 1, N'Xiaomi Mi 12 Ultra với màn hình AMOLED 6.81 inch, chip Snapdragon 8 Gen 2, và camera quad 50MP', 2, 8, 0, 2, N'/Images/files/Xiaomi-Mi-12-Ultra-1-600x600.jpg', 3, 1)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [Giatien], [Soluong], [Mota], [Thesim], [Bonhotrong], [Sanphammoi], [Ram], [Anhbia], [Mahang], [Mahdh]) VALUES (9, N'Oppo Find X5 Pro', CAST(19990000 AS Decimal(18, 0)), 99, N'Oppo Find X5 Pro với màn hình AMOLED 6.7 inch, chip Snapdragon 8 Gen 1, và camera quad 50MP', 2, 8, 0, 16, N'/Images/files/Oppo-Find-X5-Pro-1-600x600.jpg', 1, 1)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [Giatien], [Soluong], [Mota], [Thesim], [Bonhotrong], [Sanphammoi], [Ram], [Anhbia], [Mahang], [Mahdh]) VALUES (10, N'Vivo X80 Pro', CAST(17990000 AS Decimal(18, 0)), 99, N'Vivo X80 Pro với màn hình AMOLED 6.78 inch, chip Snapdragon 8 Gen 1, và camera triple 50MP', 2, 512, 0, 18, N'/Images/files/vivo-X80-Pro-1-600x600.jpg', 1, 1)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [Giatien], [Soluong], [Mota], [Thesim], [Bonhotrong], [Sanphammoi], [Ram], [Anhbia], [Mahang], [Mahdh]) VALUES (11, N'Realme GT 3 Pro', CAST(16990000 AS Decimal(18, 0)), 112, N'Realme GT 3 Pro với màn hình Super AMOLED 6.7 inch, chip Snapdragon 8 Gen 1, và camera triple 64MP', 2, 512, 0, 18, N'/Images/files/Realme-GT3-Pro-600x600.jpg', 1, 1)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [Giatien], [Soluong], [Mota], [Thesim], [Bonhotrong], [Sanphammoi], [Ram], [Anhbia], [Mahang], [Mahdh]) VALUES (13, N'Asus ROG Phone 6', CAST(18490000 AS Decimal(18, 0)), 10, N'Asus ROG Phone 6 với màn hình AMOLED 6.78 inch, chip Snapdragon 8 Gen 1, và camera dual 64MP', 2, 8, 0, 16, N'/Images/files/Asus-ROG-Phone-6-600x600.jpg', 3, 1)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [Giatien], [Soluong], [Mota], [Thesim], [Bonhotrong], [Sanphammoi], [Ram], [Anhbia], [Mahang], [Mahdh]) VALUES (14, N'Sony Xperia 1 IV', CAST(17990000 AS Decimal(18, 0)), 999, N'Sony Xperia 1 IV với màn hình OLED 6.5 inch, chip Snapdragon 8 Gen 1, và camera triple 50MP', 2, 512, 0, 18, N'/Images/files/Sony-Xperia-1-IV-1-600x600.jpg', 3, 1)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [Giatien], [Soluong], [Mota], [Thesim], [Bonhotrong], [Sanphammoi], [Ram], [Anhbia], [Mahang], [Mahdh]) VALUES (15, N'Huawei P50 Pro', CAST(21990000 AS Decimal(18, 0)), 10, N'Huawei P50 Pro với màn hình OLED 6.6 inch, chip Kirin 9000, và camera quad 50MP', 2, 512, 0, 18, N'/Images/files/Huawei-P50-Pro-1-600x600.jpg', 3, 1)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [Giatien], [Soluong], [Mota], [Thesim], [Bonhotrong], [Sanphammoi], [Ram], [Anhbia], [Mahang], [Mahdh]) VALUES (16, N'Huawei Mate 50 Pro', CAST(24990000 AS Decimal(18, 0)), 10, N'Huawei Mate 50 Pro với màn hình OLED 6.8 inch, chip Kirin 9000, và camera triple 50MP', 2, 512, 0, 18, N'/Images/files/Huawei-Mate-50-Pro-600x600.jpg', 3, 1)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [Giatien], [Soluong], [Mota], [Thesim], [Bonhotrong], [Sanphammoi], [Ram], [Anhbia], [Mahang], [Mahdh]) VALUES (18, N'iPhone 14 | Chính hãng VN/A', CAST(25990000 AS Decimal(18, 0)), 244, N'Trên iPhone 14, bạn sẽ tìm thấy một kiểu dáng mang đậm bản sắc Apple với thân máy được hoàn thiện tỉ mỉ, chắc chắn mà vẫn nhẹ nhàng. Loại nhôm cấu tạo nên khung vỏ iPhone 14 được tuyển chọn kỹ lưỡng và là nguyên liệu cao cấp được ứng dụng phổ biến trong ngành hàng không', 1, 128, 0, 8, N'/Images/files/iPhone_14_Pro_Max_D-1a__en-US.png', 2, 2)
SET IDENTITY_INSERT [dbo].[Sanpham] OFF
GO
ALTER TABLE [dbo].[Nguoidung] ADD  CONSTRAINT [DF_Nguoidung_IDQuyen]  DEFAULT ((0)) FOR [IDQuyen]
GO
ALTER TABLE [dbo].[Chitietdonhang]  WITH CHECK ADD  CONSTRAINT [FK_Chitietdonhang_Donhang] FOREIGN KEY([Madon])
REFERENCES [dbo].[Donhang] ([Madon])
GO
ALTER TABLE [dbo].[Chitietdonhang] CHECK CONSTRAINT [FK_Chitietdonhang_Donhang]
GO
ALTER TABLE [dbo].[Chitietdonhang]  WITH CHECK ADD  CONSTRAINT [FK_Chitietdonhang_Sanpham] FOREIGN KEY([Masp])
REFERENCES [dbo].[Sanpham] ([Masp])
GO
ALTER TABLE [dbo].[Chitietdonhang] CHECK CONSTRAINT [FK_Chitietdonhang_Sanpham]
GO
ALTER TABLE [dbo].[Donhang]  WITH CHECK ADD  CONSTRAINT [FK_Donhang_Khachhang] FOREIGN KEY([MaNguoidung])
REFERENCES [dbo].[Nguoidung] ([MaNguoiDung])
GO
ALTER TABLE [dbo].[Donhang] CHECK CONSTRAINT [FK_Donhang_Khachhang]
GO
ALTER TABLE [dbo].[Nguoidung]  WITH CHECK ADD  CONSTRAINT [FK_Nguoidung_Nguoidung] FOREIGN KEY([IDQuyen])
REFERENCES [dbo].[PhanQuyen] ([IDQuyen])
GO
ALTER TABLE [dbo].[Nguoidung] CHECK CONSTRAINT [FK_Nguoidung_Nguoidung]
GO
ALTER TABLE [dbo].[Sanpham]  WITH CHECK ADD  CONSTRAINT [FK_Sanpham_Hangsanxuat] FOREIGN KEY([Mahang])
REFERENCES [dbo].[Hangsanxuat] ([Mahang])
GO
ALTER TABLE [dbo].[Sanpham] CHECK CONSTRAINT [FK_Sanpham_Hangsanxuat]
GO
ALTER TABLE [dbo].[Sanpham]  WITH CHECK ADD  CONSTRAINT [FK_Sanpham_Hedieuhanh] FOREIGN KEY([Mahdh])
REFERENCES [dbo].[Hedieuhanh] ([Mahdh])
GO
ALTER TABLE [dbo].[Sanpham] CHECK CONSTRAINT [FK_Sanpham_Hedieuhanh]
GO
USE [master]
GO
ALTER DATABASE [Qldienthoai] SET  READ_WRITE 
GO
