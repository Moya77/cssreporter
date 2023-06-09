USE [master]
GO
/****** Object:  Database [cssreporter]    Script Date: 2/4/2023 07:34:19 ******/
CREATE DATABASE [cssreporter]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'cssreporter', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESSDEV\MSSQL\DATA\cssreporter.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'cssreporter_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESSDEV\MSSQL\DATA\cssreporter_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [cssreporter] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [cssreporter].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [cssreporter] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [cssreporter] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [cssreporter] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [cssreporter] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [cssreporter] SET ARITHABORT OFF 
GO
ALTER DATABASE [cssreporter] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [cssreporter] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [cssreporter] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [cssreporter] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [cssreporter] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [cssreporter] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [cssreporter] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [cssreporter] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [cssreporter] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [cssreporter] SET  ENABLE_BROKER 
GO
ALTER DATABASE [cssreporter] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [cssreporter] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [cssreporter] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [cssreporter] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [cssreporter] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [cssreporter] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [cssreporter] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [cssreporter] SET RECOVERY FULL 
GO
ALTER DATABASE [cssreporter] SET  MULTI_USER 
GO
ALTER DATABASE [cssreporter] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [cssreporter] SET DB_CHAINING OFF 
GO
ALTER DATABASE [cssreporter] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [cssreporter] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [cssreporter] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [cssreporter] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'cssreporter', N'ON'
GO
ALTER DATABASE [cssreporter] SET QUERY_STORE = OFF
GO
USE [cssreporter]
GO
/****** Object:  Table [dbo].[AlergiasPaciente]    Script Date: 2/4/2023 07:34:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlergiasPaciente](
	[id_paciente] [varchar](50) NULL,
	[alergia] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clinicas]    Script Date: 2/4/2023 07:34:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clinicas](
	[NombreClinica] [varchar](50) NULL,
	[CedulaJuridica] [varchar](50) NOT NULL,
	[pais] [varchar](40) NULL,
	[provinciaEstado] [varchar](50) NULL,
	[distrito] [varchar](50) NULL,
	[Telefono] [varchar](40) NULL,
	[correo] [varchar](50) NULL,
	[direccionWeb] [varchar](60) NULL,
PRIMARY KEY CLUSTERED 
(
	[CedulaJuridica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnfermedadPaciente]    Script Date: 2/4/2023 07:34:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnfermedadPaciente](
	[id_paciente] [varchar](50) NULL,
	[enfermedad] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InyeccionesPaciente]    Script Date: 2/4/2023 07:34:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InyeccionesPaciente](
	[id_paciente] [varchar](50) NULL,
	[VacunaSaramRubParoti] [varchar](6) NULL,
	[VacunaTetHepAoBInfl] [varchar](6) NULL,
	[CantCovid] [int] NULL,
	[CovidComent] [varchar](80) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NumerosRegistro]    Script Date: 2/4/2023 07:34:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NumerosRegistro](
	[Id_profesional] [varchar](50) NULL,
	[Id_registro] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OtrosSintomasPaciente]    Script Date: 2/4/2023 07:34:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OtrosSintomasPaciente](
	[id_paciente] [varchar](50) NULL,
	[sintoma] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pacientes]    Script Date: 2/4/2023 07:34:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pacientes](
	[identificacion] [varchar](50) NOT NULL,
	[nombre] [varchar](50) NULL,
	[primerApellido] [varchar](40) NULL,
	[segundoApellido] [varchar](40) NULL,
	[fechaNacimiento] [varchar](50) NULL,
	[genero] [varchar](10) NULL,
	[numeroContacto] [varchar](30) NULL,
	[pais] [varchar](30) NULL,
	[provinciaOestado] [varchar](50) NULL,
	[distrito] [varchar](50) NULL,
	[dondehabita] [varchar](50) NULL,
	[estadoCivil] [varchar](50) NULL,
	[correoElectronico] [varchar](50) NULL,
	[fechaRegistro] [varchar](50) NULL,
	[ocupacion] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[identificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Profesionales]    Script Date: 2/4/2023 07:34:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profesionales](
	[Identificacion] [varchar](50) NOT NULL,
	[Codigo_profesional] [varchar](50) NULL,
	[Nombre_completo] [varchar](100) NULL,
	[Correo] [varchar](50) NULL,
	[Pais] [varchar](20) NULL,
	[Estado] [varchar](20) NULL,
	[Provincia] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Identificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SintomasPaciente]    Script Date: 2/4/2023 07:34:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SintomasPaciente](
	[id_paciente] [varchar](50) NULL,
	[MotivoConsulta] [varchar](50) NULL,
	[Sintomas] [varchar](50) NULL,
	[OtrasCondiciones] [varchar](50) NULL,
	[ReapacicionOnuevoCancer] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[GetClinica]    Script Date: 2/4/2023 07:34:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetClinica]
	@Identificacion varchar(50)
AS
BEGIN
	select * from Clinicas where CedulaJuridica=@Identificacion;
END
GO
/****** Object:  StoredProcedure [dbo].[GetNumRegistro]    Script Date: 2/4/2023 07:34:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[GetNumRegistro]
	@Identificacion varchar(50)
AS
BEGIN
	select Id_registro from NumerosRegistro where Id_profesional=@Identificacion;
END
GO
/****** Object:  StoredProcedure [dbo].[GetNumRegProfesional]    Script Date: 2/4/2023 07:34:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetNumRegProfesional]
@Identificacion varchar(50)

AS

BEGIN 
select NumerosRegistro.Id_registro from NumerosRegistro where Id_profesional=@Identificacion;
END
GO
/****** Object:  StoredProcedure [dbo].[GetPaciente]    Script Date: 2/4/2023 07:34:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[GetPaciente]
	@Identificacion varchar(50)
AS
BEGIN
	select * from Pacientes where identificacion=@Identificacion;
END
GO
/****** Object:  StoredProcedure [dbo].[GetProfesional]    Script Date: 2/4/2023 07:34:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetProfesional]
	@Identificacion varchar(50)
AS
BEGIN
	select * from Profesionales where Identificacion=@Identificacion;
END
GO
/****** Object:  StoredProcedure [dbo].[RegAlergiaPaciente]    Script Date: 2/4/2023 07:34:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RegAlergiaPaciente]
@id_paciente varchar(50),
@alergia varchar(50)
	
AS
BEGIN
	
	insert into dbo.AlergiasPaciente values(@id_paciente,@alergia);
 
END
GO
/****** Object:  StoredProcedure [dbo].[RegClinica]    Script Date: 2/4/2023 07:34:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RegClinica]
@NombreClinica varchar(50),
@CedulaJuridica varchar(50),
@pais varchar(40),
@provinciaEstado varchar (50),
@distrito varchar(50),
@Telefono varchar(40),
@correo varchar(50),
@direccionWeb varchar(60)
	
AS
BEGIN
	
	insert into dbo.Clinicas values(@NombreClinica,@CedulaJuridica,@pais,@provinciaEstado,@distrito,@Telefono,@correo,@direccionWeb);
 
END
GO
/****** Object:  StoredProcedure [dbo].[RegEnfermedadPaciente]    Script Date: 2/4/2023 07:34:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RegEnfermedadPaciente]
@id_paciente varchar(50),
@enfermedad varchar(50)
	
AS
BEGIN
	
	insert into dbo.EnfermedadPaciente values(@id_paciente,@enfermedad);
 
END
GO
/****** Object:  StoredProcedure [dbo].[RegInyeccionPaciente]    Script Date: 2/4/2023 07:34:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[RegInyeccionPaciente]
@id_paciente varchar(50),
@VacunaSaramRubParoti varchar(6),
@VacunaTetHepAoBInfl varchar(6),
@CantCovid int,
@CovidComent varchar(80)
	
AS
BEGIN
	
	insert into dbo.InyeccionesPaciente values(@id_paciente,@VacunaSaramRubParoti,@VacunaTetHepAoBInfl,@CantCovid,@CovidComent);
 
END
GO
/****** Object:  StoredProcedure [dbo].[RegOtrosSintomasPaciente]    Script Date: 2/4/2023 07:34:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RegOtrosSintomasPaciente]
@id_paciente varchar(50),
@sintoma varchar(50)
	
AS
BEGIN
	
	insert into dbo.OtrosSintomasPaciente values(@id_paciente,@sintoma);
 
END
GO
/****** Object:  StoredProcedure [dbo].[RegPaciente]    Script Date: 2/4/2023 07:34:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RegPaciente]
@identificacion varchar(50),
@nombre varchar(50),
@primerApellido varchar(40),
@segundoApellido varchar (40),
@fechaNacimiento varchar(50),
@genero varchar(10),
@numeroContacto varchar(30),
@pais varchar(30),
@provinciaOestado varchar(50),
@distrito varchar(50),
@dondehabita varchar(50),
@estadoCivil varchar(50),
@correoElectronico varchar(50),
@fechaRegistro varchar(50),
@ocupacion varchar(50)
	
AS
BEGIN
	if((select count(*) from Pacientes where identificacion=@identificacion)=0)
	begin
	insert into dbo.Pacientes values(@identificacion,@nombre,@primerApellido,@segundoApellido,@fechaNacimiento,@genero,@numeroContacto,
	@pais,@provinciaOestado,@distrito,@dondehabita,@estadoCivil,@correoElectronico,@fechaRegistro,@ocupacion);
	end
	else
	begin
	update Pacientes set nombre=@nombre, primerApellido=@primerApellido, segundoApellido=@segundoApellido,fechaNacimiento=@fechaNacimiento,genero=@genero,
	numeroContacto=@numeroContacto, pais=@pais,provinciaOestado=@provinciaOestado,distrito=@distrito,dondehabita=@dondehabita,estadoCivil=@estadoCivil,
	correoElectronico=@correoElectronico,ocupacion=@ocupacion where identificacion=@identificacion;
	end
 
END
GO
/****** Object:  StoredProcedure [dbo].[RegProfesional]    Script Date: 2/4/2023 07:34:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RegProfesional]
@Identificacion varchar(50),
@Codigo_profesional varchar(50),
@Nombre_completo varchar(100),
@Correo varchar(50),
@Pais varchar(20),
@Estado varchar(20),
@Provincia varchar(20)
AS

BEGIN 
IF ((select count(*) from Profesionales where Identificacion=@Identificacion)=0)
BEGIN
INSERT INTO Profesionales(Identificacion,Codigo_profesional,Nombre_completo,Correo,Pais,Estado,Provincia) values(@Identificacion,@Codigo_profesional,@Nombre_completo,@Correo,@Pais,@Estado,@Provincia);
insert into NumerosRegistro values(@Identificacion,(select count(*) from NumerosRegistro)+1);
EXEC GetNumRegistro @Identificacion;
END
ELSE
BEGIN
update Profesionales set Nombre_completo=@Nombre_completo, Correo = @Correo, Pais=@Pais, Estado=@Estado, Provincia=@Provincia where Identificacion=@Identificacion;
END
END
GO
/****** Object:  StoredProcedure [dbo].[RegSintomasPaciente]    Script Date: 2/4/2023 07:34:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RegSintomasPaciente]
@id_paciente varchar(50),
@MotivoConsulta varchar(50),
@Sintomas varchar(50),
@OtrasCondiciones varchar(50),
@ReapacicionOnuevoCancer varchar(50)
	
AS
BEGIN
	
	insert into dbo.SintomasPaciente values(@id_paciente,@MotivoConsulta,@Sintomas,@OtrasCondiciones,@ReapacicionOnuevoCancer);
 
END
GO
USE [master]
GO
ALTER DATABASE [cssreporter] SET  READ_WRITE 
GO
