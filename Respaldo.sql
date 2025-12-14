USE [master]
GO

CREATE DATABASE [BD_JN]
GO

USE [BD_JN]
GO

CREATE TABLE [dbo].[tbError](
	[ConsecutivoError] [int] IDENTITY(1,1) NOT NULL,
	[ConsecutivoUsuario] [int] NOT NULL,
	[Mensaje] [varchar](max) NOT NULL,
	[Origen] [varchar](50) NOT NULL,
	[FechaHora] [datetime] NOT NULL,
 CONSTRAINT [PK_tbError] PRIMARY KEY CLUSTERED 
(
	[ConsecutivoError] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbPerfil](
	[ConsecutivoPerfil] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
 CONSTRAINT [PK_tbPerfil] PRIMARY KEY CLUSTERED 
(
	[ConsecutivoPerfil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbProducto](
	[ConsecutivoProducto] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Descripcion] [varchar](2000) NOT NULL,
	[Precio] [decimal](10, 2) NOT NULL,
	[Estado] [bit] NOT NULL,
	[Imagen] [varchar](255) NOT NULL,
	[ConsecutivoUsuario] [int] NOT NULL,
 CONSTRAINT [PK_tbProducto] PRIMARY KEY CLUSTERED 
(
	[ConsecutivoProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbResenna](
	[ConsecutivoResenna] [int] IDENTITY(1,1) NOT NULL,
	[ConsecutivoUsuario] [int] NOT NULL,
	[ConsecutivoProducto] [int] NOT NULL,
	[Descripcion] [varchar](255) NOT NULL,
	[Calificacion] [int] NOT NULL,
	[Fecha] [datetime] NOT NULL,
 CONSTRAINT [PK_tbResenna] PRIMARY KEY CLUSTERED 
(
	[ConsecutivoResenna] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbUsuario](
	[ConsecutivoUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Identificacion] [varchar](15) NOT NULL,
	[Nombre] [varchar](255) NOT NULL,
	[CorreoElectronico] [varchar](100) NOT NULL,
	[Contrasenna] [varchar](100) NOT NULL,
	[Estado] [bit] NOT NULL,
	[ConsecutivoPerfil] [int] NOT NULL,
	[NombreComercial] [varchar](255) NULL,
	[ImagenComercial] [varchar](255) NULL,
 CONSTRAINT [PK_tbUsuario] PRIMARY KEY CLUSTERED 
(
	[ConsecutivoUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET IDENTITY_INSERT [dbo].[tbError] ON 
GO
INSERT [dbo].[tbError] ([ConsecutivoError], [ConsecutivoUsuario], [Mensaje], [Origen], [FechaHora]) VALUES (1, 0, N'Object reference not set to an instance of an object.', N'/api/Home/ValidarSesion', CAST(N'2025-11-20T20:51:46.167' AS DateTime))
GO
INSERT [dbo].[tbError] ([ConsecutivoError], [ConsecutivoUsuario], [Mensaje], [Origen], [FechaHora]) VALUES (2, 1, N'Object reference not set to an instance of an object.', N'/api/Producto/ConsultarProductos', CAST(N'2025-11-20T20:53:05.223' AS DateTime))
GO
INSERT [dbo].[tbError] ([ConsecutivoError], [ConsecutivoUsuario], [Mensaje], [Origen], [FechaHora]) VALUES (3, 4, N'Procedure or function ''ConsultarProductos'' expects parameter ''@ConsecutivoUsuario'', which was not supplied.', N'/api/Producto/ConsultarProductos', CAST(N'2025-11-27T20:34:30.627' AS DateTime))
GO
INSERT [dbo].[tbError] ([ConsecutivoError], [ConsecutivoUsuario], [Mensaje], [Origen], [FechaHora]) VALUES (4, 4, N'Could not find stored procedure ''AdminResponse''.', N'/api/Admin/Peores', CAST(N'2025-12-14T08:27:00.947' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[tbError] OFF
GO

SET IDENTITY_INSERT [dbo].[tbPerfil] ON 
GO
INSERT [dbo].[tbPerfil] ([ConsecutivoPerfil], [Nombre]) VALUES (1, N'Usuario Administrador')
GO
INSERT [dbo].[tbPerfil] ([ConsecutivoPerfil], [Nombre]) VALUES (2, N'Usuario Regular')
GO
SET IDENTITY_INSERT [dbo].[tbPerfil] OFF
GO

SET IDENTITY_INSERT [dbo].[tbProducto] ON 
GO
INSERT [dbo].[tbProducto] ([ConsecutivoProducto], [Nombre], [Descripcion], [Precio], [Estado], [Imagen], [ConsecutivoUsuario]) VALUES (1, N'Play 5', N'PlayStation', CAST(500.00 AS Decimal(10, 2)), 1, N'/imagenes/', 5)
GO
INSERT [dbo].[tbProducto] ([ConsecutivoProducto], [Nombre], [Descripcion], [Precio], [Estado], [Imagen], [ConsecutivoUsuario]) VALUES (2, N'Echo Dot MS', N'Conocidos como Alexas', CAST(120.00 AS Decimal(10, 2)), 1, N'/imagenes/', 4)
GO
INSERT [dbo].[tbProducto] ([ConsecutivoProducto], [Nombre], [Descripcion], [Precio], [Estado], [Imagen], [ConsecutivoUsuario]) VALUES (3, N'Play 5.1', N'PlayStation', CAST(600.00 AS Decimal(10, 2)), 1, N'/imagenes/', 4)
GO
INSERT [dbo].[tbProducto] ([ConsecutivoProducto], [Nombre], [Descripcion], [Precio], [Estado], [Imagen], [ConsecutivoUsuario]) VALUES (4, N'Play 5.2', N'PlayStation', CAST(700.00 AS Decimal(10, 2)), 1, N'/imagenes/', 4)
GO
INSERT [dbo].[tbProducto] ([ConsecutivoProducto], [Nombre], [Descripcion], [Precio], [Estado], [Imagen], [ConsecutivoUsuario]) VALUES (5, N'Play 5.3', N'PlayStation', CAST(800.00 AS Decimal(10, 2)), 1, N'/imagenes/', 4)
GO
INSERT [dbo].[tbProducto] ([ConsecutivoProducto], [Nombre], [Descripcion], [Precio], [Estado], [Imagen], [ConsecutivoUsuario]) VALUES (6, N'Play 5.4', N'PlayStation', CAST(90.00 AS Decimal(10, 2)), 1, N'/imagenes/', 4)
GO
INSERT [dbo].[tbProducto] ([ConsecutivoProducto], [Nombre], [Descripcion], [Precio], [Estado], [Imagen], [ConsecutivoUsuario]) VALUES (7, N'Play 5.5', N'PlayStation', CAST(1000.00 AS Decimal(10, 2)), 1, N'/imagenes/', 4)
GO
INSERT [dbo].[tbProducto] ([ConsecutivoProducto], [Nombre], [Descripcion], [Precio], [Estado], [Imagen], [ConsecutivoUsuario]) VALUES (8, N'Play 5.6', N'PlayStation', CAST(1100.00 AS Decimal(10, 2)), 1, N'/imagenes/', 4)
GO
INSERT [dbo].[tbProducto] ([ConsecutivoProducto], [Nombre], [Descripcion], [Precio], [Estado], [Imagen], [ConsecutivoUsuario]) VALUES (9, N'Play 5.7', N'PlayStation', CAST(1200.00 AS Decimal(10, 2)), 1, N'/imagenes/', 4)
GO
SET IDENTITY_INSERT [dbo].[tbProducto] OFF
GO

SET IDENTITY_INSERT [dbo].[tbResenna] ON 
GO
INSERT [dbo].[tbResenna] ([ConsecutivoResenna], [ConsecutivoUsuario], [ConsecutivoProducto], [Descripcion], [Calificacion], [Fecha]) VALUES (1, 6, 6, N'Es una buena promoción, excelente.', 3, CAST(N'2025-12-14T08:28:48.033' AS DateTime))
GO
INSERT [dbo].[tbResenna] ([ConsecutivoResenna], [ConsecutivoUsuario], [ConsecutivoProducto], [Descripcion], [Calificacion], [Fecha]) VALUES (2, 6, 6, N'No se vale, ayer lo compré en 600 dólares...', 1, CAST(N'2024-12-10T08:29:36.930' AS DateTime))
GO
INSERT [dbo].[tbResenna] ([ConsecutivoResenna], [ConsecutivoUsuario], [ConsecutivoProducto], [Descripcion], [Calificacion], [Fecha]) VALUES (3, 6, 3, N'', 3, CAST(N'2025-12-14T08:31:30.293' AS DateTime))
GO
INSERT [dbo].[tbResenna] ([ConsecutivoResenna], [ConsecutivoUsuario], [ConsecutivoProducto], [Descripcion], [Calificacion], [Fecha]) VALUES (4, 6, 4, N'', 2, CAST(N'2025-12-14T08:31:32.520' AS DateTime))
GO
INSERT [dbo].[tbResenna] ([ConsecutivoResenna], [ConsecutivoUsuario], [ConsecutivoProducto], [Descripcion], [Calificacion], [Fecha]) VALUES (5, 6, 5, N'', 3, CAST(N'2025-12-14T08:31:34.867' AS DateTime))
GO
INSERT [dbo].[tbResenna] ([ConsecutivoResenna], [ConsecutivoUsuario], [ConsecutivoProducto], [Descripcion], [Calificacion], [Fecha]) VALUES (6, 6, 5, N'', 3, CAST(N'2025-12-14T08:31:38.200' AS DateTime))
GO
INSERT [dbo].[tbResenna] ([ConsecutivoResenna], [ConsecutivoUsuario], [ConsecutivoProducto], [Descripcion], [Calificacion], [Fecha]) VALUES (7, 6, 5, N'', 3, CAST(N'2025-12-14T08:31:42.133' AS DateTime))
GO
INSERT [dbo].[tbResenna] ([ConsecutivoResenna], [ConsecutivoUsuario], [ConsecutivoProducto], [Descripcion], [Calificacion], [Fecha]) VALUES (8, 6, 8, N'', 1, CAST(N'2025-12-14T08:31:44.820' AS DateTime))
GO
INSERT [dbo].[tbResenna] ([ConsecutivoResenna], [ConsecutivoUsuario], [ConsecutivoProducto], [Descripcion], [Calificacion], [Fecha]) VALUES (9, 6, 8, N'', 1, CAST(N'2025-12-14T08:31:47.233' AS DateTime))
GO
INSERT [dbo].[tbResenna] ([ConsecutivoResenna], [ConsecutivoUsuario], [ConsecutivoProducto], [Descripcion], [Calificacion], [Fecha]) VALUES (10, 6, 8, N'', 1, CAST(N'2025-12-14T08:31:49.313' AS DateTime))
GO
INSERT [dbo].[tbResenna] ([ConsecutivoResenna], [ConsecutivoUsuario], [ConsecutivoProducto], [Descripcion], [Calificacion], [Fecha]) VALUES (11, 6, 8, N'', 1, CAST(N'2025-12-14T08:31:51.323' AS DateTime))
GO
INSERT [dbo].[tbResenna] ([ConsecutivoResenna], [ConsecutivoUsuario], [ConsecutivoProducto], [Descripcion], [Calificacion], [Fecha]) VALUES (12, 6, 7, N'', 1, CAST(N'2025-12-14T08:31:53.390' AS DateTime))
GO
INSERT [dbo].[tbResenna] ([ConsecutivoResenna], [ConsecutivoUsuario], [ConsecutivoProducto], [Descripcion], [Calificacion], [Fecha]) VALUES (13, 6, 9, N'', 1, CAST(N'2025-12-14T08:31:55.593' AS DateTime))
GO
INSERT [dbo].[tbResenna] ([ConsecutivoResenna], [ConsecutivoUsuario], [ConsecutivoProducto], [Descripcion], [Calificacion], [Fecha]) VALUES (14, 6, 6, N'', 3, CAST(N'2025-12-14T08:31:58.407' AS DateTime))
GO
INSERT [dbo].[tbResenna] ([ConsecutivoResenna], [ConsecutivoUsuario], [ConsecutivoProducto], [Descripcion], [Calificacion], [Fecha]) VALUES (15, 6, 2, N'', 3, CAST(N'2025-12-14T08:32:01.007' AS DateTime))
GO
INSERT [dbo].[tbResenna] ([ConsecutivoResenna], [ConsecutivoUsuario], [ConsecutivoProducto], [Descripcion], [Calificacion], [Fecha]) VALUES (16, 6, 3, N'', 3, CAST(N'2025-12-14T08:32:04.500' AS DateTime))
GO
INSERT [dbo].[tbResenna] ([ConsecutivoResenna], [ConsecutivoUsuario], [ConsecutivoProducto], [Descripcion], [Calificacion], [Fecha]) VALUES (17, 6, 4, N'', 3, CAST(N'2025-12-14T08:32:07.493' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[tbResenna] OFF
GO

SET IDENTITY_INSERT [dbo].[tbUsuario] ON 
GO
INSERT [dbo].[tbUsuario] ([ConsecutivoUsuario], [Identificacion], [Nombre], [CorreoElectronico], [Contrasenna], [Estado], [ConsecutivoPerfil], [NombreComercial], [ImagenComercial]) VALUES (4, N'117710474', N'BRAYTON MACCOY ARTOLA', N'bmaccoy0474@ufide.ac.cr', N'SOFCEkEpmdc0M6jHsUvwKQ==', 1, 1, N'Microsoft', N'/empresas/')
GO
INSERT [dbo].[tbUsuario] ([ConsecutivoUsuario], [Identificacion], [Nombre], [CorreoElectronico], [Contrasenna], [Estado], [ConsecutivoPerfil], [NombreComercial], [ImagenComercial]) VALUES (5, N'305550650', N'JOHNNY FABIAN CASTILLO FALLAS', N'jcastillo50650@ufide.ac.cr', N'qvaCXOjOlWMez+4lOcGq9g==', 1, 1, N'SONY', N'/empresas/')
GO
INSERT [dbo].[tbUsuario] ([ConsecutivoUsuario], [Identificacion], [Nombre], [CorreoElectronico], [Contrasenna], [Estado], [ConsecutivoPerfil], [NombreComercial], [ImagenComercial]) VALUES (6, N'304590415', N'EDUARDO JOSE CALVO CASTILLO', N'ecalvo90415@ufide.ac.cr', N'dPSXBgbFVEcXsUyc/3MgDg==', 1, 2, NULL, NULL)
GO
INSERT [dbo].[tbUsuario] ([ConsecutivoUsuario], [Identificacion], [Nombre], [CorreoElectronico], [Contrasenna], [Estado], [ConsecutivoPerfil], [NombreComercial], [ImagenComercial]) VALUES (7, N'304590416', N'FRANCINI DE LOS ANGELES ROMERO ARAYA', N'ecalvo90416@ufide.ac.cr', N'+sukSIHuC24UnTkqq8VKDQ==', 1, 1, N'90416 SA', N'/empresas/')
GO
INSERT [dbo].[tbUsuario] ([ConsecutivoUsuario], [Identificacion], [Nombre], [CorreoElectronico], [Contrasenna], [Estado], [ConsecutivoPerfil], [NombreComercial], [ImagenComercial]) VALUES (8, N'304590417', N'MERCEDES FRANCISCA MAROTO HERNANDEZ', N'ecalvo90417@ufide.ac.cr', N'gmS8S0S7ufhxPQocCl+GWA==', 1, 1, N'90417 SA', N'/empresas/')
GO
INSERT [dbo].[tbUsuario] ([ConsecutivoUsuario], [Identificacion], [Nombre], [CorreoElectronico], [Contrasenna], [Estado], [ConsecutivoPerfil], [NombreComercial], [ImagenComercial]) VALUES (9, N'304590418', N'JESUS ALBERTO NUÑEZ MOYA', N'ecalvo90418@ufide.ac.cr', N'ZZms9o9trkbdluhdMDdDzw==', 1, 1, N'90418 SA', N'/empresas/')
GO
INSERT [dbo].[tbUsuario] ([ConsecutivoUsuario], [Identificacion], [Nombre], [CorreoElectronico], [Contrasenna], [Estado], [ConsecutivoPerfil], [NombreComercial], [ImagenComercial]) VALUES (10, N'304590419', N'90419', N'90419', N'90419', 1, 1, N'90419 SA', N'/empresas/')
GO
SET IDENTITY_INSERT [dbo].[tbUsuario] OFF
GO

ALTER TABLE [dbo].[tbProducto]  WITH CHECK ADD  CONSTRAINT [FK_tbProducto_tbUsuario] FOREIGN KEY([ConsecutivoUsuario])
REFERENCES [dbo].[tbUsuario] ([ConsecutivoUsuario])
GO
ALTER TABLE [dbo].[tbProducto] CHECK CONSTRAINT [FK_tbProducto_tbUsuario]
GO

ALTER TABLE [dbo].[tbResenna]  WITH CHECK ADD  CONSTRAINT [FK_tbResenna_tbProducto] FOREIGN KEY([ConsecutivoProducto])
REFERENCES [dbo].[tbProducto] ([ConsecutivoProducto])
GO
ALTER TABLE [dbo].[tbResenna] CHECK CONSTRAINT [FK_tbResenna_tbProducto]
GO

ALTER TABLE [dbo].[tbResenna]  WITH CHECK ADD  CONSTRAINT [FK_tbResenna_tbResenna] FOREIGN KEY([ConsecutivoUsuario])
REFERENCES [dbo].[tbUsuario] ([ConsecutivoUsuario])
GO
ALTER TABLE [dbo].[tbResenna] CHECK CONSTRAINT [FK_tbResenna_tbResenna]
GO

ALTER TABLE [dbo].[tbUsuario]  WITH CHECK ADD  CONSTRAINT [FK_tbUsuario_tbPerfil] FOREIGN KEY([ConsecutivoPerfil])
REFERENCES [dbo].[tbPerfil] ([ConsecutivoPerfil])
GO
ALTER TABLE [dbo].[tbUsuario] CHECK CONSTRAINT [FK_tbUsuario_tbPerfil]
GO

CREATE PROCEDURE [dbo].[ActualizarContrasenna]
	@ConsecutivoUsuario INT,
    @Contrasenna VARCHAR(100)
AS
BEGIN

   UPDATE   dbo.tbUsuario
   SET      Contrasenna = @Contrasenna
   WHERE	ConsecutivoUsuario = @ConsecutivoUsuario

END
GO

CREATE PROCEDURE [dbo].[ActualizarEmpresa]
	@ConsecutivoUsuario INT,
    @NombreComercial VARCHAR(100),
    @ImagenComercial VARCHAR(255)
AS
BEGIN

    UPDATE dbo.tbUsuario
       SET NombreComercial = @NombreComercial,
           ImagenComercial = @ImagenComercial
     WHERE ConsecutivoUsuario = @ConsecutivoUsuario

END
GO

CREATE PROCEDURE [dbo].[ActualizarPerfil]
	@ConsecutivoUsuario INT,
    @Identificacion VARCHAR(15),
	@Nombre VARCHAR(255),
	@CorreoElectronico VARCHAR(100)
AS
BEGIN

   UPDATE   dbo.tbUsuario
   SET      Identificacion = @Identificacion,
			Nombre = @Nombre,
			CorreoElectronico = @CorreoElectronico
   WHERE	ConsecutivoUsuario = @ConsecutivoUsuario

END
GO

CREATE PROCEDURE [dbo].[ActualizarProducto]
	@ConsecutivoProducto INT,
    @Nombre VARCHAR(100),
    @Descripcion VARCHAR(2000),
    @Precio DECIMAL(10,2),
    @Imagen VARCHAR(255),
    @ConsecutivoUsuario INT
AS
BEGIN

    UPDATE dbo.tbProducto
       SET Nombre = @Nombre,
           Descripcion = @Descripcion,
           Precio = @Precio,
           Imagen = @Imagen
     WHERE ConsecutivoProducto = @ConsecutivoProducto
        AND ConsecutivoUsuario = @ConsecutivoUsuario

END
GO

CREATE PROCEDURE [dbo].[CalificarProducto]
	@ConsecutivoProducto int,
	@RatingValue int,
	@Resenna varchar(255),
	@ConsecutivoUsuario int
AS
BEGIN

    INSERT INTO dbo.tbResenna (ConsecutivoUsuario,ConsecutivoProducto,Descripcion,Calificacion,Fecha)
    VALUES (@ConsecutivoUsuario,@ConsecutivoProducto,@Resenna,@RatingValue,GETDATE())

END
GO

CREATE PROCEDURE [dbo].[CambiarEstadoProducto]
	@ConsecutivoProducto INT,
	@ConsecutivoUsuario INT
AS
BEGIN
	
	UPDATE	tbProducto
	SET		Estado = CASE WHEN Estado = 1 THEN 0 ELSE 1 END
	WHERE	ConsecutivoProducto = @ConsecutivoProducto
		AND ConsecutivoUsuario = @ConsecutivoUsuario

END
GO

CREATE PROCEDURE [dbo].[CantidadProductos]
    @ConsecutivoUsuario INT
AS
BEGIN

    SELECT  COUNT(*) 'Cantidad'
    FROM    tbProducto
    WHERE   ConsecutivoUsuario = @ConsecutivoUsuario
        AND Estado = 1

END
GO

CREATE PROCEDURE [dbo].[CantidadResennas]
    @ConsecutivoUsuario INT
AS
BEGIN

    SELECT  COUNT(*) 'Cantidad'
    FROM    tbResenna R
    INNER   JOIN tbProducto P ON R.ConsecutivoProducto = P.ConsecutivoProducto
    WHERE   P.ConsecutivoUsuario = @ConsecutivoUsuario
        AND P.Estado = 1
        AND R.Fecha BETWEEN DATEADD(YEAR, -1, GETDATE()) AND GETDATE()
        AND R.Calificacion != 2

END
GO

CREATE PROCEDURE [dbo].[ConsultarProductos]
	@ConsecutivoProducto INT,
    @ConsecutivoUsuario INT
AS
BEGIN

    IF @ConsecutivoProducto = 0
        SET @ConsecutivoProducto = NULL

      SELECT  ConsecutivoProducto,
              P.Nombre,
              Precio,
              P.Estado,
              Imagen,
              Descripcion,
              U.NombreComercial
      FROM  dbo.tbProducto P
      INNER JOIN dbo.tbUsuario U ON P.ConsecutivoUsuario = U.ConsecutivoUsuario
      WHERE ConsecutivoProducto = ISNULL(@ConsecutivoProducto,ConsecutivoProducto)
        AND P.ConsecutivoUsuario = @ConsecutivoUsuario

END
GO

CREATE PROCEDURE [dbo].[ConsultarUsuario]
	@ConsecutivoUsuario INT
AS
BEGIN

    SELECT  ConsecutivoUsuario,
            Identificacion,
            U.Nombre,
            CorreoElectronico,
            Contrasenna,
            Estado,
            U.ConsecutivoPerfil,
            P.Nombre 'NombrePerfil',
            U.NombreComercial,
            U.ImagenComercial
      FROM  dbo.tbUsuario U
      INNER JOIN dbo.tbPerfil P ON U.ConsecutivoPerfil = P.ConsecutivoPerfil
      WHERE ConsecutivoUsuario = @ConsecutivoUsuario

END
GO

CREATE PROCEDURE [dbo].[ConsultarUsuarios]

AS
BEGIN

    SELECT  ConsecutivoUsuario,
            Identificacion,
            U.Nombre,
            CorreoElectronico,
            Contrasenna,
            Estado,
            U.ConsecutivoPerfil,
            P.Nombre 'NombrePerfil',
            U.NombreComercial,
            U.ImagenComercial
      FROM  dbo.tbUsuario U
      INNER JOIN dbo.tbPerfil P ON U.ConsecutivoPerfil = P.ConsecutivoPerfil
      WHERE U.Estado = 1
        AND U.ConsecutivoPerfil = 1

END
GO

CREATE PROCEDURE [dbo].[Mejores]
    @ConsecutivoUsuario INT
AS
BEGIN

    SELECT  TOP 5
            COUNT(*) 'Cantidad',
            P.Nombre,
            P.Precio
    FROM    tbResenna R
    INNER   JOIN tbProducto P ON R.ConsecutivoProducto = P.ConsecutivoProducto
    WHERE   P.ConsecutivoUsuario = @ConsecutivoUsuario
        AND Calificacion = 3
        AND R.Fecha BETWEEN DATEADD(YEAR, -1, GETDATE()) AND GETDATE()
    GROUP BY P.Nombre, P.Precio
    ORDER BY COUNT(*) DESC

END
GO

CREATE PROCEDURE [dbo].[Peores]
    @ConsecutivoUsuario INT
AS
BEGIN

    SELECT  TOP 5
            COUNT(*) 'Cantidad',
            P.Nombre,
            P.Precio
    FROM    tbResenna R
    INNER   JOIN tbProducto P ON R.ConsecutivoProducto = P.ConsecutivoProducto
    WHERE   P.ConsecutivoUsuario = @ConsecutivoUsuario
        AND Calificacion = 1
        AND R.Fecha BETWEEN DATEADD(YEAR, -1, GETDATE()) AND GETDATE()
    GROUP BY P.Nombre, P.Precio
    ORDER BY COUNT(*) DESC

END
GO

CREATE PROCEDURE [dbo].[RegistrarError]
	@ConsecutivoUsuario INT,
    @MensajeError VARCHAR(MAX),
    @OrigenError VARCHAR(50)
AS
BEGIN

    INSERT INTO dbo.tbError (ConsecutivoUsuario,Mensaje,Origen,FechaHora)
    VALUES (@ConsecutivoUsuario, @MensajeError, @OrigenError, GETDATE())

END
GO

CREATE PROCEDURE [dbo].[Registro]
	@Identificacion VARCHAR(15),
    @Nombre VARCHAR(255),
    @CorreoElectronico VARCHAR(100),
    @Contrasenna VARCHAR(100)
AS
BEGIN

    DECLARE @EstadoActivo BIT = 1
    DECLARE @PerfilRegular INT = 2

    IF NOT EXISTS(SELECT 1 FROM tbUsuario
        WHERE   Identificacion = @Identificacion
            OR CorreoElectronico = @CorreoElectronico)
    BEGIN
	
        INSERT INTO dbo.tbUsuario (Identificacion,Nombre,CorreoElectronico,Contrasenna,Estado,ConsecutivoPerfil)
        VALUES (@Identificacion,@Nombre,@CorreoElectronico,@Contrasenna,@EstadoActivo,@PerfilRegular)

    END

END
GO

CREATE PROCEDURE [dbo].[RegistroProducto]
	@Nombre VARCHAR(100),
    @Descripcion VARCHAR(2000),
    @Precio DECIMAL(10,2),
    @Imagen VARCHAR(255),
    @ConsecutivoUsuario INT
AS
BEGIN

    DECLARE @EstadoActivo BIT = 1

    IF NOT EXISTS(SELECT 1 FROM tbProducto
        WHERE   Nombre = @Nombre)
    BEGIN
	
        INSERT INTO dbo.tbProducto (Nombre,Descripcion,Precio,Estado,Imagen,ConsecutivoUsuario)
        VALUES (@Nombre, @Descripcion, @Precio, @EstadoActivo, @Imagen, @ConsecutivoUsuario)

        SELECT @@IDENTITY 'ConsecutivoProducto'

    END

    SELECT 0 'ConsecutivoProducto'

END
GO

CREATE PROCEDURE [dbo].[ValidarSesion]
	@CorreoElectronico VARCHAR(100),
    @Contrasenna VARCHAR(100)
AS
BEGIN

    SELECT  ConsecutivoUsuario,
            Identificacion,
            U.Nombre,
            CorreoElectronico,
            Contrasenna,
            Estado,
            U.ConsecutivoPerfil,
            P.Nombre 'NombrePerfil'
      FROM  dbo.tbUsuario U
      INNER JOIN dbo.tbPerfil P ON U.ConsecutivoPerfil = P.ConsecutivoPerfil
      WHERE CorreoElectronico = @CorreoElectronico
        AND Contrasenna = @Contrasenna
        AND Estado = 1

END
GO

CREATE PROCEDURE [dbo].[ValidarUsuario]
	@CorreoElectronico VARCHAR(100)
AS
BEGIN

    SELECT  ConsecutivoUsuario,
            Identificacion,
            Nombre,
            CorreoElectronico,
            Contrasenna,
            Estado,
            ConsecutivoPerfil
      FROM  dbo.tbUsuario
      WHERE CorreoElectronico = @CorreoElectronico
        AND Estado = 1

END
GO
