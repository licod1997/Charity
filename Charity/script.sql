USE [master]
GO
/****** Object:  Database [Charity]    Script Date: 20-Aug-17 4:45:40 PM ******/
CREATE DATABASE [Charity]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Charity', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.TESTDBI\MSSQL\DATA\Charity.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Charity_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.TESTDBI\MSSQL\DATA\Charity_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Charity] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Charity].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Charity] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Charity] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Charity] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Charity] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Charity] SET ARITHABORT OFF 
GO
ALTER DATABASE [Charity] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Charity] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Charity] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Charity] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Charity] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Charity] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Charity] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Charity] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Charity] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Charity] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Charity] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Charity] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Charity] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Charity] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Charity] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Charity] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Charity] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Charity] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Charity] SET  MULTI_USER 
GO
ALTER DATABASE [Charity] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Charity] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Charity] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Charity] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Charity] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Charity]
GO
/****** Object:  Table [dbo].[Menus]    Script Date: 20-Aug-17 4:45:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[URL] [nvarchar](256) NOT NULL,
	[DisplayOrder] [int] NULL,
	[Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Messages]    Script Date: 20-Aug-17 4:45:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[VisitorName] [nvarchar](256) NOT NULL,
	[Email] [nvarchar](256) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[CreatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[News]    Script Date: 20-Aug-17 4:45:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
	[PageEntry] [nvarchar](256) NULL,
	[PageContent] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[PageStatus] [bit] NULL,
 CONSTRAINT [PK__News__3214EC27C0FC7FD8] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pages]    Script Date: 20-Aug-17 4:45:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pages](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
	[Content] [nvarchar](max) NULL,
	[DisplayOrder] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Photos]    Script Date: 20-Aug-17 4:45:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Photos](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](256) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VisitorCounter]    Script Date: 20-Aug-17 4:45:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VisitorCounter](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Counter] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Menus] ON 

INSERT [dbo].[Menus] ([ID], [Name], [URL], [DisplayOrder], [Status]) VALUES (1, N'Home', N'/home', 1, 1)
INSERT [dbo].[Menus] ([ID], [Name], [URL], [DisplayOrder], [Status]) VALUES (2, N'About Our School', N'/about', 3, 1)
INSERT [dbo].[Menus] ([ID], [Name], [URL], [DisplayOrder], [Status]) VALUES (3, N'Photo Album', N'/photo', 4, 1)
INSERT [dbo].[Menus] ([ID], [Name], [URL], [DisplayOrder], [Status]) VALUES (4, N'How to Help', N'/help', 5, 1)
INSERT [dbo].[Menus] ([ID], [Name], [URL], [DisplayOrder], [Status]) VALUES (5, N'Contact', N'/contact', 6, 1)
INSERT [dbo].[Menus] ([ID], [Name], [URL], [DisplayOrder], [Status]) VALUES (6, N'News', N'/news', 2, 1)
SET IDENTITY_INSERT [dbo].[Menus] OFF
SET IDENTITY_INSERT [dbo].[Messages] ON 

INSERT [dbo].[Messages] ([ID], [VisitorName], [Email], [Content], [CreatedDate]) VALUES (1, N'licod', N'licod1234@gmail.com', N'123', CAST(N'2017-08-06 00:35:05.293' AS DateTime))
INSERT [dbo].[Messages] ([ID], [VisitorName], [Email], [Content], [CreatedDate]) VALUES (2, N'licod', N'licod1234@gmail.com', N'123213', CAST(N'2017-08-06 00:36:28.997' AS DateTime))
INSERT [dbo].[Messages] ([ID], [VisitorName], [Email], [Content], [CreatedDate]) VALUES (3, N'licod', N'licod1234@gmail.com', N'123123', CAST(N'2017-08-06 00:37:33.930' AS DateTime))
INSERT [dbo].[Messages] ([ID], [VisitorName], [Email], [Content], [CreatedDate]) VALUES (4, N'licod', N'licod1234@gmail.com', N'123', CAST(N'2017-08-06 00:38:51.193' AS DateTime))
INSERT [dbo].[Messages] ([ID], [VisitorName], [Email], [Content], [CreatedDate]) VALUES (5, N'licod', N'licod1234@gmail.com', N'123', CAST(N'2017-08-06 00:40:04.277' AS DateTime))
INSERT [dbo].[Messages] ([ID], [VisitorName], [Email], [Content], [CreatedDate]) VALUES (6, N'licod', N'licod1234@gmail.com', N'1231231', CAST(N'2017-08-06 01:07:44.200' AS DateTime))
INSERT [dbo].[Messages] ([ID], [VisitorName], [Email], [Content], [CreatedDate]) VALUES (7, N'licod', N'licod1234@gmail.com', N'1231231', CAST(N'2017-08-06 01:13:44.617' AS DateTime))
INSERT [dbo].[Messages] ([ID], [VisitorName], [Email], [Content], [CreatedDate]) VALUES (8, N'licod', N'licod1234@gmail.com', N'123', CAST(N'2017-08-06 12:13:03.007' AS DateTime))
INSERT [dbo].[Messages] ([ID], [VisitorName], [Email], [Content], [CreatedDate]) VALUES (9, N'licod', N'licod1234@gmail.com', N'ilyluyly', CAST(N'2017-08-06 12:22:47.333' AS DateTime))
INSERT [dbo].[Messages] ([ID], [VisitorName], [Email], [Content], [CreatedDate]) VALUES (10, N'123', N'licod1234@gmail.com', N'123', CAST(N'2017-08-20 16:19:01.690' AS DateTime))
SET IDENTITY_INSERT [dbo].[Messages] OFF
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([ID], [Name], [PageEntry], [PageContent], [CreatedDate], [PageStatus]) VALUES (2, N'Aliquip ex ea commodo 1', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquipex ea commodo consequat.Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augueduis dolore te feugait nulla facilisi.Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam;est usus legentis in iis qui facit eorum claritatem.Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius.Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum.Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposueritlitterarum formas humanitatis per seacula quarta decima et quinta decima.Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.', CAST(N'2015-09-08 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[News] ([ID], [Name], [PageEntry], [PageContent], [CreatedDate], [PageStatus]) VALUES (5, N'Ullamcorper suscipit lobortis 1', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquipex ea commodo consequat.Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augueduis dolore te feugait nulla facilisi.Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam;est usus legentis in iis qui facit eorum claritatem.Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius.Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum.Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposueritlitterarum formas humanitatis per seacula quarta decima et quinta decima.Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.', CAST(N'2015-10-30 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[News] ([ID], [Name], [PageEntry], [PageContent], [CreatedDate], [PageStatus]) VALUES (6, N'Aliquip ex ea commodo 2', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquipex ea commodo consequat.Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augueduis dolore te feugait nulla facilisi.Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam;est usus legentis in iis qui facit eorum claritatem.Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius.Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum.Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposueritlitterarum formas humanitatis per seacula quarta decima et quinta decima.Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.', CAST(N'2015-10-31 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[News] ([ID], [Name], [PageEntry], [PageContent], [CreatedDate], [PageStatus]) VALUES (7, N'Ullamcorper suscipit lobortis 2', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquipex ea commodo consequat.Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augueduis dolore te feugait nulla facilisi.Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam;est usus legentis in iis qui facit eorum claritatem.Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius.Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum.Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposueritlitterarum formas humanitatis per seacula quarta decima et quinta decima.Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.', CAST(N'2015-11-01 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[News] ([ID], [Name], [PageEntry], [PageContent], [CreatedDate], [PageStatus]) VALUES (8, N'Aliquip ex ea commodo 3', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquipex ea commodo consequat.Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augueduis dolore te feugait nulla facilisi.Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam;est usus legentis in iis qui facit eorum claritatem.Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius.Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum.Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposueritlitterarum formas humanitatis per seacula quarta decima et quinta decima.Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.', CAST(N'2015-11-02 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[News] ([ID], [Name], [PageEntry], [PageContent], [CreatedDate], [PageStatus]) VALUES (9, N'Ullamcorper suscipit lobortis 3', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquipex ea commodo consequat.Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augueduis dolore te feugait nulla facilisi.Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam;est usus legentis in iis qui facit eorum claritatem.Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius.Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum.Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposueritlitterarum formas humanitatis per seacula quarta decima et quinta decima.Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.', CAST(N'2015-11-03 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[News] ([ID], [Name], [PageEntry], [PageContent], [CreatedDate], [PageStatus]) VALUES (10, N'Aliquip ex ea commodo 4', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquipex ea commodo consequat.Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augueduis dolore te feugait nulla facilisi.Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam;est usus legentis in iis qui facit eorum claritatem.Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius.Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum.Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposueritlitterarum formas humanitatis per seacula quarta decima et quinta decima.Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.', CAST(N'2015-11-04 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[News] ([ID], [Name], [PageEntry], [PageContent], [CreatedDate], [PageStatus]) VALUES (11, N'Ullamcorper suscipit lobortis 4', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquipex ea commodo consequat.Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augueduis dolore te feugait nulla facilisi.Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam;est usus legentis in iis qui facit eorum claritatem.Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius.Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum.Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposueritlitterarum formas humanitatis per seacula quarta decima et quinta decima.Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.', CAST(N'2015-11-05 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[News] ([ID], [Name], [PageEntry], [PageContent], [CreatedDate], [PageStatus]) VALUES (12, N'Aliquip ex ea commodo 5', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquipex ea commodo consequat.Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augueduis dolore te feugait nulla facilisi.Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam;est usus legentis in iis qui facit eorum claritatem.Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius.Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum.Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposueritlitterarum formas humanitatis per seacula quarta decima et quinta decima.Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.', CAST(N'2015-11-06 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[News] ([ID], [Name], [PageEntry], [PageContent], [CreatedDate], [PageStatus]) VALUES (13, N'Ullamcorper suscipit lobortis 5', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquipex ea commodo consequat.Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augueduis dolore te feugait nulla facilisi.Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam;est usus legentis in iis qui facit eorum claritatem.Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius.Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum.Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposueritlitterarum formas humanitatis per seacula quarta decima et quinta decima.Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.', CAST(N'2015-11-07 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[News] ([ID], [Name], [PageEntry], [PageContent], [CreatedDate], [PageStatus]) VALUES (14, N'Aliquip ex ea commodo 6', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquipex ea commodo consequat.Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augueduis dolore te feugait nulla facilisi.Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam;est usus legentis in iis qui facit eorum claritatem.Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius.Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum.Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposueritlitterarum formas humanitatis per seacula quarta decima et quinta decima.Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.', CAST(N'2015-11-08 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[News] ([ID], [Name], [PageEntry], [PageContent], [CreatedDate], [PageStatus]) VALUES (15, N'Ullamcorper suscipit lobortis 6', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquipex ea commodo consequat.Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augueduis dolore te feugait nulla facilisi.Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam;est usus legentis in iis qui facit eorum claritatem.Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius.Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum.Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposueritlitterarum formas humanitatis per seacula quarta decima et quinta decima.Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.', CAST(N'2015-11-09 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[News] ([ID], [Name], [PageEntry], [PageContent], [CreatedDate], [PageStatus]) VALUES (16, N'Aliquip ex ea commodo 7', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquipex ea commodo consequat.Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augueduis dolore te feugait nulla facilisi.Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam;est usus legentis in iis qui facit eorum claritatem.Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius.Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum.Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposueritlitterarum formas humanitatis per seacula quarta decima et quinta decima.Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.', CAST(N'2015-11-10 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[News] ([ID], [Name], [PageEntry], [PageContent], [CreatedDate], [PageStatus]) VALUES (17, N'Ullamcorper suscipit lobortis 7', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquipex ea commodo consequat.Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augueduis dolore te feugait nulla facilisi.Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam;est usus legentis in iis qui facit eorum claritatem.Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius.Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum.Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposueritlitterarum formas humanitatis per seacula quarta decima et quinta decima.Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.', CAST(N'2015-11-11 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[News] ([ID], [Name], [PageEntry], [PageContent], [CreatedDate], [PageStatus]) VALUES (18, N'Aliquip ex ea commodo 8', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquipex ea commodo consequat.Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augueduis dolore te feugait nulla facilisi.Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam;est usus legentis in iis qui facit eorum claritatem.Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius.Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum.Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposueritlitterarum formas humanitatis per seacula quarta decima et quinta decima.Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.', CAST(N'2015-11-12 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[News] ([ID], [Name], [PageEntry], [PageContent], [CreatedDate], [PageStatus]) VALUES (19, N'Ullamcorper suscipit lobortis 8', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquipex ea commodo consequat.Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augueduis dolore te feugait nulla facilisi.Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam;est usus legentis in iis qui facit eorum claritatem.Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius.Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum.Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposueritlitterarum formas humanitatis per seacula quarta decima et quinta decima.Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.', CAST(N'2015-11-13 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[News] ([ID], [Name], [PageEntry], [PageContent], [CreatedDate], [PageStatus]) VALUES (20, N'Aliquip ex ea commodo 9', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquipex ea commodo consequat.Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augueduis dolore te feugait nulla facilisi.Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam;est usus legentis in iis qui facit eorum claritatem.Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius.Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum.Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposueritlitterarum formas humanitatis per seacula quarta decima et quinta decima.Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.', CAST(N'2015-11-14 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[News] ([ID], [Name], [PageEntry], [PageContent], [CreatedDate], [PageStatus]) VALUES (21, N'Ullamcorper suscipit lobortis 9', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquipex ea commodo consequat.Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augueduis dolore te feugait nulla facilisi.Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam;est usus legentis in iis qui facit eorum claritatem.Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius.Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum.Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposueritlitterarum formas humanitatis per seacula quarta decima et quinta decima.Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.', CAST(N'2015-11-15 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[News] ([ID], [Name], [PageEntry], [PageContent], [CreatedDate], [PageStatus]) VALUES (22, N'Aliquip ex ea commodo 10', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquipex ea commodo consequat.Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augueduis dolore te feugait nulla facilisi.Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam;est usus legentis in iis qui facit eorum claritatem.Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius.Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum.Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposueritlitterarum formas humanitatis per seacula quarta decima et quinta decima.Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.', CAST(N'2015-11-16 00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[News] OFF
SET IDENTITY_INSERT [dbo].[Pages] ON 

INSERT [dbo].[Pages] ([ID], [Name], [Content], [DisplayOrder], [CreatedDate], [Status]) VALUES (1, N'Home', N'<div class="section article"> <style>.wordwrapfix{word-wrap: break-word;}</style> <div class="heading wordwrapfix"> <h3>Our school</h3> </div><div class="content"> <div class="img-simple "> <div class="image"> <a rel="nofollow" data-ss="imagemodal" data-href="/resources/Home_files/i285415639381953156._szw1280h1280_.jpg"><img src="/resources/Home_files/i285415639381953156._szw1280h1280_.jpg"> </a> </div></div><p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p></div></div>', 1, CAST(N'2015-10-30 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Pages] ([ID], [Name], [Content], [DisplayOrder], [CreatedDate], [Status]) VALUES (2, N'Home', N'<div class="section article"> <style>.wordwrapfix{word-wrap: break-word;}</style> <div class="heading wordwrapfix"> <h3>We help children to get an education</h3> </div><div class="content"> <div class="img-simple span3 pull-left"> <div class="image"> <a rel="nofollow" data-ss="imagemodal" data-href="/resources/Home_files/i285415639381953158._szw480h1280_.jpg"><img src="/resources/Home_files/i285415639381953158._szw480h1280_.jpg"> </a> </div></div><p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.</p><p>At eam doctus oportere, eam feugait delectus ne. Quo cu vulputate persecuti. Eum ut natum possim comprehensam, habeo dicta scaevola eu nec. Ea adhuc reformidans eam. Pri dolore epicuri eu, ne cum tantas fierent instructior. Pro ridens intellegam ut, sea at graecis scriptorem eloquentiam.</p><p>Per an labitur lucilius ullamcorper, esse erat ponderum ad vim. Possim laoreet suscipit ex pri, vix numquam eruditi feugait in. Nec maluisset complectitur te, at sea decore semper. Falli numquam perpetua sea et, tibique repudiandae an pro. Ut his solum persius postulant. Soluta nemore debitis ne eos, cum an scripta pericula partiendo.</p><p><a rel="nofollow" href="help">How to Help</a> </p></div></div>', 2, CAST(N'2015-10-30 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Pages] ([ID], [Name], [Content], [DisplayOrder], [CreatedDate], [Status]) VALUES (4, N'About', N'<div class="section article"> <style>.wordwrapfix{word-wrap: break-word;}</style> <div class="heading wordwrapfix"> <h3>About Our School</h3> </div><div class="content"> <div class="img-simple span6 pull-right"> <div class="image"> <a rel="nofollow" data-ss="imagemodal" data-href="/resources/About Our School_files/i285415639381953159._szw480h1280_.jpg"><img src="/resources/About Our School_files/i285415639381953159._szw480h1280_.jpg"> </a> </div></div><p><span>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. </span> </p><p><span>Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.</span> </p></div></div>', 1, CAST(N'2015-10-30 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Pages] ([ID], [Name], [Content], [DisplayOrder], [CreatedDate], [Status]) VALUES (5, N'About', N'<div class="section article"> <style>.wordwrapfix{word-wrap: break-word;}</style> <div class="heading wordwrapfix"> <h3>Volunteers</h3> </div><div class="content"> <p>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.</p></div></div>', 2, CAST(N'2015-10-30 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Pages] ([ID], [Name], [Content], [DisplayOrder], [CreatedDate], [Status]) VALUES (6, N'Help', N'<div class="section"> <div class="content"> <div class="span12 contact-text"> <h4>Thank you for your interest in helping our school</h4> <p><span>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. </span> </p><p><span>Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat</span> </p></div><div class="img-simple span6 "> <div class="image"> <a rel="nofollow" data-ss="imagemodal" data-href="/resources/How to Help_files/i285415639381953180._szw480h1280_.jpg"><img src="/resources/How to Help_files/i285415639381953180._szw480h1280_.jpg"> </a> </div></div></div></div>', 1, CAST(N'2015-10-30 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Pages] ([ID], [Name], [Content], [DisplayOrder], [CreatedDate], [Status]) VALUES (7, N'Contact', N'<div class="row-fluid map-page-info"> <div class="span6"> <div class="item"> <div class="heading"> <h4 class="item-title map-page-title">Children''s Charity School</h4> </div><div class="content"> <div class="country"> <p>Address:<br>City:<br>Country:</p></div><div class="row-fluid"> <div class="span3"> Tel: </div><div class="span9"> <a rel="nofollow" href="tel:123456"> 123456 </a> </div></div><div class="row-fluid"> <div class="span3"> Email: </div><div class="span9"> <a rel="nofollow" href="mailto:your-email@your-email.com"> your-email@your-email.com </a> </div></div></div></div></div><div class="span6"> <div class="item"> <div class="heading"> <h4 class="item-title map-page-title"></h4> </div><div class="content"> </div></div></div></div>', 1, CAST(N'2015-10-30 00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Pages] OFF
SET IDENTITY_INSERT [dbo].[Photos] ON 

INSERT [dbo].[Photos] ([ID], [Image], [CreatedDate], [Status]) VALUES (1, N'/resources/Photo Album_files/i285415639381953177._szw360h1280_.jpg', CAST(N'2015-05-20 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Photos] ([ID], [Image], [CreatedDate], [Status]) VALUES (2, N'/resources/Photo Album_files/i285415639381953174._szw360h1280_.jpg', CAST(N'2015-05-21 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Photos] ([ID], [Image], [CreatedDate], [Status]) VALUES (3, N'/resources/Photo Album_files/i285415639381953172._szw360h1280_.jpg', CAST(N'2015-05-22 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Photos] ([ID], [Image], [CreatedDate], [Status]) VALUES (4, N'/resources/Photo Album_files/i285415639381953167._szw360h1280_.jpg', CAST(N'2015-05-23 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Photos] ([ID], [Image], [CreatedDate], [Status]) VALUES (5, N'/resources/Photo Album_files/i285415639381953169._szw360h1280_.jpg', CAST(N'2015-05-24 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Photos] ([ID], [Image], [CreatedDate], [Status]) VALUES (6, N'/resources/Photo Album_files/i285415639381953166._szw360h1280_.jpg', CAST(N'2015-05-25 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Photos] ([ID], [Image], [CreatedDate], [Status]) VALUES (7, N'/resources/Photo Album_files/i285415639381953164._szw360h1280_.jpg', CAST(N'2015-05-26 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Photos] ([ID], [Image], [CreatedDate], [Status]) VALUES (8, N'/resources/Photo Album_files/i285415639381953161._szw360h1280_.jpg', CAST(N'2015-05-27 00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Photos] OFF
SET IDENTITY_INSERT [dbo].[VisitorCounter] ON 

INSERT [dbo].[VisitorCounter] ([ID], [Counter]) VALUES (1, 719)
SET IDENTITY_INSERT [dbo].[VisitorCounter] OFF
USE [master]
GO
ALTER DATABASE [Charity] SET  READ_WRITE 
GO
