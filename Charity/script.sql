USE [master]
GO
/****** Object:  Database [Charity]    Script Date: 28-Jul-17 10:47:28 PM ******/
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
/****** Object:  Table [dbo].[Menus]    Script Date: 28-Jul-17 10:47:28 PM ******/
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
/****** Object:  Table [dbo].[Messages]    Script Date: 28-Jul-17 10:47:28 PM ******/
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
/****** Object:  Table [dbo].[News]    Script Date: 28-Jul-17 10:47:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
	[Entry] [nvarchar](256) NULL,
	[Content] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pages]    Script Date: 28-Jul-17 10:47:28 PM ******/
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
/****** Object:  Table [dbo].[Photos]    Script Date: 28-Jul-17 10:47:28 PM ******/
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
/****** Object:  Table [dbo].[VisitorCounter]    Script Date: 28-Jul-17 10:47:28 PM ******/
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

INSERT [dbo].[Menus] ([ID], [Name], [URL], [DisplayOrder], [Status]) VALUES (1, N'Home', N'home', 1, 1)
INSERT [dbo].[Menus] ([ID], [Name], [URL], [DisplayOrder], [Status]) VALUES (2, N'About Our School', N'about', 3, 1)
INSERT [dbo].[Menus] ([ID], [Name], [URL], [DisplayOrder], [Status]) VALUES (3, N'Photo Album', N'photo', 4, 1)
INSERT [dbo].[Menus] ([ID], [Name], [URL], [DisplayOrder], [Status]) VALUES (4, N'How to Help', N'help', 5, 1)
INSERT [dbo].[Menus] ([ID], [Name], [URL], [DisplayOrder], [Status]) VALUES (5, N'Contact', N'contact', 6, 1)
INSERT [dbo].[Menus] ([ID], [Name], [URL], [DisplayOrder], [Status]) VALUES (6, N'Overview', N'overview', 2, 0)
SET IDENTITY_INSERT [dbo].[Menus] OFF
SET IDENTITY_INSERT [dbo].[Messages] ON 

INSERT [dbo].[Messages] ([ID], [VisitorName], [Email], [Content], [CreatedDate]) VALUES (1, N'123213', N'licod1234@gmail.com', N'1232131', CAST(N'2017-07-28 02:56:02.557' AS DateTime))
INSERT [dbo].[Messages] ([ID], [VisitorName], [Email], [Content], [CreatedDate]) VALUES (2, N'123213', N'licod1234@gmail.com', N'1232131', CAST(N'2017-07-28 02:56:19.667' AS DateTime))
INSERT [dbo].[Messages] ([ID], [VisitorName], [Email], [Content], [CreatedDate]) VALUES (3, N'123213', N'licod1234@gmail.com', N'1232131', CAST(N'2017-07-28 02:56:31.767' AS DateTime))
INSERT [dbo].[Messages] ([ID], [VisitorName], [Email], [Content], [CreatedDate]) VALUES (4, N'213', N'licod1234@gmail.com', N'123', CAST(N'2017-07-28 21:27:54.247' AS DateTime))
INSERT [dbo].[Messages] ([ID], [VisitorName], [Email], [Content], [CreatedDate]) VALUES (5, N'123', N'licod1234@gmail.com', N'123', CAST(N'2017-07-28 21:51:31.627' AS DateTime))
SET IDENTITY_INSERT [dbo].[Messages] OFF
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([ID], [Name], [Entry], [Content], [CreatedDate], [Status]) VALUES (2, N'Aliquip ex ea commodo', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.', CAST(N'2015-09-08 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[News] ([ID], [Name], [Entry], [Content], [CreatedDate], [Status]) VALUES (5, N'Ullamcorper suscipit lobortis', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.', CAST(N'2015-10-30 00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[News] OFF
SET IDENTITY_INSERT [dbo].[Pages] ON 

INSERT [dbo].[Pages] ([ID], [Name], [Content], [DisplayOrder], [CreatedDate], [Status]) VALUES (1, N'Home', N'<div class="section article"> <style>.wordwrapfix{word-wrap:break-word;}</style> <div class="heading wordwrapfix"> <h3>Our school</h3> </div><div class="content"> <div class="img-simple "> <div class="image"> <a rel="nofollow" data-ss="imagemodal" data-href="./Home_files/i285415639381953156._szw1280h1280_.jpg"><img src="./Home_files/i285415639381953156._szw1280h1280_.jpg"></a> </div></div><p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p></div></div>', 1, CAST(N'2015-10-30 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Pages] ([ID], [Name], [Content], [DisplayOrder], [CreatedDate], [Status]) VALUES (2, N'Home', N'<div class="section article"> <style>.wordwrapfix{word-wrap:break-word;}</style> <div class="heading wordwrapfix"> <h3>We help children to get an education</h3> </div><div class="content"> <div class="img-simple span3 pull-left"> <div class="image"> <a rel="nofollow" data-ss="imagemodal" data-href="./Home_files/i285415639381953158._szw480h1280_.jpg"><img src="./Home_files/i285415639381953158._szw480h1280_.jpg"></a> </div></div><p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.</p><p>At eam doctus oportere, eam feugait delectus ne. Quo cu vulputate persecuti. Eum ut natum possim comprehensam, habeo dicta scaevola eu nec. Ea adhuc reformidans eam. Pri dolore epicuri eu, ne cum tantas fierent instructior. Pro ridens intellegam ut, sea at graecis scriptorem eloquentiam.</p><p>Per an labitur lucilius ullamcorper, esse erat ponderum ad vim. Possim laoreet suscipit ex pri, vix numquam eruditi feugait in. Nec maluisset complectitur te, at sea decore semper. Falli numquam perpetua sea et, tibique repudiandae an pro. Ut his solum persius postulant. Soluta nemore debitis ne eos, cum an scripta pericula partiendo.</p><p><a rel="nofollow" href="help">How to Help</a></p></div></div>', 2, CAST(N'2015-10-30 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Pages] ([ID], [Name], [Content], [DisplayOrder], [CreatedDate], [Status]) VALUES (4, N'About', N'<div class="section article"> <style>.wordwrapfix{word-wrap: break-word;}</style> <div class="heading wordwrapfix"> <h3>About Our School</h3> </div><div class="content"> <div class="img-simple span6 pull-right"> <div class="image"> <a rel="nofollow" data-ss="imagemodal" data-href="./About Our School_files/i285415639381953159._szw480h1280_.jpg"><img src="./About Our School_files/i285415639381953159._szw480h1280_.jpg"></a> </div></div><p><span>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. </span> </p><p><span>Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.</span> </p></div></div>', 1, CAST(N'2015-10-30 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Pages] ([ID], [Name], [Content], [DisplayOrder], [CreatedDate], [Status]) VALUES (5, N'About', N'<div class="section article"> <style>.wordwrapfix{word-wrap: break-word;}</style> <div class="heading wordwrapfix"> <h3>Volunteers</h3> </div><div class="content"> <p>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.</p></div></div>', 2, CAST(N'2015-10-30 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Pages] ([ID], [Name], [Content], [DisplayOrder], [CreatedDate], [Status]) VALUES (6, N'Help', N'<div class="section"> <div class="content"> <div class="span12 contact-text"> <h4>Thank you for your interest in helping our school</h4> <p><span>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. </span> </p><p><span>Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat</span> </p></div><div class="img-simple span6 "> <div class="image"> <a rel="nofollow" data-ss="imagemodal" data-href="http://cdn.simplesite.com/i/d2/f3/285415634679428050/i285415639381953180._szw1280h1280_.jpg"><img src="./How to Help_files/i285415639381953180._szw480h1280_.jpg"></a> </div></div></div></div>', 1, CAST(N'2015-10-30 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Pages] ([ID], [Name], [Content], [DisplayOrder], [CreatedDate], [Status]) VALUES (7, N'Contact', N'<div class="row-fluid map-page-info"> <div class="span6"> <div class="item"> <div class="heading"> <h4 class="item-title map-page-title">Children''s Charity School</h4> </div><div class="content"> <div class="country"> <p>Address:<br>City:<br>Country:</p></div><div class="row-fluid"> <div class="span3"> Tel: </div><div class="span9"> <a rel="nofollow" href="tel:123456"> 123456 </a> </div></div><div class="row-fluid"> <div class="span3"> Email: </div><div class="span9"> <a rel="nofollow" href="mailto:your-email@your-email.com"> your-email@your-email.com </a> </div></div></div></div></div><div class="span6"> <div class="item"> <div class="heading"> <h4 class="item-title map-page-title"></h4> </div><div class="content"> </div></div></div></div>', 1, CAST(N'2015-10-30 00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Pages] OFF
SET IDENTITY_INSERT [dbo].[Photos] ON 

INSERT [dbo].[Photos] ([ID], [Image], [CreatedDate], [Status]) VALUES (1, N'./Photo Album_files/i285415639381953177._szw360h1280_.jpg', CAST(N'2015-05-20 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Photos] ([ID], [Image], [CreatedDate], [Status]) VALUES (2, N'./Photo Album_files/i285415639381953174._szw360h1280_.jpg', CAST(N'2015-05-21 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Photos] ([ID], [Image], [CreatedDate], [Status]) VALUES (3, N'./Photo Album_files/i285415639381953172._szw360h1280_.jpg', CAST(N'2015-05-22 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Photos] ([ID], [Image], [CreatedDate], [Status]) VALUES (4, N'./Photo Album_files/i285415639381953167._szw360h1280_.jpg', CAST(N'2015-05-23 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Photos] ([ID], [Image], [CreatedDate], [Status]) VALUES (5, N'./Photo Album_files/i285415639381953169._szw360h1280_.jpg', CAST(N'2015-05-24 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Photos] ([ID], [Image], [CreatedDate], [Status]) VALUES (6, N'./Photo Album_files/i285415639381953166._szw360h1280_.jpg', CAST(N'2015-05-25 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Photos] ([ID], [Image], [CreatedDate], [Status]) VALUES (7, N'./Photo Album_files/i285415639381953164._szw360h1280_.jpg', CAST(N'2015-05-26 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Photos] ([ID], [Image], [CreatedDate], [Status]) VALUES (8, N'./Photo Album_files/i285415639381953161._szw360h1280_.jpg', CAST(N'2015-05-27 00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Photos] OFF
SET IDENTITY_INSERT [dbo].[VisitorCounter] ON 

INSERT [dbo].[VisitorCounter] ([ID], [Counter]) VALUES (1, 188)
SET IDENTITY_INSERT [dbo].[VisitorCounter] OFF
USE [master]
GO
ALTER DATABASE [Charity] SET  READ_WRITE 
GO
