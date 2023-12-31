USE [master]
GO
/****** Object:  Database [YogaCenterDB]    Script Date: 14/07/2023 8:50:37 SA ******/
CREATE DATABASE [YogaCenterDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'YogaCenterDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\YogaCenterDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'YogaCenterDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\YogaCenterDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [YogaCenterDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [YogaCenterDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [YogaCenterDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [YogaCenterDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [YogaCenterDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [YogaCenterDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [YogaCenterDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [YogaCenterDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [YogaCenterDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [YogaCenterDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [YogaCenterDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [YogaCenterDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [YogaCenterDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [YogaCenterDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [YogaCenterDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [YogaCenterDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [YogaCenterDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [YogaCenterDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [YogaCenterDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [YogaCenterDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [YogaCenterDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [YogaCenterDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [YogaCenterDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [YogaCenterDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [YogaCenterDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [YogaCenterDB] SET  MULTI_USER 
GO
ALTER DATABASE [YogaCenterDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [YogaCenterDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [YogaCenterDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [YogaCenterDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [YogaCenterDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [YogaCenterDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [YogaCenterDB] SET QUERY_STORE = OFF
GO
USE [YogaCenterDB]
GO
/****** Object:  Table [dbo].[tblAccount]    Script Date: 14/07/2023 8:50:37 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAccount](
	[account_id] [int] IDENTITY(1,1) NOT NULL,
	[account_img] [nvarchar](255) NULL,
	[account_name] [nvarchar](30) NULL,
	[account_password] [nvarchar](30) NULL,
	[account_email] [nvarchar](50) NULL,
	[account_phone] [nvarchar](12) NULL,
	[account_is_active] [bit] NULL,
	[role_id] [int] NULL,
	[social_id] [nvarchar](21) NULL,
	[create_date] [date] NULL,
 CONSTRAINT [PK_tblAccount] PRIMARY KEY CLUSTERED 
(
	[account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBill]    Script Date: 14/07/2023 8:50:37 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBill](
	[course_id] [int] NULL,
	[account_id] [int] NULL,
	[bill_id] [int] IDENTITY(1,1) NOT NULL,
	[bill_status] [int] NULL,
	[bill_is_active] [bit] NULL,
	[bill_value] [decimal](10, 2) NULL,
	[bill_discount] [int] NULL,
	[bill_date] [datetime] NULL,
	[order_code] [nvarchar](15) NULL,
	[payment_method] [nvarchar](20) NULL,
	[payment_date] [datetime] NULL,
 CONSTRAINT [PK_tblBill] PRIMARY KEY CLUSTERED 
(
	[bill_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBillMembership]    Script Date: 14/07/2023 8:50:37 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBillMembership](
	[membership_id] [int] NULL,
	[account_id] [int] NULL,
	[bill_mem_id] [int] IDENTITY(1,1) NOT NULL,
	[bill_status] [int] NULL,
	[bill_is_active] [bit] NULL,
	[bill_value] [decimal](10, 2) NULL,
	[bill_discount] [int] NULL,
	[bill_date] [datetime] NULL,
	[order_code] [nvarchar](15) NULL,
	[payment_method] [nvarchar](20) NULL,
	[payment_date] [datetime] NULL,
 CONSTRAINT [PK_tblBillMembership] PRIMARY KEY CLUSTERED 
(
	[bill_mem_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBlog]    Script Date: 14/07/2023 8:50:37 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBlog](
	[blog_id] [int] IDENTITY(1,1) NOT NULL,
	[blog_title] [nvarchar](50) NULL,
	[blog_detail] [nvarchar](3000) NULL,
	[account_id] [int] NULL,
	[blog_date] [datetime] NULL,
	[blog_img] [nvarchar](255) NULL,
 CONSTRAINT [PK_tblBlog] PRIMARY KEY CLUSTERED 
(
	[blog_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 14/07/2023 8:50:37 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](20) NULL,
	[category_is_active] [bit] NULL,
 CONSTRAINT [PK_tblCategory] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblClassSchedule]    Script Date: 14/07/2023 8:50:37 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblClassSchedule](
	[registration_id] [int] NULL,
	[class_schedule_id] [int] IDENTITY(1,1) NOT NULL,
	[class_date] [date] NULL,
	[slot_start_time] [time](7) NULL,
	[slot_end_time] [time](7) NULL,
	[class_status] [int] NULL,
 CONSTRAINT [PK_tblClassSchedule] PRIMARY KEY CLUSTERED 
(
	[class_schedule_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblComment]    Script Date: 14/07/2023 8:50:37 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblComment](
	[blog_id] [int] NULL,
	[comment_content] [nvarchar](255) NULL,
	[comment_date] [datetime] NULL,
	[account_id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCourse]    Script Date: 14/07/2023 8:50:37 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCourse](
	[course_id] [int] IDENTITY(1,1) NOT NULL,
	[course_title] [nvarchar](50) NULL,
	[course_detail] [text] NULL,
	[course_duration] [int] NULL,
	[course_img] [nvarchar](255) NULL,
	[category_id] [int] NULL,
	[course_price] [decimal](10, 2) NULL,
	[course_is_active] [bit] NULL,
	[account_id] [int] NULL,
 CONSTRAINT [PK_tblCourse] PRIMARY KEY CLUSTERED 
(
	[course_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCourseSchedule]    Script Date: 14/07/2023 8:50:37 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCourseSchedule](
	[course_id] [int] NULL,
	[course_schedule_id] [int] IDENTITY(1,1) NOT NULL,
	[day_of_week] [nvarchar](20) NULL,
	[start_time] [time](7) NULL,
	[end_time] [time](7) NULL,
	[is_active] [bit] NULL,
 CONSTRAINT [PK_tblCourseSchedule] PRIMARY KEY CLUSTERED 
(
	[course_schedule_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCourseWishlist]    Script Date: 14/07/2023 8:50:37 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCourseWishlist](
	[course_id] [int] NOT NULL,
	[account_id] [int] NOT NULL,
 CONSTRAINT [PK_tblCourseWishlist] PRIMARY KEY CLUSTERED 
(
	[course_id] ASC,
	[account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMembership]    Script Date: 14/07/2023 8:50:37 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMembership](
	[membership_id] [int] IDENTITY(1,1) NOT NULL,
	[membership_name] [nvarchar](50) NULL,
	[membership_duration] [int] NULL,
	[membership_price] [decimal](10, 2) NULL,
	[membership_description] [nvarchar](255) NULL,
	[membership_discours] [int] NULL,
	[membership_is_active] [bit] NULL,
 CONSTRAINT [PK_tblMembership] PRIMARY KEY CLUSTERED 
(
	[membership_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRatingCourse]    Script Date: 14/07/2023 8:50:37 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRatingCourse](
	[registration_id] [int] NOT NULL,
	[rating_star] [int] NULL,
	[feedback] [nvarchar](50) NULL,
	[course_id] [int] NULL,
 CONSTRAINT [PK_tblRatingCourse] PRIMARY KEY CLUSTERED 
(
	[registration_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRegistrationCourse]    Script Date: 14/07/2023 8:50:37 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRegistrationCourse](
	[course_id] [int] NULL,
	[account_id] [int] NULL,
	[registration_id] [int] IDENTITY(1,1) NOT NULL,
	[registration_date] [datetime] NULL,
	[end_date] [datetime] NULL,
	[course_status] [int] NULL,
	[course_schedule_id] [int] NULL,
	[registration_status] [bit] NULL,
 CONSTRAINT [PK_tblRegistrationCourse] PRIMARY KEY CLUSTERED 
(
	[registration_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRegistrationMembership]    Script Date: 14/07/2023 8:50:37 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRegistrationMembership](
	[membership_id] [int] NOT NULL,
	[account_id] [int] NOT NULL,
	[registration_date] [datetime] NULL,
	[expriration_date] [datetime] NULL,
	[registration_status] [bit] NULL,
 CONSTRAINT [PK_tblRegistrationMembership] PRIMARY KEY CLUSTERED 
(
	[membership_id] ASC,
	[account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRole]    Script Date: 14/07/2023 8:50:37 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRole](
	[role_id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [nvarchar](20) NULL,
 CONSTRAINT [PK_tblRole] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblAccount] ON 

INSERT [dbo].[tblAccount] ([account_id], [account_img], [account_name], [account_password], [account_email], [account_phone], [account_is_active], [role_id], [social_id], [create_date]) VALUES (1, N'avatar-acc-id-1.jpg', N'Thang', N'thang123', N'thangdeptrai@gmail.com', N'037700123', 1, 3, NULL, CAST(N'2023-06-12' AS Date))
INSERT [dbo].[tblAccount] ([account_id], [account_img], [account_name], [account_password], [account_email], [account_phone], [account_is_active], [role_id], [social_id], [create_date]) VALUES (2, N'avatar-acc-id-2.webp', N'Long99', N'long123', N'dd@gmail', N'655653543', 1, 1, NULL, CAST(N'2023-05-14' AS Date))
INSERT [dbo].[tblAccount] ([account_id], [account_img], [account_name], [account_password], [account_email], [account_phone], [account_is_active], [role_id], [social_id], [create_date]) VALUES (3, N'avatar-acc-id-3.jpg', N'An Le Dang', N'an148', N'anmobieblog@gmail.com', N'0991144564', 1, 2, NULL, CAST(N'2023-04-11' AS Date))
INSERT [dbo].[tblAccount] ([account_id], [account_img], [account_name], [account_password], [account_email], [account_phone], [account_is_active], [role_id], [social_id], [create_date]) VALUES (4, N'avatar-acc-id-4.jpg', N'Dung Jone', N'12345', N'dung@gmail.com', N'0123456789', 1, 2, NULL, CAST(N'2023-02-18' AS Date))
INSERT [dbo].[tblAccount] ([account_id], [account_img], [account_name], [account_password], [account_email], [account_phone], [account_is_active], [role_id], [social_id], [create_date]) VALUES (12, N'avatar-acc-id-12.jpg', N'John Doe', N'password1', N'john.doe@example.com', N'0312345678', 1, 2, NULL, CAST(N'2022-01-01' AS Date))
INSERT [dbo].[tblAccount] ([account_id], [account_img], [account_name], [account_password], [account_email], [account_phone], [account_is_active], [role_id], [social_id], [create_date]) VALUES (13, N'avatar-acc-id-13.jpg', N'Jane Smith', N'password2', N'jane.smith@example.com', N'0323456789', 1, 2, NULL, CAST(N'2022-02-02' AS Date))
INSERT [dbo].[tblAccount] ([account_id], [account_img], [account_name], [account_password], [account_email], [account_phone], [account_is_active], [role_id], [social_id], [create_date]) VALUES (14, N'avatar-acc-id-14.jpg', N'Bob Johnson', N'password3', N'bob.johnson@example.com', N'0334567890', 1, 2, NULL, CAST(N'2022-05-03' AS Date))
INSERT [dbo].[tblAccount] ([account_id], [account_img], [account_name], [account_password], [account_email], [account_phone], [account_is_active], [role_id], [social_id], [create_date]) VALUES (15, N'avatar-acc-id-15.jpg', N'Alice Brown', N'password4', N'alice.brown@example.com', N'0345678901', 1, 2, NULL, CAST(N'2022-04-04' AS Date))
INSERT [dbo].[tblAccount] ([account_id], [account_img], [account_name], [account_password], [account_email], [account_phone], [account_is_active], [role_id], [social_id], [create_date]) VALUES (16, N'avatar-acc-id-16.jpg', N'Michael Davis', N'password5', N'michael.davis@example.com', N'0356789012', 1, 2, NULL, CAST(N'2022-05-05' AS Date))
INSERT [dbo].[tblAccount] ([account_id], [account_img], [account_name], [account_password], [account_email], [account_phone], [account_is_active], [role_id], [social_id], [create_date]) VALUES (17, N'avatar-acc-id-17.jpg', N'Sarah Wilson', N'password6', N'sarah.wilson@example.com', N'0367890123', 1, 2, NULL, CAST(N'2022-01-06' AS Date))
INSERT [dbo].[tblAccount] ([account_id], [account_img], [account_name], [account_password], [account_email], [account_phone], [account_is_active], [role_id], [social_id], [create_date]) VALUES (18, N'avatar-acc-id-18.jpg', N'David Taylor', N'password7', N'david.taylor@example.com', N'0378901234', 1, 2, NULL, CAST(N'2022-07-07' AS Date))
INSERT [dbo].[tblAccount] ([account_id], [account_img], [account_name], [account_password], [account_email], [account_phone], [account_is_active], [role_id], [social_id], [create_date]) VALUES (19, N'avatar-acc-id-19.jpg', N'Emily Anderson', N'password8', N'emily.anderson@example.com', N'0389012345', 1, 2, NULL, CAST(N'2022-02-08' AS Date))
INSERT [dbo].[tblAccount] ([account_id], [account_img], [account_name], [account_password], [account_email], [account_phone], [account_is_active], [role_id], [social_id], [create_date]) VALUES (20, N'hinh-avatar-1.png', N'Alex Rodriguez', N'password9', N'alex.rodriguez@example.com', N'0390123456', 1, 1, NULL, CAST(N'2022-09-09' AS Date))
INSERT [dbo].[tblAccount] ([account_id], [account_img], [account_name], [account_password], [account_email], [account_phone], [account_is_active], [role_id], [social_id], [create_date]) VALUES (21, N'hinh-avatar-1.png', N'Olivia Martinez', N'password10', N'olivia.martinez@example.com', N'0301234567', 1, 1, NULL, CAST(N'2022-10-10' AS Date))
INSERT [dbo].[tblAccount] ([account_id], [account_img], [account_name], [account_password], [account_email], [account_phone], [account_is_active], [role_id], [social_id], [create_date]) VALUES (22, N'hinh-avatar-1.png', N'Daniel Thomas', N'password11', N'daniel.thomas@example.com', N'0312345678', 1, 1, NULL, CAST(N'2022-10-11' AS Date))
INSERT [dbo].[tblAccount] ([account_id], [account_img], [account_name], [account_password], [account_email], [account_phone], [account_is_active], [role_id], [social_id], [create_date]) VALUES (23, N'hinh-avatar-1.png', N'Sophia Clark', N'password12', N'sophia.clark@example.com', N'0323456789', 1, 1, NULL, CAST(N'2022-12-12' AS Date))
INSERT [dbo].[tblAccount] ([account_id], [account_img], [account_name], [account_password], [account_email], [account_phone], [account_is_active], [role_id], [social_id], [create_date]) VALUES (24, N'hinh-avatar-1.png', N'Matthew Rodriguez', N'password13', N'matthew.rodriguez@example.com', N'0334567890', 1, 1, NULL, CAST(N'2023-01-01' AS Date))
INSERT [dbo].[tblAccount] ([account_id], [account_img], [account_name], [account_password], [account_email], [account_phone], [account_is_active], [role_id], [social_id], [create_date]) VALUES (25, N'hinh-avatar-1.png', N'Ava Thompson', N'password14', N'ava.thompson@example.com', N'0345678901', 1, 1, NULL, CAST(N'2023-01-02' AS Date))
INSERT [dbo].[tblAccount] ([account_id], [account_img], [account_name], [account_password], [account_email], [account_phone], [account_is_active], [role_id], [social_id], [create_date]) VALUES (26, N'hinh-avatar-1.png', N'Ethan Davis', N'password15', N'ethan.davis@example.com', N'0356789012', 1, 1, NULL, CAST(N'2023-03-03' AS Date))
INSERT [dbo].[tblAccount] ([account_id], [account_img], [account_name], [account_password], [account_email], [account_phone], [account_is_active], [role_id], [social_id], [create_date]) VALUES (27, N'hinh-avatar-1.png', N'Mia Brown', N'password16', N'mia.brown@example.com', N'0367890123', 1, 1, NULL, CAST(N'2023-04-04' AS Date))
INSERT [dbo].[tblAccount] ([account_id], [account_img], [account_name], [account_password], [account_email], [account_phone], [account_is_active], [role_id], [social_id], [create_date]) VALUES (28, N'hinh-avatar-1.png', N'James Wilson', N'password17', N'james.wilson@example.com', N'0378901234', 1, 1, NULL, CAST(N'2023-05-05' AS Date))
INSERT [dbo].[tblAccount] ([account_id], [account_img], [account_name], [account_password], [account_email], [account_phone], [account_is_active], [role_id], [social_id], [create_date]) VALUES (29, N'hinh-avatar-1.png', N'Charlotte Taylor', N'password18', N'charlotte.taylor@example.com', N'0389012345', 1, 1, NULL, CAST(N'2023-06-06' AS Date))
INSERT [dbo].[tblAccount] ([account_id], [account_img], [account_name], [account_password], [account_email], [account_phone], [account_is_active], [role_id], [social_id], [create_date]) VALUES (30, N'hinh-avatar-1.png', N'Benjamin Anderson', N'password19', N'benjamin.anderson@example.com', N'0390123456', 1, 1, NULL, CAST(N'2023-07-07' AS Date))
INSERT [dbo].[tblAccount] ([account_id], [account_img], [account_name], [account_password], [account_email], [account_phone], [account_is_active], [role_id], [social_id], [create_date]) VALUES (31, N'hinh-avatar-1.png', N'Amelia Clark', N'password20', N'amelia.clark@example.com', N'0301234567', 1, 1, NULL, CAST(N'2022-06-08' AS Date))
INSERT [dbo].[tblAccount] ([account_id], [account_img], [account_name], [account_password], [account_email], [account_phone], [account_is_active], [role_id], [social_id], [create_date]) VALUES (32, N'hinh-avatar-1.png', N'Sophie Johnson', N'password21', N'sophie.johnson@example.com', N'0312345678', 1, 1, NULL, CAST(N'2022-09-09' AS Date))
INSERT [dbo].[tblAccount] ([account_id], [account_img], [account_name], [account_password], [account_email], [account_phone], [account_is_active], [role_id], [social_id], [create_date]) VALUES (33, N'hinh-avatar-1.png', N'Liam Wilson', N'password22', N'liam.wilson@example.com', N'0323456789', 1, 1, NULL, CAST(N'2022-10-10' AS Date))
INSERT [dbo].[tblAccount] ([account_id], [account_img], [account_name], [account_password], [account_email], [account_phone], [account_is_active], [role_id], [social_id], [create_date]) VALUES (34, N'hinh-avatar-1.png', N'Grace Thompson', N'password23', N'grace.thompson@example.com', N'0334567890', 1, 1, NULL, CAST(N'2022-11-11' AS Date))
INSERT [dbo].[tblAccount] ([account_id], [account_img], [account_name], [account_password], [account_email], [account_phone], [account_is_active], [role_id], [social_id], [create_date]) VALUES (35, N'hinh-avatar-1.png', N'Noah Davis', N'password24', N'noah.davis@example.com', N'0345678901', 1, 1, NULL, CAST(N'2022-12-12' AS Date))
INSERT [dbo].[tblAccount] ([account_id], [account_img], [account_name], [account_password], [account_email], [account_phone], [account_is_active], [role_id], [social_id], [create_date]) VALUES (36, N'hinh-avatar-1.png', N'Chloe Anderson', N'password25', N'chloe.anderson@example.com', N'0356789012', 1, 1, NULL, CAST(N'2023-01-01' AS Date))
INSERT [dbo].[tblAccount] ([account_id], [account_img], [account_name], [account_password], [account_email], [account_phone], [account_is_active], [role_id], [social_id], [create_date]) VALUES (37, N'hinh-avatar-1.png', N'Benjamin Brown', N'password26', N'benjamin.brown@example.com', N'0367890123', 1, 1, NULL, CAST(N'2023-02-02' AS Date))
INSERT [dbo].[tblAccount] ([account_id], [account_img], [account_name], [account_password], [account_email], [account_phone], [account_is_active], [role_id], [social_id], [create_date]) VALUES (38, N'hinh-avatar-1.png', N'Ava Thomas', N'password27', N'ava.thomas@example.com', N'0378901234', 1, 1, NULL, CAST(N'2023-03-03' AS Date))
INSERT [dbo].[tblAccount] ([account_id], [account_img], [account_name], [account_password], [account_email], [account_phone], [account_is_active], [role_id], [social_id], [create_date]) VALUES (39, N'hinh-avatar-1.png', N'Elijah Taylor', N'password28', N'elijah.taylor@example.com', N'0389012345', 1, 1, NULL, CAST(N'2023-04-04' AS Date))
INSERT [dbo].[tblAccount] ([account_id], [account_img], [account_name], [account_password], [account_email], [account_phone], [account_is_active], [role_id], [social_id], [create_date]) VALUES (40, N'hinh-avatar-1.png', N'Mia Martinez', N'password29', N'mia.martinez@example.com', N'0390123456', 1, 1, NULL, CAST(N'2023-05-05' AS Date))
INSERT [dbo].[tblAccount] ([account_id], [account_img], [account_name], [account_password], [account_email], [account_phone], [account_is_active], [role_id], [social_id], [create_date]) VALUES (41, N'hinh-avatar-1.png', N'James Wilson', N'password30', N'james.wilson@example.com', N'0301234567', 1, 1, NULL, CAST(N'2022-06-06' AS Date))
INSERT [dbo].[tblAccount] ([account_id], [account_img], [account_name], [account_password], [account_email], [account_phone], [account_is_active], [role_id], [social_id], [create_date]) VALUES (42, N'hinh-avatar-1.png', N'Lily Clark', N'password31', N'lily.clark@example.com', N'0312345678', 1, 1, NULL, CAST(N'2022-07-07' AS Date))
INSERT [dbo].[tblAccount] ([account_id], [account_img], [account_name], [account_password], [account_email], [account_phone], [account_is_active], [role_id], [social_id], [create_date]) VALUES (43, N'hinh-avatar-1.png', N'William Rodriguez', N'password32', N'william.rodriguez@example.com', N'0323456789', 1, 1, NULL, CAST(N'2022-08-08' AS Date))
INSERT [dbo].[tblAccount] ([account_id], [account_img], [account_name], [account_password], [account_email], [account_phone], [account_is_active], [role_id], [social_id], [create_date]) VALUES (44, N'hinh-avatar-1.png', N'Olivia Thompson', N'password33', N'olivia.thompson@example.com', N'0334567890', 1, 1, NULL, CAST(N'2022-09-09' AS Date))
INSERT [dbo].[tblAccount] ([account_id], [account_img], [account_name], [account_password], [account_email], [account_phone], [account_is_active], [role_id], [social_id], [create_date]) VALUES (45, N'hinh-avatar-1.png', N'Lucas Davis', N'password34', N'lucas.davis@example.com', N'0345678901', 1, 1, NULL, CAST(N'2022-10-10' AS Date))
INSERT [dbo].[tblAccount] ([account_id], [account_img], [account_name], [account_password], [account_email], [account_phone], [account_is_active], [role_id], [social_id], [create_date]) VALUES (46, N'hinh-avatar-1.png', N'Emily Wilson', N'password35', N'emily.wilson@example.com', N'0356789012', 1, 1, NULL, CAST(N'2022-11-11' AS Date))
INSERT [dbo].[tblAccount] ([account_id], [account_img], [account_name], [account_password], [account_email], [account_phone], [account_is_active], [role_id], [social_id], [create_date]) VALUES (47, N'hinh-avatar-1.png', N'Henry Anderson', N'password36', N'henry.anderson@example.com', N'0367890123', 1, 1, NULL, CAST(N'2022-12-12' AS Date))
INSERT [dbo].[tblAccount] ([account_id], [account_img], [account_name], [account_password], [account_email], [account_phone], [account_is_active], [role_id], [social_id], [create_date]) VALUES (48, N'hinh-avatar-1.png', N'Isabella Brown', N'password37', N'isabella.brown@example.com', N'0378901234', 1, 1, NULL, CAST(N'2023-01-01' AS Date))
INSERT [dbo].[tblAccount] ([account_id], [account_img], [account_name], [account_password], [account_email], [account_phone], [account_is_active], [role_id], [social_id], [create_date]) VALUES (49, N'hinh-avatar-1.png', N'Jack Thomas', N'password38', N'jack.thomas@example.com', N'0389012345', 1, 1, NULL, CAST(N'2023-02-02' AS Date))
INSERT [dbo].[tblAccount] ([account_id], [account_img], [account_name], [account_password], [account_email], [account_phone], [account_is_active], [role_id], [social_id], [create_date]) VALUES (50, N'hinh-avatar-1.png', N'Sophia Martinez', N'password39', N'sophia.martinez@example.com', N'0390123456', 1, 1, NULL, CAST(N'2023-03-03' AS Date))
INSERT [dbo].[tblAccount] ([account_id], [account_img], [account_name], [account_password], [account_email], [account_phone], [account_is_active], [role_id], [social_id], [create_date]) VALUES (51, N'hinh-avatar-1.png', N'Daniel Wilson', N'password40', N'daniel.wilson@example.com', N'0301234567', 1, 1, NULL, CAST(N'2023-04-04' AS Date))
SET IDENTITY_INSERT [dbo].[tblAccount] OFF
GO
SET IDENTITY_INSERT [dbo].[tblBill] ON 

INSERT [dbo].[tblBill] ([course_id], [account_id], [bill_id], [bill_status], [bill_is_active], [bill_value], [bill_discount], [bill_date], [order_code], [payment_method], [payment_date]) VALUES (1, 1, 1, 1, 1, CAST(39.00 AS Decimal(10, 2)), 0, CAST(N'2023-06-03T00:00:00.000' AS DateTime), N'ABC123', N'Credit Card', CAST(N'2023-06-10T00:00:00.000' AS DateTime))
INSERT [dbo].[tblBill] ([course_id], [account_id], [bill_id], [bill_status], [bill_is_active], [bill_value], [bill_discount], [bill_date], [order_code], [payment_method], [payment_date]) VALUES (2, 2, 2, 0, 1, CAST(0.00 AS Decimal(10, 2)), 0, CAST(N'2023-06-03T00:00:00.000' AS DateTime), N'DEF456', N'Cash', CAST(N'2023-06-12T00:00:00.000' AS DateTime))
INSERT [dbo].[tblBill] ([course_id], [account_id], [bill_id], [bill_status], [bill_is_active], [bill_value], [bill_discount], [bill_date], [order_code], [payment_method], [payment_date]) VALUES (3, 2, 3, 1, 1, CAST(432.00 AS Decimal(10, 2)), 20, CAST(N'2023-06-03T00:00:00.000' AS DateTime), N'GHI789', N'PayPal', CAST(N'2023-06-14T00:00:00.000' AS DateTime))
INSERT [dbo].[tblBill] ([course_id], [account_id], [bill_id], [bill_status], [bill_is_active], [bill_value], [bill_discount], [bill_date], [order_code], [payment_method], [payment_date]) VALUES (1, 2, 4, 1, 1, CAST(120.00 AS Decimal(10, 2)), 10, CAST(N'2023-06-16T00:00:00.000' AS DateTime), N'JKL012', N'Credit Card', CAST(N'2023-06-20T00:00:00.000' AS DateTime))
INSERT [dbo].[tblBill] ([course_id], [account_id], [bill_id], [bill_status], [bill_is_active], [bill_value], [bill_discount], [bill_date], [order_code], [payment_method], [payment_date]) VALUES (1, 2, 18, 0, 1, CAST(31.20 AS Decimal(10, 2)), 20, CAST(N'2023-07-13T00:00:00.000' AS DateTime), N'786604', N'VNPAY', CAST(N'2023-07-13T23:10:11.000' AS DateTime))
INSERT [dbo].[tblBill] ([course_id], [account_id], [bill_id], [bill_status], [bill_is_active], [bill_value], [bill_discount], [bill_date], [order_code], [payment_method], [payment_date]) VALUES (3, 2, 19, 0, 1, CAST(43.20 AS Decimal(10, 2)), 20, CAST(N'2023-07-13T00:00:00.000' AS DateTime), N'836288', N'VNPAY', CAST(N'2023-07-13T23:12:00.000' AS DateTime))
INSERT [dbo].[tblBill] ([course_id], [account_id], [bill_id], [bill_status], [bill_is_active], [bill_value], [bill_discount], [bill_date], [order_code], [payment_method], [payment_date]) VALUES (7, 2, 20, 0, 1, CAST(31.20 AS Decimal(10, 2)), 20, CAST(N'2023-07-13T00:00:00.000' AS DateTime), N'733171', N'VNPAY', CAST(N'2023-07-13T23:13:25.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblBill] OFF
GO
SET IDENTITY_INSERT [dbo].[tblBlog] ON 

INSERT [dbo].[tblBlog] ([blog_id], [blog_title], [blog_detail], [account_id], [blog_date], [blog_img]) VALUES (9, N'Tips for a Healthy Lifestyle', N'Maintaining a healthy lifestyle is crucial for overall well-being. In this blog post, we share practical tips to help you improve your health. Discover how to eat nutritious foods, stay active, manage stress, and lead a healthier life.', 2, CAST(N'2022-01-01T00:00:00.000' AS DateTime), N'img-blog-id-9.jpg')
INSERT [dbo].[tblBlog] ([blog_id], [blog_title], [blog_detail], [account_id], [blog_date], [blog_img]) VALUES (10, N'Benefits of Yoga for Mind and Body', N'Yoga offers numerous benefits for both the mind and body. Explore how yoga can improve flexibility, strength, mental clarity, and promote relaxation. Discover the transformative power of yoga in this blog post.', 12, CAST(N'2022-02-02T00:00:00.000' AS DateTime), N'img-blog-id-10.jpg')
INSERT [dbo].[tblBlog] ([blog_id], [blog_title], [blog_detail], [account_id], [blog_date], [blog_img]) VALUES (11, N'Healthy Snack Ideas for Busy Individuals', N'Finding nutritious snacks can be challenging, especially with a busy schedule. In this blog post, we provide you with healthy snack ideas that are quick, easy to prepare, and packed with nutrients.', 13, CAST(N'2022-03-03T00:00:00.000' AS DateTime), N'img-blog-id-11.jpg')
INSERT [dbo].[tblBlog] ([blog_id], [blog_title], [blog_detail], [account_id], [blog_date], [blog_img]) VALUES (12, N'Power of Meditation: Cultivating Inner Peace', N'Meditation helps cultivate inner peace and find balance in today''s hectic world. Learn about the benefits of meditation and different techniques to incorporate it into your daily routine.', 14, CAST(N'2022-04-04T00:00:00.000' AS DateTime), N'img-blog-id-12.jpg')
INSERT [dbo].[tblBlog] ([blog_id], [blog_title], [blog_detail], [account_id], [blog_date], [blog_img]) VALUES (13, N'Importance of Proper Posture for a Healthy Spine', N'Maintaining good posture is essential for a healthy spine and overall well-being. Discover the importance of proper posture, common mistakes to avoid, and exercises to improve posture.', 15, CAST(N'2022-05-05T00:00:00.000' AS DateTime), N'img-blog-id-13.jpg')
INSERT [dbo].[tblBlog] ([blog_id], [blog_title], [blog_detail], [account_id], [blog_date], [blog_img]) VALUES (14, N'Yoga Poses for Stress Relief and Relaxation', N'<p><strong>Explore a selection of yoga poses</strong> designed to r<em>elease tension</em>, calm the mind, and restore balance for stress relief and relaxation. Explore a selection of yoga poses designed to release tension, calm the mind, and restore balance for stress relief and relaxation.</p>', 16, CAST(N'2022-06-06T00:00:00.000' AS DateTime), N'img-blog-id-14.jpg')
INSERT [dbo].[tblBlog] ([blog_id], [blog_title], [blog_detail], [account_id], [blog_date], [blog_img]) VALUES (15, N'Eating Mindfully: Nourishing Your Body and Soul', N'<p>Discover the <strong>benefits</strong> of mindful eating and learn how to cultivate a mindful eating practice for a healthier relationship with food.</p>', 17, CAST(N'2022-07-07T00:00:00.000' AS DateTime), N'img-blog-id-15.jpg')
INSERT [dbo].[tblBlog] ([blog_id], [blog_title], [blog_detail], [account_id], [blog_date], [blog_img]) VALUES (16, N'Role of Sleep in Your Health and Well-being', N'<p><strong>Explore the importance</strong> of sleep, its impact on physical and mental health, and practical tips for improving sleep quality and developing healthy sleep habits.</p>', 18, CAST(N'2022-08-08T00:00:00.000' AS DateTime), N'img-blog-id-16.jpg')
INSERT [dbo].[tblBlog] ([blog_id], [blog_title], [blog_detail], [account_id], [blog_date], [blog_img]) VALUES (17, N'Art of Pranayama: Yogic Breathing Techniques', N'<p><strong>Explore different pranayama </strong>techniques to enhance energy, reduce stress, improve focus, and achieve inner balance. Explore different pranayama techniques to enhance energy, reduce stress, improve focus, and achieve inner balance.</p>', 19, CAST(N'2022-09-09T00:00:00.000' AS DateTime), N'img-blog-id-17.jpg')
INSERT [dbo].[tblBlog] ([blog_id], [blog_title], [blog_detail], [account_id], [blog_date], [blog_img]) VALUES (18, N'Yoga Asanas to Boost Your Energy Levels', N'<p>Discover energizing yoga poses that can increase vitality, improve circulation, and uplift your spirits. Discover energizing yoga poses that can increase vitality, improve circulation, and uplift your spirits.</p>', 20, CAST(N'2022-10-10T00:00:00.000' AS DateTime), N'img-blog-id-18.jpg')
INSERT [dbo].[tblBlog] ([blog_id], [blog_title], [blog_detail], [account_id], [blog_date], [blog_img]) VALUES (19, N'Build a Home Yoga Practice', N'<p>Learn how to set up a dedicated space, design a sequence, and overcome challenges to establish a sustainable and fulfilling home yoga practice.</p>', 2, CAST(N'2022-11-11T00:00:00.000' AS DateTime), N'img-blog-id-19.jpg')
INSERT [dbo].[tblBlog] ([blog_id], [blog_title], [blog_detail], [account_id], [blog_date], [blog_img]) VALUES (20, N'Healthy Habits for a Strong Immune System', N'<p><strong>Discover a range of healthy</strong> habits that can boost your<em> immune</em> system and promote overall well-being. Discover a range of healthy habits that can boost your immune system and promote overall well-being.</p>', 3, CAST(N'2022-12-12T00:00:00.000' AS DateTime), N'img-blog-id-20.jpg')
INSERT [dbo].[tblBlog] ([blog_id], [blog_title], [blog_detail], [account_id], [blog_date], [blog_img]) VALUES (21, N'Joy of Outdoor Yoga: Connecting with Nature', N'<p>Experience the unique benefits of practicing yoga in the great outdoors and connecting with nature. Experience the unique benefits of practicing yoga in the great outdoors and connecting with nature.</p>', 4, CAST(N'2023-01-01T00:00:00.000' AS DateTime), N'img-blog-id-21.jpg')
INSERT [dbo].[tblBlog] ([blog_id], [blog_title], [blog_detail], [account_id], [blog_date], [blog_img]) VALUES (22, N'Healthy Breakfast Ideas to Kickstart Your Day', N'<p><strong>Start your day off</strong> right with <em>quick,</em> delicious, and nutritious breakfast ideas . delicious, and nutritious breakfast ideas&nbsp;</p>', 12, CAST(N'2023-02-02T00:00:00.000' AS DateTime), N'img-blog-id-22.jpg')
INSERT [dbo].[tblBlog] ([blog_id], [blog_title], [blog_detail], [account_id], [blog_date], [blog_img]) VALUES (23, N'Yoga for Flexibility: Enhancing Range of Motion', N'<p>Discover yoga poses and sequences designed to improve flexibility and increase joint mobility. Discover yoga poses and sequences designed to improve flexibility and increase joint mobility.</p>', 13, CAST(N'2023-03-03T00:00:00.000' AS DateTime), N'img-blog-id-23.jpg')
INSERT [dbo].[tblBlog] ([blog_id], [blog_title], [blog_detail], [account_id], [blog_date], [blog_img]) VALUES (24, N'Art of Mindful Movement: Yoga Flow Practice', N'<p>Explore the<strong> benefits</strong> of mindful movement in yoga flow and learn how to create your own mindful and fluid yoga sequences.</p>', 14, CAST(N'2023-04-04T00:00:00.000' AS DateTime), N'img-blog-id-24.jpg')
INSERT [dbo].[tblBlog] ([blog_id], [blog_title], [blog_detail], [account_id], [blog_date], [blog_img]) VALUES (25, N'Yoga Poses for Strength and Stamina', N'<p>Discover yoga poses that can help you develop muscular strength, improve stability, and enhance physical stamina.</p>', 15, CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'img-blog-id-25.jpg')
INSERT [dbo].[tblBlog] ([blog_id], [blog_title], [blog_detail], [account_id], [blog_date], [blog_img]) VALUES (26, N'Healing Power of Ayurveda: Holistic Well-being', N'<p>Learn about <strong>Ayurvedic principles</strong>, dietary guidelines, <strong>lifestyle practices,</strong> and herbal remedies for holistic well-being.</p>', 15, CAST(N'2023-06-06T00:00:00.000' AS DateTime), N'img-blog-id-26.jpg')
INSERT [dbo].[tblBlog] ([blog_id], [blog_title], [blog_detail], [account_id], [blog_date], [blog_img]) VALUES (27, N'Stress Management: Finding Inner Peace', N'<p><strong>Explore effective</strong> stress management <em>techniques, including meditation</em>, deep breathing exercises, and mindfulness practices.</p>', 18, CAST(N'2023-07-07T00:00:00.000' AS DateTime), N'img-blog-id-27.jpg')
INSERT [dbo].[tblBlog] ([blog_id], [blog_title], [blog_detail], [account_id], [blog_date], [blog_img]) VALUES (28, N'Yoga for Better Sleep: Relaxing Poses and Rituals', N'<p><strong>Incorporate yoga</strong> into your nighttime routine for relaxation, tension relief, and improved sleep quality.</p>
<p>&nbsp;</p>', 1, CAST(N'2023-08-08T00:00:00.000' AS DateTime), N'img-blog-id-28.jpg')
SET IDENTITY_INSERT [dbo].[tblBlog] OFF
GO
SET IDENTITY_INSERT [dbo].[tblCategory] ON 

INSERT [dbo].[tblCategory] ([category_id], [category_name], [category_is_active]) VALUES (1, N'Meditation Yoga', 1)
INSERT [dbo].[tblCategory] ([category_id], [category_name], [category_is_active]) VALUES (2, N'Aerial Yoga', 1)
INSERT [dbo].[tblCategory] ([category_id], [category_name], [category_is_active]) VALUES (3, N'Vinyasa Yoga', 1)
INSERT [dbo].[tblCategory] ([category_id], [category_name], [category_is_active]) VALUES (4, N'Pure Alignment', 1)
INSERT [dbo].[tblCategory] ([category_id], [category_name], [category_is_active]) VALUES (5, N'Hot Yoga', 1)
INSERT [dbo].[tblCategory] ([category_id], [category_name], [category_is_active]) VALUES (6, N'Basic Yoga', 1)
SET IDENTITY_INSERT [dbo].[tblCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[tblClassSchedule] ON 

INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (19, 143, CAST(N'2023-07-19' AS Date), CAST(N'18:00:00' AS Time), CAST(N'20:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (19, 144, CAST(N'2023-07-22' AS Date), CAST(N'18:00:00' AS Time), CAST(N'20:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (19, 145, CAST(N'2023-07-26' AS Date), CAST(N'18:00:00' AS Time), CAST(N'20:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (19, 146, CAST(N'2023-07-29' AS Date), CAST(N'18:00:00' AS Time), CAST(N'20:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (19, 147, CAST(N'2023-08-02' AS Date), CAST(N'18:00:00' AS Time), CAST(N'20:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (19, 148, CAST(N'2023-08-05' AS Date), CAST(N'18:00:00' AS Time), CAST(N'20:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (19, 149, CAST(N'2023-08-09' AS Date), CAST(N'18:00:00' AS Time), CAST(N'20:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (19, 150, CAST(N'2023-08-12' AS Date), CAST(N'18:00:00' AS Time), CAST(N'20:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (19, 151, CAST(N'2023-08-16' AS Date), CAST(N'18:00:00' AS Time), CAST(N'20:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (20, 152, CAST(N'2023-07-19' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (20, 153, CAST(N'2023-07-21' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (20, 154, CAST(N'2023-07-26' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (20, 155, CAST(N'2023-07-28' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (20, 156, CAST(N'2023-08-02' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (20, 157, CAST(N'2023-08-04' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (20, 158, CAST(N'2023-08-09' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (20, 159, CAST(N'2023-08-11' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (20, 160, CAST(N'2023-08-16' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (20, 161, CAST(N'2023-08-18' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (20, 162, CAST(N'2023-08-23' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (20, 163, CAST(N'2023-08-25' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (21, 164, CAST(N'2023-07-15' AS Date), CAST(N'07:00:00' AS Time), CAST(N'09:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (21, 165, CAST(N'2023-07-16' AS Date), CAST(N'07:00:00' AS Time), CAST(N'09:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (21, 166, CAST(N'2023-07-19' AS Date), CAST(N'07:00:00' AS Time), CAST(N'09:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (21, 167, CAST(N'2023-07-22' AS Date), CAST(N'07:00:00' AS Time), CAST(N'09:00:00' AS Time), 1)
SET IDENTITY_INSERT [dbo].[tblClassSchedule] OFF
GO
SET IDENTITY_INSERT [dbo].[tblCourse] ON 

INSERT [dbo].[tblCourse] ([course_id], [course_title], [course_detail], [course_duration], [course_img], [category_id], [course_price], [course_is_active], [account_id]) VALUES (1, N'Yoga for Beginners Course', N'Deepen your vinyasa yoga practice with this comprehensive course. Learn advanced vinyasa sequences, creative transitions, and how to synchronize breath with movement. Enhance your flexibility, strength, and flow.', 9, N'img-course-id-1.jpg', 1, CAST(39.00 AS Decimal(10, 2)), 1, 3)
INSERT [dbo].[tblCourse] ([course_id], [course_title], [course_detail], [course_duration], [course_img], [category_id], [course_price], [course_is_active], [account_id]) VALUES (2, N'Yamas and Niyamas', N'Embark on a transformative journey of mindfulness meditation. Develop awareness, cultivate presence, and learn to navigate life with mindfulness. This course includes guided meditations, mindful exercises, and practical tips for daily mindfulness.', 12, N'img-course-id-2.jpg', 3, CAST(0.00 AS Decimal(10, 2)), 1, 3)
INSERT [dbo].[tblCourse] ([course_id], [course_title], [course_detail], [course_duration], [course_img], [category_id], [course_price], [course_is_active], [account_id]) VALUES (3, N'The Smart Flow Yoga', N'Transform your body and mind with this dynamic yoga course focused on strength and flexibility. Discover challenging poses, effective sequences, and targeted practices to enhance your overall yoga practice.', 12, N'img-course-id-3.jpg', 3, CAST(54.00 AS Decimal(10, 2)), 1, 3)
INSERT [dbo].[tblCourse] ([course_id], [course_title], [course_detail], [course_duration], [course_img], [category_id], [course_price], [course_is_active], [account_id]) VALUES (4, N'Nine days of Pranayama', N'Elevate your practice with this dynamic hot power yoga fusion course. Combine the heat of hot yoga with the intensity of power yoga to build strength, endurance, and enhance your overall fitness level.', 4, N'img-course-id-4.jpg', 4, CAST(47.00 AS Decimal(10, 2)), 1, 3)
INSERT [dbo].[tblCourse] ([course_id], [course_title], [course_detail], [course_duration], [course_img], [category_id], [course_price], [course_is_active], [account_id]) VALUES (5, N'Mastering Anxiety', N'Deepen your understanding of yoga anatomy and explore the human body in relation to yoga practice. Learn about skeletal structure, muscle engagement, and how anatomy influences asana alignment.', 6, N'img-course-id-5.jpg', 6, CAST(39.00 AS Decimal(10, 2)), 1, 4)
INSERT [dbo].[tblCourse] ([course_id], [course_title], [course_detail], [course_duration], [course_img], [category_id], [course_price], [course_is_active], [account_id]) VALUES (6, N'Self Care Through Ayurveda', N'Take your aerial yoga practice to new heights with this advanced course. Explore complex poses, challenging sequences, and develop advanced aerial skills for an exhilarating and rewarding practice.', 8, N'img-course-id-6.jpg', 5, CAST(0.00 AS Decimal(10, 2)), 1, 4)
INSERT [dbo].[tblCourse] ([course_id], [course_title], [course_detail], [course_duration], [course_img], [category_id], [course_price], [course_is_active], [account_id]) VALUES (7, N'Vinyasa Krama', N'Learn the foundational yoga asanas with this beginner-friendly course. Develop a solid understanding of basic poses, alignment principles, and breath awareness. Perfect for those new to yoga.', 4, N'img-course-id-7.jpg', 1, CAST(39.00 AS Decimal(10, 2)), 1, 4)
INSERT [dbo].[tblCourse] ([course_id], [course_title], [course_detail], [course_duration], [course_img], [category_id], [course_price], [course_is_active], [account_id]) VALUES (8, N'Yoga For Better Sleep', N'Explore alignment-based yoga therapy principles to address specific physical conditions and injuries. Learn therapeutic modifications, sequencing strategies, and practices to support healing and well-being.', 6, N'img-course-id-8.jpg', 2, CAST(49.00 AS Decimal(10, 2)), 1, 4)
INSERT [dbo].[tblCourse] ([course_id], [course_title], [course_detail], [course_duration], [course_img], [category_id], [course_price], [course_is_active], [account_id]) VALUES (28, N'Introduction to Meditation', N'Discover the essence of meditation and learn practical techniques to cultivate a regular meditation practice. This course provides a foundation for beginners and introduces various meditation styles and their benefits.', 8, N'img-course-id-28.jpg', 1, CAST(19.99 AS Decimal(10, 2)), 1, 12)
INSERT [dbo].[tblCourse] ([course_id], [course_title], [course_detail], [course_duration], [course_img], [category_id], [course_price], [course_is_active], [account_id]) VALUES (29, N'Aerial Yoga for Beginners', N'Explore the world of aerial yoga and experience the benefits of this unique practice. This course is designed for beginners and covers basic aerial yoga poses, safety guidelines, and gentle sequences to improve strength and flexibility.', 10, N'img-course-id-29.jpg', 2, CAST(0.00 AS Decimal(10, 2)), 1, 13)
INSERT [dbo].[tblCourse] ([course_id], [course_title], [course_detail], [course_duration], [course_img], [category_id], [course_price], [course_is_active], [account_id]) VALUES (30, N'Vinyasa Flow Mastery', N'Deepen your vinyasa yoga practice with this comprehensive course. Learn advanced vinyasa sequences, creative transitions, and how to synchronize breath with movement. Enhance your flexibility, strength, and flow.', 12, N'img-course-id-30.jpg', 3, CAST(39.99 AS Decimal(10, 2)), 1, 14)
INSERT [dbo].[tblCourse] ([course_id], [course_title], [course_detail], [course_duration], [course_img], [category_id], [course_price], [course_is_active], [account_id]) VALUES (31, N'Pure Alignment Workshop', N'Master the art of alignment in yoga with this workshop-style course. Dive into the details of each asana, understand proper alignment principles, and refine your postures to prevent injuries and maximize benefits.', 8, N'img-course-id-31.jpg', 4, CAST(24.99 AS Decimal(10, 2)), 1, 15)
INSERT [dbo].[tblCourse] ([course_id], [course_title], [course_detail], [course_duration], [course_img], [category_id], [course_price], [course_is_active], [account_id]) VALUES (32, N'Hot Yoga Intensive', N'Experience the transformative power of hot yoga in this intensive course. Discover how practicing yoga in a heated room can enhance flexibility, detoxify the body, and deepen your practice. Suitable for all levels.', 10, N'img-course-id-32.jpg', 5, CAST(34.99 AS Decimal(10, 2)), 1, 16)
INSERT [dbo].[tblCourse] ([course_id], [course_title], [course_detail], [course_duration], [course_img], [category_id], [course_price], [course_is_active], [account_id]) VALUES (33, N'Foundations of Basic Yoga', N'Build a strong foundation in basic yoga with this comprehensive course. Learn essential yoga poses, proper alignment, breathing techniques, and relaxation methods. Perfect for beginners.', 12, N'img-course-id-33.jpg', 6, CAST(0.00 AS Decimal(10, 2)), 1, 17)
INSERT [dbo].[tblCourse] ([course_id], [course_title], [course_detail], [course_duration], [course_img], [category_id], [course_price], [course_is_active], [account_id]) VALUES (34, N'Mindfulness Meditation Journey', N'Embark on a transformative journey of mindfulness meditation. Develop awareness, cultivate presence, and learn to navigate life with mindfulness. This course includes guided meditations, mindful exercises, and practical tips for daily mindfulness.', 8, N'img-course-id-34.jpg', 1, CAST(19.99 AS Decimal(10, 2)), 1, 18)
INSERT [dbo].[tblCourse] ([course_id], [course_title], [course_detail], [course_duration], [course_img], [category_id], [course_price], [course_is_active], [account_id]) VALUES (35, N'Aerial Yoga Flow', N'Take your aerial yoga practice to the next level with this dynamic flow course. Explore fluid sequences, inversions, and creative transitions in the aerial hammock. Enhance your strength, flexibility, and grace.', 10, N'img-course-id-35.jpg', 2, CAST(34.99 AS Decimal(10, 2)), 1, 19)
INSERT [dbo].[tblCourse] ([course_id], [course_title], [course_detail], [course_duration], [course_img], [category_id], [course_price], [course_is_active], [account_id]) VALUES (36, N'Vinyasa Yoga: The Art of Sequencing', N'Discover the art of crafting transformative vinyasa yoga sequences. Learn how to design creative flows, intelligently link asanas, and create a seamless and balanced yoga class experience.', 12, N'img-course-id-36.jpg', 3, CAST(39.99 AS Decimal(10, 2)), 1, 12)
INSERT [dbo].[tblCourse] ([course_id], [course_title], [course_detail], [course_duration], [course_img], [category_id], [course_price], [course_is_active], [account_id]) VALUES (37, N'Alignment-Based Yoga Therapy', N'Explore alignment-based yoga therapy principles to address specific physical conditions and injuries. Learn therapeutic modifications, sequencing strategies, and practices to support healing and well-being.', 8, N'img-course-id-37.jpg', 4, CAST(0.00 AS Decimal(10, 2)), 1, 13)
INSERT [dbo].[tblCourse] ([course_id], [course_title], [course_detail], [course_duration], [course_img], [category_id], [course_price], [course_is_active], [account_id]) VALUES (38, N'Hot Power Yoga Fusion', N'Elevate your practice with this dynamic hot power yoga fusion course. Combine the heat of hot yoga with the intensity of power yoga to build strength, endurance, and enhance your overall fitness level.', 10, N'img-course-id-38.jpg', 5, CAST(34.99 AS Decimal(10, 2)), 1, 14)
INSERT [dbo].[tblCourse] ([course_id], [course_title], [course_detail], [course_duration], [course_img], [category_id], [course_price], [course_is_active], [account_id]) VALUES (39, N'Yoga for Beginners: Foundational Asanas', N'Learn the foundational yoga asanas with this beginner-friendly course. Develop a solid understanding of basic poses, alignment principles, and breath awareness. Perfect for those new to yoga.', 12, N'img-course-id-39.jpg', 6, CAST(24.99 AS Decimal(10, 2)), 1, 15)
INSERT [dbo].[tblCourse] ([course_id], [course_title], [course_detail], [course_duration], [course_img], [category_id], [course_price], [course_is_active], [account_id]) VALUES (40, N'Guided Meditation for Stress Relief', N'Discover the power of guided meditation for stress relief and relaxation. Learn different guided meditation techniques, mindfulness exercises, and breathing practices to calm the mind and promote inner peace.', 8, N'img-course-id-40.jpg', 1, CAST(19.99 AS Decimal(10, 2)), 1, 16)
INSERT [dbo].[tblCourse] ([course_id], [course_title], [course_detail], [course_duration], [course_img], [category_id], [course_price], [course_is_active], [account_id]) VALUES (41, N'Aerial Yoga Inversions', N'Take flight and explore the world of aerial yoga inversions. Learn how to safely and confidently perform inversions in the aerial hammock, strengthen your core, and experience the joy of being upside down.', 10, N'img-course-id-41.jpg', 2, CAST(29.99 AS Decimal(10, 2)), 1, 17)
INSERT [dbo].[tblCourse] ([course_id], [course_title], [course_detail], [course_duration], [course_img], [category_id], [course_price], [course_is_active], [account_id]) VALUES (42, N'Yoga for Strength and Flexibility', N'Transform your body and mind with this dynamic yoga course focused on strength and flexibility. Discover challenging poses, effective sequences, and targeted practices to enhance your overall yoga practice.', 12, N'img-course-id-42.jpg', 3, CAST(39.99 AS Decimal(10, 2)), 1, 18)
INSERT [dbo].[tblCourse] ([course_id], [course_title], [course_detail], [course_duration], [course_img], [category_id], [course_price], [course_is_active], [account_id]) VALUES (43, N'Yoga Anatomy: Exploring the Human Body', N'Deepen your understanding of yoga anatomy and explore the human body in relation to yoga practice. Learn about skeletal structure, muscle engagement, and how anatomy influences asana alignment.', 8, N'img-course-id-43.jpg', 4, CAST(0.00 AS Decimal(10, 2)), 1, 19)
INSERT [dbo].[tblCourse] ([course_id], [course_title], [course_detail], [course_duration], [course_img], [category_id], [course_price], [course_is_active], [account_id]) VALUES (44, N'Yin Yoga for Relaxation and Restoration', N'Experience deep relaxation and restoration with Yin Yoga. Discover passive stretching, longer holds, and meditative practices to release tension, increase flexibility, and cultivate inner calm.', 10, N'img-course-id-44.jpg', 5, CAST(34.99 AS Decimal(10, 2)), 1, 12)
INSERT [dbo].[tblCourse] ([course_id], [course_title], [course_detail], [course_duration], [course_img], [category_id], [course_price], [course_is_active], [account_id]) VALUES (45, N'Yoga for Mind and Body Balance', N'Find balance and harmony in your mind and body through this holistic yoga course. Learn asanas, pranayama techniques, and mindfulness practices to cultivate overall well-being and inner peace.', 12, N'img-course-id-45.jpg', 6, CAST(29.99 AS Decimal(10, 2)), 1, 13)
INSERT [dbo].[tblCourse] ([course_id], [course_title], [course_detail], [course_duration], [course_img], [category_id], [course_price], [course_is_active], [account_id]) VALUES (46, N'Meditation for Beginners: Cultivating Inner Still', N'Embark on a journey of self-discovery and inner stillness through meditation. Learn various meditation techniques, breath awareness, and mindfulness practices to cultivate calmness and clarity.', 8, N'img-course-id-46.jpg', 1, CAST(0.00 AS Decimal(10, 2)), 1, 14)
INSERT [dbo].[tblCourse] ([course_id], [course_title], [course_detail], [course_duration], [course_img], [category_id], [course_price], [course_is_active], [account_id]) VALUES (47, N'Advanced Aerial Yoga', N'Take your aerial yoga practice to new heights with this advanced course. Explore complex poses, challenging sequences, and develop advanced aerial skills for an exhilarating and rewarding practice.', 10, N'img-course-id-47.jpg', 2, CAST(34.99 AS Decimal(10, 2)), 1, 15)
SET IDENTITY_INSERT [dbo].[tblCourse] OFF
GO
SET IDENTITY_INSERT [dbo].[tblCourseSchedule] ON 

INSERT [dbo].[tblCourseSchedule] ([course_id], [course_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (1, 1, N'2,4,5', CAST(N'08:00:00' AS Time), CAST(N'10:00:01' AS Time), 1)
INSERT [dbo].[tblCourseSchedule] ([course_id], [course_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (2, 2, N'3,5', CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblCourseSchedule] ([course_id], [course_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (2, 3, N'2,6', CAST(N'16:00:00' AS Time), CAST(N'18:00:00' AS Time), 1)
INSERT [dbo].[tblCourseSchedule] ([course_id], [course_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (1, 5, N'2,5', CAST(N'18:00:00' AS Time), CAST(N'20:00:00' AS Time), 1)
INSERT [dbo].[tblCourseSchedule] ([course_id], [course_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (1, 6, N'3,4', CAST(N'08:30:00' AS Time), CAST(N'10:00:01' AS Time), 1)
INSERT [dbo].[tblCourseSchedule] ([course_id], [course_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (2, 7, N'2,4', CAST(N'06:00:00' AS Time), CAST(N'08:00:00' AS Time), 1)
INSERT [dbo].[tblCourseSchedule] ([course_id], [course_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (1, 8, N'2,4,5', CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblCourseSchedule] ([course_id], [course_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (2, 9, N'3,4,6', CAST(N'08:00:00' AS Time), CAST(N'10:00:01' AS Time), 1)
INSERT [dbo].[tblCourseSchedule] ([course_id], [course_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (4, 10, N'3,4,6', CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblCourseSchedule] ([course_id], [course_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (5, 12, N'2,4', CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblCourseSchedule] ([course_id], [course_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (6, 13, N'3,6', CAST(N'17:00:00' AS Time), CAST(N'19:00:00' AS Time), 1)
INSERT [dbo].[tblCourseSchedule] ([course_id], [course_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (7, 14, N'2,5,6', CAST(N'07:00:00' AS Time), CAST(N'09:00:00' AS Time), 1)
INSERT [dbo].[tblCourseSchedule] ([course_id], [course_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (8, 15, N'1', CAST(N'07:00:00' AS Time), CAST(N'09:00:00' AS Time), 1)
INSERT [dbo].[tblCourseSchedule] ([course_id], [course_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (8, 19, N'2,3,4', CAST(N'07:00:00' AS Time), CAST(N'09:00:00' AS Time), 1)
INSERT [dbo].[tblCourseSchedule] ([course_id], [course_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (3, 20, N'2,4', CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblCourseSchedule] ([course_id], [course_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (28, 21, N'0,2,6', CAST(N'07:00:00' AS Time), CAST(N'09:00:00' AS Time), 1)
INSERT [dbo].[tblCourseSchedule] ([course_id], [course_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (29, 22, N'1,3,5', CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblCourseSchedule] ([course_id], [course_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (30, 23, N'0,3,4', CAST(N'09:00:00' AS Time), CAST(N'11:00:00' AS Time), 1)
INSERT [dbo].[tblCourseSchedule] ([course_id], [course_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (31, 24, N'2,4,6', CAST(N'10:00:00' AS Time), CAST(N'12:00:00' AS Time), 1)
INSERT [dbo].[tblCourseSchedule] ([course_id], [course_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (32, 25, N'1,4,5', CAST(N'11:00:00' AS Time), CAST(N'13:00:00' AS Time), 1)
INSERT [dbo].[tblCourseSchedule] ([course_id], [course_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (33, 26, N'3,5,6', CAST(N'12:00:00' AS Time), CAST(N'14:00:00' AS Time), 1)
INSERT [dbo].[tblCourseSchedule] ([course_id], [course_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (34, 27, N'0,2,3', CAST(N'13:00:00' AS Time), CAST(N'15:00:00' AS Time), 1)
INSERT [dbo].[tblCourseSchedule] ([course_id], [course_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (35, 28, N'1,3,6', CAST(N'14:00:00' AS Time), CAST(N'16:00:00' AS Time), 1)
INSERT [dbo].[tblCourseSchedule] ([course_id], [course_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (36, 29, N'0,4,5', CAST(N'15:00:00' AS Time), CAST(N'17:00:00' AS Time), 1)
INSERT [dbo].[tblCourseSchedule] ([course_id], [course_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (37, 30, N'2,4,6', CAST(N'16:00:00' AS Time), CAST(N'18:00:00' AS Time), 1)
INSERT [dbo].[tblCourseSchedule] ([course_id], [course_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (38, 31, N'1,3,5', CAST(N'17:00:00' AS Time), CAST(N'19:00:00' AS Time), 1)
INSERT [dbo].[tblCourseSchedule] ([course_id], [course_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (39, 32, N'0,2,4', CAST(N'18:00:00' AS Time), CAST(N'20:00:00' AS Time), 1)
INSERT [dbo].[tblCourseSchedule] ([course_id], [course_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (40, 33, N'2,5,6', CAST(N'07:00:00' AS Time), CAST(N'09:00:00' AS Time), 1)
INSERT [dbo].[tblCourseSchedule] ([course_id], [course_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (41, 34, N'1,3,4', CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblCourseSchedule] ([course_id], [course_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (42, 35, N'0,4,6', CAST(N'09:00:00' AS Time), CAST(N'11:00:00' AS Time), 1)
INSERT [dbo].[tblCourseSchedule] ([course_id], [course_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (43, 36, N'2,4,5', CAST(N'10:00:00' AS Time), CAST(N'12:00:00' AS Time), 1)
INSERT [dbo].[tblCourseSchedule] ([course_id], [course_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (44, 37, N'1,4,6', CAST(N'11:00:00' AS Time), CAST(N'13:00:00' AS Time), 1)
INSERT [dbo].[tblCourseSchedule] ([course_id], [course_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (45, 38, N'3,5,6', CAST(N'12:00:00' AS Time), CAST(N'14:00:00' AS Time), 1)
INSERT [dbo].[tblCourseSchedule] ([course_id], [course_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (46, 39, N'0,2,3', CAST(N'13:00:00' AS Time), CAST(N'15:00:00' AS Time), 1)
INSERT [dbo].[tblCourseSchedule] ([course_id], [course_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (47, 40, N'1,3,6', CAST(N'14:00:00' AS Time), CAST(N'16:00:00' AS Time), 1)
INSERT [dbo].[tblCourseSchedule] ([course_id], [course_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (28, 41, N'0,2,6', CAST(N'07:00:00' AS Time), CAST(N'09:00:00' AS Time), 1)
INSERT [dbo].[tblCourseSchedule] ([course_id], [course_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (29, 42, N'1,3,5', CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblCourseSchedule] ([course_id], [course_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (30, 43, N'0,3,4', CAST(N'09:00:00' AS Time), CAST(N'11:00:00' AS Time), 1)
INSERT [dbo].[tblCourseSchedule] ([course_id], [course_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (31, 44, N'2,4,6', CAST(N'10:00:00' AS Time), CAST(N'12:00:00' AS Time), 1)
INSERT [dbo].[tblCourseSchedule] ([course_id], [course_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (32, 45, N'1,4,5', CAST(N'11:00:00' AS Time), CAST(N'13:00:00' AS Time), 1)
INSERT [dbo].[tblCourseSchedule] ([course_id], [course_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (33, 46, N'3,5,6', CAST(N'12:00:00' AS Time), CAST(N'14:00:00' AS Time), 1)
INSERT [dbo].[tblCourseSchedule] ([course_id], [course_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (34, 47, N'0,2,3', CAST(N'13:00:00' AS Time), CAST(N'15:00:00' AS Time), 1)
INSERT [dbo].[tblCourseSchedule] ([course_id], [course_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (35, 48, N'1,3,6', CAST(N'14:00:00' AS Time), CAST(N'16:00:00' AS Time), 1)
INSERT [dbo].[tblCourseSchedule] ([course_id], [course_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (36, 49, N'0,4,5', CAST(N'15:00:00' AS Time), CAST(N'17:00:00' AS Time), 1)
INSERT [dbo].[tblCourseSchedule] ([course_id], [course_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (37, 50, N'2,4,6', CAST(N'16:00:00' AS Time), CAST(N'18:00:00' AS Time), 1)
INSERT [dbo].[tblCourseSchedule] ([course_id], [course_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (38, 51, N'1,3,5', CAST(N'17:00:00' AS Time), CAST(N'19:00:00' AS Time), 1)
INSERT [dbo].[tblCourseSchedule] ([course_id], [course_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (39, 52, N'0,2,4', CAST(N'18:00:00' AS Time), CAST(N'20:00:00' AS Time), 1)
INSERT [dbo].[tblCourseSchedule] ([course_id], [course_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (40, 53, N'2,5,6', CAST(N'07:00:00' AS Time), CAST(N'09:00:00' AS Time), 1)
INSERT [dbo].[tblCourseSchedule] ([course_id], [course_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (41, 54, N'1,3,4', CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblCourseSchedule] ([course_id], [course_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (42, 55, N'0,4,6', CAST(N'09:00:00' AS Time), CAST(N'11:00:00' AS Time), 1)
INSERT [dbo].[tblCourseSchedule] ([course_id], [course_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (43, 56, N'2,4,5', CAST(N'10:00:00' AS Time), CAST(N'12:00:00' AS Time), 1)
INSERT [dbo].[tblCourseSchedule] ([course_id], [course_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (44, 57, N'1,4,6', CAST(N'11:00:00' AS Time), CAST(N'13:00:00' AS Time), 1)
INSERT [dbo].[tblCourseSchedule] ([course_id], [course_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (45, 58, N'3,5,6', CAST(N'12:00:00' AS Time), CAST(N'14:00:00' AS Time), 1)
INSERT [dbo].[tblCourseSchedule] ([course_id], [course_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (46, 59, N'0,2,3', CAST(N'13:00:00' AS Time), CAST(N'15:00:00' AS Time), 1)
INSERT [dbo].[tblCourseSchedule] ([course_id], [course_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (47, 60, N'1,3,6', CAST(N'14:00:00' AS Time), CAST(N'16:00:00' AS Time), 1)
SET IDENTITY_INSERT [dbo].[tblCourseSchedule] OFF
GO
INSERT [dbo].[tblCourseWishlist] ([course_id], [account_id]) VALUES (1, 3)
INSERT [dbo].[tblCourseWishlist] ([course_id], [account_id]) VALUES (2, 1)
INSERT [dbo].[tblCourseWishlist] ([course_id], [account_id]) VALUES (2, 3)
INSERT [dbo].[tblCourseWishlist] ([course_id], [account_id]) VALUES (3, 3)
GO
SET IDENTITY_INSERT [dbo].[tblMembership] ON 

INSERT [dbo].[tblMembership] ([membership_id], [membership_name], [membership_duration], [membership_price], [membership_description], [membership_discours], [membership_is_active]) VALUES (1, N'monthly', 30, CAST(35.00 AS Decimal(10, 2)), N'20% discount on all courses within 30 days from the time of registration', 20, 1)
INSERT [dbo].[tblMembership] ([membership_id], [membership_name], [membership_duration], [membership_price], [membership_description], [membership_discours], [membership_is_active]) VALUES (2, N'year', 365, CAST(350.00 AS Decimal(10, 2)), N'25% off all courses within 365 days of registration', 25, 1)
INSERT [dbo].[tblMembership] ([membership_id], [membership_name], [membership_duration], [membership_price], [membership_description], [membership_discours], [membership_is_active]) VALUES (3, N'year', 365, CAST(300.00 AS Decimal(10, 2)), N'test 1', 20, 1)
SET IDENTITY_INSERT [dbo].[tblMembership] OFF
GO
SET IDENTITY_INSERT [dbo].[tblRegistrationCourse] ON 

INSERT [dbo].[tblRegistrationCourse] ([course_id], [account_id], [registration_id], [registration_date], [end_date], [course_status], [course_schedule_id], [registration_status]) VALUES (1, 2, 19, CAST(N'2023-07-19T00:00:00.000' AS DateTime), CAST(N'2023-08-16T00:00:00.000' AS DateTime), 0, 5, 1)
INSERT [dbo].[tblRegistrationCourse] ([course_id], [account_id], [registration_id], [registration_date], [end_date], [course_status], [course_schedule_id], [registration_status]) VALUES (3, 2, 20, CAST(N'2023-07-19T00:00:00.000' AS DateTime), CAST(N'2023-08-25T00:00:00.000' AS DateTime), 0, 20, 1)
INSERT [dbo].[tblRegistrationCourse] ([course_id], [account_id], [registration_id], [registration_date], [end_date], [course_status], [course_schedule_id], [registration_status]) VALUES (7, 2, 21, CAST(N'2023-07-15T00:00:00.000' AS DateTime), CAST(N'2023-07-22T00:00:00.000' AS DateTime), 0, 14, 1)
SET IDENTITY_INSERT [dbo].[tblRegistrationCourse] OFF
GO
INSERT [dbo].[tblRegistrationMembership] ([membership_id], [account_id], [registration_date], [expriration_date], [registration_status]) VALUES (1, 2, CAST(N'2023-06-03T00:00:00.000' AS DateTime), CAST(N'2023-07-03T00:00:00.000' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[tblRole] ON 

INSERT [dbo].[tblRole] ([role_id], [role_name]) VALUES (1, N'trainee')
INSERT [dbo].[tblRole] ([role_id], [role_name]) VALUES (2, N'trainer')
INSERT [dbo].[tblRole] ([role_id], [role_name]) VALUES (3, N'admin')
INSERT [dbo].[tblRole] ([role_id], [role_name]) VALUES (4, N'casher')
SET IDENTITY_INSERT [dbo].[tblRole] OFF
GO
ALTER TABLE [dbo].[tblAccount] ADD  CONSTRAINT [DF_tblAccount_create_date]  DEFAULT (getdate()) FOR [create_date]
GO
ALTER TABLE [dbo].[tblAccount]  WITH CHECK ADD  CONSTRAINT [FK_tblAccount_tblRole] FOREIGN KEY([role_id])
REFERENCES [dbo].[tblRole] ([role_id])
GO
ALTER TABLE [dbo].[tblAccount] CHECK CONSTRAINT [FK_tblAccount_tblRole]
GO
ALTER TABLE [dbo].[tblBill]  WITH CHECK ADD  CONSTRAINT [FK_tblBill_tblAccount] FOREIGN KEY([account_id])
REFERENCES [dbo].[tblAccount] ([account_id])
GO
ALTER TABLE [dbo].[tblBill] CHECK CONSTRAINT [FK_tblBill_tblAccount]
GO
ALTER TABLE [dbo].[tblBill]  WITH CHECK ADD  CONSTRAINT [FK_tblBill_tblCourse] FOREIGN KEY([course_id])
REFERENCES [dbo].[tblCourse] ([course_id])
GO
ALTER TABLE [dbo].[tblBill] CHECK CONSTRAINT [FK_tblBill_tblCourse]
GO
ALTER TABLE [dbo].[tblBillMembership]  WITH CHECK ADD  CONSTRAINT [FK_tblBillMembership_tblAccount] FOREIGN KEY([account_id])
REFERENCES [dbo].[tblAccount] ([account_id])
GO
ALTER TABLE [dbo].[tblBillMembership] CHECK CONSTRAINT [FK_tblBillMembership_tblAccount]
GO
ALTER TABLE [dbo].[tblBillMembership]  WITH CHECK ADD  CONSTRAINT [FK_tblBillMembership_tblMembership] FOREIGN KEY([membership_id])
REFERENCES [dbo].[tblMembership] ([membership_id])
GO
ALTER TABLE [dbo].[tblBillMembership] CHECK CONSTRAINT [FK_tblBillMembership_tblMembership]
GO
ALTER TABLE [dbo].[tblBlog]  WITH CHECK ADD  CONSTRAINT [FK_tblBlog_tblAccount] FOREIGN KEY([account_id])
REFERENCES [dbo].[tblAccount] ([account_id])
GO
ALTER TABLE [dbo].[tblBlog] CHECK CONSTRAINT [FK_tblBlog_tblAccount]
GO
ALTER TABLE [dbo].[tblClassSchedule]  WITH CHECK ADD  CONSTRAINT [FK_tblClassSchedule_tblRegistrationCourse] FOREIGN KEY([registration_id])
REFERENCES [dbo].[tblRegistrationCourse] ([registration_id])
GO
ALTER TABLE [dbo].[tblClassSchedule] CHECK CONSTRAINT [FK_tblClassSchedule_tblRegistrationCourse]
GO
ALTER TABLE [dbo].[tblComment]  WITH CHECK ADD  CONSTRAINT [FK_tblComment_tblAccount] FOREIGN KEY([account_id])
REFERENCES [dbo].[tblAccount] ([account_id])
GO
ALTER TABLE [dbo].[tblComment] CHECK CONSTRAINT [FK_tblComment_tblAccount]
GO
ALTER TABLE [dbo].[tblComment]  WITH CHECK ADD  CONSTRAINT [FK_tblComment_tblBlog] FOREIGN KEY([blog_id])
REFERENCES [dbo].[tblBlog] ([blog_id])
GO
ALTER TABLE [dbo].[tblComment] CHECK CONSTRAINT [FK_tblComment_tblBlog]
GO
ALTER TABLE [dbo].[tblCourse]  WITH CHECK ADD  CONSTRAINT [FK_tblCourse_tblAccount] FOREIGN KEY([account_id])
REFERENCES [dbo].[tblAccount] ([account_id])
GO
ALTER TABLE [dbo].[tblCourse] CHECK CONSTRAINT [FK_tblCourse_tblAccount]
GO
ALTER TABLE [dbo].[tblCourse]  WITH CHECK ADD  CONSTRAINT [FK_tblCourse_tblCategory] FOREIGN KEY([category_id])
REFERENCES [dbo].[tblCategory] ([category_id])
GO
ALTER TABLE [dbo].[tblCourse] CHECK CONSTRAINT [FK_tblCourse_tblCategory]
GO
ALTER TABLE [dbo].[tblCourseSchedule]  WITH CHECK ADD  CONSTRAINT [FK_tblCourseSchedule_tblCourse] FOREIGN KEY([course_id])
REFERENCES [dbo].[tblCourse] ([course_id])
GO
ALTER TABLE [dbo].[tblCourseSchedule] CHECK CONSTRAINT [FK_tblCourseSchedule_tblCourse]
GO
ALTER TABLE [dbo].[tblCourseWishlist]  WITH CHECK ADD  CONSTRAINT [FK_tblCourseWishlist_tblAccount] FOREIGN KEY([account_id])
REFERENCES [dbo].[tblAccount] ([account_id])
GO
ALTER TABLE [dbo].[tblCourseWishlist] CHECK CONSTRAINT [FK_tblCourseWishlist_tblAccount]
GO
ALTER TABLE [dbo].[tblCourseWishlist]  WITH CHECK ADD  CONSTRAINT [FK_tblCourseWishlist_tblCourse] FOREIGN KEY([course_id])
REFERENCES [dbo].[tblCourse] ([course_id])
GO
ALTER TABLE [dbo].[tblCourseWishlist] CHECK CONSTRAINT [FK_tblCourseWishlist_tblCourse]
GO
ALTER TABLE [dbo].[tblRatingCourse]  WITH CHECK ADD  CONSTRAINT [FK_tblRatingCourse_tblCourse] FOREIGN KEY([course_id])
REFERENCES [dbo].[tblCourse] ([course_id])
GO
ALTER TABLE [dbo].[tblRatingCourse] CHECK CONSTRAINT [FK_tblRatingCourse_tblCourse]
GO
ALTER TABLE [dbo].[tblRatingCourse]  WITH CHECK ADD  CONSTRAINT [FK_tblRatingCourse_tblRegistrationCourse] FOREIGN KEY([registration_id])
REFERENCES [dbo].[tblRegistrationCourse] ([registration_id])
GO
ALTER TABLE [dbo].[tblRatingCourse] CHECK CONSTRAINT [FK_tblRatingCourse_tblRegistrationCourse]
GO
ALTER TABLE [dbo].[tblRegistrationCourse]  WITH CHECK ADD  CONSTRAINT [FK_tblRegistrationCourse_tblAccount] FOREIGN KEY([account_id])
REFERENCES [dbo].[tblAccount] ([account_id])
GO
ALTER TABLE [dbo].[tblRegistrationCourse] CHECK CONSTRAINT [FK_tblRegistrationCourse_tblAccount]
GO
ALTER TABLE [dbo].[tblRegistrationCourse]  WITH CHECK ADD  CONSTRAINT [FK_tblRegistrationCourse_tblCourse] FOREIGN KEY([course_id])
REFERENCES [dbo].[tblCourse] ([course_id])
GO
ALTER TABLE [dbo].[tblRegistrationCourse] CHECK CONSTRAINT [FK_tblRegistrationCourse_tblCourse]
GO
ALTER TABLE [dbo].[tblRegistrationCourse]  WITH CHECK ADD  CONSTRAINT [FK_tblRegistrationCourse_tblCourseSchedule] FOREIGN KEY([course_schedule_id])
REFERENCES [dbo].[tblCourseSchedule] ([course_schedule_id])
GO
ALTER TABLE [dbo].[tblRegistrationCourse] CHECK CONSTRAINT [FK_tblRegistrationCourse_tblCourseSchedule]
GO
ALTER TABLE [dbo].[tblRegistrationMembership]  WITH CHECK ADD  CONSTRAINT [FK_tblRegistrationMembership_tblAccount] FOREIGN KEY([account_id])
REFERENCES [dbo].[tblAccount] ([account_id])
GO
ALTER TABLE [dbo].[tblRegistrationMembership] CHECK CONSTRAINT [FK_tblRegistrationMembership_tblAccount]
GO
ALTER TABLE [dbo].[tblRegistrationMembership]  WITH CHECK ADD  CONSTRAINT [FK_tblRegistrationMembership_tblMembership] FOREIGN KEY([membership_id])
REFERENCES [dbo].[tblMembership] ([membership_id])
GO
ALTER TABLE [dbo].[tblRegistrationMembership] CHECK CONSTRAINT [FK_tblRegistrationMembership_tblMembership]
GO
USE [master]
GO
ALTER DATABASE [YogaCenterDB] SET  READ_WRITE 
GO
