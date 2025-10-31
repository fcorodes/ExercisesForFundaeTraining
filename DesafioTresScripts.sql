DesafioTres


---------------------------------------
---- TABLE CATEGORY esquema y datos ---
---------------------------------------

USE [BaseDatosDesafioTres]
GO
/****** Object:  Table [dbo].[category]    Script Date: 31/10/2025 09:31:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[CategoryId] [int] NOT NULL,
	[CategoryDesc] [nvarchar](max) NULL,
 CONSTRAINT [PK_category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[category] ([CategoryId], [CategoryDesc]) VALUES (1, N'CategoriaPremium')
GO
INSERT [dbo].[category] ([CategoryId], [CategoryDesc]) VALUES (2, N'CategoriaMedium')
GO
INSERT [dbo].[category] ([CategoryId], [CategoryDesc]) VALUES (3, N'CategoriaBaja')
GO


SELECT TOP (1000) [CategoryId]
      ,[CategoryDesc]
  FROM [BaseDatosDesafioTres].[dbo].[category]


CategoryId	CategoryDesc
1	CategoriaPremium
2	CategoriaMedium
3	CategoriaBaja


---------------------------------------
---- TABLE PRODUCTOS esquema y datos ---
---------------------------------------

USE [BaseDatosDesafioTres]
GO
/****** Object:  Table [dbo].[products]    Script Date: 31/10/2025 09:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[productId] [int] IDENTITY(1,1) NOT NULL,
	[productName] [nvarchar](max) NOT NULL,
	[productDescription] [nvarchar](max) NOT NULL,
	[productStock] [int] NOT NULL,
	[productPrice] [numeric](18, 0) NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_products] PRIMARY KEY CLUSTERED 
(
	[productId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[products] ON 
GO
INSERT [dbo].[products] ([productId], [productName], [productDescription], [productStock], [productPrice], [CategoryId]) VALUES (4, N'Melones', N'Las mejores melones del mundo', 400, CAST(3 AS Numeric(18, 0)), 1)
GO
INSERT [dbo].[products] ([productId], [productName], [productDescription], [productStock], [productPrice], [CategoryId]) VALUES (5, N'Limones', N'Las mejores limones del mundo', 300, CAST(7 AS Numeric(18, 0)), 1)
GO
INSERT [dbo].[products] ([productId], [productName], [productDescription], [productStock], [productPrice], [CategoryId]) VALUES (6, N'Naranjas medianas', N'Las naranjas medianas', 500, CAST(20 AS Numeric(18, 0)), 2)
GO
INSERT [dbo].[products] ([productId], [productName], [productDescription], [productStock], [productPrice], [CategoryId]) VALUES (7, N'Melones medianos', N'Los melones medianos', 400, CAST(2 AS Numeric(18, 0)), 2)
GO
INSERT [dbo].[products] ([productId], [productName], [productDescription], [productStock], [productPrice], [CategoryId]) VALUES (8, N'Limones medianos', N'Los limones medianos', 1500, CAST(5 AS Numeric(18, 0)), 2)
GO
INSERT [dbo].[products] ([productId], [productName], [productDescription], [productStock], [productPrice], [CategoryId]) VALUES (9, N'Limones restos', N'Los limones con taras', 13500, CAST(2 AS Numeric(18, 0)), 3)
GO
SET IDENTITY_INSERT [dbo].[products] OFF
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [FK_products_category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[category] ([CategoryId])
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [FK_products_category]
GO



SELECT TOP (1000) [productId]
      ,[productName]
      ,[productDescription]
      ,[productStock]
      ,[productPrice]
      ,[CategoryId]
  FROM [BaseDatosDesafioTres].[dbo].[products]


productId	productName	productDescription	productStock	productPrice	CategoryId
4	Melones	Las mejores melones del mundo	400	3	1
5	Limones	Las mejores limones del mundo	300	7	1
6	Naranjas medianas	Las naranjas medianas	500	20	2
7	Melones medianos	Los melones medianos	400	2	2
8	Limones medianos	Los limones medianos	1500	5	2
9	Limones restos	Los limones con taras	13500	2	3







---------------------------------------
---- TABLE clientes esquema y datos ---
---------------------------------------

USE [BaseDatosDesafioTres]
GO
/****** Object:  Table [dbo].[clients]    Script Date: 31/10/2025 09:55:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clients](
	[ClientId] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [nvarchar](max) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ZipCode] [int] NOT NULL,
	[Place] [nvarchar](max) NOT NULL,
	[shippingAddress] [nvarchar](max) NOT NULL,
	[TelephoneNumber] [int] NOT NULL,
 CONSTRAINT [PK_clients] PRIMARY KEY CLUSTERED 
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[clients] ON 
GO
INSERT [dbo].[clients] ([ClientId], [Surname], [Name], [ZipCode], [Place], [shippingAddress], [TelephoneNumber]) VALUES (1, N'Perez', N'Hanna', 45001, N'Place1', N'shippingAddress1', 666666666)
GO
INSERT [dbo].[clients] ([ClientId], [Surname], [Name], [ZipCode], [Place], [shippingAddress], [TelephoneNumber]) VALUES (2, N'Martinez', N'Pedro', 97001, N'Place2', N'shippingAddress2', 777777777)
GO
SET IDENTITY_INSERT [dbo].[clients] OFF
GO
/****** Object:  Index [IX_clients]    Script Date: 31/10/2025 09:55:13 ******/
ALTER TABLE [dbo].[clients] ADD  CONSTRAINT [IX_clients] UNIQUE NONCLUSTERED 
(
	[TelephoneNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO



SELECT TOP (1000) [ClientId]
      ,[Surname]
      ,[Name]
      ,[ZipCode]
      ,[Place]
      ,[shippingAddress]
      ,[TelephoneNumber]
  FROM [BaseDatosDesafioTres].[dbo].[clients]


ClientId	Surname	Name	ZipCode	Place	shippingAddress	TelephoneNumber
1	Perez	Hanna	45001	Place1	shippingAddress1	666666666
2	Martinez	Pedro	97001	Place2	shippingAddress2	777777777




---------------------------------------
---- TABLE PRODUCTOS esquema y datos ---
---------------------------------------

USE [BaseDatosDesafioTres]
GO
/****** Object:  Table [dbo].[details]    Script Date: 31/10/2025 10:03:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[details](
	[DetailId] [int] NOT NULL,
	[OrderDate] [date] NOT NULL,
	[OrderTime] [time](7) NOT NULL,
	[Notes] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_details] PRIMARY KEY CLUSTERED 
(
	[DetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[details] ([DetailId], [OrderDate], [OrderTime], [Notes]) VALUES (1, CAST(N'2025-10-31' AS Date), CAST(N'10:01:03' AS Time), N'Detalle del primer pedido')
GO
INSERT [dbo].[details] ([DetailId], [OrderDate], [OrderTime], [Notes]) VALUES (2, CAST(N'2024-12-31' AS Date), CAST(N'12:31:34' AS Time), N'Detalle del segundo pedido')
GO


SELECT TOP (1000) [DetailId]
      ,[OrderDate]
      ,[OrderTime]
      ,[Notes]
  FROM [BaseDatosDesafioTres].[dbo].[details]



DetailId	OrderDate	OrderTime	Notes
1	2025-10-31	10:01:03.0000000	Detalle del primer pedido
2	2024-12-31	12:31:34.0000000	Detalle del segundo pedido



---------------------------------------
---- TABLE ordenes esquema y datos ---
---------------------------------------


USE [BaseDatosDesafioTres]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 31/10/2025 10:09:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[productId] [int] NOT NULL,
	[ClientId] [int] NOT NULL,
	[DetailId] [int] NOT NULL,
	[UdsResquested] [int] NOT NULL,
 CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[orders] ON 
GO
INSERT [dbo].[orders] ([OrderId], [productId], [ClientId], [DetailId], [UdsResquested]) VALUES (5, 4, 2, 1, 1)
GO
INSERT [dbo].[orders] ([OrderId], [productId], [ClientId], [DetailId], [UdsResquested]) VALUES (6, 5, 1, 2, 10)
GO
INSERT [dbo].[orders] ([OrderId], [productId], [ClientId], [DetailId], [UdsResquested]) VALUES (7, 5, 2, 2, 50)
GO
INSERT [dbo].[orders] ([OrderId], [productId], [ClientId], [DetailId], [UdsResquested]) VALUES (8, 5, 2, 2, 500)
GO
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_clients] FOREIGN KEY([ClientId])
REFERENCES [dbo].[clients] ([ClientId])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_clients]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_details] FOREIGN KEY([DetailId])
REFERENCES [dbo].[details] ([DetailId])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_details]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_products] FOREIGN KEY([productId])
REFERENCES [dbo].[products] ([productId])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_products]
GO



SELECT TOP (1000) [OrderId]
      ,[productId]
      ,[ClientId]
      ,[DetailId]
      ,[UdsResquested]
  FROM [BaseDatosDesafioTres].[dbo].[orders]


OrderId	productId	ClientId	DetailId	UdsResquested
5	4	2	1	1
7	5	2	2	50
8	5	2	2	500



---------------------------------------
---------------------------------------
------ queries simples ------ 
---------------------------------------


  select * 
  from orders a, details b
   where a.productId = 4
  and a.DetailId = b.DetailId


OrderId	productId	ClientId	DetailId	UdsResquested	DetailId	OrderDate	OrderTime	Notes
5	4	2	1	1	1	2025-10-31	10:01:03.0000000	Detalle del primer pedido




  select a.productName, a.productDescription
  from products a
  inner join category b
  on a.CategoryId = b.CategoryId



productName	productDescription
Melones	Las mejores melones del mundo
Limones	Las mejores limones del mundo
Naranjas medianas	Las naranjas medianas
Melones medianos	Los melones medianos
Limones medianos	Los limones medianos
Limones restos	Los limones con taras




prodecimiento almacenado

CREATE PROCEDURE pr_Names 
    ( @VarNombre nvarchar(50) = NULL)
   AS
   BEGIN
      -- The print statement returns text to the user
      PRINT 'los productos que estan dados de alta en la base de datos son ' + @VarNombre ;
      -- A second statement starts here
      SELECT a.ProductName, b.CategoryDesc FROM products a, category b
            WHERE a.productName = '%' + @VarNombre + '%' and a.CategoryId = b.CategoryId
   END
GO



-------------------------------------------------------------
--------- Automatización de creación de informe -------------
-------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE pr_Names 
    ( @VarNombre nvarchar(50) = NULL)
   AS
   BEGIN
      -- The print statement returns text to the user
      PRINT 'los productos que están dados de alta en la base de datos son ' + @VarNombre ;
      -- A second statement starts here
      SELECT a.ProductName, b.CategoryDesc FROM products a, category b
            WHERE a.productName like @VarNombre + '%' and a.CategoryId = b.CategoryId

   END
GO


-------------------------------------------------------------
--------- ejecución -----------------------------------------
-------------------------------------------------------------

EXECUTE pr_Names 'Limones';
GO

-------------------------------------------------------------
---------  salida -------------------------------------------
-------------------------------------------------------------


ProductName	CategoryDesc
Limones	CategoriaPremium
Limones medianos	CategoriaMedium
Limones restos	CategoriaBaja



los productos que estan dados de alta en la base de datos son Limones

(3 filas afectadas)

Hora de finalización: 2025-10-31T11:22:18.6636593+01:00
