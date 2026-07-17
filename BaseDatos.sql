USE [master]
GO

CREATE DATABASE [JN_BD]
GO

USE [JN_BD]
GO

CREATE TABLE [dbo].[tbError](
	[Consecutivo] [int] IDENTITY(1,1) NOT NULL,
	[Mensaje] [varchar](max) NOT NULL,
	[Lugar] [varchar](50) NOT NULL,
	[FechaHora] [datetime] NOT NULL,
	[ConsecutivoUsuario] [int] NOT NULL,
 CONSTRAINT [PK_tbError] PRIMARY KEY CLUSTERED 
(
	[Consecutivo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbRol](
	[Consecutivo] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tbRol] PRIMARY KEY CLUSTERED 
(
	[Consecutivo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbUsuario](
	[Consecutivo] [int] IDENTITY(1,1) NOT NULL,
	[Identificacion] [varchar](15) NOT NULL,
	[Nombre] [varchar](250) NOT NULL,
	[CorreoElectronico] [varchar](100) NOT NULL,
	[Contrasenna] [varchar](100) NOT NULL,
	[Estado] [bit] NOT NULL,
	[UsaContrasennaTemp] [bit] NOT NULL,
	[ConsecutivoRol] [int] NOT NULL,
 CONSTRAINT [PK_tbUsuario] PRIMARY KEY CLUSTERED 
(
	[Consecutivo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET IDENTITY_INSERT [dbo].[tbError] ON 
GO
INSERT [dbo].[tbError] ([Consecutivo], [Mensaje], [Lugar], [FechaHora], [ConsecutivoUsuario]) VALUES (1, N'Violation of UNIQUE KEY constraint ''UK_Identificacion''. Cannot insert duplicate key in object ''dbo.tbUsuario''. The duplicate key value is (304590415).
The statement has been terminated.', N'/api/Home/RegistrarAPI', CAST(N'2026-06-18T18:41:20.870' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[tbError] OFF
GO

SET IDENTITY_INSERT [dbo].[tbRol] ON 
GO
INSERT [dbo].[tbRol] ([Consecutivo], [Nombre]) VALUES (1, N'Usuario')
GO
INSERT [dbo].[tbRol] ([Consecutivo], [Nombre]) VALUES (2, N'Administrador')
GO
SET IDENTITY_INSERT [dbo].[tbRol] OFF
GO

SET IDENTITY_INSERT [dbo].[tbUsuario] ON 
GO
INSERT [dbo].[tbUsuario] ([Consecutivo], [Identificacion], [Nombre], [CorreoElectronico], [Contrasenna], [Estado], [UsaContrasennaTemp], [ConsecutivoRol]) VALUES (7, N'304590415', N'Eduardo Calvo Castillo', N'ecalvo90415@ufide.ac.cr', N'$2a$11$lR12jLMENpuG62nFkwyW/e7wSjZEnp837SGeArY1d0FaLeDEcsBzu', 1, 0, 2)
GO
INSERT [dbo].[tbUsuario] ([Consecutivo], [Identificacion], [Nombre], [CorreoElectronico], [Contrasenna], [Estado], [UsaContrasennaTemp], [ConsecutivoRol]) VALUES (8, N'206690870', N'Manuel Mora Monge', N'mmora90870@ufide.ac.cr', N'$2a$11$faCoDb2o.a3SmTdro0ePPOdiTyN2IykN6IgEOhtKXue8B8.cdUe0W', 1, 0, 1)
GO
SET IDENTITY_INSERT [dbo].[tbUsuario] OFF
GO

ALTER TABLE [dbo].[tbUsuario] ADD  CONSTRAINT [UK_CorreoElectronico] UNIQUE NONCLUSTERED 
(
	[CorreoElectronico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tbUsuario] ADD  CONSTRAINT [UK_Identificacion] UNIQUE NONCLUSTERED 
(
	[Identificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tbUsuario]  WITH CHECK ADD  CONSTRAINT [FK_tbUsuario_tbRol] FOREIGN KEY([ConsecutivoRol])
REFERENCES [dbo].[tbRol] ([Consecutivo])
GO
ALTER TABLE [dbo].[tbUsuario] CHECK CONSTRAINT [FK_tbUsuario_tbRol]
GO

CREATE PROCEDURE [dbo].[spActualizarContrasenna]
    @Consecutivo     int,
    @Contrasenna     varchar(100),
    @IndicadorTemp   bit
AS
BEGIN

    UPDATE  dbo.tbUsuario
       SET  Contrasenna = @Contrasenna,
            UsaContrasennaTemp = @IndicadorTemp
     WHERE  Consecutivo = @Consecutivo

END
GO

CREATE PROCEDURE [dbo].[spActualizarPerfil]
    @Consecutivo        int,
    @Identificacion     varchar(15),
    @Nombre             varchar(250),
    @CorreoElectronico  varchar(100)
AS
BEGIN

    UPDATE  dbo.tbUsuario
       SET  Identificacion = @Identificacion,
            Nombre = @Nombre,
            CorreoElectronico = @CorreoElectronico
     WHERE  Consecutivo = @Consecutivo

END
GO

CREATE PROCEDURE [dbo].[spConsultarUsuario]
    @Consecutivo  int
AS
BEGIN

    SELECT  Consecutivo,Identificacion,Nombre,CorreoElectronico,Estado,UsaContrasennaTemp
    FROM    dbo.tbUsuario
    WHERE   Consecutivo = @Consecutivo

END
GO

CREATE PROCEDURE [dbo].[spIniciarSesionUsuario]
    @CorreoElectronico  varchar(100),
    @Contrasenna        varchar(100)
AS
BEGIN

    SELECT  U.Consecutivo,Identificacion,U.Nombre,CorreoElectronico,Estado,UsaContrasennaTemp,
            Contrasenna,ConsecutivoRol,R.Nombre 'NombreRol'
    FROM    dbo.tbUsuario U
    INNER JOIN dbo.tbRol R ON U.ConsecutivoRol = R.Consecutivo
    WHERE   CorreoElectronico = @CorreoElectronico
        --AND Contrasenna = @Contrasenna
        AND Estado = 1

END
GO

CREATE PROCEDURE [dbo].[spRegistrarError]
    @Mensaje            varchar(max),
    @Lugar              varchar(50),
    @FechaHora          datetime,
    @ConsecutivoUsuario int
AS
BEGIN

    INSERT INTO dbo.tbError(Mensaje,Lugar,FechaHora,ConsecutivoUsuario)
    VALUES (@Mensaje,@Lugar,@FechaHora,@ConsecutivoUsuario)

END
GO

CREATE PROCEDURE [dbo].[spRegistrarUsuario]
    @Identificacion     varchar(15),
    @Nombre             varchar(250),
    @CorreoElectronico  varchar(100),
    @Contrasenna        varchar(100)
AS
BEGIN

    IF NOT EXISTS (SELECT 1 FROM tbUsuario
                  WHERE Identificacion = @Identificacion
                    OR  CorreoElectronico = @CorreoElectronico)
    BEGIN

        DECLARE @Estado BIT = 1
        DECLARE @ContrasennaNOTemp BIT = 0
        DECLARE @Rol BIT = 1
	
        INSERT INTO dbo.tbUsuario(Identificacion,Nombre,CorreoElectronico,Contrasenna,Estado,UsaContrasennaTemp,ConsecutivoRol)
        VALUES(@Identificacion,@Nombre,@CorreoElectronico,@Contrasenna,@Estado,@ContrasennaNOTemp,@Rol)

    END

END
GO

CREATE PROCEDURE [dbo].[spValidarCorreo]
    @CorreoElectronico  varchar(100)
AS
BEGIN

    SELECT  Consecutivo,Identificacion,Nombre,CorreoElectronico,Estado,UsaContrasennaTemp
    FROM    dbo.tbUsuario
    WHERE   CorreoElectronico = @CorreoElectronico
        AND Estado = 1

END
GO