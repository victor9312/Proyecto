USE [master]
GO
/****** Object:  Database [almacen]    Script Date: 09/09/2016 11:43:50 ******/
CREATE DATABASE [almacen] ON  PRIMARY 
( NAME = N'almacen', FILENAME = N'c:\Program Files (x86)\Microsoft SQL Server\MSSQL.1\MSSQL\DATA\almacen.mdf' , SIZE = 2240KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'almacen_log', FILENAME = N'c:\Program Files (x86)\Microsoft SQL Server\MSSQL.1\MSSQL\DATA\almacen_log.LDF' , SIZE = 560KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [almacen] SET COMPATIBILITY_LEVEL = 90
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
ALTER DATABASE [almacen] SET AUTO_CLOSE ON 
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
ALTER DATABASE [almacen] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [almacen] SET  MULTI_USER 
GO
ALTER DATABASE [almacen] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [almacen] SET DB_CHAINING OFF 
GO
USE [almacen]
GO
/****** Object:  User [admin]    Script Date: 09/09/2016 11:43:50 ******/
CREATE USER [admin] FOR LOGIN [admin] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  StoredProcedure [dbo].[ActualizarArticulo]    Script Date: 09/09/2016 11:43:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ActualizarArticulo]
@id int,
@nombre nvarchar(20),
@descripcion nvarchar(30),
@unidad nvarchar(4),
@tipo nvarchar(15),
@precio_uni int,
@f_entrada nvarchar(20),
@f_salida nvarchar(20),
@cantidad int,
@existencia int,
@precio_prod int,
@estatus nvarchar(1)

as
update articulo set nombre=@nombre, descripcion=@descripcion, unidad=@unidad, tipo=@tipo, precio_uni=@precio_uni, f_entrada=@f_entrada, f_salida=@f_salida, cantidad=@cantidad, existencia=@existencia, precio_prod=@precio_prod, estatus=@estatus where id=@id;

GO
/****** Object:  StoredProcedure [dbo].[ActualizarUsuario]    Script Date: 09/09/2016 11:43:51 ******/
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
/****** Object:  StoredProcedure [dbo].[EliminarArticulos]    Script Date: 09/09/2016 11:43:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[EliminarArticulos]
@lista_ids nvarchar(1500)
as update articulo set estatus='b' where id in(@lista_ids);
GO
/****** Object:  StoredProcedure [dbo].[EliminarUsuarios]    Script Date: 09/09/2016 11:43:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[EliminarUsuarios]
@lista_ids nvarchar(1500)
as update usuario set estatus='b' where id in(@lista_ids);

GO
/****** Object:  StoredProcedure [dbo].[InsertarArticulo]    Script Date: 09/09/2016 11:43:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsertarArticulo]
@id int,
@nombre nvarchar(20),
@descripcion nvarchar(30),
@unidad nvarchar(4),
@tipo nvarchar(15),
@precio_uni int,
@f_entrada nvarchar(20),
@f_salida nvarchar(20),
@cantidad int,
@existencia int,
@precio_prod int,
@id_local int

as insert into articulo values(@id, @nombre, @descripcion, @unidad, @tipo, @precio_uni, @f_entrada, @f_salida, @cantidad, @existencia, @precio_prod, 'a', 1, @id_local);

GO
/****** Object:  StoredProcedure [dbo].[InsertarUsuario]    Script Date: 09/09/2016 11:43:51 ******/
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
/****** Object:  StoredProcedure [dbo].[ListarArticuloPorId]    Script Date: 09/09/2016 11:43:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ListarArticuloPorId]
@id int
as
select * from articulo where id=@id;
GO
/****** Object:  StoredProcedure [dbo].[ListarArticulos]    Script Date: 09/09/2016 11:43:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ListarArticulos]
as
select * from articulo;
GO
/****** Object:  StoredProcedure [dbo].[ListarUsuarioPorId]    Script Date: 09/09/2016 11:43:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ListarUsuarioPorId]
@id int
as
select * from usuario where id=@id;
GO
/****** Object:  StoredProcedure [dbo].[ListarUsuarios]    Script Date: 09/09/2016 11:43:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ListarUsuarios]
as
select * from usuario;
GO
/****** Object:  Table [dbo].[Articulo]    Script Date: 09/09/2016 11:43:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articulo](
	[Id] [int] NULL,
	[Nombre] [nvarchar](20) NULL,
	[Descripcion] [nvarchar](30) NULL,
	[Unidad] [nvarchar](4) NULL,
	[Tipo] [nvarchar](15) NULL,
	[Precio_uni] [int] NULL,
	[F_entrada] [datetime] NULL,
	[F_salida] [datetime] NULL,
	[Cantidad] [int] NULL,
	[Existencia] [int] NULL,
	[Precio_prod] [int] NULL,
	[Estatus] [nchar](1) NULL,
	[Corte_mes] [int] NULL,
	[Id_local] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[entrada]    Script Date: 09/09/2016 11:43:51 ******/
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
/****** Object:  Table [dbo].[FABRICA]    Script Date: 09/09/2016 11:43:51 ******/
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
/****** Object:  Table [dbo].[Localizacion]    Script Date: 09/09/2016 11:43:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Localizacion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre_pasillo] [nvarchar](20) NULL,
	[id_nombre] [int] NULL,
	[dpto] [nvarchar](20) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 09/09/2016 11:43:51 ******/
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
USE [master]
GO
ALTER DATABASE [almacen] SET  READ_WRITE 
GO
