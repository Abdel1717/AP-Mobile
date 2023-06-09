USE [master]
GO
/****** Object:  Database [Ap3]    Script Date: 5/17/2023 1:06:44 PM ******/
CREATE DATABASE [Ap3]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Ap3', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Ap3.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'Ap3_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Ap3_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Ap3] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Ap3].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Ap3] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Ap3] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Ap3] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Ap3] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Ap3] SET ARITHABORT OFF 
GO
ALTER DATABASE [Ap3] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Ap3] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Ap3] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Ap3] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Ap3] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Ap3] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Ap3] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Ap3] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Ap3] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Ap3] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Ap3] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Ap3] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Ap3] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Ap3] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Ap3] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Ap3] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Ap3] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Ap3] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Ap3] SET  MULTI_USER 
GO
ALTER DATABASE [Ap3] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Ap3] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Ap3] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Ap3] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Ap3] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Ap3] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Ap3', N'ON'
GO
ALTER DATABASE [Ap3] SET QUERY_STORE = OFF
GO
USE [Ap3]
GO
/****** Object:  Table [dbo].[Adherent_]    Script Date: 5/17/2023 1:06:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Adherent_](
	[idAdherent] [int] IDENTITY(1,1) NOT NULL,
	[nomAdherent] [varchar](50) NULL,
	[prenomAdherent] [varchar](50) NULL,
	[Age] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[identifiant] [varchar](50) NULL,
	[mot_de_passe] [varchar](max) NULL,
	[idTarif] [int] NULL,
	[dateAdhesion] [date] NULL,
	[nb_evenement] [int] NULL,
	[type] [varchar](50) NOT NULL,
 CONSTRAINT [PK__Adherent__7FD6B6C3F42CC603] PRIMARY KEY CLUSTERED 
(
	[idAdherent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CalendrierEntrainement]    Script Date: 5/17/2023 1:06:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CalendrierEntrainement](
	[idCalendrier] [int] IDENTITY(1,1) NOT NULL,
	[dateCalendrier] [date] NULL,
	[heureCalendrier] [time](7) NULL,
	[idCategorie] [int] NOT NULL,
	[seance] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[idCalendrier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categorie]    Script Date: 5/17/2023 1:06:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorie](
	[idCategorie] [int] IDENTITY(1,1) NOT NULL,
	[nomCategorie] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[idCategorie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EntrainementsJoueurs]    Script Date: 5/17/2023 1:06:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EntrainementsJoueurs](
	[idCalendrier] [int] NOT NULL,
	[idAdherent] [int] NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_EntrainementsJoueurs] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Entraineur]    Script Date: 5/17/2023 1:06:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entraineur](
	[idAdherent] [int] NOT NULL,
	[formation] [varchar](50) NULL,
	[tauxHorraire] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[idAdherent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Evenement_]    Script Date: 5/17/2023 1:06:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Evenement_](
	[idEvenement_] [int] IDENTITY(1,1) NOT NULL,
	[nomEvenement] [varchar](50) NULL,
	[dateEvenement] [date] NULL,
	[resultat] [varchar](50) NULL,
	[idAdherent] [int] NOT NULL,
	[idCategorie] [int] NOT NULL,
	[idLieu] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idEvenement_] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HistoAdherent]    Script Date: 5/17/2023 1:06:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistoAdherent](
	[idHisto] [int] IDENTITY(1,1) NOT NULL,
	[dateHisto] [date] NULL,
	[nom] [varchar](50) NULL,
	[prenom] [varchar](50) NULL,
	[Age] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[identifiant] [varchar](50) NULL,
	[mdp] [varchar](255) NULL,
	[dateAdhesion] [date] NULL,
	[nb_evenemnt] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Joueur]    Script Date: 5/17/2023 1:06:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Joueur](
	[idAdherent] [int] NOT NULL,
	[numero] [varchar](50) NULL,
	[poste] [varchar](50) NULL,
	[idCategorie] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idAdherent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lieu]    Script Date: 5/17/2023 1:06:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lieu](
	[idLieu] [int] IDENTITY(1,1) NOT NULL,
	[nomLieu] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[idLieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrdreDuJour]    Script Date: 5/17/2023 1:06:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdreDuJour](
	[idRéunion] [int] NOT NULL,
	[idOrdre] [int] NOT NULL,
	[nomOrdre] [varchar](50) NULL,
 CONSTRAINT [PK__OrdreDuJ__3F57F7CDA5EDCD56] PRIMARY KEY CLUSTERED 
(
	[idRéunion] ASC,
	[idOrdre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Organiser]    Script Date: 5/17/2023 1:06:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Organiser](
	[idCalendrier] [int] NOT NULL,
	[idAdherent] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idCalendrier] ASC,
	[idAdherent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Participer]    Script Date: 5/17/2023 1:06:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Participer](
	[idAdherent] [int] NOT NULL,
	[idCalendrier] [int] NOT NULL,
	[travailRealisé] [varchar](50) NULL,
	[absence] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[idAdherent] ASC,
	[idCalendrier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Plannifier]    Script Date: 5/17/2023 1:06:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Plannifier](
	[idAdherent] [int] NOT NULL,
	[idRéunion] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idAdherent] ASC,
	[idRéunion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Remplace]    Script Date: 5/17/2023 1:06:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Remplace](
	[idAdherent] [int] NOT NULL,
	[idAdherent_1] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idAdherent] ASC,
	[idAdherent_1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reserver]    Script Date: 5/17/2023 1:06:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reserver](
	[idAdherent] [int] NOT NULL,
	[idEvenement_] [int] NOT NULL,
	[dateReservation] [date] NULL,
	[placeReservation] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idAdherent] ASC,
	[idEvenement_] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Réunions]    Script Date: 5/17/2023 1:06:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Réunions](
	[idRéunion] [int] IDENTITY(1,1) NOT NULL,
	[objet] [varchar](50) NULL,
	[date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[idRéunion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tarifs]    Script Date: 5/17/2023 1:06:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tarifs](
	[idTarif] [int] IDENTITY(1,1) NOT NULL,
	[nomTarif] [varchar](50) NULL,
	[prixTarif] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idTarif] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Adherent_] ON 

INSERT [dbo].[Adherent_] ([idAdherent], [nomAdherent], [prenomAdherent], [Age], [email], [identifiant], [mot_de_passe], [idTarif], [dateAdhesion], [nb_evenement], [type]) VALUES (8, N'melio', N'das', N'10', N'hehehe@gmail.com', N'lelele', N'disdqOIDQ', 1, CAST(N'2002-11-21' AS Date), 2, N'adherent')
INSERT [dbo].[Adherent_] ([idAdherent], [nomAdherent], [prenomAdherent], [Age], [email], [identifiant], [mot_de_passe], [idTarif], [dateAdhesion], [nb_evenement], [type]) VALUES (9, N'wafin', N'haha', N'45', N'DSDD@JOUER.COM', N'lalala', N'kikikuo', 1, CAST(N'2022-01-01' AS Date), NULL, N'adherent')
INSERT [dbo].[Adherent_] ([idAdherent], [nomAdherent], [prenomAdherent], [Age], [email], [identifiant], [mot_de_passe], [idTarif], [dateAdhesion], [nb_evenement], [type]) VALUES (13, N'bebe', N'heheheh', N'78', N'lespoules@hotwheels.com', N'lililili', N'kekeke', 2, CAST(N'2022-08-21' AS Date), NULL, N'adherent')
INSERT [dbo].[Adherent_] ([idAdherent], [nomAdherent], [prenomAdherent], [Age], [email], [identifiant], [mot_de_passe], [idTarif], [dateAdhesion], [nb_evenement], [type]) VALUES (17, N'hbibz', N'laaaaaaaaa', N'22', N'lefruit@jo.com', N'ojpjojp', N'kizkizkiz', 2, CAST(N'2021-11-20' AS Date), NULL, N'adherent')
INSERT [dbo].[Adherent_] ([idAdherent], [nomAdherent], [prenomAdherent], [Age], [email], [identifiant], [mot_de_passe], [idTarif], [dateAdhesion], [nb_evenement], [type]) VALUES (20, N'MEHDI ALLALI', N'Mehdiallali665@gmail.com', N'2023-01-12', N'mehdiallali665@gmail.com', N'mmehdi allali', N'1ÜÐ	]Sé¿æÍ¿€Ì¹!ÂR
ë¦Æ”IÑÒ½ìQj¼»ßV ÂÝBê!1¯§Â$ÏG~E¤^»…Hõê˜\ï,', NULL, NULL, NULL, N'adherent')
INSERT [dbo].[Adherent_] ([idAdherent], [nomAdherent], [prenomAdherent], [Age], [email], [identifiant], [mot_de_passe], [idTarif], [dateAdhesion], [nb_evenement], [type]) VALUES (21, N'Mehdi ALLALI', N'mehdiallali665@gmail.com', N'2023-01-13', N'mehdiallali@gmail.com', NULL, N'$2y$10$nnn1TIOhcLvQNNo6tNjtP.W3NneWKu876SiGTsKJzdAv6b7gw9duW', NULL, NULL, NULL, N'adherent')
INSERT [dbo].[Adherent_] ([idAdherent], [nomAdherent], [prenomAdherent], [Age], [email], [identifiant], [mot_de_passe], [idTarif], [dateAdhesion], [nb_evenement], [type]) VALUES (22, N'Mehdi ALLALI', N'mehdiallali665@gmail.com', N'2023-01-05', N'mehdiallali66@gmail.com', NULL, N'$2y$10$gcGDEcK49S1x5Q5lp2WtS.SkdWvHJeS0mVNS7Gh3DPbquU1KBuGZ6', NULL, NULL, NULL, N'adherent')
INSERT [dbo].[Adherent_] ([idAdherent], [nomAdherent], [prenomAdherent], [Age], [email], [identifiant], [mot_de_passe], [idTarif], [dateAdhesion], [nb_evenement], [type]) VALUES (23, N'Mo ALLALI', N'mehdiallali564@gmail.com', N'2023-01-06', N'mehdiallali564@gmail.com', NULL, N'$2y$10$OLgoNnJX0FjnioX80HCCJOgRIbTmmJWwBJdjwSanGzRmJw2hUQjRG', NULL, NULL, NULL, N'adherent')
INSERT [dbo].[Adherent_] ([idAdherent], [nomAdherent], [prenomAdherent], [Age], [email], [identifiant], [mot_de_passe], [idTarif], [dateAdhesion], [nb_evenement], [type]) VALUES (24, N'Mehdi ALLALI', N'mehdiallali665@gmail.com', N'2023-01-06', N'mehd@gmail.com', NULL, N'$2y$10$HEAn27n0JHDyAeBScv6p9eu6UdUYGnVws89p/rWbt/QKxfTys/sFe', NULL, NULL, NULL, N'adherent')
INSERT [dbo].[Adherent_] ([idAdherent], [nomAdherent], [prenomAdherent], [Age], [email], [identifiant], [mot_de_passe], [idTarif], [dateAdhesion], [nb_evenement], [type]) VALUES (25, N'Mehdi ALLALI', N'mehdiallali665@gmail.com', N'2023-01-12', N'mehdial@gmail.com', NULL, N'$2y$10$te5idQftwQzqiNg5iYF5OuyGaXjZmgblBeoVaVwEnf9xH3YJdg7Rm', NULL, NULL, 2, N'adherent')
INSERT [dbo].[Adherent_] ([idAdherent], [nomAdherent], [prenomAdherent], [Age], [email], [identifiant], [mot_de_passe], [idTarif], [dateAdhesion], [nb_evenement], [type]) VALUES (1025, N'Mehdi ALLALI', N'mehdiallali665@gmail.com', N'2003-05-22', N'mehdiallali65@gmail.com', NULL, N'$2y$10$0Wk/dWsucBX0lxjo8WXyVeJs6DlxA7Gc7s.Fy1UjhpfE8zcPtJaWa', NULL, NULL, 0, N'adherent')
INSERT [dbo].[Adherent_] ([idAdherent], [nomAdherent], [prenomAdherent], [Age], [email], [identifiant], [mot_de_passe], [idTarif], [dateAdhesion], [nb_evenement], [type]) VALUES (2025, N'aaaaaaaaa', N'aaaa5@gmail.com', N'2002-01-01', N'aaaa665@gmail.com', NULL, N'$2y$10$RpbaWDEkgLxKcoGu9E86zevbE9Su7xbV4GfgyUQuPhgcoNti3f2oC', NULL, NULL, 0, N'adherent')
INSERT [dbo].[Adherent_] ([idAdherent], [nomAdherent], [prenomAdherent], [Age], [email], [identifiant], [mot_de_passe], [idTarif], [dateAdhesion], [nb_evenement], [type]) VALUES (2026, N'Mohammed ALLALI', N'meh@gmail.com', N'2002-01-01', N'meh@gmail.com', NULL, N'$2y$10$9UtHART.Zxk4cslFqvSmouias7Agq5N5f9OzVXzV5U6ZaGPwy3yse', NULL, NULL, 0, N'adherent')
INSERT [dbo].[Adherent_] ([idAdherent], [nomAdherent], [prenomAdherent], [Age], [email], [identifiant], [mot_de_passe], [idTarif], [dateAdhesion], [nb_evenement], [type]) VALUES (3025, N'paul', N'arthur', N'2023-05-11', N'paul@gmail.com', NULL, N'$2y$10$eR7l3wLaSp2uIqFyg.zo2.7DoCe/XrO0QT.ZUMSruuK4McuANbvgu', NULL, NULL, 0, N'adherent')
INSERT [dbo].[Adherent_] ([idAdherent], [nomAdherent], [prenomAdherent], [Age], [email], [identifiant], [mot_de_passe], [idTarif], [dateAdhesion], [nb_evenement], [type]) VALUES (3026, N'yazid', N'yaya', N'2023-05-13', N'yaya@gg.com', NULL, N'$2y$10$Lt/jr0S1N02p5CJ84/parugd3rFs3wxykBCqx7ITEXmx/319QcSbG', NULL, NULL, 0, N'joueur')
SET IDENTITY_INSERT [dbo].[Adherent_] OFF
GO
SET IDENTITY_INSERT [dbo].[CalendrierEntrainement] ON 

INSERT [dbo].[CalendrierEntrainement] ([idCalendrier], [dateCalendrier], [heureCalendrier], [idCategorie], [seance]) VALUES (2, CAST(N'1976-10-10' AS Date), CAST(N'11:15:00' AS Time), 3, N'cardio salut')
INSERT [dbo].[CalendrierEntrainement] ([idCalendrier], [dateCalendrier], [heureCalendrier], [idCategorie], [seance]) VALUES (5, CAST(N'2002-10-10' AS Date), CAST(N'12:59:00' AS Time), 4, N'Centres, Aillier vers kle feu')
INSERT [dbo].[CalendrierEntrainement] ([idCalendrier], [dateCalendrier], [heureCalendrier], [idCategorie], [seance]) VALUES (8, CAST(N'2022-11-02' AS Date), CAST(N'19:00:00' AS Time), 2, N'detente Runing back')
INSERT [dbo].[CalendrierEntrainement] ([idCalendrier], [dateCalendrier], [heureCalendrier], [idCategorie], [seance]) VALUES (9, CAST(N'2022-11-05' AS Date), CAST(N'17:00:00' AS Time), 2, N'cardio')
INSERT [dbo].[CalendrierEntrainement] ([idCalendrier], [dateCalendrier], [heureCalendrier], [idCategorie], [seance]) VALUES (14, CAST(N'2022-12-10' AS Date), CAST(N'10:02:00' AS Time), 1, N'ne me saoule plus')
INSERT [dbo].[CalendrierEntrainement] ([idCalendrier], [dateCalendrier], [heureCalendrier], [idCategorie], [seance]) VALUES (15, CAST(N'2366-01-25' AS Date), CAST(N'19:00:00' AS Time), 2, N'tu te tais')
INSERT [dbo].[CalendrierEntrainement] ([idCalendrier], [dateCalendrier], [heureCalendrier], [idCategorie], [seance]) VALUES (1015, CAST(N'2023-05-14' AS Date), CAST(N'22:55:00' AS Time), 4, N'9alouch')
SET IDENTITY_INSERT [dbo].[CalendrierEntrainement] OFF
GO
SET IDENTITY_INSERT [dbo].[Categorie] ON 

INSERT [dbo].[Categorie] ([idCategorie], [nomCategorie]) VALUES (1, N'junior')
INSERT [dbo].[Categorie] ([idCategorie], [nomCategorie]) VALUES (2, N'Benjamins')
INSERT [dbo].[Categorie] ([idCategorie], [nomCategorie]) VALUES (3, N'U21')
INSERT [dbo].[Categorie] ([idCategorie], [nomCategorie]) VALUES (4, N'Seniors')
SET IDENTITY_INSERT [dbo].[Categorie] OFF
GO
SET IDENTITY_INSERT [dbo].[EntrainementsJoueurs] ON 

INSERT [dbo].[EntrainementsJoueurs] ([idCalendrier], [idAdherent], [id]) VALUES (2, 1025, 2)
INSERT [dbo].[EntrainementsJoueurs] ([idCalendrier], [idAdherent], [id]) VALUES (5, 2025, 4)
INSERT [dbo].[EntrainementsJoueurs] ([idCalendrier], [idAdherent], [id]) VALUES (15, 3026, 1006)
INSERT [dbo].[EntrainementsJoueurs] ([idCalendrier], [idAdherent], [id]) VALUES (14, 3026, 1007)
INSERT [dbo].[EntrainementsJoueurs] ([idCalendrier], [idAdherent], [id]) VALUES (9, 3026, 1008)
SET IDENTITY_INSERT [dbo].[EntrainementsJoueurs] OFF
GO
INSERT [dbo].[Entraineur] ([idAdherent], [formation], [tauxHorraire]) VALUES (8, N'staps', N'10')
INSERT [dbo].[Entraineur] ([idAdherent], [formation], [tauxHorraire]) VALUES (21, N'staps', N'8')
INSERT [dbo].[Entraineur] ([idAdherent], [formation], [tauxHorraire]) VALUES (25, N'info', N'16')
GO
SET IDENTITY_INSERT [dbo].[Evenement_] ON 

INSERT [dbo].[Evenement_] ([idEvenement_], [nomEvenement], [dateEvenement], [resultat], [idAdherent], [idCategorie], [idLieu]) VALUES (4, N'match', CAST(N'2002-10-10' AS Date), N'1', 8, 1, 1)
INSERT [dbo].[Evenement_] ([idEvenement_], [nomEvenement], [dateEvenement], [resultat], [idAdherent], [idCategorie], [idLieu]) VALUES (9, N'tournoi', CAST(N'2022-11-11' AS Date), N'1', 8, 2, 2)
SET IDENTITY_INSERT [dbo].[Evenement_] OFF
GO
SET IDENTITY_INSERT [dbo].[HistoAdherent] ON 

INSERT [dbo].[HistoAdherent] ([idHisto], [dateHisto], [nom], [prenom], [Age], [email], [identifiant], [mdp], [dateAdhesion], [nb_evenemnt]) VALUES (1, CAST(N'2023-01-05' AS Date), N'bebewww', N'hihihihi', N'19', N'fromages@espacefoot.com', N'lululu', N'kukuku', CAST(N'2022-11-25' AS Date), NULL)
INSERT [dbo].[HistoAdherent] ([idHisto], [dateHisto], [nom], [prenom], [Age], [email], [identifiant], [mdp], [dateAdhesion], [nb_evenemnt]) VALUES (2, CAST(N'2023-01-05' AS Date), N'KHALTY', N'Aziza', N'21', N'dazd@ji.com', N'akhalty', N'akh', CAST(N'2021-11-21' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[HistoAdherent] OFF
GO
INSERT [dbo].[Joueur] ([idAdherent], [numero], [poste], [idCategorie]) VALUES (8, N'7', N'AD', 3)
INSERT [dbo].[Joueur] ([idAdherent], [numero], [poste], [idCategorie]) VALUES (20, N'10', N'remplissage des gourdes', 1)
INSERT [dbo].[Joueur] ([idAdherent], [numero], [poste], [idCategorie]) VALUES (1025, N'12', N'sur le banc', 4)
INSERT [dbo].[Joueur] ([idAdherent], [numero], [poste], [idCategorie]) VALUES (2025, N'11', N'fais pas le fou', 2)
INSERT [dbo].[Joueur] ([idAdherent], [numero], [poste], [idCategorie]) VALUES (2026, N'25', N'tu me pourrie la vie', 4)
INSERT [dbo].[Joueur] ([idAdherent], [numero], [poste], [idCategorie]) VALUES (3025, N'9', N'tes un bon ', 3)
INSERT [dbo].[Joueur] ([idAdherent], [numero], [poste], [idCategorie]) VALUES (3026, N'81', N'Testeur', 1)
GO
SET IDENTITY_INSERT [dbo].[Lieu] ON 

INSERT [dbo].[Lieu] ([idLieu], [nomLieu]) VALUES (1, N'britania')
INSERT [dbo].[Lieu] ([idLieu], [nomLieu]) VALUES (2, N'bzbz')
SET IDENTITY_INSERT [dbo].[Lieu] OFF
GO
INSERT [dbo].[OrdreDuJour] ([idRéunion], [idOrdre], [nomOrdre]) VALUES (1, 1, N'Affectation des entraîneurs')
INSERT [dbo].[OrdreDuJour] ([idRéunion], [idOrdre], [nomOrdre]) VALUES (1, 2, N'Planning des entraînements')
INSERT [dbo].[OrdreDuJour] ([idRéunion], [idOrdre], [nomOrdre]) VALUES (1, 3, N'Affectation des salles')
INSERT [dbo].[OrdreDuJour] ([idRéunion], [idOrdre], [nomOrdre]) VALUES (2, 1, N'Bilan des inscriptions')
INSERT [dbo].[OrdreDuJour] ([idRéunion], [idOrdre], [nomOrdre]) VALUES (2, 2, N'Répartition des groupes')
GO
INSERT [dbo].[Organiser] ([idCalendrier], [idAdherent]) VALUES (5, 8)
INSERT [dbo].[Organiser] ([idCalendrier], [idAdherent]) VALUES (5, 25)
INSERT [dbo].[Organiser] ([idCalendrier], [idAdherent]) VALUES (8, 8)
INSERT [dbo].[Organiser] ([idCalendrier], [idAdherent]) VALUES (8, 25)
GO
INSERT [dbo].[Participer] ([idAdherent], [idCalendrier], [travailRealisé], [absence]) VALUES (8, 2, N'néttoyage', 0)
INSERT [dbo].[Participer] ([idAdherent], [idCalendrier], [travailRealisé], [absence]) VALUES (9, 2, N'running', 1)
INSERT [dbo].[Participer] ([idAdherent], [idCalendrier], [travailRealisé], [absence]) VALUES (9, 5, N'jogging', 0)
INSERT [dbo].[Participer] ([idAdherent], [idCalendrier], [travailRealisé], [absence]) VALUES (1025, 5, N'foot', 0)
GO
INSERT [dbo].[Plannifier] ([idAdherent], [idRéunion]) VALUES (8, 1)
GO
INSERT [dbo].[Remplace] ([idAdherent], [idAdherent_1]) VALUES (8, 8)
GO
INSERT [dbo].[Reserver] ([idAdherent], [idEvenement_], [dateReservation], [placeReservation]) VALUES (8, 4, CAST(N'2022-10-06' AS Date), 10)
GO
SET IDENTITY_INSERT [dbo].[Réunions] ON 

INSERT [dbo].[Réunions] ([idRéunion], [objet], [date]) VALUES (1, N'entrainement', CAST(N'2002-01-01' AS Date))
INSERT [dbo].[Réunions] ([idRéunion], [objet], [date]) VALUES (2, N'entraineurs', CAST(N'2021-05-17' AS Date))
INSERT [dbo].[Réunions] ([idRéunion], [objet], [date]) VALUES (3, N'salle', CAST(N'2054-09-11' AS Date))
INSERT [dbo].[Réunions] ([idRéunion], [objet], [date]) VALUES (4, N'joueurs', CAST(N'2022-05-12' AS Date))
SET IDENTITY_INSERT [dbo].[Réunions] OFF
GO
SET IDENTITY_INSERT [dbo].[Tarifs] ON 

INSERT [dbo].[Tarifs] ([idTarif], [nomTarif], [prixTarif]) VALUES (1, N'tarif1', 10)
INSERT [dbo].[Tarifs] ([idTarif], [nomTarif], [prixTarif]) VALUES (2, N'tarif2', 15)
INSERT [dbo].[Tarifs] ([idTarif], [nomTarif], [prixTarif]) VALUES (3, N'tarif3', 12)
INSERT [dbo].[Tarifs] ([idTarif], [nomTarif], [prixTarif]) VALUES (4, N'tarif4', 14)
SET IDENTITY_INSERT [dbo].[Tarifs] OFF
GO
ALTER TABLE [dbo].[Adherent_] ADD  CONSTRAINT [DF_Adherent__nb_evenement]  DEFAULT ((0)) FOR [nb_evenement]
GO
ALTER TABLE [dbo].[Adherent_] ADD  CONSTRAINT [DF_Adherent__type]  DEFAULT ('adherent') FOR [type]
GO
ALTER TABLE [dbo].[Adherent_]  WITH CHECK ADD  CONSTRAINT [FK__Adherent___idTar__31EC6D26] FOREIGN KEY([idTarif])
REFERENCES [dbo].[Tarifs] ([idTarif])
GO
ALTER TABLE [dbo].[Adherent_] CHECK CONSTRAINT [FK__Adherent___idTar__31EC6D26]
GO
ALTER TABLE [dbo].[CalendrierEntrainement]  WITH CHECK ADD FOREIGN KEY([idCategorie])
REFERENCES [dbo].[Categorie] ([idCategorie])
GO
ALTER TABLE [dbo].[EntrainementsJoueurs]  WITH CHECK ADD  CONSTRAINT [FK_EntrainementsJoueurs_CalendrierEntrainement] FOREIGN KEY([idCalendrier])
REFERENCES [dbo].[CalendrierEntrainement] ([idCalendrier])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EntrainementsJoueurs] CHECK CONSTRAINT [FK_EntrainementsJoueurs_CalendrierEntrainement]
GO
ALTER TABLE [dbo].[EntrainementsJoueurs]  WITH CHECK ADD  CONSTRAINT [FK_EntrainementsJoueurs_Joueur] FOREIGN KEY([idAdherent])
REFERENCES [dbo].[Joueur] ([idAdherent])
GO
ALTER TABLE [dbo].[EntrainementsJoueurs] CHECK CONSTRAINT [FK_EntrainementsJoueurs_Joueur]
GO
ALTER TABLE [dbo].[Entraineur]  WITH CHECK ADD  CONSTRAINT [FK__Entraineu__idAdh__38996AB5] FOREIGN KEY([idAdherent])
REFERENCES [dbo].[Adherent_] ([idAdherent])
GO
ALTER TABLE [dbo].[Entraineur] CHECK CONSTRAINT [FK__Entraineu__idAdh__38996AB5]
GO
ALTER TABLE [dbo].[Evenement_]  WITH CHECK ADD FOREIGN KEY([idAdherent])
REFERENCES [dbo].[Entraineur] ([idAdherent])
GO
ALTER TABLE [dbo].[Evenement_]  WITH CHECK ADD FOREIGN KEY([idCategorie])
REFERENCES [dbo].[Categorie] ([idCategorie])
GO
ALTER TABLE [dbo].[Evenement_]  WITH CHECK ADD FOREIGN KEY([idLieu])
REFERENCES [dbo].[Lieu] ([idLieu])
GO
ALTER TABLE [dbo].[Joueur]  WITH CHECK ADD  CONSTRAINT [FK__Joueur__idAdhere__34C8D9D1] FOREIGN KEY([idAdherent])
REFERENCES [dbo].[Adherent_] ([idAdherent])
GO
ALTER TABLE [dbo].[Joueur] CHECK CONSTRAINT [FK__Joueur__idAdhere__34C8D9D1]
GO
ALTER TABLE [dbo].[Joueur]  WITH CHECK ADD FOREIGN KEY([idCategorie])
REFERENCES [dbo].[Categorie] ([idCategorie])
GO
ALTER TABLE [dbo].[OrdreDuJour]  WITH CHECK ADD  CONSTRAINT [FK__OrdreDuJo__idRéu__2F10007B] FOREIGN KEY([idRéunion])
REFERENCES [dbo].[Réunions] ([idRéunion])
GO
ALTER TABLE [dbo].[OrdreDuJour] CHECK CONSTRAINT [FK__OrdreDuJo__idRéu__2F10007B]
GO
ALTER TABLE [dbo].[Organiser]  WITH CHECK ADD FOREIGN KEY([idAdherent])
REFERENCES [dbo].[Entraineur] ([idAdherent])
GO
ALTER TABLE [dbo].[Organiser]  WITH CHECK ADD FOREIGN KEY([idCalendrier])
REFERENCES [dbo].[CalendrierEntrainement] ([idCalendrier])
GO
ALTER TABLE [dbo].[Participer]  WITH CHECK ADD  CONSTRAINT [FK__Participe__idAdh__403A8C7D] FOREIGN KEY([idAdherent])
REFERENCES [dbo].[Adherent_] ([idAdherent])
GO
ALTER TABLE [dbo].[Participer] CHECK CONSTRAINT [FK__Participe__idAdh__403A8C7D]
GO
ALTER TABLE [dbo].[Participer]  WITH CHECK ADD  CONSTRAINT [FK__Participe__idCal__412EB0B6] FOREIGN KEY([idCalendrier])
REFERENCES [dbo].[CalendrierEntrainement] ([idCalendrier])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Participer] CHECK CONSTRAINT [FK__Participe__idCal__412EB0B6]
GO
ALTER TABLE [dbo].[Plannifier]  WITH CHECK ADD FOREIGN KEY([idAdherent])
REFERENCES [dbo].[Entraineur] ([idAdherent])
GO
ALTER TABLE [dbo].[Plannifier]  WITH CHECK ADD FOREIGN KEY([idRéunion])
REFERENCES [dbo].[Réunions] ([idRéunion])
GO
ALTER TABLE [dbo].[Remplace]  WITH CHECK ADD FOREIGN KEY([idAdherent])
REFERENCES [dbo].[Entraineur] ([idAdherent])
GO
ALTER TABLE [dbo].[Remplace]  WITH CHECK ADD FOREIGN KEY([idAdherent_1])
REFERENCES [dbo].[Entraineur] ([idAdherent])
GO
ALTER TABLE [dbo].[Reserver]  WITH CHECK ADD  CONSTRAINT [FK__Reserver__idAdhe__440B1D61] FOREIGN KEY([idAdherent])
REFERENCES [dbo].[Adherent_] ([idAdherent])
GO
ALTER TABLE [dbo].[Reserver] CHECK CONSTRAINT [FK__Reserver__idAdhe__440B1D61]
GO
ALTER TABLE [dbo].[Reserver]  WITH CHECK ADD  CONSTRAINT [FK__Reserver__idEven__44FF419A] FOREIGN KEY([idEvenement_])
REFERENCES [dbo].[Evenement_] ([idEvenement_])
GO
ALTER TABLE [dbo].[Reserver] CHECK CONSTRAINT [FK__Reserver__idEven__44FF419A]
GO
/****** Object:  StoredProcedure [dbo].[AdhesionRenouvele]    Script Date: 5/17/2023 1:06:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[AdhesionRenouvele] 
AS
BEGIN
    -- Insert statements for procedure here
	SELECT dateAdhesion
	FROM Adherent_ 
	WHERE YEAR(dateAdhesion) = '2022'; 
END
GO
/****** Object:  StoredProcedure [dbo].[EvenementAdherent]    Script Date: 5/17/2023 1:06:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[EvenementAdherent] @nomAdh varchar(50)
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SELECT nomAdherent, prenomAdherent, absence, travailRealisé, C.idCalendrier
	FROM Adherent_ A, Participer P, CalendrierEntrainement C
	WHERE A.idAdherent = P.idAdherent 
	AND C.idCalendrier = p.idCalendrier 
	AND nomAdherent = @nomAdh;

    -- Insert statements for procedure here
	
END
GO
/****** Object:  StoredProcedure [dbo].[HeureEntrainement]    Script Date: 5/17/2023 1:06:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[HeureEntrainement]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	

    -- Insert statements for procedure here
	SELECT nomAdherent, prenomAdherent, count(*)*2
FROM Adherent_ A, Participer P, CalendrierEntrainement C
WHERE A.idAdherent = P.idAdherent and C.idCalendrier = p.idCalendrier
group by nomAdherent, prenomAdherent
END


       
    
GO
/****** Object:  StoredProcedure [dbo].[NbEntrainement]    Script Date: 5/17/2023 1:06:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[NbEntrainement]	@nomAdh varchar(50), @dateDeb date, @dateFin date
AS
BEGIN
	select nomAdherent, count(C.idCalendrier) as Entrainements
	from Adherent_ A, Participer P, CalendrierEntrainement C
	WHERE A.idAdherent = P.idAdherent and C.idCalendrier = p.idCalendrier
	and C.dateCalendrier between @dateDeb and @dateFin
	and nomAdherent = @nomAdh
	group by nomAdherent
END
GO
/****** Object:  StoredProcedure [dbo].[OrdreReunion]    Script Date: 5/17/2023 1:06:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[OrdreReunion] @dateReu date 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	

    -- Insert statements for procedure here
	select nomOrdre, objet, R.date
From OrdreDuJour O, Réunions R
Where R.idRéunion = O.idRéunion and R.date = @dateReu
END
GO
USE [master]
GO
ALTER DATABASE [Ap3] SET  READ_WRITE 
GO
