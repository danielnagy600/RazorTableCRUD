USE [Cars]
GO
/****** Object:  Table [dbo].[Automakers]    Script Date: 2020. 07. 23. 0:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Automakers](
	[CompanyID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](50) NOT NULL,
	[FoundedDate] [date] NOT NULL,
	[HeadquartersCity] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Automaker] PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Details]    Script Date: 2020. 07. 23. 0:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Details](
	[DetailsID] [int] IDENTITY(1,1) NOT NULL,
	[FirstRegistration] [date] NOT NULL,
	[Price] [money] NOT NULL,
	[FuelType] [nchar](20) NOT NULL,
	[Colour] [nvarchar](10) NOT NULL,
	[Mileage] [decimal](18, 0) NOT NULL,
	[Transmission] [nchar](20) NOT NULL,
 CONSTRAINT [PK_Details] PRIMARY KEY CLUSTERED 
(
	[DetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Models]    Script Date: 2020. 07. 23. 0:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Models](
	[ModelID] [int] IDENTITY(1,1) NOT NULL,
	[DetailsID] [int] NULL,
	[CompanyID] [int] NOT NULL,
	[ModelName] [nvarchar](25) NOT NULL,
 CONSTRAINT [PK_Models] PRIMARY KEY CLUSTERED 
(
	[ModelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Automakers] ON 

INSERT [dbo].[Automakers] ([CompanyID], [CompanyName], [FoundedDate], [HeadquartersCity]) VALUES (1, N'Audi', CAST(N'1932-06-29' AS Date), N'Chemnitz')
INSERT [dbo].[Automakers] ([CompanyID], [CompanyName], [FoundedDate], [HeadquartersCity]) VALUES (2, N'Ford', CAST(N'1903-06-16' AS Date), N'Dearborn')
INSERT [dbo].[Automakers] ([CompanyID], [CompanyName], [FoundedDate], [HeadquartersCity]) VALUES (3, N'Tesla', CAST(N'2003-07-01' AS Date), N'Palo Alto')
SET IDENTITY_INSERT [dbo].[Automakers] OFF
GO
SET IDENTITY_INSERT [dbo].[Details] ON 

INSERT [dbo].[Details] ([DetailsID], [FirstRegistration], [Price], [FuelType], [Colour], [Mileage], [Transmission]) VALUES (2, CAST(N'2018-05-14' AS Date), 25650.0000, N'Disel               ', N'Blue', CAST(59440 AS Decimal(18, 0)), N'Automatic           ')
INSERT [dbo].[Details] ([DetailsID], [FirstRegistration], [Price], [FuelType], [Colour], [Mileage], [Transmission]) VALUES (3, CAST(N'2015-06-02' AS Date), 13200.0000, N'Disel               ', N'Black', CAST(167500 AS Decimal(18, 0)), N'Automatic           ')
INSERT [dbo].[Details] ([DetailsID], [FirstRegistration], [Price], [FuelType], [Colour], [Mileage], [Transmission]) VALUES (4, CAST(N'2009-09-25' AS Date), 17450.0000, N'Petrol              ', N'Grey', CAST(64869 AS Decimal(18, 0)), N'Manual              ')
INSERT [dbo].[Details] ([DetailsID], [FirstRegistration], [Price], [FuelType], [Colour], [Mileage], [Transmission]) VALUES (5, CAST(N'2018-01-23' AS Date), 13400.0000, N'Disel               ', N'Orange', CAST(68255 AS Decimal(18, 0)), N'Automatic           ')
INSERT [dbo].[Details] ([DetailsID], [FirstRegistration], [Price], [FuelType], [Colour], [Mileage], [Transmission]) VALUES (6, CAST(N'2018-02-06' AS Date), 8900.0000, N'Petrol              ', N'Grey', CAST(60124 AS Decimal(18, 0)), N'Manual              ')
INSERT [dbo].[Details] ([DetailsID], [FirstRegistration], [Price], [FuelType], [Colour], [Mileage], [Transmission]) VALUES (7, CAST(N'2017-02-07' AS Date), 12500.0000, N'Disel               ', N'Blue', CAST(127019 AS Decimal(18, 0)), N'Automatic           ')
INSERT [dbo].[Details] ([DetailsID], [FirstRegistration], [Price], [FuelType], [Colour], [Mileage], [Transmission]) VALUES (8, CAST(N'2015-10-22' AS Date), 19700.0000, N'Electric            ', N'Black', CAST(157909 AS Decimal(18, 0)), N'Direct              ')
INSERT [dbo].[Details] ([DetailsID], [FirstRegistration], [Price], [FuelType], [Colour], [Mileage], [Transmission]) VALUES (10, CAST(N'2016-12-03' AS Date), 33200.0000, N'Electric            ', N'Grey', CAST(109410 AS Decimal(18, 0)), N'Direct              ')
INSERT [dbo].[Details] ([DetailsID], [FirstRegistration], [Price], [FuelType], [Colour], [Mileage], [Transmission]) VALUES (11, CAST(N'2019-06-28' AS Date), 52700.0000, N'Electric            ', N'Grey', CAST(20597 AS Decimal(18, 0)), N'Direct              ')
INSERT [dbo].[Details] ([DetailsID], [FirstRegistration], [Price], [FuelType], [Colour], [Mileage], [Transmission]) VALUES (12, CAST(N'2020-07-02' AS Date), 15650.0000, N'Automatic           ', N'Red', CAST(242324 AS Decimal(18, 0)), N'Disel               ')
INSERT [dbo].[Details] ([DetailsID], [FirstRegistration], [Price], [FuelType], [Colour], [Mileage], [Transmission]) VALUES (13, CAST(N'2020-07-03' AS Date), 15650.0000, N'Manual              ', N'Red', CAST(242324 AS Decimal(18, 0)), N'Petrol              ')
INSERT [dbo].[Details] ([DetailsID], [FirstRegistration], [Price], [FuelType], [Colour], [Mileage], [Transmission]) VALUES (14, CAST(N'2020-07-02' AS Date), 25650.0000, N'Manual              ', N'Red', CAST(242324 AS Decimal(18, 0)), N'Petrol              ')
INSERT [dbo].[Details] ([DetailsID], [FirstRegistration], [Price], [FuelType], [Colour], [Mileage], [Transmission]) VALUES (15, CAST(N'2020-07-02' AS Date), 25650.0000, N'Manual              ', N'Red', CAST(242324 AS Decimal(18, 0)), N'Petrol              ')
INSERT [dbo].[Details] ([DetailsID], [FirstRegistration], [Price], [FuelType], [Colour], [Mileage], [Transmission]) VALUES (16, CAST(N'2019-02-05' AS Date), 28650.0000, N'Direct              ', N'Gray', CAST(600 AS Decimal(18, 0)), N'Electric            ')
INSERT [dbo].[Details] ([DetailsID], [FirstRegistration], [Price], [FuelType], [Colour], [Mileage], [Transmission]) VALUES (17, CAST(N'2014-10-22' AS Date), 20000.0000, N'Automatic           ', N'Green', CAST(16000 AS Decimal(18, 0)), N'Disel               ')
INSERT [dbo].[Details] ([DetailsID], [FirstRegistration], [Price], [FuelType], [Colour], [Mileage], [Transmission]) VALUES (18, CAST(N'2019-08-29' AS Date), 30650.0000, N'Manual              ', N'Pink', CAST(300 AS Decimal(18, 0)), N'Petrol              ')
INSERT [dbo].[Details] ([DetailsID], [FirstRegistration], [Price], [FuelType], [Colour], [Mileage], [Transmission]) VALUES (19, CAST(N'1950-06-30' AS Date), 25000.0000, N'Automatic           ', N'Black', CAST(1300 AS Decimal(18, 0)), N'Petrol              ')
INSERT [dbo].[Details] ([DetailsID], [FirstRegistration], [Price], [FuelType], [Colour], [Mileage], [Transmission]) VALUES (20, CAST(N'2020-02-04' AS Date), 32000.0000, N'Manual              ', N'Red', CAST(50 AS Decimal(18, 0)), N'Petrol              ')
INSERT [dbo].[Details] ([DetailsID], [FirstRegistration], [Price], [FuelType], [Colour], [Mileage], [Transmission]) VALUES (21, CAST(N'2018-05-14' AS Date), 25650.0000, N'Automatic           ', N'Red', CAST(59440 AS Decimal(18, 0)), N'Disel               ')
SET IDENTITY_INSERT [dbo].[Details] OFF
GO
SET IDENTITY_INSERT [dbo].[Models] ON 

INSERT [dbo].[Models] ([ModelID], [DetailsID], [CompanyID], [ModelName]) VALUES (2, 2, 3, N'Q7')
INSERT [dbo].[Models] ([ModelID], [DetailsID], [CompanyID], [ModelName]) VALUES (3, 3, 1, N'A6')
INSERT [dbo].[Models] ([ModelID], [DetailsID], [CompanyID], [ModelName]) VALUES (4, 4, 1, N'S5')
INSERT [dbo].[Models] ([ModelID], [DetailsID], [CompanyID], [ModelName]) VALUES (5, 5, 2, N'Ranger')
INSERT [dbo].[Models] ([ModelID], [DetailsID], [CompanyID], [ModelName]) VALUES (6, 6, 2, N'Edge')
INSERT [dbo].[Models] ([ModelID], [DetailsID], [CompanyID], [ModelName]) VALUES (7, 7, 2, N'Galaxy')
INSERT [dbo].[Models] ([ModelID], [DetailsID], [CompanyID], [ModelName]) VALUES (8, 8, 3, N'S85')
INSERT [dbo].[Models] ([ModelID], [DetailsID], [CompanyID], [ModelName]) VALUES (14, 10, 3, N'S60')
INSERT [dbo].[Models] ([ModelID], [DetailsID], [CompanyID], [ModelName]) VALUES (15, 11, 3, N'SX')
INSERT [dbo].[Models] ([ModelID], [DetailsID], [CompanyID], [ModelName]) VALUES (16, 15, 1, N'Q7')
INSERT [dbo].[Models] ([ModelID], [DetailsID], [CompanyID], [ModelName]) VALUES (17, 16, 3, N'S3')
INSERT [dbo].[Models] ([ModelID], [DetailsID], [CompanyID], [ModelName]) VALUES (18, 17, 2, N'K')
INSERT [dbo].[Models] ([ModelID], [DetailsID], [CompanyID], [ModelName]) VALUES (19, 18, 1, N'R')
INSERT [dbo].[Models] ([ModelID], [DetailsID], [CompanyID], [ModelName]) VALUES (20, 19, 1, N'T')
INSERT [dbo].[Models] ([ModelID], [DetailsID], [CompanyID], [ModelName]) VALUES (21, 20, 1, N'RS')
INSERT [dbo].[Models] ([ModelID], [DetailsID], [CompanyID], [ModelName]) VALUES (22, 21, 1, N'Q7')
SET IDENTITY_INSERT [dbo].[Models] OFF
GO
ALTER TABLE [dbo].[Models]  WITH CHECK ADD  CONSTRAINT [FK_Models_Automakers] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Automakers] ([CompanyID])
GO
ALTER TABLE [dbo].[Models] CHECK CONSTRAINT [FK_Models_Automakers]
GO
ALTER TABLE [dbo].[Models]  WITH CHECK ADD  CONSTRAINT [FK_Models_Details] FOREIGN KEY([DetailsID])
REFERENCES [dbo].[Details] ([DetailsID])
GO
ALTER TABLE [dbo].[Models] CHECK CONSTRAINT [FK_Models_Details]
GO
