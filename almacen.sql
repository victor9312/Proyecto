USE [master]
GO
/****** Object:  Database [almacen]    Script Date: 15/09/2016 21:28:18 ******/
CREATE DATABASE [almacen]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'almacen', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.PROYECTO\MSSQL\DATA\almacen.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'almacen_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.PROYECTO\MSSQL\DATA\almacen_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [almacen] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [almacen].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [almacen] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [almacen] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [almacen] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [almacen] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [almacen] SET ARITHABORT OFF 
GO
ALTER DATABASE [almacen] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [almacen] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [almacen] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [almacen] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [almacen] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [almacen] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [almacen] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [almacen] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [almacen] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [almacen] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [almacen] SET  ENABLE_BROKER 
GO
ALTER DATABASE [almacen] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [almacen] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [almacen] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [almacen] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [almacen] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [almacen] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [almacen] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [almacen] SET RECOVERY FULL 
GO
ALTER DATABASE [almacen] SET  MULTI_USER 
GO
ALTER DATABASE [almacen] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [almacen] SET DB_CHAINING OFF 
GO
ALTER DATABASE [almacen] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [almacen] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'almacen', N'ON'
GO
USE [almacen]
GO
/****** Object:  StoredProcedure [dbo].[ActualizarArticulo]    Script Date: 15/09/2016 21:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[ActualizarArticulo]
@id_articulo int,
@nombre nvarchar(50),
@descripcion nvarchar(50),
@unidad nvarchar(10),
@cantidad int,
@estatus nchar(1)

as
update articulo set nombre=@nombre, descripcion=@descripcion, unidad=@unidad, cantidad=@cantidad, estatus=@estatus where id_articulo=@id_articulo;

GO
/****** Object:  StoredProcedure [dbo].[ActualizarUsuario]    Script Date: 15/09/2016 21:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ActualizarUsuario]
@id int,
@usuario nvarchar(15),
@contraseña nvarchar(8),
@dpto nvarchar(15),
@cargo nvarchar(15),
@estatus nvarchar(2)
as
update usuario set usuario=@usuario, contraseña=@contraseña, dpto=@dpto, cargo=@cargo, estatus=@estatus where id=@id;

GO
/****** Object:  StoredProcedure [dbo].[EliminarArticulos]    Script Date: 15/09/2016 21:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[EliminarArticulos]
@lista_ids nvarchar(1500)
as update articulo set estatus='b' where id_articulo in(@lista_ids);
GO
/****** Object:  StoredProcedure [dbo].[EliminarUsuarios]    Script Date: 15/09/2016 21:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[EliminarUsuarios]
@lista_ids nvarchar(1500)
as update usuario set estatus='b' where id in(@lista_ids);


GO
/****** Object:  StoredProcedure [dbo].[InsertarArticulo]    Script Date: 15/09/2016 21:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsertarArticulo]
@id_grupo int,
@nombre nvarchar(50),
@descripcion nvarchar(50),
@unidad nvarchar(10)

as insert into articulo(id_grupo, nombre, descripcion, unidad, estatus, corte_mes) values(@id_grupo, @nombre, @descripcion, @unidad, 'a', 1);

GO
/****** Object:  StoredProcedure [dbo].[InsertarUsuario]    Script Date: 15/09/2016 21:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InsertarUsuario]
@usuario nvarchar(15),
@contraseña nvarchar(8),
@dpto nvarchar(15),
@cargo nvarchar(15)

as insert into usuario(usuario, contraseña, dpto, cargo, estatus) values(@usuario, @contraseña, @dpto, @cargo, 'a');


GO
/****** Object:  StoredProcedure [dbo].[ListarArticuloPorId]    Script Date: 15/09/2016 21:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ListarArticuloPorId]
@id_articulo int
as
select * from articulo where id_articulo=@id_articulo;
GO
/****** Object:  StoredProcedure [dbo].[ListarArticulos]    Script Date: 15/09/2016 21:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ListarArticulos]
as
select * from articulo;

GO
/****** Object:  StoredProcedure [dbo].[ListarUsuarioPorId]    Script Date: 15/09/2016 21:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ListarUsuarioPorId]
@id int
as
select * from usuario where id=@id;

GO
/****** Object:  StoredProcedure [dbo].[ListarUsuarios]    Script Date: 15/09/2016 21:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ListarUsuarios]
as
select * from usuario;

GO
/****** Object:  Table [dbo].[Articulo]    Script Date: 15/09/2016 21:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articulo](
	[Id_Articulo] [int] IDENTITY(1,1) NOT NULL,
	[Id_Grupo] [int] NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Descripcion] [nvarchar](50) NOT NULL,
	[Unidad] [nvarchar](10) NOT NULL,
	[Cantidad] [int] NULL,
	[Estatus] [nchar](1) NOT NULL,
	[Corte_mes] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Articulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Articulo_has_Factura]    Script Date: 15/09/2016 21:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articulo_has_Factura](
	[Id_Articulo] [int] NOT NULL,
	[Id_Factura] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Articulo] ASC,
	[Id_Factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[entrada]    Script Date: 15/09/2016 21:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[entrada](
	[id] [int] NOT NULL,
	[requisicion] [varchar](30) NOT NULL,
	[fecha_entrada] [datetime] NOT NULL,
	[nombre_producto] [varchar](30) NOT NULL,
	[cantidad] [int] NOT NULL,
	[serie] [varchar](25) NOT NULL,
	[descripcion] [varchar](30) NOT NULL,
	[num_parte] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FABRICA]    Script Date: 15/09/2016 21:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FABRICA](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_DPTO] [nchar](10) NULL,
	[DPTO] [nchar](20) NULL,
	[PROYECTO] [nchar](30) NULL,
	[PLAN] [nchar](10) NULL,
	[REAL] [nchar](10) NULL,
	[FECHA] [nvarchar](10) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Factura]    Script Date: 15/09/2016 21:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factura](
	[Id_Factura] [int] IDENTITY(1,1) NOT NULL,
	[Id_Proveedor] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Precio_uni] [real] NOT NULL,
	[Total] [real] NOT NULL,
	[Fecha_entrada] [datetime] NOT NULL,
	[Fecha_ultima_entrada] [datetime] NOT NULL,
	[Concepto] [nvarchar](300) NOT NULL,
	[Importe] [real] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Grupo]    Script Date: 15/09/2016 21:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grupo](
	[Id_Grupo] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Grupo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Localizacion]    Script Date: 15/09/2016 21:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Localizacion](
	[Id_Localizacion] [int] IDENTITY(1,1) NOT NULL,
	[Id_Articulo] [int] NOT NULL,
	[Num_Cuviculo] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Localizacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 15/09/2016 21:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedor](
	[Id_Proveedor] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Domicilio] [nvarchar](150) NOT NULL,
	[RFC] [nvarchar](15) NOT NULL,
	[Ciudad] [nvarchar](30) NOT NULL,
	[N_ECO] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Proveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 15/09/2016 21:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Usuario] [nvarchar](15) NOT NULL,
	[Contraseña] [nvarchar](8) NOT NULL,
	[Dpto] [nvarchar](15) NULL,
	[Cargo] [nvarchar](15) NULL,
	[Estatus] [nvarchar](2) NULL
) ON [PRIMARY]

GO
/****** Object:  Index [Articulo_FKIndex1]    Script Date: 15/09/2016 21:28:19 ******/
CREATE NONCLUSTERED INDEX [Articulo_FKIndex1] ON [dbo].[Articulo]
(
	[Id_Grupo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Rel_10]    Script Date: 15/09/2016 21:28:19 ******/
CREATE NONCLUSTERED INDEX [IFK_Rel_10] ON [dbo].[Articulo]
(
	[Id_Grupo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Articulo_has_Factura_FKIndex1]    Script Date: 15/09/2016 21:28:19 ******/
CREATE NONCLUSTERED INDEX [Articulo_has_Factura_FKIndex1] ON [dbo].[Articulo_has_Factura]
(
	[Id_Articulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Articulo_has_Factura_FKIndex2]    Script Date: 15/09/2016 21:28:19 ******/
CREATE NONCLUSTERED INDEX [Articulo_has_Factura_FKIndex2] ON [dbo].[Articulo_has_Factura]
(
	[Id_Factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Rel_05]    Script Date: 15/09/2016 21:28:19 ******/
CREATE NONCLUSTERED INDEX [IFK_Rel_05] ON [dbo].[Articulo_has_Factura]
(
	[Id_Articulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Rel_06]    Script Date: 15/09/2016 21:28:19 ******/
CREATE NONCLUSTERED INDEX [IFK_Rel_06] ON [dbo].[Articulo_has_Factura]
(
	[Id_Factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Factura_FKIndex1]    Script Date: 15/09/2016 21:28:19 ******/
CREATE NONCLUSTERED INDEX [Factura_FKIndex1] ON [dbo].[Factura]
(
	[Id_Proveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Rel_15]    Script Date: 15/09/2016 21:28:19 ******/
CREATE NONCLUSTERED INDEX [IFK_Rel_15] ON [dbo].[Factura]
(
	[Id_Proveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Rel_03]    Script Date: 15/09/2016 21:28:19 ******/
CREATE NONCLUSTERED INDEX [IFK_Rel_03] ON [dbo].[Localizacion]
(
	[Id_Articulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Localizacion_FKIndex1]    Script Date: 15/09/2016 21:28:19 ******/
CREATE NONCLUSTERED INDEX [Localizacion_FKIndex1] ON [dbo].[Localizacion]
(
	[Id_Articulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Articulo]  WITH CHECK ADD FOREIGN KEY([Id_Grupo])
REFERENCES [dbo].[Grupo] ([Id_Grupo])
GO
ALTER TABLE [dbo].[Articulo_has_Factura]  WITH CHECK ADD FOREIGN KEY([Id_Articulo])
REFERENCES [dbo].[Articulo] ([Id_Articulo])
GO
ALTER TABLE [dbo].[Articulo_has_Factura]  WITH CHECK ADD FOREIGN KEY([Id_Factura])
REFERENCES [dbo].[Factura] ([Id_Factura])
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD FOREIGN KEY([Id_Proveedor])
REFERENCES [dbo].[Proveedor] ([Id_Proveedor])
GO
ALTER TABLE [dbo].[Localizacion]  WITH CHECK ADD FOREIGN KEY([Id_Articulo])
REFERENCES [dbo].[Articulo] ([Id_Articulo])
GO
USE [master]
GO
ALTER DATABASE [almacen] SET  READ_WRITE 
GO
