
USE [DB_DWH_FinalPrj]
GO
/****** Object:  Table [dbo].[DimConfirmedCases]    Script Date: 07/05/2023 10:15:56 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimConfirmedCases](
	[DateKey] [int] NULL,
	[LocationKey] [int] NULL,
	[New_Cases] [float] NULL,
	[ConfirmedCasesKey] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ConfirmedCasesKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimConfirmedDeaths]    Script Date: 07/05/2023 10:15:56 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimConfirmedDeaths](
	[DateKey] [int] NULL,
	[LocationKey] [int] NULL,
	[New_Deaths] [float] NULL,
	[ConfirmedDeathsKey] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ConfirmedDeathsKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimDate]    Script Date: 07/05/2023 10:15:56 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimDate](
	[FullDate] [date] NULL,
	[DateYear] [int] NULL,
	[DateQuarter] [int] NULL,
	[DateMonth] [int] NULL,
	[DateDay] [int] NULL,
	[DateKey] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimLocation]    Script Date: 07/05/2023 10:15:56 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimLocation](
	[ISO_Code] [nvarchar](255) NULL,
	[Continent] [nvarchar](255) NULL,
	[Location] [nvarchar](255) NULL,
	[LocationKey] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LocationKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimPopulation]    Script Date: 07/05/2023 10:15:56 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimPopulation](
	[LocationKey] [int] NOT NULL,
	[Population] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[LocationKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimTests]    Script Date: 07/05/2023 10:15:56 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimTests](
	[DateKey] [int] NULL,
	[LocationKey] [int] NULL,
	[New_Tests] [float] NULL,
	[New_Positive] [float] NULL,
	[New_Negative] [float] NULL,
	[TestsKey] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TestsKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactStatify]    Script Date: 07/05/2023 10:15:56 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactStatify](
	[StatifyKey] [int] NOT NULL,
	[ConfirmedCasesKey] [int] NULL,
	[ConfirmedDeathsKey] [int] NULL,
	[New_Cases] [float] NULL,
	[New_Deaths] [float] NULL,
	[Population] [float] NULL,
	[LocationKey] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[StatifyKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactStatify_tmp]    Script Date: 07/05/2023 10:15:56 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactStatify_tmp](
	[New_Cases] [float] NULL,
	[New_Deaths] [float] NULL,
	[Population] [float] NULL,
	[LocationKey] [int] NULL,
	[DateKey] [int] NULL,
	[StatifyKey] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactTestsCovid]    Script Date: 07/05/2023 10:15:56 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactTestsCovid](
	[TestsCovidKey] [int] NOT NULL,
	[TestsKey] [int] NULL,
	[LocationKey] [int] NULL,
	[New_Tests] [float] NULL,
	[New_Positive] [float] NULL,
	[New_Negative] [float] NULL,
	[Population] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[TestsCovidKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactTestsCovid_tmp]    Script Date: 07/05/2023 10:15:56 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactTestsCovid_tmp](
	[LocationKey] [int] NULL,
	[New_Tests] [float] NULL,
	[Population] [float] NULL,
	[New_Positive] [float] NULL,
	[New_Negative] [float] NULL,
	[DateKey] [int] NULL,
	[TestsCovidKey] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OLE DB Destination]    Script Date: 07/05/2023 10:15:56 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OLE DB Destination](
	[ISO_CODE] [nvarchar](255) NULL,
	[Year] [int] NULL,
	[Total_NewCases] [float] NULL,
	[Total_NewDeaths] [float] NULL,
	[Populations] [float] NULL,
	[DATEKEY] [int] NULL,
	[LOCATION] [nvarchar](255) NULL,
	[LocationKey] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LocationKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StgConfirmedCases]    Script Date: 07/05/2023 10:15:56 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StgConfirmedCases](
	[ISO_Code] [nvarchar](255) NULL,
	[FullDate] [date] NULL,
	[New_Cases] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StgConfirmedDeaths]    Script Date: 07/05/2023 10:15:56 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StgConfirmedDeaths](
	[ISO_Code] [nvarchar](255) NULL,
	[FullDate] [date] NULL,
	[New_Deaths] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StgDate]    Script Date: 07/05/2023 10:15:56 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StgDate](
	[FullDate] [date] NULL,
	[DateYear] [int] NULL,
	[DateQuarter] [int] NULL,
	[DateMonth] [int] NULL,
	[DateDay] [int] NULL,
	[DateKey] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StgeTests]    Script Date: 07/05/2023 10:15:56 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StgeTests](
	[ISO_Code] [nvarchar](255) NULL,
	[FullDate] [date] NULL,
	[New_Tests] [float] NULL,
	[New_Positive] [float] NULL,
	[New_Negative] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StgFactStatify]    Script Date: 07/05/2023 10:15:56 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StgFactStatify](
	[ISO_Code] [nvarchar](255) NULL,
	[FullDate] [date] NULL,
	[New_Cases] [float] NULL,
	[New_Deaths] [float] NULL,
	[Population] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StgFactTests]    Script Date: 07/05/2023 10:15:56 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StgFactTests](
	[ISO_Code] [nvarchar](255) NULL,
	[FullDate] [date] NULL,
	[New_Tests] [float] NULL,
	[Population] [float] NULL,
	[New_Positive] [float] NULL,
	[New_Negative] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StgLocation]    Script Date: 07/05/2023 10:15:56 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StgLocation](
	[ISO_Code] [nvarchar](255) NULL,
	[Continent] [nvarchar](255) NULL,
	[Location] [nvarchar](255) NULL,
	[LocationKey] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StgPopulation]    Script Date: 07/05/2023 10:15:56 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StgPopulation](
	[ISO_Code] [nvarchar](255) NULL,
	[Population] [float] NULL,
	[PopulationKey] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DimConfirmedCases]  WITH CHECK ADD FOREIGN KEY([DateKey])
REFERENCES [dbo].[DimDate] ([DateKey])
GO
ALTER TABLE [dbo].[DimConfirmedCases]  WITH CHECK ADD FOREIGN KEY([LocationKey])
REFERENCES [dbo].[DimLocation] ([LocationKey])
GO
ALTER TABLE [dbo].[DimConfirmedDeaths]  WITH CHECK ADD FOREIGN KEY([DateKey])
REFERENCES [dbo].[DimDate] ([DateKey])
GO
ALTER TABLE [dbo].[DimConfirmedDeaths]  WITH CHECK ADD FOREIGN KEY([LocationKey])
REFERENCES [dbo].[DimLocation] ([LocationKey])
GO
ALTER TABLE [dbo].[DimPopulation]  WITH CHECK ADD FOREIGN KEY([LocationKey])
REFERENCES [dbo].[DimLocation] ([LocationKey])
GO
ALTER TABLE [dbo].[DimTests]  WITH CHECK ADD FOREIGN KEY([DateKey])
REFERENCES [dbo].[DimDate] ([DateKey])
GO
ALTER TABLE [dbo].[DimTests]  WITH CHECK ADD FOREIGN KEY([LocationKey])
REFERENCES [dbo].[DimLocation] ([LocationKey])
GO
ALTER TABLE [dbo].[FactStatify]  WITH CHECK ADD FOREIGN KEY([ConfirmedCasesKey])
REFERENCES [dbo].[DimConfirmedCases] ([ConfirmedCasesKey])
GO
ALTER TABLE [dbo].[FactStatify]  WITH CHECK ADD FOREIGN KEY([ConfirmedDeathsKey])
REFERENCES [dbo].[DimConfirmedDeaths] ([ConfirmedDeathsKey])
GO
ALTER TABLE [dbo].[FactStatify]  WITH CHECK ADD FOREIGN KEY([LocationKey])
REFERENCES [dbo].[DimPopulation] ([LocationKey])
GO
ALTER TABLE [dbo].[FactTestsCovid]  WITH CHECK ADD FOREIGN KEY([LocationKey])
REFERENCES [dbo].[DimPopulation] ([LocationKey])
GO
ALTER TABLE [dbo].[FactTestsCovid]  WITH CHECK ADD FOREIGN KEY([TestsKey])
REFERENCES [dbo].[DimTests] ([TestsKey])
GO
ALTER TABLE [dbo].[OLE DB Destination]  WITH CHECK ADD FOREIGN KEY([LocationKey])
REFERENCES [dbo].[DimPopulation] ([LocationKey])
GO
