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

CREATE TABLE [dbo].[tbMensaje](
	[Consecutivo] [int] IDENTITY(1,1) NOT NULL,
	[Mensaje] [nvarchar](max) NOT NULL,
	[FechaHora] [datetime] NOT NULL,
	[ConsecutivoUsuario] [int] NOT NULL,
	[ConsecutivoSolicitud] [int] NOT NULL,
 CONSTRAINT [PK_tbMensaje] PRIMARY KEY CLUSTERED 
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

CREATE TABLE [dbo].[tbSolicitud](
	[Consecutivo] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [varchar](150) NOT NULL,
	[Descripcion] [varchar](max) NOT NULL,
	[FechaRegistro] [datetime] NOT NULL,
	[FechaFinalizacion] [datetime] NULL,
	[ConsecutivoUsuario] [int] NOT NULL,
	[ConsecutivoAdmin] [int] NOT NULL,
	[ConsecutivoEstado] [int] NOT NULL,
	[Solucion] [varchar](max) NULL,
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
INSERT [dbo].[tbRol] ([Consecutivo], [Nombre]) VALUES (2, N'Soporte')
GO
SET IDENTITY_INSERT [dbo].[tbRol] OFF
GO

SET IDENTITY_INSERT [dbo].[tbSolicitud] ON 
GO
INSERT [dbo].[tbSolicitud] ([Consecutivo], [Titulo], [Descripcion], [FechaRegistro], [FechaFinalizacion], [ConsecutivoUsuario], [ConsecutivoAdmin], [ConsecutivoEstado], [Solucion]) VALUES (12, N'Error al iniciar sesión después de actualizar las credenciales del usuario', N'El usuario reporta que después de actualizar su contraseña no puede ingresar al sistema. Al intentar autenticarse, se muestra un mensaje de credenciales inválidas aunque la información ingresada sea correcta.', CAST(N'2026-08-13T19:28:18.640' AS DateTime), CAST(N'2026-08-13T19:31:47.080' AS DateTime), 8, 9, 2, N'Solventado, era un error de permisos a nivel de AD')
GO
INSERT [dbo].[tbSolicitud] ([Consecutivo], [Titulo], [Descripcion], [FechaRegistro], [FechaFinalizacion], [ConsecutivoUsuario], [ConsecutivoAdmin], [ConsecutivoEstado], [Solucion]) VALUES (13, N'Lentitud general del sistema durante la consulta de información de usuarios', N'Se presenta una demora considerable al realizar búsquedas de usuarios. La pantalla permanece cargando durante varios segundos antes de mostrar los resultados, afectando el tiempo de respuesta esperado por los usuarios.', CAST(N'2026-08-13T19:29:15.720' AS DateTime), NULL, 8, 7, 1, NULL)
GO
INSERT [dbo].[tbSolicitud] ([Consecutivo], [Titulo], [Descripcion], [FechaRegistro], [FechaFinalizacion], [ConsecutivoUsuario], [ConsecutivoAdmin], [ConsecutivoEstado], [Solucion]) VALUES (14, N'Error al guardar la información ingresada en el formulario de registro', N'Al completar todos los campos obligatorios y seleccionar la opción de guardar, el sistema muestra un mensaje de error y no registra la información. El problema ocurre de manera intermitente con diferentes usuarios.', CAST(N'2026-08-13T19:29:34.767' AS DateTime), CAST(N'2026-08-13T19:29:55.643' AS DateTime), 8, 9, 3, N'Solicitud cancelada por el usuario')
GO
INSERT [dbo].[tbSolicitud] ([Consecutivo], [Titulo], [Descripcion], [FechaRegistro], [FechaFinalizacion], [ConsecutivoUsuario], [ConsecutivoAdmin], [ConsecutivoEstado], [Solucion]) VALUES (15, N'Fallo durante la generación y descarga de reportes en formato Excel', N'Los usuarios pueden consultar la información, pero al intentar generar el archivo Excel el sistema presenta un error. El reporte no se descarga y la pantalla permanece cargando durante varios segundos.', CAST(N'2026-08-13T19:36:02.197' AS DateTime), CAST(N'2026-08-13T20:59:01.967' AS DateTime), 8, 9, 2, N'Se atendió este desmadre')
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

ALTER TABLE [dbo].[tbMensaje]  WITH CHECK ADD  CONSTRAINT [FK_tbMensaje_Solicitud] FOREIGN KEY([ConsecutivoSolicitud])
REFERENCES [dbo].[tbSolicitud] ([Consecutivo])
GO
ALTER TABLE [dbo].[tbMensaje] CHECK CONSTRAINT [FK_tbMensaje_Solicitud]
GO

ALTER TABLE [dbo].[tbMensaje]  WITH CHECK ADD  CONSTRAINT [FK_tbMensaje_Usuario] FOREIGN KEY([ConsecutivoUsuario])
REFERENCES [dbo].[tbUsuario] ([Consecutivo])
GO
ALTER TABLE [dbo].[tbMensaje] CHECK CONSTRAINT [FK_tbMensaje_Usuario]
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

CREATE PROCEDURE [dbo].[spAtenderSolicitud]
    @ConsecutivoSolicitud  int,
    @ConsecutivoAdmin      int,
    @Solucion              varchar(max)
AS
BEGIN

    UPDATE  dbo.tbSolicitud
       SET  ConsecutivoEstado   = 2,
            FechaFinalizacion   = GETDATE(),
            Solucion            = @Solucion
     WHERE  Consecutivo         = @ConsecutivoSolicitud
        AND ConsecutivoAdmin    = @ConsecutivoAdmin
        AND ConsecutivoEstado   = 1

END
GO

CREATE PROCEDURE [dbo].[spCancelarSolicitudUsuario]
    @ConsecutivoSolicitud   int,
    @ConsecutivoUsuario     int
AS
BEGIN

    UPDATE  dbo.tbSolicitud
    SET     ConsecutivoEstado = 3,
            FechaFinalizacion = GETDATE(),
            Solucion          = 'Solicitud cancelada por el usuario'
    WHERE   Consecutivo         = @ConsecutivoSolicitud
        AND ConsecutivoUsuario  = @ConsecutivoUsuario
        AND ConsecutivoEstado   = 1

END
GO

CREATE PROCEDURE [dbo].[spConsultarMensajes]
    @ConsecutivoSolicitud  int
AS
BEGIN

    SELECT  M.Consecutivo,
            M.Mensaje,
            M.FechaHora,
            M.ConsecutivoUsuario,
            U.Nombre 'NombreUsuario'
    FROM    dbo.tbMensaje M
    INNER JOIN dbo.tbUsuario U ON M.ConsecutivoUsuario = U.Consecutivo
    WHERE   M.ConsecutivoSolicitud = @ConsecutivoSolicitud
    ORDER BY M.FechaHora

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

CREATE PROCEDURE [dbo].[spConsultarSolicitudesAbiertas]
    @ConsecutivoUsuario  int,
    @ConsecutivoRol      int
AS
BEGIN

    IF @ConsecutivoRol = 1
    BEGIN
        -- Solicitudes abiertas del usuario, con el nombre del soportista asignado
        SELECT  S.Consecutivo,
                S.Titulo,
                U.Nombre 'NombreInterlocutor'
        FROM    dbo.tbSolicitud S
        INNER JOIN dbo.tbUsuario U ON S.ConsecutivoAdmin = U.Consecutivo
        WHERE   S.ConsecutivoUsuario  = @ConsecutivoUsuario
            AND S.ConsecutivoEstado   = 1
    END
    ELSE
    BEGIN
        -- Solicitudes abiertas asignadas al soportista, con el nombre del usuario
        SELECT  S.Consecutivo,
                S.Titulo,
                U.Nombre 'NombreInterlocutor'
        FROM    dbo.tbSolicitud S
        INNER JOIN dbo.tbUsuario U ON S.ConsecutivoUsuario = U.Consecutivo
        WHERE   S.ConsecutivoAdmin  = @ConsecutivoUsuario
            AND S.ConsecutivoEstado = 1
    END

END
GO

CREATE PROCEDURE [dbo].[spConsultarSolicitudesAdmin]
    @ConsecutivoAdmin  int
AS
BEGIN

    SELECT  S.Consecutivo,
            S.Titulo,
            S.Descripcion,
            S.FechaRegistro,
            S.FechaFinalizacion,
            U.Nombre 'NombreUsuario',
            E.Nombre 'NombreEstado'
    FROM    dbo.tbSolicitud S
    INNER JOIN dbo.tbUsuario U ON S.ConsecutivoUsuario = U.Consecutivo
    INNER JOIN dbo.tbEstado E ON S.ConsecutivoEstado = E.Consecutivo
    WHERE   S.ConsecutivoAdmin = @ConsecutivoAdmin

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

CREATE PROCEDURE [dbo].[spObtenerInterlocutorSolicitud]
    @ConsecutivoSolicitud  int,
    @ConsecutivoUsuario    int
AS
BEGIN

    SELECT  CASE WHEN ConsecutivoUsuario = @ConsecutivoUsuario
                 THEN ConsecutivoAdmin
                 ELSE ConsecutivoUsuario
            END
    FROM    dbo.tbSolicitud
    WHERE   Consecutivo = @ConsecutivoSolicitud

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

CREATE PROCEDURE [dbo].[spRegistrarMensaje]
    @ConsecutivoUsuario    int,
    @ConsecutivoSolicitud  int,
    @Mensaje               nvarchar(max)
AS
BEGIN

    INSERT INTO dbo.tbMensaje(Mensaje, FechaHora, ConsecutivoUsuario, ConsecutivoSolicitud)
    VALUES (@Mensaje, GETDATE(), @ConsecutivoUsuario, @ConsecutivoSolicitud)

    SELECT SCOPE_IDENTITY() AS 'Consecutivo'

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
                                ConsecutivoUsuario,ConsecutivoAdmin,ConsecutivoEstado,Solucion)
    VALUES (@Titulo,@Descripcion,GETDATE(),NULL,@ConsecutivoUsuario,@ConsecutivoAdmin,1,NULL)


    SELECT SCOPE_IDENTITY() AS 'Consecutivo'

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

CREATE PROCEDURE [dbo].[spValidarAccesoSolicitud]
    @ConsecutivoSolicitud  int,
    @ConsecutivoUsuario    int
AS
BEGIN

    SELECT  COUNT(1)
    FROM    dbo.tbSolicitud
    WHERE   Consecutivo = @ConsecutivoSolicitud
        AND (ConsecutivoUsuario = @ConsecutivoUsuario OR ConsecutivoAdmin = @ConsecutivoUsuario)

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