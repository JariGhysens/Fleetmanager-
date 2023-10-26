USE [master]
GO
/****** Object:  Database [FleetManager]    Script Date: 26/10/2023 14:07:32 ******/
CREATE DATABASE [FleetManager]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FleetManager', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\FleetManager.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FleetManager_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\FleetManager_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [FleetManager] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FleetManager].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FleetManager] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FleetManager] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FleetManager] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FleetManager] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FleetManager] SET ARITHABORT OFF 
GO
ALTER DATABASE [FleetManager] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FleetManager] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FleetManager] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FleetManager] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FleetManager] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FleetManager] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FleetManager] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FleetManager] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FleetManager] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FleetManager] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FleetManager] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FleetManager] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FleetManager] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FleetManager] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FleetManager] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FleetManager] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FleetManager] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FleetManager] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FleetManager] SET  MULTI_USER 
GO
ALTER DATABASE [FleetManager] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FleetManager] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FleetManager] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FleetManager] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FleetManager] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FleetManager] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [FleetManager] SET QUERY_STORE = ON
GO
ALTER DATABASE [FleetManager] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [FleetManager]
GO
/****** Object:  Table [dbo].[Bestuurder]    Script Date: 26/10/2023 14:07:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bestuurder](
	[Id_Bestuurder] [int] IDENTITY(1,1) NOT NULL,
	[Naam] [varchar](255) NULL,
	[Voornaam] [varchar](255) NULL,
	[Straat] [varchar](255) NULL,
	[Huisnummer] [varchar](10) NULL,
	[Stad] [varchar](255) NULL,
	[Postcode] [varchar](10) NULL,
	[Geboortedatum] [date] NULL,
	[Rijksregisternummer] [varchar](12) NULL,
	[Categorie_rijbewijs] [varchar](10) NULL,
 CONSTRAINT [PK_Bestuurder] PRIMARY KEY CLUSTERED 
(
	[Id_Bestuurder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manager]    Script Date: 26/10/2023 14:07:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manager](
	[Id_Bestuurder] [int] NOT NULL,
	[Id_Tankkaart] [int] NULL,
	[Id_Voertuig] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tankkaart]    Script Date: 26/10/2023 14:07:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tankkaart](
	[Id_Tankkaart] [int] IDENTITY(1,1) NOT NULL,
	[Kaartnummer] [varchar](12) NOT NULL,
	[Geldigheidsdatum] [date] NOT NULL,
	[Pincode] [varchar](6) NULL,
	[Brandstoffen] [varchar](255) NOT NULL,
	[Geblokkeerd] [bit] NOT NULL,
 CONSTRAINT [PK_Tankkaart] PRIMARY KEY CLUSTERED 
(
	[Id_Tankkaart] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Voertuig]    Script Date: 26/10/2023 14:07:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Voertuig](
	[Id_Voertuig] [int] IDENTITY(1,1) NOT NULL,
	[Merk] [varchar](255) NULL,
	[Model] [varchar](255) NULL,
	[Chassisnummer] [varchar](255) NULL,
	[Nummerplaat] [varchar](20) NULL,
	[Brandstoftype] [varchar](50) NULL,
	[Type_voertuig] [varchar](50) NULL,
	[Kleur] [varchar](50) NULL,
	[Aantal_deuren] [int] NULL,
 CONSTRAINT [PK_Voertuig] PRIMARY KEY CLUSTERED 
(
	[Id_Voertuig] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Tankkaart] ADD  CONSTRAINT [DF__Tankkaart__Geblo__5070F446]  DEFAULT ((0)) FOR [Geblokkeerd]
GO
ALTER TABLE [dbo].[Manager]  WITH CHECK ADD  CONSTRAINT [FK_Manager_Bestuurder] FOREIGN KEY([Id_Bestuurder])
REFERENCES [dbo].[Bestuurder] ([Id_Bestuurder])
GO
ALTER TABLE [dbo].[Manager] CHECK CONSTRAINT [FK_Manager_Bestuurder]
GO
ALTER TABLE [dbo].[Manager]  WITH CHECK ADD  CONSTRAINT [FK_Manager_Tankkaart] FOREIGN KEY([Id_Tankkaart])
REFERENCES [dbo].[Tankkaart] ([Id_Tankkaart])
GO
ALTER TABLE [dbo].[Manager] CHECK CONSTRAINT [FK_Manager_Tankkaart]
GO
ALTER TABLE [dbo].[Manager]  WITH CHECK ADD  CONSTRAINT [FK_Manager_Voertuig] FOREIGN KEY([Id_Voertuig])
REFERENCES [dbo].[Voertuig] ([Id_Voertuig])
GO
ALTER TABLE [dbo].[Manager] CHECK CONSTRAINT [FK_Manager_Voertuig]
GO
ALTER TABLE [dbo].[Tankkaart]  WITH CHECK ADD  CONSTRAINT [CHK_Pincode_Length] CHECK  ((len([Pincode])>=(4) AND len([Pincode])<=(6)))
GO
ALTER TABLE [dbo].[Tankkaart] CHECK CONSTRAINT [CHK_Pincode_Length]
GO
ALTER TABLE [dbo].[Voertuig]  WITH CHECK ADD  CONSTRAINT [CHK_Aantal_deuren] CHECK  (([Aantal_deuren]>=(3) AND [Aantal_deuren]<=(5)))
GO
ALTER TABLE [dbo].[Voertuig] CHECK CONSTRAINT [CHK_Aantal_deuren]
GO
USE [master]
GO
ALTER DATABASE [FleetManager] SET  READ_WRITE 
GO
