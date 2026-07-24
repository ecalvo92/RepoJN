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

CREATE TABLE [dbo].[tbEstado](
	[Consecutivo] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tbEstado] PRIMARY KEY CLUSTERED 
(
	[Consecutivo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
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

CREATE TABLE [dbo].[tbSolicitud](
	[Consecutivo] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [varchar](150) NOT NULL,
	[Descripcion] [varchar](max) NOT NULL,
	[FechaRegistro] [datetime] NOT NULL,
	[FechaFinalizacion] [datetime] NULL,
	[ConsecutivoUsuario] [int] NOT NULL,
	[ConsecutivoAdmin] [int] NOT NULL,
	[ConsecutivoEstado] [int] NOT NULL,
 CONSTRAINT [PK_tbSolicitud] PRIMARY KEY CLUSTERED 
(
	[Consecutivo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
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

SET IDENTITY_INSERT [dbo].[tbEstado] ON 
GO
INSERT [dbo].[tbEstado] ([Consecutivo], [Nombre]) VALUES (1, N'Abierto')
GO
INSERT [dbo].[tbEstado] ([Consecutivo], [Nombre]) VALUES (2, N'Atendido')
GO
INSERT [dbo].[tbEstado] ([Consecutivo], [Nombre]) VALUES (3, N'Cancelado')
GO
SET IDENTITY_INSERT [dbo].[tbEstado] OFF
GO

SET IDENTITY_INSERT [dbo].[tbRol] ON 
GO
INSERT [dbo].[tbRol] ([Consecutivo], [Nombre]) VALUES (1, N'Usuario')
GO
INSERT [dbo].[tbRol] ([Consecutivo], [Nombre]) VALUES (2, N'Administrador')
GO
SET IDENTITY_INSERT [dbo].[tbRol] OFF
GO

SET IDENTITY_INSERT [dbo].[tbSolicitud] ON 
GO
INSERT [dbo].[tbSolicitud] ([Consecutivo], [Titulo], [Descripcion], [FechaRegistro], [FechaFinalizacion], [ConsecutivoUsuario], [ConsecutivoAdmin], [ConsecutivoEstado]) VALUES (1, N'No me sirve el facebook', N'Cuando entro a internet me sale un dinosaurio raro', CAST(N'2026-07-23T20:43:46.077' AS DateTime), NULL, 8, 7, 1)
GO
INSERT [dbo].[tbSolicitud] ([Consecutivo], [Titulo], [Descripcion], [FechaRegistro], [FechaFinalizacion], [ConsecutivoUsuario], [ConsecutivoAdmin], [ConsecutivoEstado]) VALUES (2, N'No me sirve el internet', N'Cuando entro a internet me sale un dinosaurio raro', CAST(N'2026-07-23T20:46:01.533' AS DateTime), NULL, 8, 7, 1)
GO
INSERT [dbo].[tbSolicitud] ([Consecutivo], [Titulo], [Descripcion], [FechaRegistro], [FechaFinalizacion], [ConsecutivoUsuario], [ConsecutivoAdmin], [ConsecutivoEstado]) VALUES (3, N'No me sirve el formulario 1', N'Cuando entro a internet me sale un dinosaurio raro', CAST(N'2026-07-23T20:48:29.243' AS DateTime), CAST(N'2026-07-23T20:52:02.780' AS DateTime), 8, 9, 3)
GO
INSERT [dbo].[tbSolicitud] ([Consecutivo], [Titulo], [Descripcion], [FechaRegistro], [FechaFinalizacion], [ConsecutivoUsuario], [ConsecutivoAdmin], [ConsecutivoEstado]) VALUES (4, N'No me sirve el formulario 2', N'Cuando entro a internet me sale un dinosaurio raro', CAST(N'2026-07-23T20:48:52.320' AS DateTime), NULL, 8, 10, 1)
GO
INSERT [dbo].[tbSolicitud] ([Consecutivo], [Titulo], [Descripcion], [FechaRegistro], [FechaFinalizacion], [ConsecutivoUsuario], [ConsecutivoAdmin], [ConsecutivoEstado]) VALUES (5, N'No me sirve el formulario 3', N'Cuando entro a internet me sale un dinosaurio raro', CAST(N'2026-07-23T20:49:06.877' AS DateTime), NULL, 8, 9, 1)
GO
INSERT [dbo].[tbSolicitud] ([Consecutivo], [Titulo], [Descripcion], [FechaRegistro], [FechaFinalizacion], [ConsecutivoUsuario], [ConsecutivoAdmin], [ConsecutivoEstado]) VALUES (6, N'No me sirve el formulario 4', N'Cuando entro a internet me sale un dinosaurio raro', CAST(N'2026-07-23T20:49:19.230' AS DateTime), NULL, 8, 10, 1)
GO
INSERT [dbo].[tbSolicitud] ([Consecutivo], [Titulo], [Descripcion], [FechaRegistro], [FechaFinalizacion], [ConsecutivoUsuario], [ConsecutivoAdmin], [ConsecutivoEstado]) VALUES (7, N'No me sirve el formulario FINAL KO', N'Cuando entro a internet me sale un dinosaurio raro', CAST(N'2026-07-23T20:49:42.080' AS DateTime), NULL, 8, 9, 1)
GO
INSERT [dbo].[tbSolicitud] ([Consecutivo], [Titulo], [Descripcion], [FechaRegistro], [FechaFinalizacion], [ConsecutivoUsuario], [ConsecutivoAdmin], [ConsecutivoEstado]) VALUES (8, N'No me sirve el formulario FINAL KO este si', N'Cuando entro a internet me sale un dinosaurio raro', CAST(N'2026-07-23T20:49:56.780' AS DateTime), NULL, 8, 7, 1)
GO
INSERT [dbo].[tbSolicitud] ([Consecutivo], [Titulo], [Descripcion], [FechaRegistro], [FechaFinalizacion], [ConsecutivoUsuario], [ConsecutivoAdmin], [ConsecutivoEstado]) VALUES (9, N'No me sirve el formulario FINAL KO este si FINAL FINAL', N'Cuando entro a internet me sale un dinosaurio raro', CAST(N'2026-07-23T20:50:17.360' AS DateTime), NULL, 8, 10, 1)
GO
SET IDENTITY_INSERT [dbo].[tbSolicitud] OFF
GO

SET IDENTITY_INSERT [dbo].[tbUsuario] ON 
GO
INSERT [dbo].[tbUsuario] ([Consecutivo], [Identificacion], [Nombre], [CorreoElectronico], [Contrasenna], [Estado], [UsaContrasennaTemp], [ConsecutivoRol]) VALUES (7, N'304590415', N'Eduardo Calvo Castillo', N'ecalvo90415@ufide.ac.cr', N'$2a$11$lR12jLMENpuG62nFkwyW/e7wSjZEnp837SGeArY1d0FaLeDEcsBzu', 1, 0, 2)
GO
INSERT [dbo].[tbUsuario] ([Consecutivo], [Identificacion], [Nombre], [CorreoElectronico], [Contrasenna], [Estado], [UsaContrasennaTemp], [ConsecutivoRol]) VALUES (8, N'206690870', N'Manuel Mora Monge', N'mmora90870@ufide.ac.cr', N'$2a$11$faCoDb2o.a3SmTdro0ePPOdiTyN2IykN6IgEOhtKXue8B8.cdUe0W', 1, 0, 1)
GO
INSERT [dbo].[tbUsuario] ([Consecutivo], [Identificacion], [Nombre], [CorreoElectronico], [Contrasenna], [Estado], [UsaContrasennaTemp], [ConsecutivoRol]) VALUES (9, N'119390692', N'Kenneth Gomez Torres', N'kgomez90692@ufide.ac.cr', N'$2a$11$/ADg55r5cosb7I51elVUReRQ5WX8lXaz459bZA65j8yT4w.Yrbyri', 1, 0, 2)
GO
INSERT [dbo].[tbUsuario] ([Consecutivo], [Identificacion], [Nombre], [CorreoElectronico], [Contrasenna], [Estado], [UsaContrasennaTemp], [ConsecutivoRol]) VALUES (10, N'402660841', N'Adrián Villalobos Latiff', N'avillalobos60841@ufide.ac.cr', N'$2a$11$.tWBEyR/7wTjsrPhQfZte.VgFoUFK0p54XoyIS5n9P/v2kBB4jBH6', 1, 0, 2)
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

ALTER TABLE [dbo].[tbSolicitud]  WITH CHECK ADD  CONSTRAINT [FK_tbSolicitud_Admin] FOREIGN KEY([ConsecutivoAdmin])
REFERENCES [dbo].[tbUsuario] ([Consecutivo])
GO
ALTER TABLE [dbo].[tbSolicitud] CHECK CONSTRAINT [FK_tbSolicitud_Admin]
GO

ALTER TABLE [dbo].[tbSolicitud]  WITH CHECK ADD  CONSTRAINT [FK_tbSolicitud_Estado] FOREIGN KEY([ConsecutivoEstado])
REFERENCES [dbo].[tbEstado] ([Consecutivo])
GO
ALTER TABLE [dbo].[tbSolicitud] CHECK CONSTRAINT [FK_tbSolicitud_Estado]
GO

ALTER TABLE [dbo].[tbSolicitud]  WITH CHECK ADD  CONSTRAINT [FK_tbSolicitud_Usuario] FOREIGN KEY([ConsecutivoUsuario])
REFERENCES [dbo].[tbUsuario] ([Consecutivo])
GO
ALTER TABLE [dbo].[tbSolicitud] CHECK CONSTRAINT [FK_tbSolicitud_Usuario]
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

CREATE PROCEDURE [dbo].[spCancelarSolicitudUsuario]
    @ConsecutivoSolicitud   int,
    @ConsecutivoUsuario     int
AS
BEGIN

    UPDATE  dbo.tbSolicitud
    SET     ConsecutivoEstado = 3,
            FechaFinalizacion = GETDATE()
    WHERE   Consecutivo         = @ConsecutivoSolicitud
        AND ConsecutivoUsuario  = @ConsecutivoUsuario
        AND ConsecutivoEstado   = 1

END
GO

CREATE PROCEDURE [dbo].[spConsultarSolicitud]
    @ConsecutivoSolicitud  int
AS
BEGIN

    SELECT  S.Consecutivo,
            S.Titulo,
            S.Descripcion,
            S.FechaRegistro,
            S.FechaFinalizacion,
            U.Nombre 'NombreAdmin',
            E.Nombre 'NombreEstado'
    FROM    dbo.tbSolicitud S
    INNER JOIN dbo.tbUsuario U ON S.ConsecutivoAdmin = U.Consecutivo
    INNER JOIN dbo.tbEstado E ON S.ConsecutivoEstado = E.Consecutivo
    WHERE   S.Consecutivo = @ConsecutivoSolicitud

END
GO

CREATE PROCEDURE [dbo].[spConsultarSolicitudesUsuario]
    @ConsecutivoUsuario  int
AS
BEGIN

    SELECT  S.Consecutivo,
            S.Titulo,
            S.Descripcion,
            S.FechaRegistro,
            S.FechaFinalizacion,
            U.Nombre 'NombreAdmin',
            E.Nombre 'NombreEstado'
    FROM    dbo.tbSolicitud S
    INNER JOIN dbo.tbUsuario U ON S.ConsecutivoAdmin = U.Consecutivo
    INNER JOIN dbo.tbEstado E ON S.ConsecutivoEstado = E.Consecutivo
    WHERE   S.ConsecutivoUsuario = @ConsecutivoUsuario

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

CREATE PROCEDURE [dbo].[spRegistrarSolicitud]
    @Titulo             varchar(150),
    @Descripcion        varchar(max),
    @ConsecutivoUsuario int
AS
BEGIN

    --ADMIN CON MENOS SOLICITUDES EN COLA
    DECLARE @ConsecutivoAdmin INT

    SELECT  TOP 1 @ConsecutivoAdmin = U.Consecutivo 
    FROM    dbo.tbUsuario U
    LEFT JOIN dbo.tbSolicitud S ON  S.ConsecutivoAdmin = U.Consecutivo 
                                AND S.ConsecutivoEstado = 1
    WHERE   U.ConsecutivoRol = 2
    GROUP BY U.Consecutivo
    ORDER BY COUNT(S.Consecutivo)


    INSERT INTO dbo.tbSolicitud(Titulo,Descripcion,FechaRegistro,FechaFinalizacion,
                                ConsecutivoUsuario,ConsecutivoAdmin,ConsecutivoEstado)
    VALUES (@Titulo,@Descripcion,GETDATE(),NULL,@ConsecutivoUsuario,@ConsecutivoAdmin,1)

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