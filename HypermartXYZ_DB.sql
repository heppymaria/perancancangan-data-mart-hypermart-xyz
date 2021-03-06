USE [master]
GO
/****** Object:  Database [Hypermart_XYZ]    Script Date: 23/04/2020 13.52.36 ******/
CREATE DATABASE [Hypermart_XYZ]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Hypermart_XYZ', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Hypermart_XYZ.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Hypermart_XYZ_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Hypermart_XYZ_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Hypermart_XYZ] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Hypermart_XYZ].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Hypermart_XYZ] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Hypermart_XYZ] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Hypermart_XYZ] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Hypermart_XYZ] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Hypermart_XYZ] SET ARITHABORT OFF 
GO
ALTER DATABASE [Hypermart_XYZ] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Hypermart_XYZ] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Hypermart_XYZ] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Hypermart_XYZ] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Hypermart_XYZ] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Hypermart_XYZ] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Hypermart_XYZ] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Hypermart_XYZ] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Hypermart_XYZ] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Hypermart_XYZ] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Hypermart_XYZ] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Hypermart_XYZ] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Hypermart_XYZ] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Hypermart_XYZ] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Hypermart_XYZ] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Hypermart_XYZ] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Hypermart_XYZ] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Hypermart_XYZ] SET RECOVERY FULL 
GO
ALTER DATABASE [Hypermart_XYZ] SET  MULTI_USER 
GO
ALTER DATABASE [Hypermart_XYZ] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Hypermart_XYZ] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Hypermart_XYZ] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Hypermart_XYZ] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Hypermart_XYZ] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Hypermart_XYZ', N'ON'
GO
USE [Hypermart_XYZ]
GO
/****** Object:  Table [dbo].[Dim_Customer]    Script Date: 23/04/2020 13.52.36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Dim_Customer](
	[Customer_ID] [varchar](50) NOT NULL,
	[Customer_Name] [varchar](50) NOT NULL,
	[Phone_Number] [varchar](20) NULL,
 CONSTRAINT [PK_Customer_Dim] PRIMARY KEY CLUSTERED 
(
	[Customer_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Dim_Date]    Script Date: 23/04/2020 13.52.37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Dim_Date](
	[Date_ID] [varchar](50) NOT NULL,
	[Year] [nvarchar](50) NOT NULL,
	[Month] [nvarchar](50) NOT NULL,
	[Date] [varchar](50) NOT NULL,
	[Quartal] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Date_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Dim_Employee]    Script Date: 23/04/2020 13.52.37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Dim_Employee](
	[Employee_ID] [varchar](50) NOT NULL,
	[Employee_Name] [varchar](50) NOT NULL,
	[Phone_Number] [int] NULL,
	[Email_Address] [varchar](100) NULL,
 CONSTRAINT [PK_Sales_Dim] PRIMARY KEY CLUSTERED 
(
	[Employee_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Dim_Invoice]    Script Date: 23/04/2020 13.52.37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Dim_Invoice](
	[Invoice_ID] [varchar](50) NOT NULL,
	[Payment_Type] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Invoice_Dim] PRIMARY KEY CLUSTERED 
(
	[Invoice_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Dim_Item]    Script Date: 23/04/2020 13.52.37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Dim_Item](
	[Item_ID] [varchar](20) NOT NULL,
	[Item_Name] [varchar](200) NOT NULL,
	[Stock] [int] NULL,
 CONSTRAINT [PK_Item_Dim] PRIMARY KEY CLUSTERED 
(
	[Item_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Dim_NotaPayment]    Script Date: 23/04/2020 13.52.37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Dim_NotaPayment](
	[NotaPayment_ID] [varchar](50) NOT NULL,
	[NotaPayment_Type] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Dim_NotaPayment] PRIMARY KEY CLUSTERED 
(
	[NotaPayment_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Dim_Storage_Bin]    Script Date: 23/04/2020 13.52.37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Dim_Storage_Bin](
	[Storage_ID] [varchar](50) NOT NULL,
	[Storage_location] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Storage_Bin] PRIMARY KEY CLUSTERED 
(
	[Storage_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Dim_Supplier]    Script Date: 23/04/2020 13.52.37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Dim_Supplier](
	[Supplier_ID] [varchar](50) NOT NULL,
	[Supplier_Name] [varchar](50) NOT NULL,
	[Supplier_phonenumber] [varchar](50) NOT NULL
) ON [PRIMARY]
SET ANSI_PADDING OFF
ALTER TABLE [dbo].[Dim_Supplier] ADD [Supplier_Address] [varchar](100) NULL
 CONSTRAINT [PK_Supplier_Dim] PRIMARY KEY CLUSTERED 
(
	[Supplier_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Fact_Order]    Script Date: 23/04/2020 13.52.37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Fact_Order](
	[fact_order_key] [varchar](50) NOT NULL,
	[unit_price] [float] NOT NULL,
	[percent_discount] [float] NOT NULL,
	[number_of_item_purchased] [int] NOT NULL,
	[total_purchased] [float] NOT NULL,
	[Item_ID] [varchar](20) NOT NULL,
	[Date_ID] [varchar](50) NOT NULL,
	[Supplier_ID] [varchar](50) NOT NULL,
	[Invoice_ID] [varchar](50) NOT NULL,
	[Nota_Payment_ID] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[fact_order_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Fact_Sales]    Script Date: 23/04/2020 13.52.37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Fact_Sales](
	[unit_price] [float] NOT NULL,
	[percent_discount] [float] NOT NULL,
	[number_of_items_sold] [int] NOT NULL,
	[total_sales] [float] NOT NULL,
	[fact_sales_key] [varchar](50) NOT NULL,
	[Item_ID] [varchar](20) NOT NULL,
	[Date_ID] [varchar](50) NOT NULL,
	[Customer_ID] [varchar](50) NOT NULL,
	[Employee_ID] [varchar](50) NOT NULL,
	[Invoice_ID] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[fact_sales_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Fact_Stock_Control]    Script Date: 23/04/2020 13.52.37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Fact_Stock_Control](
	[fact_stock_control_key] [varchar](50) NOT NULL,
	[quantity_of_initial_product] [int] NOT NULL,
	[quantity_of_letover_product] [int] NOT NULL,
	[quantity_of_entered_product] [int] NOT NULL,
	[quantity_of_purchased_product] [int] NOT NULL,
	[Item_ID] [varchar](20) NOT NULL,
	[Date_ID] [varchar](50) NOT NULL,
	[Storage_ID] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[fact_stock_control_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Fact_Order]  WITH CHECK ADD FOREIGN KEY([Date_ID])
REFERENCES [dbo].[Dim_Date] ([Date_ID])
GO
ALTER TABLE [dbo].[Fact_Order]  WITH CHECK ADD FOREIGN KEY([Invoice_ID])
REFERENCES [dbo].[Dim_Invoice] ([Invoice_ID])
GO
ALTER TABLE [dbo].[Fact_Order]  WITH CHECK ADD FOREIGN KEY([Item_ID])
REFERENCES [dbo].[Dim_Item] ([Item_ID])
GO
ALTER TABLE [dbo].[Fact_Order]  WITH CHECK ADD FOREIGN KEY([Nota_Payment_ID])
REFERENCES [dbo].[Dim_NotaPayment] ([NotaPayment_ID])
GO
ALTER TABLE [dbo].[Fact_Order]  WITH CHECK ADD FOREIGN KEY([Supplier_ID])
REFERENCES [dbo].[Dim_Supplier] ([Supplier_ID])
GO
ALTER TABLE [dbo].[Fact_Sales]  WITH CHECK ADD FOREIGN KEY([Customer_ID])
REFERENCES [dbo].[Dim_Customer] ([Customer_ID])
GO
ALTER TABLE [dbo].[Fact_Sales]  WITH CHECK ADD FOREIGN KEY([Date_ID])
REFERENCES [dbo].[Dim_Date] ([Date_ID])
GO
ALTER TABLE [dbo].[Fact_Sales]  WITH CHECK ADD  CONSTRAINT [FK__Fact_Sale__Employee__5629CD9C] FOREIGN KEY([Employee_ID])
REFERENCES [dbo].[Dim_Employee] ([Employee_ID])
GO
ALTER TABLE [dbo].[Fact_Sales] CHECK CONSTRAINT [FK__Fact_Sale__Employee__5629CD9C]
GO
ALTER TABLE [dbo].[Fact_Sales]  WITH CHECK ADD FOREIGN KEY([Invoice_ID])
REFERENCES [dbo].[Dim_Invoice] ([Invoice_ID])
GO
ALTER TABLE [dbo].[Fact_Sales]  WITH CHECK ADD FOREIGN KEY([Item_ID])
REFERENCES [dbo].[Dim_Item] ([Item_ID])
GO
ALTER TABLE [dbo].[Fact_Stock_Control]  WITH CHECK ADD FOREIGN KEY([Date_ID])
REFERENCES [dbo].[Dim_Date] ([Date_ID])
GO
ALTER TABLE [dbo].[Fact_Stock_Control]  WITH CHECK ADD FOREIGN KEY([Item_ID])
REFERENCES [dbo].[Dim_Item] ([Item_ID])
GO
ALTER TABLE [dbo].[Fact_Stock_Control]  WITH CHECK ADD FOREIGN KEY([Storage_ID])
REFERENCES [dbo].[Dim_Storage_Bin] ([Storage_ID])
GO
USE [master]
GO
ALTER DATABASE [Hypermart_XYZ] SET  READ_WRITE 
GO
