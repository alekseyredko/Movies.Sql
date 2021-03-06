USE [master]
GO
/****** Object:  Database [MoviesDB]    Script Date: 04.08.2021 9:42:56 ******/
CREATE DATABASE [MoviesDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MoviesDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MoviesDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MoviesDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MoviesDB_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MoviesDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MoviesDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MoviesDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MoviesDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MoviesDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MoviesDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MoviesDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [MoviesDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MoviesDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MoviesDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MoviesDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MoviesDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MoviesDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MoviesDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MoviesDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MoviesDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MoviesDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MoviesDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MoviesDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MoviesDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MoviesDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MoviesDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MoviesDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MoviesDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MoviesDB] SET RECOVERY FULL 
GO
ALTER DATABASE [MoviesDB] SET  MULTI_USER 
GO
ALTER DATABASE [MoviesDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MoviesDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MoviesDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MoviesDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MoviesDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MoviesDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'MoviesDB', N'ON'
GO
ALTER DATABASE [MoviesDB] SET QUERY_STORE = OFF
GO
USE [MoviesDB]
GO
/****** Object:  Schema [schema_name]    Script Date: 04.08.2021 9:42:57 ******/
CREATE SCHEMA [schema_name]
GO
/****** Object:  Table [dbo].[Actor]    Script Date: 04.08.2021 9:42:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actor](
	[ActorId] [int] NOT NULL,
	[Age] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ActorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genre]    Script Date: 04.08.2021 9:42:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genre](
	[GenreId] [int] IDENTITY(1,1) NOT NULL,
	[GenreName] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GenreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movie]    Script Date: 04.08.2021 9:42:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movie](
	[MovieId] [int] IDENTITY(1,1) NOT NULL,
	[MovieName] [varchar](255) NOT NULL,
	[Duration] [time](7) NOT NULL,
	[Rate] [float] NULL,
	[LastUpdate] [datetime] NULL,
	[ProducerId] [int] NULL,
 CONSTRAINT [PK__Movie__4BD2941A2C61C4AD] PRIMARY KEY CLUSTERED 
(
	[MovieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovieGenres]    Script Date: 04.08.2021 9:42:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieGenres](
	[GenreId] [int] NOT NULL,
	[MovieId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GenreId] ASC,
	[MovieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MoviesActors]    Script Date: 04.08.2021 9:42:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MoviesActors](
	[ActorId] [int] NOT NULL,
	[MovieId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ActorId] ASC,
	[MovieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 04.08.2021 9:42:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[PersonId] [int] IDENTITY(1,1) NOT NULL,
	[PersonName] [varchar](255) NOT NULL,
 CONSTRAINT [PK__Person__AA2FFBE51C875AA0] PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producer]    Script Date: 04.08.2021 9:42:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producer](
	[ProducerId] [int] NOT NULL,
	[Country] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Producer] PRIMARY KEY CLUSTERED 
(
	[ProducerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RefreshToken]    Script Date: 04.08.2021 9:42:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RefreshToken](
	[RefreshTokenId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Token] [nvarchar](64) NOT NULL,
	[Created] [datetime] NOT NULL,
	[Expires] [datetime] NOT NULL,
	[IsExpired] [bit] NOT NULL,
	[IsRevoked] [bit] NOT NULL,
 CONSTRAINT [PK_RefreshToken] PRIMARY KEY CLUSTERED 
(
	[RefreshTokenId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review]    Script Date: 04.08.2021 9:42:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[ReviewId] [int] IDENTITY(1,1) NOT NULL,
	[ReviewText] [varchar](1024) NOT NULL,
	[Rate] [int] NOT NULL,
	[MovieId] [int] NOT NULL,
	[ReviewerId] [int] NOT NULL,
	[LastUpdate] [datetime] NULL,
 CONSTRAINT [PK__Review__74BC79CED4F32337] PRIMARY KEY CLUSTERED 
(
	[ReviewId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reviewer]    Script Date: 04.08.2021 9:42:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviewer](
	[ReviewerId] [int] NOT NULL,
	[NickName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__Reviewer__1616CFDDCEA820CC] PRIMARY KEY CLUSTERED 
(
	[ReviewerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReviewerWatchHistory]    Script Date: 04.08.2021 9:42:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReviewerWatchHistory](
	[MovieId] [int] NOT NULL,
	[ReviewerId] [int] NOT NULL,
	[LastWatchTime] [datetime] NULL,
 CONSTRAINT [PK_ReviewerWatchHistory] PRIMARY KEY CLUSTERED 
(
	[MovieId] ASC,
	[ReviewerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 04.08.2021 9:42:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[PasswordHash] [nvarchar](256) NOT NULL,
	[PasswordSalt] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 04.08.2021 9:42:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[UserId] [int] NOT NULL,
	[Role] [nvarchar](20) NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Movie] ON 

INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (992, N'XULJSCWHFMSHLEVOOYMA WKWSXTLDWOXQTVTMJUJN', CAST(N'01:01:00' AS Time), 18, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (993, N'updated', CAST(N'01:06:00' AS Time), 0, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (994, N'BFQYMOPHUOSZAROVWMFU BCHNXMDGRJWFTFMSLZDT', CAST(N'01:11:00' AS Time), 11, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (995, N'GHNGYSPFJBAEXUYYLFKE OPSXPOEVTBGFOVYTFEJH', CAST(N'01:16:00' AS Time), 7, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (996, N'QCVSLGPVQQSBHAGDUHBL TSBAEUVMATQKSNRCJXQT', CAST(N'01:21:00' AS Time), 4, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (997, N'EYGSRTOEBPECTDAGKEGH ZHROJGHWCDMDGJAUQGZN', CAST(N'01:26:00' AS Time), 3, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (998, N'DJTHTAMAZNRTJYTYBWLN KSBLCOULNBJUMXTQOFPX', CAST(N'01:31:00' AS Time), 2, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (999, N'NCQNFYRWNSQHGWKEGHEG JBKPKAPHOLUPOFNGQOXY', CAST(N'01:36:00' AS Time), 4, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1000, N'DYUYWYBUPAAFYJDKFRNW NVRFNNBXXSOHOVAUGPNQ', CAST(N'01:41:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1001, N'SVANXCYHEFHUWFDNTKJW JCTTERXTSOWGUQKTEHWK', CAST(N'01:46:00' AS Time), 1, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1002, N'EBVLXZUZXEHAUUGFEJCT PEUBWTQTUGARBVASOTFM', CAST(N'01:51:00' AS Time), 0, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1003, N'WNFPRQQGJKATMTBASCYX WDYLRQQZTOHZFEYEGDZH', CAST(N'01:56:00' AS Time), 2, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1004, N'ZLFUWHXWCAGBGXWLNQQE UQWEDMROHRPOVOJKHEBQ', CAST(N'02:01:00' AS Time), 0, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1005, N'DVPTZYBPKBXFTMKDDLSH GEZKJKMYKPCMPPXDCZCH', CAST(N'02:06:00' AS Time), 4, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1006, N'PJBGQFMXPVGMHVGEQUTN PTPNHGQOVKVEGLMMHHYQ', CAST(N'02:11:00' AS Time), 0, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1007, N'KHZVEJJHYEFNWNDFWYWE MBJBJBFPRNPBGUXCKPBO', CAST(N'02:16:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1008, N'YTXWMJGJXYQBMGAGRVCO GSJLLZRMVKLYCRWGNZBL', CAST(N'02:21:00' AS Time), 2, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1009, N'YTRDOWPJFVLDDSFHNZKO WPAUGVELQGAWXWUUGWCZ', CAST(N'02:26:00' AS Time), 3, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1010, N'GRAJVWSEOEEZTLZKWMPE MQBRLBDOVCMNUQWCLEQY', CAST(N'02:31:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1011, N'LUKLGTNTQUGJUAFNJJAB YEYSOSJZCGBCRQPUXMNW', CAST(N'02:36:00' AS Time), 1, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1012, N'BQLXGQVETCCAGKTTTHVR KKUBRLKUDPQKFKGZRSYY', CAST(N'02:41:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1013, N'MKPPZNBVJXXGYORPOFGT AKTNYJJSVPRJBURGPOLP', CAST(N'02:46:00' AS Time), 0, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1014, N'ENYKSUPKLGTUSYLWPQXX CEWQCEZGLMZWFFWYXMXA', CAST(N'02:51:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1015, N'ZJTBAWNTSATVKGOKPRTG JVTYONZTVJVPNCOWKALV', CAST(N'02:56:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1016, N'QNYMNRJMYVUUVOUTDKWF HWNZYANTMPPPDDDKCDUM', CAST(N'03:01:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1017, N'YAKNPYORXZHNQDBBCGBB NSVSWLHALNEHTVDDQRTU', CAST(N'03:06:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1018, N'BBHUHUTQKAAKACAVVYGY GBOASABHZVFSPAGXKHSB', CAST(N'03:11:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1019, N'MZHVGLLLHBEOTBVYWSVW QMUJTKYPXSPBGDTJJMLL', CAST(N'03:16:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1020, N'MXBUWTURPQDOOCGLKMQS UXVOLWJOZCDBLTPLKJLM', CAST(N'03:21:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1021, N'TKTCZJCQRPLRVHAMGPSX UZLZGZWOZHTLKNLQCFGV', CAST(N'03:26:00' AS Time), 0, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1022, N'VLZAVGOCKHMUKAAQOEMT QCYUTZCAFSJLVWOSYVRC', CAST(N'03:31:00' AS Time), 0, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1023, N'KFTJSZHXAFLBKTPGOLEO FEQPSJUJBBZRLGWTHTKX', CAST(N'03:36:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1024, N'ODTNASSVWPNNRTBAXKJC HLMJGYGJKMDSYGYAWCAT', CAST(N'03:41:00' AS Time), 7, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1025, N'YZFWMOYSOWFKJEKYXCKM QGVTPXXXWCLBSJONQSDU', CAST(N'03:46:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1026, N'GAGZZOTVPVOLSSKZYQQE QCTVNEBUTGACFTXJSAZK', CAST(N'03:51:00' AS Time), 0, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1027, N'HFMGPAPPNSYPEDVTHUEM XNGVVPTHTGUPDBQHKZST', CAST(N'03:56:00' AS Time), 1, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1029, N'KXEFBSLAWCLGQSCXDNDB OUKBMPODWTNMKAFYWBCC', CAST(N'04:06:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1030, N'SHLWWKRKZNZNQCVVTLSJ ORQPQGRAXRUOEQDUPCDV', CAST(N'04:11:00' AS Time), 4, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1031, N'ZHGKQVWPKQBOBKZTYWTD BLSDFTUARCCUGEJWTTJY', CAST(N'04:16:00' AS Time), 4, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1032, N'ESJBXHGGFYKPWDCOZJYH BPHWJVUEUXHGUZBUCWRU', CAST(N'04:21:00' AS Time), 5, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1033, N'HXVUDXBEBMPEJVXWOFLM LPRBYHUXJTLKSSSAMQDS', CAST(N'04:26:00' AS Time), 3, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1034, N'YYPKTWHXOUZSOYZADGTN YLLHRVNCSUQPFBYJVXZB', CAST(N'04:31:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1035, N'RFTTYXTZWXZOCKOENLJS KKFXEHMKHUKPHUZMGWEL', CAST(N'04:36:00' AS Time), 3, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1036, N'MFLHOYWTECJACYVJLNVH POQQSJKBVRRNHADELNTM', CAST(N'04:41:00' AS Time), 4, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1037, N'OFEMPSJJHCXYVVHCSWGM BWJOKAGFWHGDHMQUGRKS', CAST(N'04:46:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1038, N'SUQNQULJOYSETCZBEDKQ DGBNKMDRYXZHYHYAPVGE', CAST(N'04:51:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1040, N'OTRHZLPUOLNUMVECDXAE AYWQYHBMYAESYABAPWCM', CAST(N'01:01:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1041, N'OXGOTDGSBMBDCDUQEGQT XTNOZNSMUXBGNYETYHZM', CAST(N'01:06:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1042, N'HOJWTLYRGHRBUFFEMSXO OHOTHTGVEXEFDZYUUHFT', CAST(N'01:11:00' AS Time), 0, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1043, N'GDLOAHOHDGCUBKCURLAP BYFKUJQHUTZZRLAMEAKC', CAST(N'01:16:00' AS Time), 8, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1044, N'XECULPWYWTGDYKZATTQJ EUNQZSNGWTFSUTGACNMF', CAST(N'01:21:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1045, N'OGPUXJWACVBHROSJHHNN VSTGZTJKHFPEKUCLQFYS', CAST(N'01:26:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1046, N'WGDFALSTQPURZXXQMGER RYOXUQQQFZEJGYSGKSVF', CAST(N'01:31:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1047, N'YGYPJUKVKNXLHVRHCYGJ NAHFXXXJLTNBKUBMVLGC', CAST(N'01:36:00' AS Time), 0, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1048, N'NVGSCSSROUGFYQPFAQAC YCHREHURZGVVSKJWFDBW', CAST(N'01:41:00' AS Time), 0, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1049, N'XCUVNJNCECUFRYHWCQLL YJNXDHBEKDMBRWUNMOKO', CAST(N'01:46:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1050, N'AJUOMKXHDHZOKNTVTOHM XOXGDAZUQUTKZHGLVAAA', CAST(N'01:51:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1051, N'KLGDUGPKJZOEYSFLNJPJ GKDNFTDZWMBMXKGSOKRH', CAST(N'01:56:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1052, N'JTJNXJXYQKSYOUKYDPYU HBXVHEZUAGKJLLRLSMWL', CAST(N'02:01:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1053, N'UTEJKHAORPQEKRJJARAG LOHOFZVZCTHGGJDLLYPJ', CAST(N'02:06:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1054, N'YZTLKMREAZTQLTOBGAOF UFHSDWXPMYARSRERBKEG', CAST(N'02:11:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1055, N'YYJQAEBLUHVXWSZLOQSQ JQKUXPMFPLRKDNAKRPZE', CAST(N'02:16:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1056, N'UZXSWXAFENAFHKBLGTSG DBCOEKNNHUADXCNVVVZG', CAST(N'02:21:00' AS Time), 8, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1057, N'XNXJYTZZEWQKRYMZYVAQ WWRJBLGYTMHVDDKQVCDE', CAST(N'02:26:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1058, N'VZSZKAMGAALRTTUGDCGJ EWDUVQAQCDPOFLRKJVBO', CAST(N'02:31:00' AS Time), 0, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1059, N'ASDCFRQXJWTKMKYLVVTR UGOFPOKZSYKSQGYSGTYF', CAST(N'02:36:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1060, N'FFXKREDKEKKLFOZRAHOW OAPTULRCHUXQFRRYFZYW', CAST(N'02:41:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1061, N'ZDUXALHUQSGOMXEDYNMY RSXJXYWCWFGETYQOLVRU', CAST(N'02:46:00' AS Time), 0, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1062, N'EREXDNBHBJWASGDXHFZC XHBLZBPJGJVPSCFKQSFY', CAST(N'02:51:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1063, N'XTKANQWKKKLMFMDJJMYP GDXUPQFNFFGDETEXETTF', CAST(N'02:56:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1064, N'ROJRGCAZQUBHVKPHSEHH LVLVDZUMLWACPOWZAJKS', CAST(N'03:01:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1065, N'NHRHNDROREQRQTRPUXQB NHSOVASOGDRKDTOJWKAY', CAST(N'03:06:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1066, N'VFQNTJGYWVVPDQNVWTHC KBDQPHHBRDEMTGTBCZDD', CAST(N'03:11:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1067, N'TCWHCSRMBJFNOCWONFXN YWXWMXZXSYSBVDJFRVLK', CAST(N'03:16:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1068, N'OQPVSKNNSNASZVWJOPXU YYQKJSKJTAUUVBAWPQYK', CAST(N'03:21:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1069, N'EEYKCBCXZKNALLEDDPRT TCYOKJQOJABTFDMERXQQ', CAST(N'03:26:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1070, N'CUGTKQKVRFEOTFFSTMQR XSUNFNWDWUNOHSFYCURV', CAST(N'03:31:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1071, N'MATCBNWJNLDOANAPPLEW NAJQFMZJUYCTCWJBRWEZ', CAST(N'03:36:00' AS Time), 0, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1072, N'TEERDANSALLELLNWWQUA HCYFSHAYUCQKENVKWVQX', CAST(N'03:41:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1073, N'WDPXGMQFQKXFRSFDZYXY HNSEVDRMWCVNCUYURQKA', CAST(N'03:46:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1074, N'OHTBPWSKXTUTWYCBKFLO BBBUFQMJEZSQCJNQTCPK', CAST(N'03:51:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1075, N'VUPAMPFVPBRCSKAZJPNN XUSULTREEXZXNWXZFPLX', CAST(N'03:56:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1076, N'LNKZXGMOUCVSVFVKMBRF XGAXBYGJUTQPJWCJXJHB', CAST(N'04:01:00' AS Time), 1, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1077, N'MKMBRGYYMNSNTREXUTUT WARLQHCNEUMQCCHNZHFN', CAST(N'04:06:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1078, N'LPNXTAXUOHUFKQCTPMDK OXXOGOCALJUKTXUMCFKX', CAST(N'04:11:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1079, N'XUXTEEHTKJCZRKFCDUHK TEHRGRSSALCHRFRZFTAD', CAST(N'04:16:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1080, N'PTKUPOVKWWHYUZDQGEGL OMFNTHDLTOQHGXZJCZYT', CAST(N'04:21:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1081, N'NXVLPJURQYFLHKBKWHAB MKUPJESGQPUWLNRZSJCE', CAST(N'04:26:00' AS Time), 3, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1082, N'MHLYRMAKCZDKSMTMJLEU XMXLAYQMRZOCZXSDEJXD', CAST(N'04:31:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1083, N'ETWXNBANYUAPPFXDRABV LDEFEHNCGBVVNWNSOXHS', CAST(N'04:36:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1084, N'OAFYKWGYOTDREYPZAHJB POQJQOWVQAHDLYWDPCDM', CAST(N'04:41:00' AS Time), 5, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1085, N'UGSDOLOQGEYRBOOYMHAX YTHOXCJWJSBBCWUHSPMK', CAST(N'04:46:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1086, N'OHQUENDBMOHEELJUCJBF WLGYPYJATUQPPWCCKVKN', CAST(N'04:51:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1088, N'DHGLFOSJZWAQGHKNERJJ XNDAJEOVLWETNJWJTXKZ', CAST(N'01:01:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1089, N'CDLFAMKMWMNYQPBLVSSU KKEWUFNUFGFFSCAHTCCT', CAST(N'01:06:00' AS Time), 2, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1090, N'UYHJZLBOMDYHXJLGYQHR ASEVCABMJGWUZDYFHLUC', CAST(N'01:11:00' AS Time), 13, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1091, N'KVDLWZNTRGTQPFWOZOZZ LEMMWRYLGHBYUSWPVMNP', CAST(N'01:16:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1092, N'DMBQUMJRMMUEGXTHRCRN AQZXGKBLZDSMGPDXXJMU', CAST(N'01:21:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1093, N'RPULVMAKHSHPNFXWWLFP AWWRERYHACWWVZVTZNXD', CAST(N'01:26:00' AS Time), 5, NULL, NULL)
GO
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1094, N'ZKYEMPFDYFFMMWVXPPAH WRHGKGKHLPEKRYSCALSQ', CAST(N'01:31:00' AS Time), 2, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1095, N'NAWABDVGTNQCUCKYZPJR TKGZWWANYNZABQYHXOGM', CAST(N'01:36:00' AS Time), 5, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1096, N'XQEFRYBBDCHZMRCVXQBP AEGVDEJOABWNOHRUZHBK', CAST(N'01:41:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1097, N'LSEGEZACTWAVOBYFJFFD ANVNLTNWMSQEVURHJVPK', CAST(N'01:46:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1098, N'OUNDZQJAEBNEYBSZVNDZ MUBBLACCGEFBTMFWKHPY', CAST(N'01:51:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1099, N'FFEZVNKBCAFVZESLUQYD QLZSFMDSGTCHNKOBHCVC', CAST(N'01:56:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1100, N'DVZLCXHLJQSOECJTBTOC JPWCFEXKTOMQJQDWWYHF', CAST(N'02:01:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1101, N'GEKEXZZWRRERQXFURYAO WSHHYDABSCFXRCUXNUJM', CAST(N'02:06:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1102, N'DFDECRPXOFSBAQUVLFWV HFAHHWSZDUZXGWABELUW', CAST(N'02:11:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1103, N'JTDLHSJBJLZXLDTJEATC FAVXSEXUTJXXWQPWDWPY', CAST(N'02:16:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1104, N'AYNTKMTCBWZTWFUCSNNX KDYNWNSQUQHBNTBWWRPM', CAST(N'02:21:00' AS Time), 4, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1105, N'RXOLJWHQEFPROERLUWQB SJZTRTRFYUGMDTKXTEOK', CAST(N'02:26:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1106, N'DBGXLUHJBUFAHTCHSSKB LVDOKXFFVSXCZGUKVPPC', CAST(N'02:31:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1107, N'LSPQWNSFBNQZXWODPMTA DWYRNWMDFDXQOQSARFLZ', CAST(N'02:36:00' AS Time), 3, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1108, N'CTDTOKJPGEYUZZMNEDUW PKXFMBEEKREWPFGTTFMN', CAST(N'02:41:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1109, N'PTQEWPADSKNPMADOBZMB ATEFYHMXVBZOPTHFRANV', CAST(N'02:46:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1110, N'NHVCQQWGAHAWJGWJUOAV FPGVDPRLNUQBWORCNBKA', CAST(N'02:51:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1111, N'MWTJNGYEGOQKYJYFAPVW PNHMGHHYWKZFDGZKPSJJ', CAST(N'02:56:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1112, N'BJTTOHQYPVJJOCUCQUVF DWOYBCCRDUCYEGDMXBKQ', CAST(N'03:01:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1113, N'KAVPECHOOJQKJXRETEWY DRFJZWCKAOLKJGMVDFQE', CAST(N'03:06:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1114, N'POZKSMKBXYTYPASTFPVF NPGTBLVFWMVLANAKYQFK', CAST(N'03:11:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1115, N'CLFLFQJQYUNGXEGCRONM ARZPQTSFYCUVQFKURQQR', CAST(N'03:16:00' AS Time), 9, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1116, N'ABKHWCSBTBRBDLONVVRO AXXKBMGPFJKFEOZOMWDC', CAST(N'03:21:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1117, N'APDYNYSSUJWHBVAAOWGX PYKXGTGSRFQMBVOZVNRS', CAST(N'03:26:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1118, N'BXEVWXKJSPRPCDDYBLXO ELOZHFCGMJLADLMVBHJL', CAST(N'03:31:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1119, N'NZXBUEXHFZVKUDHDKAUD SJVDBLUCERPCGNDZVPLL', CAST(N'03:36:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1120, N'HKLUQNXJVUDUOVBPGQOY RYCTHONTEYNOSHONAENL', CAST(N'03:41:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1121, N'EHXEDRQBOGBEVMLHMNSC WJCOORQOJUPDYCZDPSDT', CAST(N'03:46:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1122, N'JDWXNQRFFXTAQPZQDEPV RTOMMOOLDBYLVKWQOTJF', CAST(N'03:51:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1123, N'EJGCKYBRNTBMBWLNAXMK SMLAXFMTWSXVQFXJXVKK', CAST(N'03:56:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1124, N'SCAWKWVRGNVDMLCQLSHS FZYLOCHBHTUHXYYGVXHG', CAST(N'04:01:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1125, N'NDSNNOQAQLZFWNFEDVOK CGZHJDPHLJAJMEZTMRMG', CAST(N'04:06:00' AS Time), 2, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1126, N'SSCATZUTODHJNJSJVVRD BTBCGDCFRKMPQROLBMMQ', CAST(N'04:11:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1127, N'MCQFUPRCXBBUJNVWUZWM KEKKEXDZTNSUDYMMANUA', CAST(N'04:16:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1128, N'VALRVTZDDFOPPTPAPLOK WMQEZQTKDSMRWWPBKANE', CAST(N'04:21:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1129, N'AZJCQBWBDWNDFJFWUYGR QXTGCOBPAEDKYOPDETMK', CAST(N'04:26:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1130, N'MZCXTJNDDSLFHVVTJEWW KCENSNGQNBVJALUQDJOU', CAST(N'04:31:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1131, N'CSZHVVFROYLRXBZWCGWA PQGBJDRXZQZMFRCWFAHM', CAST(N'04:36:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1132, N'QSEKVAJPBFWGRHHZVJAB WETGSKJCPKRRTDEHPOBW', CAST(N'04:41:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1133, N'DEAAURUYOKCUUAEHLZAN FMHHWECUTHLWYOYQAPTY', CAST(N'04:46:00' AS Time), 3, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1134, N'TRHXNOMOGHPDCZTAXYXZ BLXWUALUCFRGNQYMXROQ', CAST(N'04:51:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1136, N'XULJSCWHFMSHLEVOOYMA WKWSXTLDWOXQTVTMJUJN', CAST(N'00:00:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1138, N'XULJSCWHFMSHLEVOOYMA WKjiiojijoWSXTLDWOXQTVTMJUJN', CAST(N'01:01:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1139, N'XULJSCWHFMSHLEVOOYMA WKjiiojijoWSXTLDWOXQTVTMJUJN', CAST(N'01:01:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1140, N'XULJSCWHFMSHLEVOOYMA WKjiiojijowwwrwrwrrwrwWSXTLDWOXQTVTMJUJN', CAST(N'01:01:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1141, N'Movie1', CAST(N'01:20:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1142, N'Mov2ie1', CAST(N'01:20:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1171, N'mov', CAST(N'01:30:40' AS Time), NULL, NULL, 10450)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1172, N'mov1', CAST(N'01:30:40' AS Time), NULL, NULL, 10456)
INSERT [dbo].[Movie] ([MovieId], [MovieName], [Duration], [Rate], [LastUpdate], [ProducerId]) VALUES (1173, N'mmmmmm', CAST(N'01:30:50' AS Time), NULL, NULL, 10456)
SET IDENTITY_INSERT [dbo].[Movie] OFF
GO
SET IDENTITY_INSERT [dbo].[Person] ON 

INSERT [dbo].[Person] ([PersonId], [PersonName]) VALUES (10450, N'Df')
INSERT [dbo].[Person] ([PersonId], [PersonName]) VALUES (10451, N'Aliaksei')
INSERT [dbo].[Person] ([PersonId], [PersonName]) VALUES (10452, N'aleksey')
INSERT [dbo].[Person] ([PersonId], [PersonName]) VALUES (10453, N'aleksey')
INSERT [dbo].[Person] ([PersonId], [PersonName]) VALUES (10454, N'eaaaaaaaa')
INSERT [dbo].[Person] ([PersonId], [PersonName]) VALUES (10455, N'Alex')
INSERT [dbo].[Person] ([PersonId], [PersonName]) VALUES (10456, N'alex')
INSERT [dbo].[Person] ([PersonId], [PersonName]) VALUES (10457, N'alex1111')
SET IDENTITY_INSERT [dbo].[Person] OFF
GO
INSERT [dbo].[Producer] ([ProducerId], [Country]) VALUES (10450, N'Belarus')
INSERT [dbo].[Producer] ([ProducerId], [Country]) VALUES (10453, N'Ukraine')
INSERT [dbo].[Producer] ([ProducerId], [Country]) VALUES (10454, N'a')
INSERT [dbo].[Producer] ([ProducerId], [Country]) VALUES (10455, N'Russia')
INSERT [dbo].[Producer] ([ProducerId], [Country]) VALUES (10456, N'Ukraine')
INSERT [dbo].[Producer] ([ProducerId], [Country]) VALUES (10457, N'Belarus')
GO
SET IDENTITY_INSERT [dbo].[Review] ON 

INSERT [dbo].[Review] ([ReviewId], [ReviewText], [Rate], [MovieId], [ReviewerId], [LastUpdate]) VALUES (16, N'33', 1, 1016, 10450, CAST(N'2021-07-22T12:25:32.190' AS DateTime))
INSERT [dbo].[Review] ([ReviewId], [ReviewText], [Rate], [MovieId], [ReviewerId], [LastUpdate]) VALUES (17, N'33rwrw3rw3', 4, 999, 10450, CAST(N'2021-07-22T12:36:45.773' AS DateTime))
INSERT [dbo].[Review] ([ReviewId], [ReviewText], [Rate], [MovieId], [ReviewerId], [LastUpdate]) VALUES (18, N'3434', 4, 1030, 10450, CAST(N'2021-07-22T12:37:43.923' AS DateTime))
INSERT [dbo].[Review] ([ReviewId], [ReviewText], [Rate], [MovieId], [ReviewerId], [LastUpdate]) VALUES (19, N'31`3223', 2, 1003, 10450, CAST(N'2021-07-22T14:19:04.960' AS DateTime))
INSERT [dbo].[Review] ([ReviewId], [ReviewText], [Rate], [MovieId], [ReviewerId], [LastUpdate]) VALUES (20, N'4r4r', 4, 1005, 10450, CAST(N'2021-07-22T14:19:31.713' AS DateTime))
INSERT [dbo].[Review] ([ReviewId], [ReviewText], [Rate], [MovieId], [ReviewerId], [LastUpdate]) VALUES (21, N'3R4WR4RW3', 2, 1000, 10450, CAST(N'2021-07-22T14:29:25.713' AS DateTime))
INSERT [dbo].[Review] ([ReviewId], [ReviewText], [Rate], [MovieId], [ReviewerId], [LastUpdate]) VALUES (23, N'msqqqw', 1, 1027, 10450, CAST(N'2021-07-22T16:15:08.160' AS DateTime))
INSERT [dbo].[Review] ([ReviewId], [ReviewText], [Rate], [MovieId], [ReviewerId], [LastUpdate]) VALUES (24, N'ewwe', 5, 1042, 10450, CAST(N'2021-07-23T11:38:53.500' AS DateTime))
INSERT [dbo].[Review] ([ReviewId], [ReviewText], [Rate], [MovieId], [ReviewerId], [LastUpdate]) VALUES (25, N'4343', 4, 1018, 10450, CAST(N'2021-07-23T13:08:28.813' AS DateTime))
INSERT [dbo].[Review] ([ReviewId], [ReviewText], [Rate], [MovieId], [ReviewerId], [LastUpdate]) VALUES (26, N'433', 4, 1104, 10450, CAST(N'2021-07-23T13:10:26.727' AS DateTime))
INSERT [dbo].[Review] ([ReviewId], [ReviewText], [Rate], [MovieId], [ReviewerId], [LastUpdate]) VALUES (27, N'34343', 2, 1017, 10450, CAST(N'2021-07-23T14:02:52.937' AS DateTime))
INSERT [dbo].[Review] ([ReviewId], [ReviewText], [Rate], [MovieId], [ReviewerId], [LastUpdate]) VALUES (28, N'455656655665656565665', 4, 1031, 10450, CAST(N'2021-07-23T14:05:06.797' AS DateTime))
INSERT [dbo].[Review] ([ReviewId], [ReviewText], [Rate], [MovieId], [ReviewerId], [LastUpdate]) VALUES (33, N'weq2eq2', 2, 1008, 10450, CAST(N'2021-07-26T07:29:16.420' AS DateTime))
INSERT [dbo].[Review] ([ReviewId], [ReviewText], [Rate], [MovieId], [ReviewerId], [LastUpdate]) VALUES (35, N'we3345', 4, 996, 10450, CAST(N'2021-07-26T08:26:56.767' AS DateTime))
INSERT [dbo].[Review] ([ReviewId], [ReviewText], [Rate], [MovieId], [ReviewerId], [LastUpdate]) VALUES (36, N'3', 4, 1045, 10450, CAST(N'2021-07-26T08:38:44.603' AS DateTime))
INSERT [dbo].[Review] ([ReviewId], [ReviewText], [Rate], [MovieId], [ReviewerId], [LastUpdate]) VALUES (37, N'rerere', 3, 1063, 10450, CAST(N'2021-07-26T10:47:20.817' AS DateTime))
INSERT [dbo].[Review] ([ReviewId], [ReviewText], [Rate], [MovieId], [ReviewerId], [LastUpdate]) VALUES (42, N'123', 3, 1009, 10450, CAST(N'2021-07-26T11:26:01.723' AS DateTime))
INSERT [dbo].[Review] ([ReviewId], [ReviewText], [Rate], [MovieId], [ReviewerId], [LastUpdate]) VALUES (43, N'woooow', 3, 997, 10450, CAST(N'2021-07-26T11:28:27.757' AS DateTime))
INSERT [dbo].[Review] ([ReviewId], [ReviewText], [Rate], [MovieId], [ReviewerId], [LastUpdate]) VALUES (44, N'maw', 2, 998, 10450, CAST(N'2021-07-26T11:44:30.657' AS DateTime))
INSERT [dbo].[Review] ([ReviewId], [ReviewText], [Rate], [MovieId], [ReviewerId], [LastUpdate]) VALUES (45, N'heh', 3, 1033, 10450, CAST(N'2021-07-26T11:45:18.400' AS DateTime))
INSERT [dbo].[Review] ([ReviewId], [ReviewText], [Rate], [MovieId], [ReviewerId], [LastUpdate]) VALUES (46, N'wow', 1, 1076, 10450, CAST(N'2021-07-26T14:22:56.780' AS DateTime))
INSERT [dbo].[Review] ([ReviewId], [ReviewText], [Rate], [MovieId], [ReviewerId], [LastUpdate]) VALUES (48, N'wooow', 3, 992, 10450, CAST(N'2021-07-29T10:29:17.530' AS DateTime))
INSERT [dbo].[Review] ([ReviewId], [ReviewText], [Rate], [MovieId], [ReviewerId], [LastUpdate]) VALUES (50, N'wow', 7, 992, 10455, CAST(N'2021-07-29T10:32:42.543' AS DateTime))
INSERT [dbo].[Review] ([ReviewId], [ReviewText], [Rate], [MovieId], [ReviewerId], [LastUpdate]) VALUES (55, N'wow', 10, 994, 10450, CAST(N'2021-07-29T11:15:35.797' AS DateTime))
INSERT [dbo].[Review] ([ReviewId], [ReviewText], [Rate], [MovieId], [ReviewerId], [LastUpdate]) VALUES (57, N'bad', 1, 994, 10455, CAST(N'2021-07-29T13:27:42.897' AS DateTime))
INSERT [dbo].[Review] ([ReviewId], [ReviewText], [Rate], [MovieId], [ReviewerId], [LastUpdate]) VALUES (59, N'good', 8, 992, 10456, CAST(N'2021-07-30T09:41:07.257' AS DateTime))
SET IDENTITY_INSERT [dbo].[Review] OFF
GO
INSERT [dbo].[Reviewer] ([ReviewerId], [NickName]) VALUES (10450, N'nick')
INSERT [dbo].[Reviewer] ([ReviewerId], [NickName]) VALUES (10455, N'alexxx')
INSERT [dbo].[Reviewer] ([ReviewerId], [NickName]) VALUES (10456, N'alexxxx9999')
GO
INSERT [dbo].[User] ([UserId], [Login], [PasswordHash], [PasswordSalt]) VALUES (10450, N'alekseyredko00', N'SG1Q3frEoK27d9ncr9QPOA==', N'CltZ7andE9gPDFYZUmh/cw==')
INSERT [dbo].[User] ([UserId], [Login], [PasswordHash], [PasswordSalt]) VALUES (10451, N'aleksey1999', N'S3UNIczbMP+s8PGe4GnbjA==', N'6CBHA3NKZRbLhbgpQOcuwg==')
INSERT [dbo].[User] ([UserId], [Login], [PasswordHash], [PasswordSalt]) VALUES (10452, N'alex', N'ckzJxNGTQYCO2VMbG72vew==', N'FbW9YQWZcL+OZx5clb3Rpg==')
INSERT [dbo].[User] ([UserId], [Login], [PasswordHash], [PasswordSalt]) VALUES (10453, N'alekseyredko000', N'/BxZ1u9sEPhE79Fgd0TqUA==', N'2RpsHF01L3cLLul0rbGhLg==')
INSERT [dbo].[User] ([UserId], [Login], [PasswordHash], [PasswordSalt]) VALUES (10454, N'aaaaaaaaa', N'8q//EoQfJc/vU9cR0LCOgg==', N'WbTsqLBAjdquIPhdcqOm/w==')
INSERT [dbo].[User] ([UserId], [Login], [PasswordHash], [PasswordSalt]) VALUES (10455, N'aleksey', N'rsnSwbJMvzU40TjdinMJ2Q==', N'hzQNeSCfd5aBegiLl9X59Q==')
INSERT [dbo].[User] ([UserId], [Login], [PasswordHash], [PasswordSalt]) VALUES (10456, N'alex1111', N'eE/+h3+QO2RMADFWpMM0Tg==', N'QYid9efWto5F3RXU1xcywQ==')
INSERT [dbo].[User] ([UserId], [Login], [PasswordHash], [PasswordSalt]) VALUES (10457, N'alex1111111', N'4uXzCL97m0c0Ck/XDzBlNg==', N'C05MGoBR0YkIcJomjgfhIg==')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Genre__BBE1C339FCE5A7FB]    Script Date: 04.08.2021 9:42:57 ******/
ALTER TABLE [dbo].[Genre] ADD UNIQUE NONCLUSTERED 
(
	[GenreName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Review] ADD  CONSTRAINT [DF__Review__Rate__38996AB5]  DEFAULT ((5)) FOR [Rate]
GO
ALTER TABLE [dbo].[Review] ADD  CONSTRAINT [DF_Review_LastUpdate]  DEFAULT (getutcdate()) FOR [LastUpdate]
GO
ALTER TABLE [dbo].[Actor]  WITH CHECK ADD  CONSTRAINT [FK__Actor__ActorId__2D27B809] FOREIGN KEY([ActorId])
REFERENCES [dbo].[Person] ([PersonId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Actor] CHECK CONSTRAINT [FK__Actor__ActorId__2D27B809]
GO
ALTER TABLE [dbo].[MovieGenres]  WITH CHECK ADD  CONSTRAINT [FK__MovieGenr__Genre__3E52440B] FOREIGN KEY([GenreId])
REFERENCES [dbo].[Genre] ([GenreId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MovieGenres] CHECK CONSTRAINT [FK__MovieGenr__Genre__3E52440B]
GO
ALTER TABLE [dbo].[MovieGenres]  WITH CHECK ADD  CONSTRAINT [FK__MovieGenr__Movie__3F466844] FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movie] ([MovieId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MovieGenres] CHECK CONSTRAINT [FK__MovieGenr__Movie__3F466844]
GO
ALTER TABLE [dbo].[MoviesActors]  WITH CHECK ADD  CONSTRAINT [FK__MoviesAct__Actor__4222D4EF] FOREIGN KEY([ActorId])
REFERENCES [dbo].[Actor] ([ActorId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MoviesActors] CHECK CONSTRAINT [FK__MoviesAct__Actor__4222D4EF]
GO
ALTER TABLE [dbo].[MoviesActors]  WITH CHECK ADD  CONSTRAINT [FK__MoviesAct__Movie__4316F928] FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movie] ([MovieId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MoviesActors] CHECK CONSTRAINT [FK__MoviesAct__Movie__4316F928]
GO
ALTER TABLE [dbo].[Producer]  WITH CHECK ADD  CONSTRAINT [FK_Producer_Person] FOREIGN KEY([ProducerId])
REFERENCES [dbo].[Person] ([PersonId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Producer] CHECK CONSTRAINT [FK_Producer_Person]
GO
ALTER TABLE [dbo].[RefreshToken]  WITH CHECK ADD  CONSTRAINT [FK_RefreshToken_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RefreshToken] CHECK CONSTRAINT [FK_RefreshToken_User]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK__Review__MovieId__3A81B327] FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movie] ([MovieId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK__Review__MovieId__3A81B327]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK__Review__Reviewer__3B75D760] FOREIGN KEY([ReviewerId])
REFERENCES [dbo].[Reviewer] ([ReviewerId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK__Review__Reviewer__3B75D760]
GO
ALTER TABLE [dbo].[Reviewer]  WITH CHECK ADD  CONSTRAINT [FK__Reviewer__Review__34C8D9D1] FOREIGN KEY([ReviewerId])
REFERENCES [dbo].[Person] ([PersonId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Reviewer] CHECK CONSTRAINT [FK__Reviewer__Review__34C8D9D1]
GO
ALTER TABLE [dbo].[ReviewerWatchHistory]  WITH CHECK ADD  CONSTRAINT [FK__ReviewerW__Movie__44FF419A] FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movie] ([MovieId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ReviewerWatchHistory] CHECK CONSTRAINT [FK__ReviewerW__Movie__44FF419A]
GO
ALTER TABLE [dbo].[ReviewerWatchHistory]  WITH CHECK ADD  CONSTRAINT [FK__ReviewerW__Revie__45F365D3] FOREIGN KEY([ReviewerId])
REFERENCES [dbo].[Reviewer] ([ReviewerId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ReviewerWatchHistory] CHECK CONSTRAINT [FK__ReviewerW__Revie__45F365D3]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Person] FOREIGN KEY([UserId])
REFERENCES [dbo].[Person] ([PersonId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Person]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_User]
GO
ALTER TABLE [dbo].[Actor]  WITH CHECK ADD CHECK  (([Age]>=(0) AND [Age]<=(200)))
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [CK__Review__Rate__398D8EEE] CHECK  (([Rate]>=(1) AND [Rate]<=(10)))
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [CK__Review__Rate__398D8EEE]
GO
USE [master]
GO
ALTER DATABASE [MoviesDB] SET  READ_WRITE 
GO
