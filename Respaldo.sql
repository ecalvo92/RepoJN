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
SET IDENTITY_INSERT [dbo].[tbProducto] OFF
GO

SET IDENTITY_INSERT [dbo].[tbUsuario] ON 
GO
INSERT [dbo].[tbUsuario] ([ConsecutivoUsuario], [Identificacion], [Nombre], [CorreoElectronico], [Contrasenna], [Estado], [ConsecutivoPerfil], [NombreComercial], [ImagenComercial]) VALUES (4, N'117710474', N'BRAYTON MACCOY ARTOLA', N'bmaccoy0474@ufide.ac.cr', N'SOFCEkEpmdc0M6jHsUvwKQ==', 1, 1, N'Microsoft', N'/empresas/')
GO
INSERT [dbo].[tbUsuario] ([ConsecutivoUsuario], [Identificacion], [Nombre], [CorreoElectronico], [Contrasenna], [Estado], [ConsecutivoPerfil], [NombreComercial], [ImagenComercial]) VALUES (5, N'305550650', N'JOHNNY FABIAN CASTILLO FALLAS', N'jcastillo50650@ufide.ac.cr', N'qvaCXOjOlWMez+4lOcGq9g==', 1, 1, N'SONY', N'/empresas/')
GO
INSERT [dbo].[tbUsuario] ([ConsecutivoUsuario], [Identificacion], [Nombre], [CorreoElectronico], [Contrasenna], [Estado], [ConsecutivoPerfil], [NombreComercial], [ImagenComercial]) VALUES (6, N'304590415', N'EDUARDO JOSE CALVO CASTILLO', N'ecalvo90415@ufide.ac.cr', N'dPSXBgbFVEcXsUyc/3MgDg==', 1, 2, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[tbUsuario] OFF
GO

ALTER TABLE [dbo].[tbProducto]  WITH CHECK ADD  CONSTRAINT [FK_tbProducto_tbUsuario] FOREIGN KEY([ConsecutivoUsuario])
REFERENCES [dbo].[tbUsuario] ([ConsecutivoUsuario])
GO
ALTER TABLE [dbo].[tbProducto] CHECK CONSTRAINT [FK_tbProducto_tbUsuario]
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

CREATE PROCEDURE [dbo].[ConsultarProductos]
	@ConsecutivoProducto INT,
    @ConsecutivoUsuario INT
AS
BEGIN

    IF @ConsecutivoProducto = 0
        SET @ConsecutivoProducto = NULL

      SELECT  ConsecutivoProducto,
              Nombre,
              Precio,
              Estado,
              Imagen,
              Descripcion
      FROM  dbo.tbProducto
      WHERE ConsecutivoProducto = ISNULL(@ConsecutivoProducto,ConsecutivoProducto)
        AND ConsecutivoUsuario = @ConsecutivoUsuario

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