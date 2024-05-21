USE [master]
GO
/****** Object:  Database [Qldienthoai]    Script Date: 2024-05-21 2:34:43 PM ******/
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
/****** Object:  User [user]    Script Date: 2024-05-21 2:34:43 PM ******/
CREATE USER [user] FOR LOGIN [user] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [saa]    Script Date: 2024-05-21 2:34:43 PM ******/
CREATE USER [saa] FOR LOGIN [saa] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [user]
GO
ALTER ROLE [db_owner] ADD MEMBER [saa]
GO
/****** Object:  Table [dbo].[Chitietdonhang]    Script Date: 2024-05-21 2:34:43 PM ******/
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
/****** Object:  Table [dbo].[Donhang]    Script Date: 2024-05-21 2:34:43 PM ******/
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
/****** Object:  Table [dbo].[Hangsanxuat]    Script Date: 2024-05-21 2:34:43 PM ******/
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
/****** Object:  Table [dbo].[Hedieuhanh]    Script Date: 2024-05-21 2:34:43 PM ******/
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
/****** Object:  Table [dbo].[Nguoidung]    Script Date: 2024-05-21 2:34:43 PM ******/
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
/****** Object:  Table [dbo].[PhanQuyen]    Script Date: 2024-05-21 2:34:43 PM ******/
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
/****** Object:  Table [dbo].[Sanpham]    Script Date: 2024-05-21 2:34:43 PM ******/
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
