USE [master]
GO
/****** Object:  Database [Fleetmanager]    Script Date: 2/01/2024 15:02:36 ******/
CREATE DATABASE [Fleetmanager]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Fleetmanager', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Fleetmanager.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Fleetmanager_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Fleetmanager_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Fleetmanager] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Fleetmanager].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Fleetmanager] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Fleetmanager] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Fleetmanager] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Fleetmanager] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Fleetmanager] SET ARITHABORT OFF 
GO
ALTER DATABASE [Fleetmanager] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Fleetmanager] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Fleetmanager] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Fleetmanager] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Fleetmanager] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Fleetmanager] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Fleetmanager] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Fleetmanager] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Fleetmanager] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Fleetmanager] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Fleetmanager] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Fleetmanager] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Fleetmanager] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Fleetmanager] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Fleetmanager] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Fleetmanager] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [Fleetmanager] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Fleetmanager] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Fleetmanager] SET  MULTI_USER 
GO
ALTER DATABASE [Fleetmanager] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Fleetmanager] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Fleetmanager] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Fleetmanager] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Fleetmanager] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Fleetmanager] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Fleetmanager] SET QUERY_STORE = ON
GO
ALTER DATABASE [Fleetmanager] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200)
GO
USE [Fleetmanager]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 2/01/2024 15:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Authentication]    Script Date: 2/01/2024 15:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authentication](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Role] [varchar](5) NOT NULL,
 CONSTRAINT [PK_Authentication] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Connection]    Script Date: 2/01/2024 15:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Connection](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdDriver] [int] NOT NULL,
	[IdGasCard] [int] NOT NULL,
	[IdVehicle] [int] NOT NULL,
 CONSTRAINT [PK_Connection] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Driver]    Script Date: 2/01/2024 15:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Driver](
	[IdDriver] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[Street] [varchar](50) NULL,
	[Number] [varchar](10) NULL,
	[City] [varchar](50) NULL,
	[ZipCode] [int] NULL,
	[DayOfBirth] [date] NOT NULL,
	[RegistryNumber] [varchar](11) NOT NULL,
	[CategoryLicense] [varchar](5) NULL,
 CONSTRAINT [PK_Driver] PRIMARY KEY CLUSTERED 
(
	[IdDriver] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GasCard]    Script Date: 2/01/2024 15:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GasCard](
	[IdGasCard] [int] IDENTITY(1,1) NOT NULL,
	[CardNumber] [varchar](12) NOT NULL,
	[ValidationDate] [date] NOT NULL,
	[Pin] [varchar](6) NOT NULL,
	[Fuel] [varchar](25) NOT NULL,
	[BlockedCard] [varchar](5) NOT NULL,
 CONSTRAINT [PK_GasCard] PRIMARY KEY CLUSTERED 
(
	[IdGasCard] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehicle]    Script Date: 2/01/2024 15:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicle](
	[IdVehicle] [int] IDENTITY(1,1) NOT NULL,
	[Brand] [varchar](50) NOT NULL,
	[Model] [varchar](50) NOT NULL,
	[ChassisNumber] [varchar](50) NOT NULL,
	[LicensePlate] [varchar](10) NULL,
	[Fuel] [varchar](25) NOT NULL,
	[VehicleType] [varchar](25) NOT NULL,
	[Color] [varchar](25) NOT NULL,
	[NumberOfDoors] [int] NOT NULL,
 CONSTRAINT [PK_Vehicle] PRIMARY KEY CLUSTERED 
(
	[IdVehicle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_Connection_IdDriver_IdGasCard_IdVehicle]    Script Date: 2/01/2024 15:02:37 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Connection_IdDriver_IdGasCard_IdVehicle] ON [dbo].[Connection]
(
	[IdDriver] ASC,
	[IdGasCard] ASC,
	[IdVehicle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Connection_IdGasCard]    Script Date: 2/01/2024 15:02:37 ******/
CREATE NONCLUSTERED INDEX [IX_Connection_IdGasCard] ON [dbo].[Connection]
(
	[IdGasCard] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Connection_IdVehicle]    Script Date: 2/01/2024 15:02:37 ******/
CREATE NONCLUSTERED INDEX [IX_Connection_IdVehicle] ON [dbo].[Connection]
(
	[IdVehicle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GasCard] ADD  CONSTRAINT [DF__GasCard__Blocked__4F7CD00D]  DEFAULT ((0)) FOR [BlockedCard]
GO
ALTER TABLE [dbo].[Vehicle] ADD  CONSTRAINT [DF__Vehicle__NumberO__52593CB8]  DEFAULT ((0)) FOR [NumberOfDoors]
GO
ALTER TABLE [dbo].[Connection]  WITH CHECK ADD  CONSTRAINT [FK__Connectie__IdBes__1A9EF37A] FOREIGN KEY([IdDriver])
REFERENCES [dbo].[Driver] ([IdDriver])
GO
ALTER TABLE [dbo].[Connection] CHECK CONSTRAINT [FK__Connectie__IdBes__1A9EF37A]
GO
ALTER TABLE [dbo].[Connection]  WITH CHECK ADD  CONSTRAINT [FK__Connectie__IdTan__1B9317B3] FOREIGN KEY([IdGasCard])
REFERENCES [dbo].[GasCard] ([IdGasCard])
GO
ALTER TABLE [dbo].[Connection] CHECK CONSTRAINT [FK__Connectie__IdTan__1B9317B3]
GO
ALTER TABLE [dbo].[Connection]  WITH CHECK ADD  CONSTRAINT [FK__Connectie__IdVoe__1C873BEC] FOREIGN KEY([IdVehicle])
REFERENCES [dbo].[Vehicle] ([IdVehicle])
GO
ALTER TABLE [dbo].[Connection] CHECK CONSTRAINT [FK__Connectie__IdVoe__1C873BEC]
GO
USE [master]
GO
ALTER DATABASE [Fleetmanager] SET  READ_WRITE 
GO
