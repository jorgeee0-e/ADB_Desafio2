USE [master]
GO
/****** Object:  Database [renta_video]    Script Date: 21/4/2024 14:27:23 ******/
CREATE DATABASE [renta_video]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'renta_video', FILENAME = N'D:\SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\renta_video.mdf' , SIZE = 10240KB , MAXSIZE =  20480KB, FILEGROWTH = 10% )
 LOG ON 
( NAME = N'renta_video_log', FILENAME = N'D:\SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\renta_video_log.ldf' , SIZE = 9216KB , MAXSIZE = 15360KB , FILEGROWTH = 5120KB)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF)
GO
ALTER DATABASE [renta_video] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [renta_video].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [renta_video] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [renta_video] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [renta_video] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [renta_video] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [renta_video] SET ARITHABORT OFF 
GO
ALTER DATABASE [renta_video] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [renta_video] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [renta_video] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [renta_video] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [renta_video] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [renta_video] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [renta_video] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [renta_video] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [renta_video] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [renta_video] SET  DISABLE_BROKER 
GO
ALTER DATABASE [renta_video] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [renta_video] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [renta_video] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [renta_video] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [renta_video] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [renta_video] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [renta_video] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [renta_video] SET RECOVERY FULL 
GO
ALTER DATABASE [renta_video] SET  MULTI_USER 
GO
ALTER DATABASE [renta_video] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [renta_video] SET DB_CHAINING OFF 
GO
ALTER DATABASE [renta_video] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [renta_video] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [renta_video] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [renta_video] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'renta_video', N'ON'
GO
ALTER DATABASE [renta_video] SET QUERY_STORE = ON
GO
ALTER DATABASE [renta_video] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [renta_video]
GO
/****** Object:  Table [dbo].[categorias]    Script Date: 21/4/2024 14:27:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categorias](
	[CodC] [nchar](10) NOT NULL,
	[Categorias] [nchar](10) NOT NULL,
 CONSTRAINT [PK_categorias] PRIMARY KEY CLUSTERED 
(
	[CodC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[clientes]    Script Date: 21/4/2024 14:27:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clientes](
	[Nombres] [nchar](50) NULL,
	[Apellidos] [nchar](50) NULL,
	[DUI] [nchar](10) NOT NULL,
	[Fecha_Afiliacion] [date] NOT NULL,
	[Edad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[DUI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[peliculas]    Script Date: 21/4/2024 14:27:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[peliculas](
	[CodP] [nchar](10) NOT NULL,
	[Nombre] [nchar](50) NOT NULL,
	[CodT] [nchar](10) NOT NULL,
	[CodC] [nchar](10) NOT NULL,
	[Fecha_Ingreso] [date] NOT NULL,
	[Disponible] [int] NULL,
 CONSTRAINT [PK_peliculas] PRIMARY KEY CLUSTERED 
(
	[CodP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rentas]    Script Date: 21/4/2024 14:27:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rentas](
	[CodR] [nchar](10) NOT NULL,
	[CodP] [nchar](10) NOT NULL,
	[DUI] [nchar](10) NOT NULL,
	[Fecha_Ingreso] [date] NOT NULL,
	[Fecha_Devolucion] [date] NOT NULL,
	[Cobro] [float] NOT NULL,
	[Mora] [float] NULL,
 CONSTRAINT [PK_rentas] PRIMARY KEY CLUSTERED 
(
	[CodR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipos]    Script Date: 21/4/2024 14:27:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipos](
	[codT] [nchar](10) NOT NULL,
	[Nombre_Tipo] [nchar](10) NOT NULL,
 CONSTRAINT [PK_tipos] PRIMARY KEY CLUSTERED 
(
	[codT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[categorias] ([CodC], [Categorias]) VALUES (N'C001      ', N'Comedia   ')
INSERT [dbo].[categorias] ([CodC], [Categorias]) VALUES (N'C002      ', N'Infantiles')
INSERT [dbo].[categorias] ([CodC], [Categorias]) VALUES (N'C003      ', N'Suspenso  ')
INSERT [dbo].[categorias] ([CodC], [Categorias]) VALUES (N'C004      ', N'Drama     ')
INSERT [dbo].[categorias] ([CodC], [Categorias]) VALUES (N'C005      ', N'Acción    ')
INSERT [dbo].[categorias] ([CodC], [Categorias]) VALUES (N'C006      ', N'Games     ')
INSERT [dbo].[categorias] ([CodC], [Categorias]) VALUES (N'C007      ', N'Sonidos   ')
INSERT [dbo].[categorias] ([CodC], [Categorias]) VALUES (N'C008      ', N'Romance   ')
INSERT [dbo].[categorias] ([CodC], [Categorias]) VALUES (N'C009      ', N'Terror    ')
INSERT [dbo].[categorias] ([CodC], [Categorias]) VALUES (N'C010      ', N'Anime     ')
GO
INSERT [dbo].[clientes] ([Nombres], [Apellidos], [DUI], [Fecha_Afiliacion], [Edad]) VALUES (N'Miguel Armando                                    ', N'Cardoza Sosa                                      ', N'00224432-3', CAST(N'2008-04-21' AS Date), 17)
INSERT [dbo].[clientes] ([Nombres], [Apellidos], [DUI], [Fecha_Afiliacion], [Edad]) VALUES (N'María Elena                                       ', N'Sánchez Campos                                    ', N'00278283-2', CAST(N'2008-04-24' AS Date), 24)
INSERT [dbo].[clientes] ([Nombres], [Apellidos], [DUI], [Fecha_Afiliacion], [Edad]) VALUES (N'Carlos                                            ', N'Alfaro                                            ', N'00455594-0', CAST(N'2022-11-05' AS Date), 30)
INSERT [dbo].[clientes] ([Nombres], [Apellidos], [DUI], [Fecha_Afiliacion], [Edad]) VALUES (N'Jorge Ernesto                                     ', N'Manzanero Vásquez                                 ', N'00900082-9', CAST(N'2008-08-06' AS Date), 28)
INSERT [dbo].[clientes] ([Nombres], [Apellidos], [DUI], [Fecha_Afiliacion], [Edad]) VALUES (N'José Antonio                                      ', N'Juárez Blanco                                     ', N'00901133-2', CAST(N'2008-04-08' AS Date), 19)
INSERT [dbo].[clientes] ([Nombres], [Apellidos], [DUI], [Fecha_Afiliacion], [Edad]) VALUES (N'Herson                                            ', N'Serrano                                           ', N'01433949-8', CAST(N'2007-06-14' AS Date), 29)
INSERT [dbo].[clientes] ([Nombres], [Apellidos], [DUI], [Fecha_Afiliacion], [Edad]) VALUES (N'Raúl Ernesto                                      ', N'Barraza Sorto                                     ', N'01503949-8', CAST(N'2008-06-14' AS Date), 29)
INSERT [dbo].[clientes] ([Nombres], [Apellidos], [DUI], [Fecha_Afiliacion], [Edad]) VALUES (N'Juan José                                         ', N'Recinos Ayala                                     ', N'01850173-9', CAST(N'2008-03-14' AS Date), 28)
INSERT [dbo].[clientes] ([Nombres], [Apellidos], [DUI], [Fecha_Afiliacion], [Edad]) VALUES (N'Pedro Arias                                       ', N'Rivas Cisneros                                    ', N'01900683-1', CAST(N'2008-05-22' AS Date), 26)
INSERT [dbo].[clientes] ([Nombres], [Apellidos], [DUI], [Fecha_Afiliacion], [Edad]) VALUES (N'Ana Epifanía                                      ', N'López Durango                                     ', N'02829380-9', CAST(N'2008-07-15' AS Date), 24)
GO
INSERT [dbo].[peliculas] ([CodP], [Nombre], [CodT], [CodC], [Fecha_Ingreso], [Disponible]) VALUES (N'P001      ', N'Ace Ventura                                       ', N'T001      ', N'C001      ', CAST(N'2022-04-13' AS Date), 10)
INSERT [dbo].[peliculas] ([CodP], [Nombre], [CodT], [CodC], [Fecha_Ingreso], [Disponible]) VALUES (N'P002      ', N'El Mundo de los Quien                             ', N'T001      ', N'C002      ', CAST(N'2006-10-01' AS Date), 4)
INSERT [dbo].[peliculas] ([CodP], [Nombre], [CodT], [CodC], [Fecha_Ingreso], [Disponible]) VALUES (N'P003      ', N'El Ultimo Guerrero                                ', N'T002      ', N'C005      ', CAST(N'2005-11-12' AS Date), 5)
INSERT [dbo].[peliculas] ([CodP], [Nombre], [CodT], [CodC], [Fecha_Ingreso], [Disponible]) VALUES (N'P004      ', N'Aguas Turbias                                     ', N'T001      ', N'C003      ', CAST(N'2005-11-11' AS Date), 6)
INSERT [dbo].[peliculas] ([CodP], [Nombre], [CodT], [CodC], [Fecha_Ingreso], [Disponible]) VALUES (N'P005      ', N'Terminator III                                    ', N'T002      ', N'C006      ', CAST(N'2003-12-26' AS Date), 5)
INSERT [dbo].[peliculas] ([CodP], [Nombre], [CodT], [CodC], [Fecha_Ingreso], [Disponible]) VALUES (N'P006      ', N'La Sociedad de los Poetas                         ', N'T003      ', N'C004      ', CAST(N'2004-09-12' AS Date), 4)
INSERT [dbo].[peliculas] ([CodP], [Nombre], [CodT], [CodC], [Fecha_Ingreso], [Disponible]) VALUES (N'P007      ', N'Final Fantasy VIII                                ', N'T003      ', N'C006      ', CAST(N'2006-08-23' AS Date), 5)
INSERT [dbo].[peliculas] ([CodP], [Nombre], [CodT], [CodC], [Fecha_Ingreso], [Disponible]) VALUES (N'P008      ', N'Little Frog                                       ', N'T001      ', N'C002      ', CAST(N'2007-01-18' AS Date), 6)
INSERT [dbo].[peliculas] ([CodP], [Nombre], [CodT], [CodC], [Fecha_Ingreso], [Disponible]) VALUES (N'P009      ', N'Halo 2                                            ', N'T001      ', N'C006      ', CAST(N'2007-07-07' AS Date), 7)
INSERT [dbo].[peliculas] ([CodP], [Nombre], [CodT], [CodC], [Fecha_Ingreso], [Disponible]) VALUES (N'P010      ', N'Ace Ventura 2                                     ', N'T001      ', N'C001      ', CAST(N'2006-06-14' AS Date), 4)
INSERT [dbo].[peliculas] ([CodP], [Nombre], [CodT], [CodC], [Fecha_Ingreso], [Disponible]) VALUES (N'P011      ', N'Oraciones y alabanzas                             ', N'T003      ', N'C007      ', CAST(N'2006-12-12' AS Date), 3)
INSERT [dbo].[peliculas] ([CodP], [Nombre], [CodT], [CodC], [Fecha_Ingreso], [Disponible]) VALUES (N'P012      ', N'Donde hay llanto hay risa                         ', N'T003      ', N'C007      ', CAST(N'2007-03-11' AS Date), 3)
INSERT [dbo].[peliculas] ([CodP], [Nombre], [CodT], [CodC], [Fecha_Ingreso], [Disponible]) VALUES (N'P013      ', N'Rambo III                                         ', N'T003      ', N'C006      ', CAST(N'2004-08-27' AS Date), 5)
INSERT [dbo].[peliculas] ([CodP], [Nombre], [CodT], [CodC], [Fecha_Ingreso], [Disponible]) VALUES (N'P014      ', N'Terminator I                                      ', N'T003      ', N'C006      ', CAST(N'2003-04-22' AS Date), 3)
INSERT [dbo].[peliculas] ([CodP], [Nombre], [CodT], [CodC], [Fecha_Ingreso], [Disponible]) VALUES (N'P015      ', N'Como agua para chocolate                          ', N'T001      ', N'C008      ', CAST(N'2002-05-18' AS Date), 2)
INSERT [dbo].[peliculas] ([CodP], [Nombre], [CodT], [CodC], [Fecha_Ingreso], [Disponible]) VALUES (N'P016      ', N'Black Adam                                        ', N'T001      ', N'C005      ', CAST(N'2022-11-05' AS Date), 2)
GO
INSERT [dbo].[rentas] ([CodR], [CodP], [DUI], [Fecha_Ingreso], [Fecha_Devolucion], [Cobro], [Mora]) VALUES (N'R001      ', N'P003      ', N'00900082-9', CAST(N'2023-02-12' AS Date), CAST(N'2023-02-16' AS Date), 1.5, 0.5)
INSERT [dbo].[rentas] ([CodR], [CodP], [DUI], [Fecha_Ingreso], [Fecha_Devolucion], [Cobro], [Mora]) VALUES (N'R002      ', N'P006      ', N'00224432-3', CAST(N'2006-10-01' AS Date), CAST(N'2006-10-08' AS Date), 1.5, 0)
INSERT [dbo].[rentas] ([CodR], [CodP], [DUI], [Fecha_Ingreso], [Fecha_Devolucion], [Cobro], [Mora]) VALUES (N'R003      ', N'P001      ', N'00901133-2', CAST(N'2005-12-11' AS Date), CAST(N'2005-12-14' AS Date), 1.5, 0)
INSERT [dbo].[rentas] ([CodR], [CodP], [DUI], [Fecha_Ingreso], [Fecha_Devolucion], [Cobro], [Mora]) VALUES (N'R004      ', N'P007      ', N'02829380-9', CAST(N'2005-11-21' AS Date), CAST(N'2005-11-29' AS Date), 1.5, 0.5)
INSERT [dbo].[rentas] ([CodR], [CodP], [DUI], [Fecha_Ingreso], [Fecha_Devolucion], [Cobro], [Mora]) VALUES (N'R005      ', N'P008      ', N'00278283-2', CAST(N'2003-12-26' AS Date), CAST(N'2003-12-28' AS Date), 1.5, 0)
INSERT [dbo].[rentas] ([CodR], [CodP], [DUI], [Fecha_Ingreso], [Fecha_Devolucion], [Cobro], [Mora]) VALUES (N'R006      ', N'P004      ', N'00224432-3', CAST(N'2004-09-12' AS Date), CAST(N'2004-09-20' AS Date), 1.5, 0.5)
INSERT [dbo].[rentas] ([CodR], [CodP], [DUI], [Fecha_Ingreso], [Fecha_Devolucion], [Cobro], [Mora]) VALUES (N'R007      ', N'P003      ', N'00900082-9', CAST(N'2006-08-23' AS Date), CAST(N'2006-08-26' AS Date), 1.5, 0)
INSERT [dbo].[rentas] ([CodR], [CodP], [DUI], [Fecha_Ingreso], [Fecha_Devolucion], [Cobro], [Mora]) VALUES (N'R008      ', N'P002      ', N'01503949-8', CAST(N'2007-01-18' AS Date), CAST(N'2007-01-21' AS Date), 1.5, 0)
INSERT [dbo].[rentas] ([CodR], [CodP], [DUI], [Fecha_Ingreso], [Fecha_Devolucion], [Cobro], [Mora]) VALUES (N'R009      ', N'P007      ', N'00901133-2', CAST(N'2007-07-07' AS Date), CAST(N'2007-07-09' AS Date), 1.5, 0)
INSERT [dbo].[rentas] ([CodR], [CodP], [DUI], [Fecha_Ingreso], [Fecha_Devolucion], [Cobro], [Mora]) VALUES (N'R011      ', N'P010      ', N'01850173-9', CAST(N'2006-12-12' AS Date), CAST(N'2006-12-21' AS Date), 1.5, 0.5)
INSERT [dbo].[rentas] ([CodR], [CodP], [DUI], [Fecha_Ingreso], [Fecha_Devolucion], [Cobro], [Mora]) VALUES (N'R012      ', N'P005      ', N'00900082-9', CAST(N'2007-03-11' AS Date), CAST(N'2007-03-13' AS Date), 1.5, 0)
INSERT [dbo].[rentas] ([CodR], [CodP], [DUI], [Fecha_Ingreso], [Fecha_Devolucion], [Cobro], [Mora]) VALUES (N'R014      ', N'P007      ', N'01850173-9', CAST(N'2003-04-22' AS Date), CAST(N'2003-04-24' AS Date), 1.5, 0)
INSERT [dbo].[rentas] ([CodR], [CodP], [DUI], [Fecha_Ingreso], [Fecha_Devolucion], [Cobro], [Mora]) VALUES (N'R015      ', N'P015      ', N'00224432-3', CAST(N'2002-05-18' AS Date), CAST(N'2002-05-28' AS Date), 1.5, 0.5)
GO
INSERT [dbo].[tipos] ([codT], [Nombre_Tipo]) VALUES (N'T001      ', N'DVD       ')
INSERT [dbo].[tipos] ([codT], [Nombre_Tipo]) VALUES (N'T002      ', N'VHS       ')
INSERT [dbo].[tipos] ([codT], [Nombre_Tipo]) VALUES (N'T003      ', N'CASSETTE  ')
GO
ALTER TABLE [dbo].[peliculas]  WITH CHECK ADD  CONSTRAINT [FK_peliculas_categorias] FOREIGN KEY([CodC])
REFERENCES [dbo].[categorias] ([CodC])
GO
ALTER TABLE [dbo].[peliculas] CHECK CONSTRAINT [FK_peliculas_categorias]
GO
ALTER TABLE [dbo].[peliculas]  WITH CHECK ADD  CONSTRAINT [FK_peliculas_tipos] FOREIGN KEY([CodT])
REFERENCES [dbo].[tipos] ([codT])
GO
ALTER TABLE [dbo].[peliculas] CHECK CONSTRAINT [FK_peliculas_tipos]
GO
ALTER TABLE [dbo].[rentas]  WITH CHECK ADD  CONSTRAINT [FK_rentas_clientes] FOREIGN KEY([DUI])
REFERENCES [dbo].[clientes] ([DUI])
GO
ALTER TABLE [dbo].[rentas] CHECK CONSTRAINT [FK_rentas_clientes]
GO
ALTER TABLE [dbo].[rentas]  WITH CHECK ADD  CONSTRAINT [FK_rentas_peliculas] FOREIGN KEY([CodP])
REFERENCES [dbo].[peliculas] ([CodP])
GO
ALTER TABLE [dbo].[rentas] CHECK CONSTRAINT [FK_rentas_peliculas]
GO
ALTER TABLE [dbo].[tipos]  WITH CHECK ADD  CONSTRAINT [chk_Nombre_Tipo] CHECK  (([Nombre_Tipo]='CASSETTE' OR [Nombre_Tipo]='VHS' OR [Nombre_Tipo]='DVD'))
GO
ALTER TABLE [dbo].[tipos] CHECK CONSTRAINT [chk_Nombre_Tipo]
GO
USE [master]
GO
ALTER DATABASE [renta_video] SET  READ_WRITE 
GO
