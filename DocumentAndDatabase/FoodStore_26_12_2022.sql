USE [DATN_FoodStore]
GO
/****** Object:  Table [dbo].[cart]    Script Date: 12/26/2022 4:47:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[food_id] [bigint] NOT NULL,
	[customer_id] [bigint] NOT NULL,
	[quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 12/26/2022 4:47:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](300) NOT NULL,
	[display_name] [nvarchar](300) NULL,
	[description] [nvarchar](1000) NULL,
	[image_name] [varchar](300) NULL,
	[color] [varchar](50) NULL,
	[create_date] [datetime] NULL,
	[create_by] [bigint] NOT NULL,
	[is_display] [bit] NOT NULL,
	[type] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category_foods]    Script Date: 12/26/2022 4:47:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category_foods](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[category_id] [bigint] NOT NULL,
	[food_id] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[comments]    Script Date: 12/26/2022 4:47:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comments](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[review_id] [bigint] NOT NULL,
	[title] [nvarchar](200) NULL,
	[content] [nvarchar](1000) NULL,
	[create_date] [datetime] NULL,
	[update_date] [datetime] NULL,
	[status] [bigint] NOT NULL,
	[is_display] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[coupons]    Script Date: 12/26/2022 4:47:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[coupons](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](300) NOT NULL,
	[code] [nvarchar](100) NULL,
	[description] [nvarchar](1000) NULL,
	[user_limit] [bigint] NOT NULL,
	[food_limit] [bigint] NOT NULL,
	[amount] [float] NOT NULL,
	[is_fixed] [bit] NOT NULL,
	[start_date] [datetime] NULL,
	[end_date] [datetime] NULL,
	[create_date] [datetime] NULL,
	[create_by] [bigint] NOT NULL,
	[is_display] [bit] NOT NULL,
	[status] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customer_coupons]    Script Date: 12/26/2022 4:47:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer_coupons](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[customer_id] [bigint] NOT NULL,
	[coupon_id] [bigint] NOT NULL,
	[create_date] [datetime] NULL,
	[status] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customer_phone_address]    Script Date: 12/26/2022 4:47:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer_phone_address](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[customer_id] [bigint] NOT NULL,
	[is_address] [bit] NOT NULL,
	[phone_or_address] [nvarchar](500) NULL,
	[is_default] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customers]    Script Date: 12/26/2022 4:47:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customers](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[username] [varchar](100) NOT NULL,
	[password] [varchar](100) NOT NULL,
	[fullname] [nvarchar](100) NULL,
	[gender] [bit] NOT NULL,
	[email] [varchar](100) NOT NULL,
	[birthday] [datetime] NULL,
	[avatar] [varchar](100) NULL,
	[remember_token] [varchar](100) NULL,
	[code] [nvarchar](100) NULL,
	[status] [bigint] NULL,
	[create_date] [datetime] NULL,
	[is_display] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[discounts]    Script Date: 12/26/2022 4:47:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[discounts](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[food_id] [bigint] NOT NULL,
	[name] [nvarchar](300) NOT NULL,
	[amount] [float] NOT NULL,
	[is_fixed] [bit] NOT NULL,
	[start_date] [datetime] NULL,
	[end_date] [datetime] NULL,
	[create_date] [datetime] NULL,
	[create_by] [bigint] NOT NULL,
	[is_display] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[food_coupons]    Script Date: 12/26/2022 4:47:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[food_coupons](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[food_id] [bigint] NOT NULL,
	[coupon_id] [bigint] NOT NULL,
	[create_date] [datetime] NULL,
	[status] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[foods]    Script Date: 12/26/2022 4:47:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[foods](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](300) NOT NULL,
	[price] [float] NOT NULL,
	[quantity_limit] [bigint] NOT NULL,
	[view_count] [bigint] NOT NULL,
	[description] [nvarchar](1000) NULL,
	[create_date] [datetime] NULL,
	[create_by] [bigint] NOT NULL,
	[is_display] [bit] NOT NULL,
	[status] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[histories]    Script Date: 12/26/2022 4:47:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[histories](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [bigint] NOT NULL,
	[create_date] [datetime] NULL,
	[record_id] [bigint] NOT NULL,
	[table_name] [varchar](100) NOT NULL,
	[memo] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[images]    Script Date: 12/26/2022 4:47:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[images](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[food_id] [bigint] NOT NULL,
	[image_name] [varchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[notifications]    Script Date: 12/26/2022 4:47:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[notifications](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[customer_id] [bigint] NOT NULL,
	[record_id] [bigint] NOT NULL,
	[table_name] [varchar](100) NOT NULL,
	[content] [nvarchar](1000) NULL,
	[create_at] [datetime] NULL,
	[is_watched] [bigint] NOT NULL,
	[color] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_details]    Script Date: 12/26/2022 4:47:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_details](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[order_id] [bigint] NOT NULL,
	[food_id] [bigint] NOT NULL,
	[quantity] [bigint] NOT NULL,
	[price] [float] NOT NULL,
	[discount_amount] [float] NOT NULL,
	[is_fixed] [bit] NOT NULL,
	[coupon_code] [varchar](100) NULL,
	[status] [bigint] NOT NULL,
	[memo] [nvarchar](1000) NULL,
	[is_display] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 12/26/2022 4:47:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[customer_id] [bigint] NOT NULL,
	[payment_id] [bigint] NOT NULL,
	[order_date] [datetime] NOT NULL,
	[shipped_date] [datetime] NULL,
	[shipped_address] [nvarchar](500) NULL,
	[shipped_phone] [nvarchar](50) NULL,
	[fee] [float] NOT NULL,
	[paid_date] [datetime] NULL,
	[status] [bigint] NOT NULL,
	[is_watched] [bit] NOT NULL,
	[is_display] [bit] NOT NULL,
	[is_deleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[paymentmethods]    Script Date: 12/26/2022 4:47:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[paymentmethods](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[description] [nvarchar](1000) NULL,
	[code] [nvarchar](100) NULL,
	[status] [bigint] NULL,
	[image_name] [nvarchar](100) NULL,
	[is_display] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[permissions]    Script Date: 12/26/2022 4:47:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[permissions](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[display_name] [nvarchar](100) NOT NULL,
	[is_display] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reviews]    Script Date: 12/26/2022 4:47:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reviews](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[food_id] [bigint] NOT NULL,
	[customer_id] [bigint] NOT NULL,
	[rating] [bigint] NOT NULL,
	[views] [bigint] NOT NULL,
	[create_date] [datetime] NULL,
	[update_date] [datetime] NULL,
	[status] [bigint] NOT NULL,
	[is_favorite] [bit] NOT NULL,
	[is_display] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role_permissions]    Script Date: 12/26/2022 4:47:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role_permissions](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[role_id] [bigint] NOT NULL,
	[permission_id] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 12/26/2022 4:47:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[display_name] [nvarchar](100) NOT NULL,
	[create_date] [datetime] NULL,
	[create_by] [bigint] NULL,
	[is_display] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_permissions]    Script Date: 12/26/2022 4:47:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_permissions](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [bigint] NOT NULL,
	[permission_id] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_roles]    Script Date: 12/26/2022 4:47:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_roles](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [bigint] NOT NULL,
	[role_id] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 12/26/2022 4:47:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[username] [varchar](100) NOT NULL,
	[password] [varchar](100) NOT NULL,
	[fullname] [nvarchar](200) NULL,
	[gender] [bit] NOT NULL,
	[phone] [varchar](100) NULL,
	[email] [varchar](100) NOT NULL,
	[birthday] [date] NULL,
	[avatar] [nvarchar](100) NULL,
	[address] [nvarchar](200) NULL,
	[remember_token] [varchar](100) NULL,
	[code] [varchar](100) NULL,
	[status] [bigint] NULL,
	[create_date] [datetime] NULL,
	[create_by] [bigint] NULL,
	[is_display] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[categories] ON 
GO
INSERT [dbo].[categories] ([id], [name], [display_name], [description], [image_name], [color], [create_date], [create_by], [is_display], [type]) VALUES (1, N'rautron', N'Rau trộn', N'Rau trộn', N'2717fb07.jpg', N'#29f52c', CAST(N'2022-01-26T00:00:00.000' AS DateTime), 1, 1, 0)
GO
INSERT [dbo].[categories] ([id], [name], [display_name], [description], [image_name], [color], [create_date], [create_by], [is_display], [type]) VALUES (2, N'com', N'Cơm', N'Cơm', N'6ffe3061.jpg', N'#17ded0', CAST(N'2022-01-21T00:00:00.000' AS DateTime), 1, 1, 0)
GO
INSERT [dbo].[categories] ([id], [name], [display_name], [description], [image_name], [color], [create_date], [create_by], [is_display], [type]) VALUES (3, N'ga', N'Gà', N'Gà', N'33c30e17.jpg', N'#111111', CAST(N'2022-01-09T00:00:00.000' AS DateTime), 1, 1, 0)
GO
INSERT [dbo].[categories] ([id], [name], [display_name], [description], [image_name], [color], [create_date], [create_by], [is_display], [type]) VALUES (4, N'chao', N'Cháo', N'Cháo', N'd5259292.jpg', N'#111111', CAST(N'2022-01-02T00:00:00.000' AS DateTime), 1, 1, 0)
GO
INSERT [dbo].[categories] ([id], [name], [display_name], [description], [image_name], [color], [create_date], [create_by], [is_display], [type]) VALUES (5, N'pizza', N'Pizza', N'Pizza', N'ae62cf3d.jpg', N'#111111', CAST(N'2022-01-20T00:00:00.000' AS DateTime), 1, 1, 0)
GO
INSERT [dbo].[categories] ([id], [name], [display_name], [description], [image_name], [color], [create_date], [create_by], [is_display], [type]) VALUES (6, N'monnuoc', N'Món nước', N'Món nước', N'cacf5a3e.jpg', N'#111111', CAST(N'2022-01-29T00:00:00.000' AS DateTime), 1, 1, 0)
GO
INSERT [dbo].[categories] ([id], [name], [display_name], [description], [image_name], [color], [create_date], [create_by], [is_display], [type]) VALUES (7, N'monkho', N'Món khô', N'Món khô', N'2701880a.jpg', N'#7362f4', CAST(N'2022-01-11T00:00:00.000' AS DateTime), 1, 1, 0)
GO
INSERT [dbo].[categories] ([id], [name], [display_name], [description], [image_name], [color], [create_date], [create_by], [is_display], [type]) VALUES (8, N'douonglanh', N'Đồ uống lạnh', N'Đồ uống lạnh', N'f49736f7.jpg', N'#111111', CAST(N'2022-01-16T00:00:00.000' AS DateTime), 1, 1, 0)
GO
INSERT [dbo].[categories] ([id], [name], [display_name], [description], [image_name], [color], [create_date], [create_by], [is_display], [type]) VALUES (9, N'anvat', N'Ăn Vặt', N'Ăn Vặt', N'da894c2f.jpg', N'#111111', CAST(N'2022-01-15T00:00:00.000' AS DateTime), 1, 1, 0)
GO
INSERT [dbo].[categories] ([id], [name], [display_name], [description], [image_name], [color], [create_date], [create_by], [is_display], [type]) VALUES (10, N'garanburger', N'Gà Rán - Burger', N'Gà Rán - Burger', N'57390029.jpg', N'#111111', CAST(N'2022-01-21T00:00:00.000' AS DateTime), 1, 1, 0)
GO
INSERT [dbo].[categories] ([id], [name], [display_name], [description], [image_name], [color], [create_date], [create_by], [is_display], [type]) VALUES (11, N'trasua', N'Trà sữa', N'Trà sữa', N'no_img2.jpg', N'#111111', CAST(N'2022-01-13T00:00:00.000' AS DateTime), 1, 1, 0)
GO
INSERT [dbo].[categories] ([id], [name], [display_name], [description], [image_name], [color], [create_date], [create_by], [is_display], [type]) VALUES (12, N'douongnong', N'Đồ uống nóng', N'Đồ uống nóng', N'no_img2.jpg', N'#111111', CAST(N'2022-01-26T00:00:00.000' AS DateTime), 1, 1, 0)
GO
INSERT [dbo].[categories] ([id], [name], [display_name], [description], [image_name], [color], [create_date], [create_by], [is_display], [type]) VALUES (38, N'A', N'a', N'A', N'no_img2.jpg', N'#111111', CAST(N'2022-12-19T00:00:00.000' AS DateTime), 1, 0, 0)
GO
SET IDENTITY_INSERT [dbo].[categories] OFF
GO
SET IDENTITY_INSERT [dbo].[category_foods] ON 
GO
INSERT [dbo].[category_foods] ([id], [category_id], [food_id]) VALUES (1, 2, 1)
GO
INSERT [dbo].[category_foods] ([id], [category_id], [food_id]) VALUES (2, 2, 4)
GO
INSERT [dbo].[category_foods] ([id], [category_id], [food_id]) VALUES (21, 6, 22)
GO
INSERT [dbo].[category_foods] ([id], [category_id], [food_id]) VALUES (24, 7, 1)
GO
INSERT [dbo].[category_foods] ([id], [category_id], [food_id]) VALUES (4, 7, 3)
GO
INSERT [dbo].[category_foods] ([id], [category_id], [food_id]) VALUES (14, 7, 15)
GO
INSERT [dbo].[category_foods] ([id], [category_id], [food_id]) VALUES (15, 7, 16)
GO
INSERT [dbo].[category_foods] ([id], [category_id], [food_id]) VALUES (16, 7, 17)
GO
INSERT [dbo].[category_foods] ([id], [category_id], [food_id]) VALUES (17, 7, 18)
GO
INSERT [dbo].[category_foods] ([id], [category_id], [food_id]) VALUES (18, 7, 19)
GO
INSERT [dbo].[category_foods] ([id], [category_id], [food_id]) VALUES (19, 7, 20)
GO
INSERT [dbo].[category_foods] ([id], [category_id], [food_id]) VALUES (20, 7, 21)
GO
INSERT [dbo].[category_foods] ([id], [category_id], [food_id]) VALUES (8, 8, 9)
GO
INSERT [dbo].[category_foods] ([id], [category_id], [food_id]) VALUES (9, 8, 10)
GO
INSERT [dbo].[category_foods] ([id], [category_id], [food_id]) VALUES (11, 8, 12)
GO
INSERT [dbo].[category_foods] ([id], [category_id], [food_id]) VALUES (12, 8, 13)
GO
INSERT [dbo].[category_foods] ([id], [category_id], [food_id]) VALUES (25, 9, 1)
GO
INSERT [dbo].[category_foods] ([id], [category_id], [food_id]) VALUES (3, 9, 2)
GO
INSERT [dbo].[category_foods] ([id], [category_id], [food_id]) VALUES (23, 9, 3)
GO
INSERT [dbo].[category_foods] ([id], [category_id], [food_id]) VALUES (6, 9, 7)
GO
INSERT [dbo].[category_foods] ([id], [category_id], [food_id]) VALUES (5, 11, 5)
GO
INSERT [dbo].[category_foods] ([id], [category_id], [food_id]) VALUES (7, 11, 8)
GO
INSERT [dbo].[category_foods] ([id], [category_id], [food_id]) VALUES (10, 12, 11)
GO
INSERT [dbo].[category_foods] ([id], [category_id], [food_id]) VALUES (13, 12, 14)
GO
SET IDENTITY_INSERT [dbo].[category_foods] OFF
GO
SET IDENTITY_INSERT [dbo].[comments] ON 
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (2, 192, N'$1.00 ', N'🚾 🆒 🆓 🆕 🆖 🆗 🆙 🏧', CAST(N'2020-11-23T00:00:00.000' AS DateTime), CAST(N'2020-04-23T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (3, 8, N'ÅÍÎÏ˝ÓÔÒÚÆ☃', N'١٢٣', CAST(N'2020-02-03T00:00:00.000' AS DateTime), CAST(N'2021-06-24T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (4, 111, N'1', N'-1', CAST(N'2021-05-29T00:00:00.000' AS DateTime), CAST(N'2022-06-02T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (5, 151, N'(╯°□°）╯︵ ┻━┻)', N'・(￣∀￣)・:*:', CAST(N'2021-07-20T00:00:00.000' AS DateTime), CAST(N'2021-02-10T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (9, 40, N'¸˛Ç◊ı˜Â¯˘¿', N' ', CAST(N'2021-02-09T00:00:00.000' AS DateTime), CAST(N'2021-08-07T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (10, 36, N'⁦test⁧', N'"', CAST(N'2020-07-11T00:00:00.000' AS DateTime), CAST(N'2020-09-18T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (11, 162, N'"', N'⁰⁴⁵', CAST(N'2022-01-14T00:00:00.000' AS DateTime), CAST(N'2020-03-03T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (12, 17, N'"''''''''"''"', N'Œ„´‰ˇÁ¨ˆØ∏”’', CAST(N'2022-03-11T00:00:00.000' AS DateTime), CAST(N'2021-07-07T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (13, 37, N'-1.00E+02', N'和製漢語', CAST(N'2020-02-03T00:00:00.000' AS DateTime), CAST(N'2021-05-31T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (14, 14, N'"''"''"''''''''"', N'・(￣∀￣)・:*:', CAST(N'2022-04-05T00:00:00.000' AS DateTime), CAST(N'2020-11-11T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (15, 84, N'울란바토르', N'1.00E+02', CAST(N'2021-03-09T00:00:00.000' AS DateTime), CAST(N'2020-01-28T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (16, 120, N'⁦test⁧', N'̗̺͖̹̯͓Ṯ̤͍̥͇͈h̲́e͏͓̼̗̙̼̣͔ ͇̜̱̠͓͍ͅN͕͠e̗̱z̘̝̜̺͙p̤̺̹͍̯͚e̠̻̠͜r̨̤͍̺̖͔̖̖d̠̟̭̬̝͟i̦͖̩͓͔̤a̠̗̬͉̙n͚͜ ̻̞̰͚ͅh̵͉i̳̞v̢͇ḙ͎͟-҉̭̩̼͔m̤̭̫i͕͇̝̦n̗͙ḍ̟ ̯̲͕͞ǫ̟̯̰̲͙̻̝f ̪̰̰̗̖̭̘͘c̦͍̲̞͍̩̙ḥ͚a̮͎̟̙͜ơ̩̹͎s̤.̝̝ ҉Z̡̖̜͖̰̣͉̜a͖̰͙̬͡l̲̫̳͍̩g̡̟̼̱͚̞̬ͅo̗͜.̟', CAST(N'2022-02-19T00:00:00.000' AS DateTime), CAST(N'2021-09-26T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (17, 200, N'$1.00 ', N'"', CAST(N'2020-09-01T00:00:00.000' AS DateTime), CAST(N'2022-01-25T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (18, 168, NULL, N'ثم نفس سقطت وبالتحديد،, جزيرتي باستخدام أن دنو. إذ هنا؟ الستار وتنصيب كان. أهّل ايطاليا، بريطانيا-فرنسا قد أخذ. سليمان، إتفاقية بين ما, يذكر الحدود أي بعد, معاملة بولندا، الإطلاق عل إيو.', CAST(N'2021-12-20T00:00:00.000' AS DateTime), CAST(N'2020-05-04T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (19, 114, N'-1.00E+02', N'｀ｨ(´∀｀∩', CAST(N'2020-04-03T00:00:00.000' AS DateTime), CAST(N'2020-12-09T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (21, 18, N'0️⃣ 1️⃣ 2️⃣ 3️⃣ 4️⃣ 5️⃣ 6️⃣ 7️⃣ 8️⃣ 9️⃣ 🔟', N'␣', CAST(N'2020-01-11T00:00:00.000' AS DateTime), CAST(N'2021-04-22T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (22, 130, N'åß∂ƒ©˙∆˚¬…æ', N'(｡◕ ∀ ◕｡)', CAST(N'2020-01-31T00:00:00.000' AS DateTime), CAST(N'2020-11-22T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (24, 188, N'パーティーへ行かないか', N'() { _; } >_[$($())] { touch /tmp/blns.shellshock2.fail; }', CAST(N'2021-09-18T00:00:00.000' AS DateTime), CAST(N'2021-01-14T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (27, 144, N'הָיְתָהtestالصفحات التّحول', N'̦H̬̤̗̤͝e͜ ̜̥̝̻͍̟́w̕h̖̯͓o̝͙̖͎̱̮ ҉̺̙̞̟͈W̷̼̭a̺̪͍į͈͕̭͙̯̜t̶̼̮s̘͙͖̕ ̠̫̠B̻͍͙͉̳ͅe̵h̵̬͇̫͙i̹͓̳̳̮͎̫̕n͟d̴̪̜̖ ̰͉̩͇͙̲͞ͅT͖̼͓̪͢h͏͓̮̻e̬̝̟ͅ ̤̹̝W͙̞̝͔͇͝ͅa͏͓͔̹̼̣l̴͔̰̤̟͔ḽ̫.͕', CAST(N'2022-01-09T00:00:00.000' AS DateTime), CAST(N'2020-09-18T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (29, 95, N'''''', N'ثم نفس سقطت وبالتحديد،, جزيرتي باستخدام أن دنو. إذ هنا؟ الستار وتنصيب كان. أهّل ايطاليا، بريطانيا-فرنسا قد أخذ. سليمان، إتفاقية بين ما, يذكر الحدود أي بعد, معاملة بولندا، الإطلاق عل إيو.', CAST(N'2021-09-03T00:00:00.000' AS DateTime), CAST(N'2021-09-14T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (30, 135, N'() { _; } >_[$($())] { touch /tmp/blns.shellshock2.fail; }', N'‪‪test‪', CAST(N'2020-12-06T00:00:00.000' AS DateTime), CAST(N'2020-09-12T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (33, 124, N'""', N'Ṱ̺̺̕o͞ ̷i̲̬͇̪͙n̝̗͕v̟̜̘̦͟o̶̙̰̠kè͚̮̺̪̹̱̤ ̖t̝͕̳̣̻̪͞h̼͓̲̦̳̘̲e͇̣̰̦̬͎ ̢̼̻̱̘h͚͎͙̜̣̲ͅi̦̲̣̰̤v̻͍e̺̭̳̪̰-m̢iͅn̖̺̞̲̯̰d̵̼̟͙̩̼̘̳ ̞̥̱̳̭r̛̗̘e͙p͠r̼̞̻̭̗e̺̠̣͟s̘͇̳͍̝͉e͉̥̯̞̲͚̬͜ǹ̬͎͎̟̖͇̤t͍̬̤͓̼̭͘ͅi̪̱n͠g̴͉ ͏͉ͅc̬̟h͡a̫̻̯͘o̫̟̖͍̙̝͉s̗̦̲.̨̹͈̣', CAST(N'2021-11-05T00:00:00.000' AS DateTime), CAST(N'2021-03-22T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (34, 168, N',。・:*:・゜’( ☻ ω ☻ )。・:*:・゜’', N'<img src=x onerror=alert(''hi'') />', CAST(N'2020-05-29T00:00:00.000' AS DateTime), CAST(N'2021-10-21T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (35, 29, N'¸˛Ç◊ı˜Â¯˘¿', NULL, CAST(N'2020-03-15T00:00:00.000' AS DateTime), CAST(N'2020-10-14T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (36, 199, N' 1/2', N'"''''''''"''"', CAST(N'2020-02-26T00:00:00.000' AS DateTime), CAST(N'2022-03-16T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (37, 73, N'1.00E+02', N'
test
', CAST(N'2021-10-19T00:00:00.000' AS DateTime), CAST(N'2022-05-02T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (38, 18, N'0/0', N'⁰⁴⁵', CAST(N'2021-09-06T00:00:00.000' AS DateTime), CAST(N'2021-08-29T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (41, 162, N'ヽ༼ຈل͜ຈ༽ﾉ ヽ༼ຈل͜ຈ༽ﾉ', N'åß∂ƒ©˙∆˚¬…æ', CAST(N'2021-10-05T00:00:00.000' AS DateTime), CAST(N'2020-05-05T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (44, 135, N'社會科學院語學研究所', N'Ω≈ç√∫˜µ≤≥÷', CAST(N'2021-05-17T00:00:00.000' AS DateTime), CAST(N'2020-05-27T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (45, 166, N'1.00E+02', N'𠜎𠜱𠝹𠱓𠱸𠲖𠳏', CAST(N'2021-07-17T00:00:00.000' AS DateTime), CAST(N'2022-05-26T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (46, 178, N'($1.00)', NULL, CAST(N'2021-10-24T00:00:00.000' AS DateTime), CAST(N'2021-01-21T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (47, 56, N'¡™£¢∞§¶•ªº–≠', N'١٢٣', CAST(N'2022-01-31T00:00:00.000' AS DateTime), CAST(N'2021-06-01T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (48, 55, N'הָיְתָהtestالصفحات التّحول', N'!@#$%^&*()', CAST(N'2020-07-06T00:00:00.000' AS DateTime), CAST(N'2021-01-12T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (49, 156, N'"', N'!@#$%^&*()', CAST(N'2021-10-31T00:00:00.000' AS DateTime), CAST(N'2021-09-09T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (50, 9, N'$1.00 ', N'<script>alert(''hi'')</script>', CAST(N'2022-03-31T00:00:00.000' AS DateTime), CAST(N'2021-05-27T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (52, 61, N'Z̮̞̠͙͔ͅḀ̗̞͈̻̗Ḷ͙͎̯̹̞͓G̻O̭̗̮', N'__ﾛ(,_,*)', CAST(N'2021-11-03T00:00:00.000' AS DateTime), CAST(N'2020-03-19T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (53, 132, N'👾 🙇 💁 🙅 🙆 🙋 🙎 🙍', N'🐵 🙈 🙉 🙊', CAST(N'2020-06-07T00:00:00.000' AS DateTime), CAST(N'2022-05-24T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (54, 4, N'⁰⁴⁵', N'''"''', CAST(N'2021-06-04T00:00:00.000' AS DateTime), CAST(N'2021-05-17T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (55, 114, N'😍', N'''''', CAST(N'2021-01-02T00:00:00.000' AS DateTime), CAST(N'2021-11-18T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (56, 143, N'¡™£¢∞§¶•ªº–≠', N'-1.00E+02', CAST(N'2020-07-03T00:00:00.000' AS DateTime), CAST(N'2020-05-14T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (57, 123, N'᠎', N'''', CAST(N'2022-01-11T00:00:00.000' AS DateTime), CAST(N'2022-02-07T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (58, 40, N'ﾟ･✿ヾ╲(｡◕‿◕｡)╱✿･ﾟ', N'0️⃣ 1️⃣ 2️⃣ 3️⃣ 4️⃣ 5️⃣ 6️⃣ 7️⃣ 8️⃣ 9️⃣ 🔟', CAST(N'2021-05-01T00:00:00.000' AS DateTime), CAST(N'2022-01-29T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (60, 14, N'𠜎𠜱𠝹𠱓𠱸𠲖𠳏', N'｀ｨ(´∀｀∩', CAST(N'2020-04-02T00:00:00.000' AS DateTime), CAST(N'2022-02-19T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (61, 17, N'<img src=x onerror=alert(''hi'') />', N'‪‪test‪', CAST(N'2022-04-13T00:00:00.000' AS DateTime), CAST(N'2022-04-13T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (62, 21, N'-1.00E+02', N'﻿', CAST(N'2021-11-19T00:00:00.000' AS DateTime), CAST(N'2021-06-15T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (63, 117, N'"', N'-1', CAST(N'2020-11-04T00:00:00.000' AS DateTime), CAST(N'2020-12-03T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (66, 107, N'`⁄€‹›ﬁﬂ‡°·‚—±', N'1''; DROP TABLE users--', CAST(N'2020-12-04T00:00:00.000' AS DateTime), CAST(N'2020-03-16T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (67, 165, N'null', N'בְּרֵאשִׁית, בָּרָא אֱלֹהִים, אֵת הַשָּׁמַיִם, וְאֵת הָאָרֶץ', CAST(N'2021-10-12T00:00:00.000' AS DateTime), CAST(N'2020-04-09T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (68, 26, N'../../../../../../../../../../../etc/passwd%00', N'␣', CAST(N'2021-03-17T00:00:00.000' AS DateTime), CAST(N'2021-02-04T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (71, 39, N'בְּרֵאשִׁית, בָּרָא אֱלֹהִים, אֵת הַשָּׁמַיִם, וְאֵת הָאָרֶץ', N'åß∂ƒ©˙∆˚¬…æ', CAST(N'2020-01-30T00:00:00.000' AS DateTime), CAST(N'2022-04-03T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (72, 151, N'__ﾛ(,_,*)', N'0', CAST(N'2022-03-30T00:00:00.000' AS DateTime), CAST(N'2020-03-09T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (73, 194, N'-0.5', N'❤️ 💔 💌 💕 💞 💓 💗 💖 💘 💝 💟 💜 💛 💚 💙', CAST(N'2020-06-05T00:00:00.000' AS DateTime), CAST(N'2021-06-06T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (74, 116, N'̡͓̞ͅI̗̘̦͝n͇͇͙v̮̫ok̲̫̙͈i̖͙̭̹̠̞n̡̻̮̣̺g̲͈͙̭͙̬͎ ̰t͔̦h̞̲e̢̤ ͍̬̲͖f̴̘͕̣è͖ẹ̥̩l͖͔͚i͓͚̦͠n͖͍̗͓̳̮g͍ ̨o͚̪͡f̘̣̬ ̖̘͖̟͙̮c҉͔̫͖͓͇͖ͅh̵̤̣͚͔á̗̼͕ͅo̼̣̥s̱͈̺̖̦̻͢.̛̖̞̠̫̰', N'"', CAST(N'2022-02-20T00:00:00.000' AS DateTime), CAST(N'2020-08-21T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (75, 117, N'̡͓̞ͅI̗̘̦͝n͇͇͙v̮̫ok̲̫̙͈i̖͙̭̹̠̞n̡̻̮̣̺g̲͈͙̭͙̬͎ ̰t͔̦h̞̲e̢̤ ͍̬̲͖f̴̘͕̣è͖ẹ̥̩l͖͔͚i͓͚̦͠n͖͍̗͓̳̮g͍ ̨o͚̪͡f̘̣̬ ̖̘͖̟͙̮c҉͔̫͖͓͇͖ͅh̵̤̣͚͔á̗̼͕ͅo̼̣̥s̱͈̺̖̦̻͢.̛̖̞̠̫̰', N'1''; DROP TABLE users--', CAST(N'2021-05-07T00:00:00.000' AS DateTime), CAST(N'2021-01-19T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (76, 98, N'-0.5', N'社會科學院語學研究所', CAST(N'2022-01-24T00:00:00.000' AS DateTime), CAST(N'2020-04-08T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (77, 30, N'1.00E+02', N'Œ„´‰ˇÁ¨ˆØ∏”’', CAST(N'2022-06-25T00:00:00.000' AS DateTime), CAST(N'2022-04-21T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (79, 44, N'0️⃣ 1️⃣ 2️⃣ 3️⃣ 4️⃣ 5️⃣ 6️⃣ 7️⃣ 8️⃣ 9️⃣ 🔟', N'NIL', CAST(N'2021-12-21T00:00:00.000' AS DateTime), CAST(N'2020-04-16T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (80, 20, N'2-Jan', N'‫test‫', CAST(N'2020-07-08T00:00:00.000' AS DateTime), CAST(N'2022-01-03T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (81, 162, N'¸˛Ç◊ı˜Â¯˘¿', N'(╯°□°）╯︵ ┻━┻)', CAST(N'2021-03-19T00:00:00.000' AS DateTime), CAST(N'2020-07-26T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (82, 17, N'-1', N'-1.00E+02', CAST(N'2020-03-13T00:00:00.000' AS DateTime), CAST(N'2020-04-06T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (83, 123, N'$1.00 ', N'1.00E+02', CAST(N'2021-06-20T00:00:00.000' AS DateTime), CAST(N'2020-10-11T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (84, 60, N'<img src=x onerror=alert(''hi'') />', N'​', CAST(N'2020-02-04T00:00:00.000' AS DateTime), CAST(N'2020-04-22T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (85, 39, N'-1.00E+02', N'åß∂ƒ©˙∆˚¬…æ', CAST(N'2021-02-20T00:00:00.000' AS DateTime), CAST(N'2021-05-30T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (86, 33, N'בְּרֵאשִׁית, בָּרָא אֱלֹהִים, אֵת הַשָּׁמַיִם, וְאֵת הָאָרֶץ', N'', CAST(N'2021-02-07T00:00:00.000' AS DateTime), CAST(N'2021-06-08T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (87, 138, N'‫test‫', N'1', CAST(N'2022-03-12T00:00:00.000' AS DateTime), CAST(N'2020-07-20T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (91, 4, N'0', N'!@#$%^&*()', CAST(N'2021-04-16T00:00:00.000' AS DateTime), CAST(N'2021-09-30T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (92, 12, N'␣', N'0', CAST(N'2020-09-26T00:00:00.000' AS DateTime), CAST(N'2020-03-31T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (94, 39, N'"''"''"''''''''"', N'0️⃣ 1️⃣ 2️⃣ 3️⃣ 4️⃣ 5️⃣ 6️⃣ 7️⃣ 8️⃣ 9️⃣ 🔟', CAST(N'2022-04-17T00:00:00.000' AS DateTime), CAST(N'2020-04-27T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (95, 102, N'사회과학원 어학연구소', N'｀ｨ(´∀｀∩', CAST(N'2020-09-20T00:00:00.000' AS DateTime), CAST(N'2020-06-18T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (96, 68, N'1', N'../../../../../../../../../../../etc/passwd%00', CAST(N'2020-06-06T00:00:00.000' AS DateTime), CAST(N'2021-09-08T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (97, 187, N'✋🏿 💪🏿 👐🏿 🙌🏿 👏🏿 🙏🏿', N'｀ｨ(´∀｀∩', CAST(N'2021-04-14T00:00:00.000' AS DateTime), CAST(N'2020-05-03T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (98, 119, N'1.00E+00', N'⁰⁴⁵₀₁₂', CAST(N'2020-01-07T00:00:00.000' AS DateTime), CAST(N'2020-01-30T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (100, 157, N'﻿', N'-1', CAST(N'2021-07-01T00:00:00.000' AS DateTime), CAST(N'2021-07-22T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (101, 2, N'0/0', N',。・:*:・゜’( ☻ ω ☻ )。・:*:・゜’', CAST(N'2021-08-21T15:52:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (102, 72, N'הָיְתָהtestالصفحات التّحول', N'2-Jan', CAST(N'2021-09-05T09:20:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (104, 151, N'<>?:"{}|_+', N'🐵 🙈 🙉 🙊', CAST(N'2021-11-28T03:46:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (105, 16, N'<img src=x onerror=alert(''hi'') />', N'0/0', CAST(N'2021-01-22T13:29:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (106, 114, N'!@#$%^&*()', N'パーティーへ行かないか', CAST(N'2021-10-13T16:31:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (107, 90, N'Jan-00', N'̡͓̞ͅI̗̘̦͝n͇͇͙v̮̫ok̲̫̙͈i̖͙̭̹̠̞n̡̻̮̣̺g̲͈͙̭͙̬͎ ̰t͔̦h̞̲e̢̤ ͍̬̲͖f̴̘͕̣è͖ẹ̥̩l͖͔͚i͓͚̦͠n͖͍̗͓̳̮g͍ ̨o͚̪͡f̘̣̬ ̖̘͖̟͙̮c҉͔̫͖͓͇͖ͅh̵̤̣͚͔á̗̼͕ͅo̼̣̥s̱͈̺̖̦̻͢.̛̖̞̠̫̰', CAST(N'2021-12-06T12:45:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (108, 168, N'"''''''''"''"', N'(｡◕ ∀ ◕｡)', CAST(N'2020-04-26T21:53:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (109, 99, N'␢', N'␢', CAST(N'2021-07-07T20:41:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (110, 129, N'😍', N'-1.00E+02', CAST(N'2020-07-27T03:14:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (111, 153, N'١٢٣', N'‪‪test‪', CAST(N'2022-04-26T04:36:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (112, 146, N'/dev/null; touch /tmp/blns.fail ; echo', N'̗̺͖̹̯͓Ṯ̤͍̥͇͈h̲́e͏͓̼̗̙̼̣͔ ͇̜̱̠͓͍ͅN͕͠e̗̱z̘̝̜̺͙p̤̺̹͍̯͚e̠̻̠͜r̨̤͍̺̖͔̖̖d̠̟̭̬̝͟i̦͖̩͓͔̤a̠̗̬͉̙n͚͜ ̻̞̰͚ͅh̵͉i̳̞v̢͇ḙ͎͟-҉̭̩̼͔m̤̭̫i͕͇̝̦n̗͙ḍ̟ ̯̲͕͞ǫ̟̯̰̲͙̻̝f ̪̰̰̗̖̭̘͘c̦͍̲̞͍̩̙ḥ͚a̮͎̟̙͜ơ̩̹͎s̤.̝̝ ҉Z̡̖̜͖̰̣͉̜a͖̰͙̬͡l̲̫̳͍̩g̡̟̼̱͚̞̬ͅo̗͜.̟', CAST(N'2021-08-20T08:15:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (116, 40, N'($1.00)', N'""', CAST(N'2020-07-17T22:21:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (117, 2, N'1;DROP TABLE users', N'和製漢語', CAST(N'2020-08-02T07:43:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (118, 44, N',./;''[]\-=', N',./;''[]\-=', CAST(N'2021-08-26T00:18:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (119, 15, N'⁦test⁧', N'<>?:"{}|_+', CAST(N'2022-03-23T15:22:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (120, 95, N'¡™£¢∞§¶•ªº–≠', N'1.00E+02', CAST(N'2022-05-15T04:44:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (121, 137, N'(╯°□°）╯︵ ┻━┻)', N'⁰⁴⁵₀₁₂', CAST(N'2022-01-09T00:01:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (123, 36, N'`⁄€‹›ﬁﬂ‡°·‚—±', N'ثم نفس سقطت وبالتحديد،, جزيرتي باستخدام أن دنو. إذ هنا؟ الستار وتنصيب كان. أهّل ايطاليا، بريطانيا-فرنسا قد أخذ. سليمان، إتفاقية بين ما, يذكر الحدود أي بعد, معاملة بولندا، الإطلاق عل إيو.', CAST(N'2022-05-26T19:53:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (124, 92, N'田中さんにあげて下さい', N'-0.5', CAST(N'2020-11-29T15:37:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (128, 196, N'❤️ 💔 💌 💕 💞 💓 💗 💖 💘 💝 💟 💜 💛 💚 💙', N'田中さんにあげて下さい', CAST(N'2020-10-22T00:12:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (129, 18, N'ヽ༼ຈل͜ຈ༽ﾉ ヽ༼ຈل͜ຈ༽ﾉ', N'œ∑´®†¥¨ˆøπ“‘', CAST(N'2021-10-26T23:02:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (130, 163, N'Z̮̞̠͙͔ͅḀ̗̞͈̻̗Ḷ͙͎̯̹̞͓G̻O̭̗̮', N'🐵 🙈 🙉 🙊', CAST(N'2020-09-22T23:25:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (131, 52, N'̦H̬̤̗̤͝e͜ ̜̥̝̻͍̟́w̕h̖̯͓o̝͙̖͎̱̮ ҉̺̙̞̟͈W̷̼̭a̺̪͍į͈͕̭͙̯̜t̶̼̮s̘͙͖̕ ̠̫̠B̻͍͙͉̳ͅe̵h̵̬͇̫͙i̹͓̳̳̮͎̫̕n͟d̴̪̜̖ ̰͉̩͇͙̲͞ͅT͖̼͓̪͢h͏͓̮̻e̬̝̟ͅ ̤̹̝W͙̞̝͔͇͝ͅa͏͓͔̹̼̣l̴͔̰̤̟͔ḽ̫.͕', N'１２３', CAST(N'2021-05-16T06:25:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (132, 33, NULL, N'''"''', CAST(N'2020-10-29T16:41:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (133, 76, N'/dev/null; touch /tmp/blns.fail ; echo', N'Ṱ̺̺̕o͞ ̷i̲̬͇̪͙n̝̗͕v̟̜̘̦͟o̶̙̰̠kè͚̮̺̪̹̱̤ ̖t̝͕̳̣̻̪͞h̼͓̲̦̳̘̲e͇̣̰̦̬͎ ̢̼̻̱̘h͚͎͙̜̣̲ͅi̦̲̣̰̤v̻͍e̺̭̳̪̰-m̢iͅn̖̺̞̲̯̰d̵̼̟͙̩̼̘̳ ̞̥̱̳̭r̛̗̘e͙p͠r̼̞̻̭̗e̺̠̣͟s̘͇̳͍̝͉e͉̥̯̞̲͚̬͜ǹ̬͎͎̟̖͇̤t͍̬̤͓̼̭͘ͅi̪̱n͠g̴͉ ͏͉ͅc̬̟h͡a̫̻̯͘o̫̟̖͍̙̝͉s̗̦̲.̨̹͈̣', CAST(N'2022-03-21T05:55:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (134, 84, N'␢', N'😍', CAST(N'2020-07-16T21:47:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (135, 84, N'Œ„´‰ˇÁ¨ˆØ∏”’', N'"', CAST(N'2020-08-11T08:19:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (136, 187, N'הָיְתָהtestالصفحات التّحول', N'⁰⁴⁵₀₁₂', CAST(N'2020-09-25T03:25:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (137, 46, N'˙ɐnbᴉlɐ ɐuƃɐɯ ǝɹolop ʇǝ ǝɹoqɐl ʇn ʇunpᴉpᴉɔuᴉ ɹodɯǝʇ poɯsnᴉǝ op pǝs ''ʇᴉlǝ ƃuᴉɔsᴉdᴉpɐ ɹnʇǝʇɔǝsuoɔ ''ʇǝɯɐ ʇᴉs ɹolop ɯnsdᴉ ɯǝɹo˥', N'test⁠test‫', CAST(N'2020-01-20T17:16:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (138, 66, N'"', N'''"''', CAST(N'2020-06-08T17:27:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (139, 133, N'Z̮̞̠͙͔ͅḀ̗̞͈̻̗Ḷ͙͎̯̹̞͓G̻O̭̗̮', N'👾 🙇 💁 🙅 🙆 🙋 🙎 🙍', CAST(N'2020-08-25T07:51:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (140, 64, N'() { _; } >_[$($())] { touch /tmp/blns.shellshock2.fail; }', N'/dev/null; touch /tmp/blns.fail ; echo', CAST(N'2020-04-09T04:36:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (141, 159, N'¡™£¢∞§¶•ªº–≠', N'Z̮̞̠͙͔ͅḀ̗̞͈̻̗Ḷ͙͎̯̹̞͓G̻O̭̗̮', CAST(N'2021-10-07T23:07:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (142, 112, N',./;''[]\-=', N'🐵 🙈 🙉 🙊', CAST(N'2020-02-07T16:13:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (143, 171, N'⁰⁴⁵', N'パーティーへ行かないか', CAST(N'2020-11-04T16:12:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (144, 128, N'1''; DROP TABLE users--', N'₀₁₂', CAST(N'2022-03-13T23:21:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (145, 187, N'(｡◕ ∀ ◕｡)', N'œ∑´®†¥¨ˆøπ“‘', CAST(N'2020-06-01T17:19:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (146, 134, N'0️⃣ 1️⃣ 2️⃣ 3️⃣ 4️⃣ 5️⃣ 6️⃣ 7️⃣ 8️⃣ 9️⃣ 🔟', N'NIL', CAST(N'2022-06-03T08:24:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (147, 185, N'‫test‫', N'・(￣∀￣)・:*:', CAST(N'2020-05-01T10:58:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (148, 66, N'null', N',。・:*:・゜’( ☻ ω ☻ )。・:*:・゜’', CAST(N'2020-01-09T04:41:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (149, 59, N'"''''''''"''"', N'｀ｨ(´∀｀∩', CAST(N'2021-02-08T17:17:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (150, 181, N',./;''[]\-=', N'<svg><script>0<1>alert(''XSS'')</script>', CAST(N'2021-03-02T02:52:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (151, 156, N'-1', N'˙ɐnbᴉlɐ ɐuƃɐɯ ǝɹolop ʇǝ ǝɹoqɐl ʇn ʇunpᴉpᴉɔuᴉ ɹodɯǝʇ poɯsnᴉǝ op pǝs ''ʇᴉlǝ ƃuᴉɔsᴉdᴉpɐ ɹnʇǝʇɔǝsuoɔ ''ʇǝɯɐ ʇᴉs ɹolop ɯnsdᴉ ɯǝɹo˥', CAST(N'2020-10-07T00:29:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (152, 70, N'사회과학원 어학연구소', N'-1.00E+02', CAST(N'2021-12-16T17:02:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (153, 54, N'👾 🙇 💁 🙅 🙆 🙋 🙎 🙍', N'᠎', CAST(N'2021-11-14T02:28:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (154, 136, N'˙ɐnbᴉlɐ ɐuƃɐɯ ǝɹolop ʇǝ ǝɹoqɐl ʇn ʇunpᴉpᴉɔuᴉ ɹodɯǝʇ poɯsnᴉǝ op pǝs ''ʇᴉlǝ ƃuᴉɔsᴉdᴉpɐ ɹnʇǝʇɔǝsuoɔ ''ʇǝɯɐ ʇᴉs ɹolop ɯnsdᴉ ɯǝɹo˥', N'١٢٣', CAST(N'2022-04-17T17:07:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (155, 85, NULL, N'''"''', CAST(N'2021-02-12T06:15:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (156, 28, N'', N'1;DROP TABLE users', CAST(N'2022-02-02T01:38:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (158, 77, N'␡', N'<svg><script>0<1>alert(''XSS'')</script>', CAST(N'2020-05-28T16:18:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (159, 177, N'בְּרֵאשִׁית, בָּרָא אֱלֹהִים, אֵת הַשָּׁמַיִם, וְאֵת הָאָרֶץ', N'🚾 🆒 🆓 🆕 🆖 🆗 🆙 🏧', CAST(N'2022-01-11T16:19:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (160, 57, N'null', N'｀ｨ(´∀｀∩', CAST(N'2022-01-17T14:31:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (161, 36, N' ', N'1.00E+02', CAST(N'2021-04-05T13:36:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (162, 157, N'⁰⁴⁵₀₁₂', N'✋🏿 💪🏿 👐🏿 🙌🏿 👏🏿 🙏🏿', CAST(N'2022-06-23T18:53:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (163, 66, N'社會科學院語學研究所', N'Jan-00', CAST(N'2021-11-24T11:14:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (164, 143, N'`⁄€‹›ﬁﬂ‡°·‚—±', N'../../../../../../../../../../../etc/passwd%00', CAST(N'2020-07-06T22:46:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (165, 109, N'1.00E+02', N'̗̺͖̹̯͓Ṯ̤͍̥͇͈h̲́e͏͓̼̗̙̼̣͔ ͇̜̱̠͓͍ͅN͕͠e̗̱z̘̝̜̺͙p̤̺̹͍̯͚e̠̻̠͜r̨̤͍̺̖͔̖̖d̠̟̭̬̝͟i̦͖̩͓͔̤a̠̗̬͉̙n͚͜ ̻̞̰͚ͅh̵͉i̳̞v̢͇ḙ͎͟-҉̭̩̼͔m̤̭̫i͕͇̝̦n̗͙ḍ̟ ̯̲͕͞ǫ̟̯̰̲͙̻̝f ̪̰̰̗̖̭̘͘c̦͍̲̞͍̩̙ḥ͚a̮͎̟̙͜ơ̩̹͎s̤.̝̝ ҉Z̡̖̜͖̰̣͉̜a͖̰͙̬͡l̲̫̳͍̩g̡̟̼̱͚̞̬ͅo̗͜.̟', CAST(N'2021-08-11T05:49:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (166, 128, N'0', N'1', CAST(N'2021-05-04T14:36:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (167, 103, N'"''"''"''''''''"', N'𠜎𠜱𠝹𠱓𠱸𠲖𠳏', CAST(N'2020-02-11T15:05:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (169, 146, N' ', N'1.00E+02', CAST(N'2021-05-15T23:55:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (170, 74, N'', N'00˙Ɩ$-', CAST(N'2022-01-03T14:12:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (171, 144, N'١٢٣', N'-1.00E+02', CAST(N'2022-04-15T02:40:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (172, 42, N'''"''', N'👾 🙇 💁 🙅 🙆 🙋 🙎 🙍', CAST(N'2021-05-01T08:53:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (173, 64, N'"''''''''"''"', N'nil', CAST(N'2021-07-21T02:14:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (174, 174, N'-0.5', N'00˙Ɩ$-', CAST(N'2021-04-16T02:38:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (175, 137, N'åß∂ƒ©˙∆˚¬…æ', N'() { 0; }; touch /tmp/blns.shellshock1.fail;', CAST(N'2021-08-28T05:56:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (176, 4, N'😍', N'<script>alert(''hi'')</script>', CAST(N'2021-03-11T09:56:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (177, 84, N'‫test‫', N'(ﾉಥ益ಥ）ﾉ﻿ ┻━┻', CAST(N'2020-07-28T01:52:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (178, 188, N'⁰⁴⁵', N'울란바토르', CAST(N'2022-06-06T07:13:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (179, 67, N'-0.5', N'__ﾛ(,_,*)', CAST(N'2020-08-28T10:09:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (180, 67, N'｀ｨ(´∀｀∩', N'✋🏿 💪🏿 👐🏿 🙌🏿 👏🏿 🙏🏿', CAST(N'2020-01-20T07:14:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (181, 127, N'''"''', N'הָיְתָהtestالصفحات التّحول', CAST(N'2020-02-08T02:03:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (182, 195, N'בְּרֵאשִׁית, בָּרָא אֱלֹהִים, אֵת הַשָּׁמַיִם, וְאֵת הָאָרֶץ', N'1E+96', CAST(N'2021-06-21T21:04:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (183, 72, N'__ﾛ(,_,*)', N'0/0', CAST(N'2022-03-16T10:19:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (184, 194, N'0', N'1.00E+02', CAST(N'2021-03-06T15:09:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (185, 167, N',。・:*:・゜’( ☻ ω ☻ )。・:*:・゜’', N'❤️ 💔 💌 💕 💞 💓 💗 💖 💘 💝 💟 💜 💛 💚 💙', CAST(N'2021-09-02T04:42:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (187, 93, N'<>?:"{}|_+', N'😍', CAST(N'2021-11-26T17:20:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (188, 178, N'Œ„´‰ˇÁ¨ˆØ∏”’', N'Œ„´‰ˇÁ¨ˆØ∏”’', CAST(N'2021-03-19T14:17:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (189, 156, N'null', N'-1.00E+02', CAST(N'2020-04-01T12:33:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (190, 51, N'｀ｨ(´∀｀∩', N'̡͓̞ͅI̗̘̦͝n͇͇͙v̮̫ok̲̫̙͈i̖͙̭̹̠̞n̡̻̮̣̺g̲͈͙̭͙̬͎ ̰t͔̦h̞̲e̢̤ ͍̬̲͖f̴̘͕̣è͖ẹ̥̩l͖͔͚i͓͚̦͠n͖͍̗͓̳̮g͍ ̨o͚̪͡f̘̣̬ ̖̘͖̟͙̮c҉͔̫͖͓͇͖ͅh̵̤̣͚͔á̗̼͕ͅo̼̣̥s̱͈̺̖̦̻͢.̛̖̞̠̫̰', CAST(N'2021-09-01T23:21:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (191, 93, N'⁰⁴⁵₀₁₂', N'''"''', CAST(N'2020-04-28T15:40:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (192, 25, N'(╯°□°）╯︵ ┻━┻)', N'הָיְתָהtestالصفحات التّحول', CAST(N'2021-03-13T21:07:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (193, 30, N'⁰⁴⁵', N'2-Jan', CAST(N'2021-03-02T03:03:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (194, 188, N'田中さんにあげて下さい', N'❤️ 💔 💌 💕 💞 💓 💗 💖 💘 💝 💟 💜 💛 💚 💙', CAST(N'2020-06-06T03:21:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (195, 20, N'ثم نفس سقطت وبالتحديد،, جزيرتي باستخدام أن دنو. إذ هنا؟ الستار وتنصيب كان. أهّل ايطاليا، بريطانيا-فرنسا قد أخذ. سليمان، إتفاقية بين ما, يذكر الحدود أي بعد, معاملة بولندا، الإطلاق عل إيو.', N'null', CAST(N'2020-07-09T23:07:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (196, 82, N'田中さんにあげて下さい', N'1', CAST(N'2020-11-22T05:40:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (197, 19, N'᠎', N'__ﾛ(,_,*)', CAST(N'2021-12-09T07:07:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (198, 109, N'田中さんにあげて下さい', N'$1.00 ', CAST(N'2020-08-23T02:48:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (199, 37, N'__ﾛ(,_,*)', N'0/0', CAST(N'2021-05-22T02:03:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (200, 51, N',。・:*:・゜’( ☻ ω ☻ )。・:*:・゜’', N'-0.5', CAST(N'2020-01-04T20:34:00.000' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (201, 201, N'haha', N'haha', CAST(N'2022-11-30T03:51:12.397' AS DateTime), NULL, 0, 0)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (202, 201, N'Huhu', N'Huhu', CAST(N'2022-11-30T03:53:12.173' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (203, 202, N'???', N'???', CAST(N'2022-11-30T03:54:54.483' AS DateTime), NULL, 0, 1)
GO
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (204, 201, N'Món ăn ngon lắm!!!', N'Món ăn ngon lắm!!!', CAST(N'2022-12-25T22:27:18.887' AS DateTime), NULL, 0, 1)
GO
SET IDENTITY_INSERT [dbo].[comments] OFF
GO
SET IDENTITY_INSERT [dbo].[customer_phone_address] ON 
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (1, 77, 0, N'81903 Haas Court', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (2, 20, 1, N'+62 364 979 9780', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (3, 36, 1, N'+54 647 890 1277', 1)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (4, 70, 1, N'+54 335 883 2762', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (5, 7, 0, N'41521 Florence Street', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (6, 40, 1, N'+63 506 239 9917', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (7, 31, 1, N'+7 508 520 0934', 1)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (8, 37, 1, N'+86 778 823 4845', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (9, 3, 1, N'+51 595 307 7672', 1)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (10, 79, 1, N'+212 389 351 5907', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (11, 66, 0, N'7 Cherokee Center', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (12, 65, 1, N'+7 612 421 9472', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (13, 88, 0, N'46349 Bartillon Road', 1)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (14, 30, 1, N'+48 227 695 9292', 1)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (15, 40, 0, N'24 Bluestem Street', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (16, 81, 1, N'+269 932 331 0794', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (17, 44, 1, N'+375 978 815 0118', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (18, 81, 0, N'42 Charing Cross Trail', 1)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (19, 8, 1, N'+351 110 304 6129', 1)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (20, 98, 0, N'9 Raven Point', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (21, 49, 0, N'25 Birchwood Road', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (22, 27, 1, N'+7 798 544 4276', 1)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (23, 61, 1, N'+376 992 449 4184', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (24, 26, 0, N'33037 Fairview Center', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (25, 29, 0, N'64 Park Meadow Hill', 1)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (26, 45, 0, N'342 Union Pass', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (27, 92, 1, N'+57 485 768 6641', 1)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (28, 61, 1, N'+33 709 985 9175', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (29, 22, 1, N'+63 502 990 5962', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (30, 75, 1, N'+86 720 822 4312', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (31, 72, 1, N'+86 767 109 2175', 1)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (32, 33, 0, N'526 Westridge Road', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (33, 53, 0, N'980 Hintze Place', 1)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (34, 1, 1, N'+62 269 468 0044', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (35, 76, 0, N'45177 Claremont Parkway', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (36, 48, 1, N'+62 346 134 3130', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (37, 32, 1, N'+20 805 388 3027', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (38, 85, 0, N'7 Butternut Way', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (39, 46, 0, N'604 Northland Court', 1)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (40, 59, 1, N'+33 318 420 0501', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (41, 52, 0, N'92743 Banding Lane', 1)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (42, 81, 0, N'24 Old Shore Way', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (43, 99, 1, N'+7 169 946 1242', 1)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (44, 48, 1, N'+381 970 296 0226', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (45, 90, 1, N'+7 178 538 7423', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (46, 69, 1, N'+55 873 547 7074', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (47, 6, 1, N'+62 856 838 0424', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (48, 32, 0, N'70522 Springview Road', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (49, 64, 0, N'987 Fallview Trail', 1)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (50, 42, 1, N'+86 382 556 2683', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (51, 40, 1, N'+62 130 430 2345', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (52, 100, 0, N'5 Melody Junction', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (53, 92, 0, N'45 Fallview Terrace', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (54, 87, 0, N'3 Stoughton Center', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (55, 6, 1, N'+46 675 211 2274', 1)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (56, 1, 1, N'+86 342 444 9753', 1)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (57, 93, 1, N'+44 769 275 7271', 1)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (58, 10, 0, N'7 Boyd Street', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (59, 46, 1, N'+33 318 669 3905', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (60, 22, 1, N'+55 335 426 0767', 1)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (61, 16, 1, N'+234 892 152 6580', 1)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (62, 99, 1, N'+33 401 886 1934', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (63, 10, 1, N'+62 667 643 4741', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (64, 7, 1, N'+358 152 700 2437', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (65, 50, 1, N'+86 370 900 0331', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (66, 40, 1, N'+62 105 963 3591', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (67, 95, 1, N'+33 469 193 6447', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (68, 58, 0, N'23483 Randy Junction', 1)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (69, 52, 0, N'6031 Bowman Parkway', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (70, 95, 0, N'876 Sheridan Circle', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (71, 23, 0, N'4040 Alpine Court', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (72, 69, 1, N'+7 109 512 4858', 1)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (73, 84, 0, N'55 Bultman Drive', 1)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (74, 85, 1, N'+62 162 944 8535', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (75, 74, 0, N'67 Grim Point', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (76, 97, 1, N'+33 707 183 9980', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (77, 51, 1, N'+381 628 664 6452', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (78, 78, 0, N'36 Hauk Lane', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (79, 58, 0, N'276 Armistice Center', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (80, 44, 1, N'+86 529 249 1571', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (81, 10, 0, N'93864 American Ash Center', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (82, 35, 1, N'+52 264 131 3885', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (83, 18, 0, N'2 Westridge Park', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (84, 64, 0, N'56 Myrtle Plaza', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (85, 9, 0, N'38 Everett Lane', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (86, 16, 1, N'+370 102 277 5608', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (87, 77, 0, N'69634 Eagan Point', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (88, 3, 0, N'816 Carioca Court', 1)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (89, 34, 1, N'+55 478 618 5046', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (90, 66, 0, N'064 Dorton Avenue', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (91, 19, 1, N'+55 727 735 6749', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (92, 9, 1, N'+62 200 998 1254', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (93, 38, 1, N'+225 950 756 3022', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (94, 62, 1, N'+371 873 254 2292', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (95, 61, 0, N'2983 Cambridge Court', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (96, 32, 0, N'12 Doe Crossing Center', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (97, 38, 0, N'744 Maple Circle', 1)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (98, 28, 0, N'5 Summit Way', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (99, 10, 0, N'301 Mallard Street', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (100, 65, 1, N'+380 213 818 9722', 1)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (101, 86, 1, N'+62 300 371 3409', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (102, 21, 0, N'419 Northview Hill', 1)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (103, 78, 0, N'38 Donald Circle', 1)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (104, 47, 1, N'+81 233 578 1373', 1)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (105, 24, 0, N'422 Shoshone Lane', 1)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (106, 78, 0, N'6417 Merchant Park', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (107, 94, 0, N'9 Mifflin Place', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (108, 8, 1, N'+359 725 383 0985', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (109, 75, 1, N'+86 137 605 2398', 1)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (110, 1, 0, N'3 Chinook Street', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (111, 32, 1, N'+351 318 290 3489', 1)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (112, 77, 0, N'6 Pepper Wood Place', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (113, 96, 1, N'+46 567 966 2420', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (114, 78, 1, N'+63 451 174 5720', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (115, 16, 1, N'+234 390 541 7167', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (116, 83, 0, N'5223 Washington Plaza', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (117, 50, 0, N'371 Pearson Road', 1)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (118, 92, 0, N'4 Thierer Circle', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (119, 46, 0, N'555 Charing Cross Way', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (120, 27, 0, N'8 Carberry Center', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (121, 91, 0, N'80 Mallory Plaza', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (122, 49, 0, N'89351 Chive Plaza', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (123, 20, 0, N'7 Kings Road', 1)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (124, 72, 1, N'+20 127 339 5604', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (125, 12, 1, N'+27 514 647 6093', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (126, 72, 1, N'+86 966 394 4237', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (127, 72, 0, N'229 Cody Pass', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (128, 94, 0, N'1 Service Court', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (129, 88, 1, N'+62 504 220 6709', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (130, 41, 0, N'84306 Mosinee Junction', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (131, 32, 1, N'+420 707 812 8363', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (132, 63, 0, N'8 Gina Drive', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (133, 48, 1, N'+86 837 160 3720', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (134, 82, 0, N'5 Basil Pass', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (135, 83, 0, N'27 Larry Pass', 1)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (136, 44, 1, N'+880 616 370 6431', 1)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (137, 18, 1, N'+86 232 985 2154', 1)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (138, 17, 1, N'+56 392 916 5332', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (139, 51, 0, N'23 Stang Circle', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (140, 88, 1, N'+374 768 719 3308', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (141, 55, 1, N'+63 249 785 8563', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (142, 54, 0, N'836 Dexter Drive', 1)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (143, 45, 1, N'+351 450 245 6298', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (144, 100, 0, N'78396 Vidon Alley', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (145, 82, 0, N'682 Grim Park', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (146, 23, 0, N'7 Toban Point', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (147, 1, 1, N'+234 674 450 6806', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (148, 17, 1, N'+63 239 222 5693', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (149, 37, 1, N'+62 942 245 9722', 1)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (150, 60, 0, N'78 Schiller Place', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (151, 27, 0, N'7 Cascade Park', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (152, 56, 1, N'+62 483 457 7318', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (153, 15, 0, N'8 Vahlen Pass', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (154, 5, 1, N'+86 392 172 2106', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (155, 67, 1, N'+86 385 680 3343', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (156, 27, 1, N'+963 337 438 8062', 1)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (157, 40, 0, N'995 Coolidge Court', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (158, 84, 0, N'03617 Basil Way', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (159, 84, 1, N'+253 595 151 6209', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (160, 47, 1, N'+48 595 119 3905', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (161, 20, 0, N'978 Melby Alley', 1)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (162, 4, 0, N'1163 Blackbird Street', 1)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (163, 27, 1, N'+62 918 553 2465', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (164, 38, 1, N'+86 479 875 8108', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (165, 59, 0, N'66991 Oxford Parkway', 1)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (166, 93, 0, N'844 Clemons Hill', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (167, 21, 0, N'00735 Brentwood Drive', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (168, 35, 0, N'0029 Sutherland Drive', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (169, 69, 0, N'30 Stang Court', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (170, 49, 0, N'64 6th Hill', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (171, 6, 1, N'+63 261 447 5896', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (172, 85, 0, N'3313 Spaight Trail', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (173, 56, 1, N'+63 304 139 5815', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (174, 89, 1, N'+1 910 480 5552', 1)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (175, 86, 0, N'32653 Evergreen Drive', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (176, 40, 1, N'+48 258 665 0496', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (177, 47, 1, N'+63 570 184 1621', 1)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (178, 14, 0, N'07 School Park', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (179, 41, 1, N'+591 311 170 1386', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (180, 5, 1, N'+63 599 512 7419', 1)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (181, 15, 1, N'+57 226 947 3770', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (182, 70, 1, N'+57 423 957 8778', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (183, 21, 1, N'+33 406 313 2994', 1)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (184, 34, 1, N'+1 713 927 5000', 1)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (185, 71, 0, N'113 Laurel Avenue', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (186, 29, 1, N'+62 906 134 7181', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (187, 81, 0, N'15 Mayfield Way', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (188, 50, 1, N'+593 530 442 3540', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (189, 95, 1, N'+27 561 230 3251', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (190, 72, 1, N'+994 470 555 0581', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (191, 4, 1, N'+994 476 532 6724', 1)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (192, 17, 0, N'023 Knutson Junction', 1)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (193, 18, 0, N'143 Grim Street', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (194, 72, 0, N'91 Loeprich Hill', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (195, 53, 1, N'+1 503 197 0758', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (196, 31, 0, N'25 Old Gate Drive', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (197, 38, 1, N'+63 519 600 7023', 1)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (198, 35, 0, N'900 Ridge Oak Pass', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (199, 96, 0, N'89382 Everett Crossing', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (200, 76, 0, N'124 Sugar Road', 0)
GO
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (207, 1, 0, N'Ho Chi Minh', 1)
GO
SET IDENTITY_INSERT [dbo].[customer_phone_address] OFF
GO
SET IDENTITY_INSERT [dbo].[customers] ON 
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (1, N'user', N'123', N'User', 1, N'lucdtps17380@fpt.edu.vn', NULL, N'user.png', NULL, NULL, 0, CAST(N'2021-04-16T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (2, N'ccalverd0', N'nrL74o2I', N'Che Calverd', 0, N'ccalverd0@yelp.com', CAST(N'1983-07-01T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2021-04-16T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (3, N'lleidl1', N'Got224a', N'Lisette Leidl', 0, N'lleidl1@amazon.co.uk', CAST(N'1995-08-24T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2020-05-19T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (4, N'candrichuk2', N'uLgwDhTcAf', N'Cindie Andrichuk', 0, N'candrichuk2@unblog.fr', CAST(N'1981-03-28T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2020-04-01T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (5, N'psilverstone31', N'5SoYUOTKAa4L', N'Pooh Silverstone', 1, N'psilverstone3@wikipedia.org', CAST(N'1992-12-14T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2021-06-12T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (6, N'ekee4', N'q9Dgvk', N'Ellene Kee', 1, N'ekee4@who.int', CAST(N'1990-08-14T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2021-09-20T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (7, N'cgoodings5', N'SiJgt0AkB', N'Chen Goodings', 0, N'cgoodings5@spiegel.de', CAST(N'1984-05-26T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2020-03-13T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (8, N'bdrakeford6', N'AoBl9boEcs', N'Beulah Drakeford', 0, N'bdrakeford6@admin.ch', CAST(N'1998-03-22T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2021-06-19T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (9, N'lo7', N'WUpdub8ofb', N'Lyndsey O'' Reagan', 0, N'lo7@ibm.com', CAST(N'1992-01-29T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2021-07-16T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (10, N'jfoggarty8', N'4vEThy', N'Jonathon Foggarty', 1, N'jfoggarty8@sakura.ne.jp', CAST(N'1992-11-07T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2022-04-03T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (11, N'kcorden9', N'Vck00eT9', N'Katherine Corden', 0, N'kcorden9@timesonline.co.uk', CAST(N'1991-03-03T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2021-06-12T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (12, N'dklammta', N'JHebq8V0E3O0', N'Derrek Klammt', 0, N'dklammta@auda.org.au', CAST(N'1983-10-16T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2020-10-10T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (13, N'tberthelb', N'DwcJ7NEI', N'Tiffanie Berthel', 1, N'tberthelb@posterous.com', CAST(N'1991-05-17T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2021-03-25T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (14, N'hsaldlerc', N'wHkNOVMcFIi2', N'Haywood Saldler', 1, N'hsaldlerc@craigslist.org', CAST(N'1982-03-15T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2021-02-07T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (15, N'bbyred', N'gZqLUO', N'Brigit Byre', 1, N'bbyred@skype.com', CAST(N'1981-07-07T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2020-12-28T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (16, N'mlovstrome', N'HnXD6f', N'Myrta Lovstrom', 1, N'mlovstrome@canalblog.com', CAST(N'1986-09-21T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2021-01-06T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (17, N'afillaryf', N'uUIzc4Ru', N'Annmaria Fillary', 1, N'afillaryf@washingtonpost.com', CAST(N'1990-05-24T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2021-10-15T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (18, N'cbeeresg', N'j4g79wc', N'Cherida Beeres', 1, N'cbeeresg@intel.com', CAST(N'1984-07-06T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2022-04-06T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (19, N'mwindowsh', N'OVY56F2uWGWC', N'Marilyn Windows', 0, N'mwindowsh@constantcontact.com', CAST(N'1998-11-07T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2022-06-07T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (20, N'tsinotti', N'qh4c28q65Ik', N'Terry Sinott', 1, N'tsinotti@smugmug.com', CAST(N'2000-02-23T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2020-06-04T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (21, N'blunneyj', N'IP5s3Tc', N'Bevvy Lunney', 1, N'blunneyj@wunderground.com', CAST(N'1996-09-21T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2020-02-25T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (22, N'bbartolomeottik', N'QCiyLvYjS8o', N'Buck Bartolomeotti', 0, N'bbartolomeottik@bbc.co.uk', CAST(N'1989-08-09T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2020-01-19T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (23, N'mjoiceyl', N'FGPBnD', N'Meade Joicey', 1, N'mjoiceyl@ameblo.jp', CAST(N'1991-07-07T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2021-10-08T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (24, N'iarbuckelm', N'uxKbQ6ixud', N'Isidor Arbuckel', 1, N'iarbuckelm@privacy.gov.au', CAST(N'1991-05-28T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2021-02-21T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (25, N'kbiggerdiken', N'JlK8uwXt', N'Kristo Biggerdike', 1, N'kbiggerdiken@multiply.com', CAST(N'1983-12-29T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2022-01-23T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (26, N'tswanwicko', N'iIZ3x3gbLI', N'Teodora Swanwick', 1, N'tswanwicko@infoseek.co.jp', CAST(N'1985-07-21T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2020-06-21T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (27, N'fgislebertp', N'ntid2sQC', N'Florance Gislebert', 1, N'fgislebertp@gmpg.org', CAST(N'1982-07-26T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2022-05-15T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (28, N'wsiddonq', N'6rs6P49', N'Waldo Siddon', 1, N'wsiddonq@sourceforge.net', CAST(N'1989-12-28T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2021-03-08T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (29, N'zshowellr', N'Vje8Xp', N'Zane Showell', 0, N'zshowellr@fastcompany.com', CAST(N'1991-03-01T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2021-09-28T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (30, N'fcasassas', N'hxLxBjsPwV', N'Fredia Casassa', 1, N'fcasassas@com.com', CAST(N'1993-02-15T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2022-04-24T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (31, N'kelwoodt', N'lIQdEOGzgU', N'Kit Elwood', 0, N'kelwoodt@senate.gov', CAST(N'1981-11-14T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2021-10-09T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (32, N'sblaziu', N'R2SC0Y2uA3', N'Stephannie Blazi', 0, N'sblaziu@csmonitor.com', CAST(N'2001-05-20T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2020-02-29T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (33, N'mraulstonev', N'Fj6NZ11Fnzov', N'Milzie Raulstone', 0, N'mraulstonev@addthis.com', CAST(N'1985-12-17T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2021-10-25T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (34, N'csouthanw', N'S0TfbOiiI', N'Clemmie Southan', 1, N'csouthanw@mysql.com', CAST(N'1980-12-27T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2021-02-15T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (35, N'hsparshottx', N'Kii2FYWza8', N'Hashim Sparshott', 1, N'hsparshottx@shutterfly.com', CAST(N'1998-08-31T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2022-05-27T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (36, N'cletticey', N'4KaX6meuA9', N'Cesaro Lettice', 1, N'cletticey@nytimes.com', CAST(N'1989-08-19T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2022-03-09T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (37, N'mperoz', N'wYzTEov4jIsz', N'Matthiew Pero', 0, N'mperoz@comcast.net', CAST(N'1982-01-23T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2021-08-26T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (38, N'jemilien10', N'OuCy3XrTU', N'Jules Emilien', 0, N'jemilien10@disqus.com', CAST(N'1989-03-18T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2021-10-25T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (39, N'omudd11', N'9jY3JFLA', N'Osbourne Mudd', 1, N'omudd11@gmpg.org', CAST(N'1983-08-02T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2022-04-14T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (40, N'pberzins12', N'NQ0iPg', N'Paco Berzins', 1, N'pberzins12@usa.gov', CAST(N'1988-07-23T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2020-07-05T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (41, N'scoaten13', N'DcUZovSsCgCb', N'Stevy Coaten', 1, N'scoaten13@a8.net', CAST(N'1981-01-19T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2021-02-17T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (42, N'tcurl14', N'lB5l7J', N'Tibold Curl', 0, N'tcurl14@washington.edu', CAST(N'2002-02-01T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2020-03-04T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (43, N'ngrund15', N'j8DOAYdJlbla', N'Nickie Grund', 0, N'ngrund15@accuweather.com', CAST(N'1994-05-10T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2020-06-05T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (44, N'houghton16', N'yZaI1tQ7lg', N'Hastings Oughton', 0, N'houghton16@exblog.jp', CAST(N'1996-07-29T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2022-06-21T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (45, N'aviney17', N'8ER1ER4t4', N'Abram Viney', 1, N'aviney17@a8.net', CAST(N'1987-04-25T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2022-01-10T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (46, N'lwerlock18', N'afmG90s', N'Ly Werlock', 1, N'lwerlock18@wordpress.org', CAST(N'1995-12-27T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2022-03-27T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (47, N'ecrosskell19', N'7ZQEktfp9', N'Emmye Crosskell', 0, N'ecrosskell19@google.nl', CAST(N'1986-12-12T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2022-05-15T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (48, N'ddamrel1a', N'g6EIqAfRr', N'Delaney Damrel', 1, N'ddamrel1a@spotify.com', CAST(N'2002-10-26T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2022-04-12T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (49, N'rrosenboim1b', N'kZENiXzOYPoA', N'Rock Rosenboim', 1, N'rrosenboim1b@youtube.com', CAST(N'1983-09-10T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2021-04-29T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (50, N'cfrancis1c', N'A3vYQQ', N'Calli Francis', 0, N'cfrancis1c@foxnews.com', CAST(N'1999-12-11T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2022-05-22T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (51, N'bbarton1d', N'LBIBcuxBV', N'Bert Barton', 1, N'bbarton1d@nbcnews.com', CAST(N'1991-07-31T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2022-05-15T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (52, N'cbulfoot1e', N'IYpl06', N'Cthrine Bulfoot', 0, N'cbulfoot1e@aboutads.info', CAST(N'2001-11-28T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2020-09-19T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (53, N'hruston1f', N'TaXY6w', N'Hedda Ruston', 1, N'hruston1f@parallels.com', CAST(N'1993-07-18T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2020-10-29T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (54, N'bscamerdine1g', N'IFI9x2g', N'Bink Scamerdine', 0, N'bscamerdine1g@godaddy.com', CAST(N'1984-09-13T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2020-02-18T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (55, N'asealove1h', N'18YSA4wtbl0U', N'Anatol Sealove', 0, N'asealove1h@latimes.com', CAST(N'2000-04-12T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2020-07-18T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (56, N'mshowte1i', N'f7dg1AQ6yKX', N'Mamie Showte', 1, N'mshowte1i@w3.org', CAST(N'1981-08-01T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2022-03-11T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (57, N'sdigance1j', N'a4xuGW', N'Scotty Digance', 1, N'sdigance1j@soup.io', CAST(N'1991-12-23T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2020-05-27T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (58, N'vsculley1k', N'MK10t3zQW', N'Viviana Sculley', 0, N'vsculley1k@ezinearticles.com', CAST(N'1992-11-26T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2020-04-27T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (59, N'kmatskevich1l', N'Wu4HHQhp', N'Kattie Matskevich', 1, N'kmatskevich1l@hexun.com', CAST(N'1983-08-07T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2022-03-20T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (60, N'aalenichicov1m', N'N7XF9iKWMJU', N'Agnola Alenichicov', 0, N'aalenichicov1m@ow.ly', CAST(N'1985-08-21T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2020-03-17T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (61, N'lsichardt1n', N'H1o0MCxwqp5', N'Luce Sichardt', 1, N'lsichardt1n@mlb.com', CAST(N'1999-07-02T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2020-06-17T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (62, N'amcentagart1o', N'AXwdXe', N'Alexi McEntagart', 1, N'amcentagart1o@marriott.com', CAST(N'1996-08-01T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2021-01-19T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (63, N'shaselgrove1p', N'w7uwaAI7Q8', N'Saba Haselgrove', 1, N'shaselgrove1p@ted.com', CAST(N'1996-06-17T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2020-05-21T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (64, N'lbroadbent1q', N'UoVPNZzT', N'Levin Broadbent', 0, N'lbroadbent1q@alibaba.com', CAST(N'1985-12-14T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2021-01-12T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (65, N'bdinsale1r', N'qZjuW8eg2x', N'Blinny Dinsale', 1, N'bdinsale1r@opera.com', CAST(N'2000-04-29T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2021-06-16T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (66, N'kpremble1s', N'bBdcQIbyq', N'Katleen Premble', 0, N'kpremble1s@skype.com', CAST(N'2001-01-31T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2020-07-22T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (67, N'ltreacy1t', N'6GmBZfJjYx9', N'Lynnea Treacy', 0, N'ltreacy1t@hubpages.com', CAST(N'1985-03-25T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2021-08-07T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (68, N'dsaggers1u', N'JfWrVrL1da', N'Druci Saggers', 1, N'dsaggers1u@illinois.edu', CAST(N'1989-03-31T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2021-02-01T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (69, N'espears1v', N'Ma4kRBxs6Cox', N'Elden Spears', 1, N'espears1v@ucsd.edu', CAST(N'1990-02-08T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2021-05-01T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (70, N'atroke1w', N'ftRG1MZT', N'Ad Troke', 0, N'atroke1w@harvard.edu', CAST(N'1986-10-11T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2020-03-24T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (71, N'mferonet1x', N'Uc2WqANR', N'Manda Feronet', 0, N'mferonet1x@discovery.com', CAST(N'1995-11-03T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2021-03-14T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (72, N'cganter1y', N'tmw7EBaoonfp', N'Claudia Ganter', 1, N'cganter1y@wufoo.com', CAST(N'1986-06-10T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2022-04-06T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (73, N'rpechell1z', N'FHiyPO', N'Rochella Pechell', 1, N'rpechell1z@boston.com', CAST(N'2001-01-27T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2020-09-28T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (74, N'stesoe20', N'5vnN2GBCtj', N'Sibby Tesoe', 1, N'stesoe20@blogtalkradio.com', CAST(N'2002-10-20T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2021-04-11T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (75, N'etroucher21', N'xFxdDYzRHt7', N'Eldin Troucher', 1, N'etroucher21@apache.org', CAST(N'1996-05-18T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2020-12-27T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (76, N'jdrewery22', N'nHCtQT12', N'Jaymie Drewery', 1, N'jdrewery22@flavors.me', CAST(N'1988-09-04T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2020-07-21T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (77, N'ndiggin23', N'msjsiwIxC4', N'Novelia Diggin', 1, N'ndiggin23@trellian.com', CAST(N'1984-08-05T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2020-12-20T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (78, N'dfrary24', N'21y40Ei', N'Dalis Frary', 1, N'dfrary24@wisc.edu', CAST(N'1989-08-02T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2022-03-28T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (79, N'lberthel25', N'hbxiBK', N'Law Berthel', 0, N'lberthel25@blog.com', CAST(N'1993-10-28T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2020-02-29T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (80, N'dkuhn26', N'J3SzfSzNTIB', N'Delphine Kuhn', 0, N'dkuhn26@squidoo.com', CAST(N'1997-02-19T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2021-05-07T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (81, N'eabsolom27', N'azYFVRc9', N'Eachelle Absolom', 1, N'eabsolom27@yandex.ru', CAST(N'1984-07-03T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2021-01-14T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (82, N'nalf28', N'SdZPfTu3', N'Nita Alf', 1, N'nalf28@timesonline.co.uk', CAST(N'1993-04-01T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2021-01-16T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (83, N'oviollet29', N'UDssG54', N'Ora Viollet', 1, N'oviollet29@yale.edu', CAST(N'1981-07-11T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2021-10-16T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (84, N'emartinovic2a', N'3pgmiOWSgXI', N'Eddi Martinovic', 0, N'emartinovic2a@networkadvertising.org', CAST(N'1993-05-09T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2020-07-30T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (85, N'clealle2b', N'cCm84S0R8i', N'Cybill Lealle', 1, N'clealle2b@unc.edu', CAST(N'2001-04-29T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2022-03-24T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (86, N'wterrelly2c', N'cEcHd21Op', N'Weylin Terrelly', 1, N'wterrelly2c@ucoz.ru', CAST(N'1982-04-09T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2022-04-22T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (87, N'gvenner2d', N'FCD25NcPSAB0', N'Gordan Venner', 1, N'gvenner2d@nsw.gov.au', CAST(N'1990-08-30T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2020-01-24T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (88, N'gcottham2e', N'SWyFMF', N'Gilda Cottham', 1, N'gcottham2e@google.de', CAST(N'2001-04-29T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2021-11-07T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (89, N'mmacgorman2f', N'x8FY0pKCCFsC', N'Mahalia MacGorman', 0, N'mmacgorman2f@mapy.cz', CAST(N'1991-01-28T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2020-09-24T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (90, N'hfleckno2g', N'1wqo1iK', N'Harry Fleckno', 0, N'hfleckno2g@java.com', CAST(N'1993-02-17T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2020-09-28T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (91, N'rsawkins2h', N'V1OZ9M1Iitd', N'Rici Sawkins', 0, N'rsawkins2h@nature.com', CAST(N'1995-12-02T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2022-02-17T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (92, N'akubiczek2i', N'LW951B', N'Art Kubiczek', 1, N'akubiczek2i@simplemachines.org', CAST(N'1991-12-29T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2020-10-10T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (93, N'kciciura2j', N'Y0iBxS7hoCGz', N'Katerine Ciciura', 1, N'kciciura2j@chron.com', CAST(N'2000-07-02T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2020-12-22T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (94, N'smarriner2k', N'WX5xrRyTi', N'Saxe Marriner', 1, N'smarriner2k@com.com', CAST(N'1994-10-07T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2021-01-05T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (95, N'ckliemke2l', N'gwOGHH', N'Clementius Kliemke', 1, N'ckliemke2l@omniture.com', CAST(N'1996-05-25T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2022-04-02T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (96, N'sgovenlock2m', N'uv4OtenZQ', N'Svend Govenlock', 1, N'sgovenlock2m@techcrunch.com', CAST(N'1998-09-17T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2020-03-15T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (97, N'mneno2n', N'5ljc3nzV', N'Marnia Neno', 0, N'mneno2n@reuters.com', CAST(N'1993-12-22T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2020-02-01T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (98, N'bcadle2o', N'xAkTQrnNOI', N'Bette-ann Cadle', 0, N'bcadle2o@comcast.net', CAST(N'1986-01-06T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2020-04-23T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (99, N'wheal2p', N'ZtNS5Ug8v', N'Wynnie Heal', 0, N'wheal2p@photobucket.com', CAST(N'1997-06-06T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2020-12-04T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (100, N'jswatten2q', N'ZFqRmf3gD', N'Julio Swatten', 0, N'jswatten2q@noaa.gov', CAST(N'2000-12-05T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2020-02-05T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (101, N'gdowglass2r', N'UXWXb9lJT', N'Godfree Dowglass', 0, N'gdowglass2r@parallels.com', CAST(N'1997-04-28T00:00:00.000' AS DateTime), N'user.png', N'', N'', 0, CAST(N'2020-02-05T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (112, N'Tuyen123', N'123456', NULL, 1, N'tuyen@gmail.com', NULL, N'user.png', NULL, NULL, 0, CAST(N'2022-12-25T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (113, N'lucduong3k@gmail.com', N'18549b9256d', NULL, 1, N'lucduong3k@gmail.com', NULL, N'user.png', NULL, NULL, 0, CAST(N'2022-12-25T00:00:00.000' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[customers] OFF
GO
SET IDENTITY_INSERT [dbo].[discounts] ON 
GO
INSERT [dbo].[discounts] ([id], [food_id], [name], [amount], [is_fixed], [start_date], [end_date], [create_date], [create_by], [is_display]) VALUES (1, 3, N'Chương trình khuyến mãi tháng 12', 10000, 1, CAST(N'2022-11-21T00:00:00.000' AS DateTime), CAST(N'2022-12-29T12:00:00.000' AS DateTime), CAST(N'2022-11-22T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[discounts] ([id], [food_id], [name], [amount], [is_fixed], [start_date], [end_date], [create_date], [create_by], [is_display]) VALUES (2, 2, N'Chương trình khuyến mãi tháng 12', 10, 0, CAST(N'2022-12-30T12:00:00.000' AS DateTime), CAST(N'2023-02-20T12:00:00.000' AS DateTime), CAST(N'2022-11-22T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[discounts] ([id], [food_id], [name], [amount], [is_fixed], [start_date], [end_date], [create_date], [create_by], [is_display]) VALUES (3, 3, N'Chương trình khuyến mãi tháng 12', 20000, 1, CAST(N'2022-11-28T00:00:00.000' AS DateTime), CAST(N'2022-12-06T00:00:00.000' AS DateTime), CAST(N'2022-11-25T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[discounts] ([id], [food_id], [name], [amount], [is_fixed], [start_date], [end_date], [create_date], [create_by], [is_display]) VALUES (4, 4, N'Chương trình khuyến mãi tháng 12', 20, 0, CAST(N'2022-11-22T00:00:00.000' AS DateTime), CAST(N'2022-11-24T00:00:00.000' AS DateTime), CAST(N'2022-11-21T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[discounts] ([id], [food_id], [name], [amount], [is_fixed], [start_date], [end_date], [create_date], [create_by], [is_display]) VALUES (5, 5, N'Chương trình khuyến mãi tháng 12', 30000, 1, CAST(N'2022-11-22T00:00:00.000' AS DateTime), CAST(N'2022-12-06T00:00:00.000' AS DateTime), CAST(N'2022-11-29T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[discounts] ([id], [food_id], [name], [amount], [is_fixed], [start_date], [end_date], [create_date], [create_by], [is_display]) VALUES (7, 11, N'Chương trình khuyến mãi tháng 12', 40000, 1, CAST(N'2022-11-20T00:00:00.000' AS DateTime), CAST(N'2023-11-29T00:00:00.000' AS DateTime), CAST(N'2022-11-26T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[discounts] ([id], [food_id], [name], [amount], [is_fixed], [start_date], [end_date], [create_date], [create_by], [is_display]) VALUES (8, 8, N'Chương trình khuyến mãi tháng 12', 40, 0, CAST(N'2022-11-30T00:00:00.000' AS DateTime), CAST(N'2022-12-14T00:00:00.000' AS DateTime), CAST(N'2022-11-22T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[discounts] ([id], [food_id], [name], [amount], [is_fixed], [start_date], [end_date], [create_date], [create_by], [is_display]) VALUES (9, 9, N'Chương trình khuyến mãi tháng 12', 50000, 1, CAST(N'2022-11-30T00:00:00.000' AS DateTime), CAST(N'2022-12-01T00:00:00.000' AS DateTime), CAST(N'2022-11-25T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[discounts] ([id], [food_id], [name], [amount], [is_fixed], [start_date], [end_date], [create_date], [create_by], [is_display]) VALUES (12, 17, N'KM mì', 10000, 1, CAST(N'2022-12-25T22:19:00.000' AS DateTime), CAST(N'2022-12-28T22:19:00.000' AS DateTime), CAST(N'2022-12-25T22:19:33.413' AS DateTime), 1, 0)
GO
INSERT [dbo].[discounts] ([id], [food_id], [name], [amount], [is_fixed], [start_date], [end_date], [create_date], [create_by], [is_display]) VALUES (13, 15, N'KM mì', 10000, 1, CAST(N'2022-12-25T22:19:00.000' AS DateTime), CAST(N'2022-12-28T22:19:00.000' AS DateTime), CAST(N'2022-12-25T22:21:16.447' AS DateTime), 1, 0)
GO
SET IDENTITY_INSERT [dbo].[discounts] OFF
GO
SET IDENTITY_INSERT [dbo].[foods] ON 
GO
INSERT [dbo].[foods] ([id], [name], [price], [quantity_limit], [view_count], [description], [create_date], [create_by], [is_display], [status]) VALUES (1, N'Cơm Gà Xối Mỡ', 55000, 100, 36, N'Cơm Gà Xối Mỡ', CAST(N'2022-11-14T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[foods] ([id], [name], [price], [quantity_limit], [view_count], [description], [create_date], [create_by], [is_display], [status]) VALUES (2, N'Bánh Tráng Chấm', 30000, 50, 4, N'Bánh Tráng Chấm', CAST(N'2022-11-15T00:00:00.000' AS DateTime), 1, 1, 2)
GO
INSERT [dbo].[foods] ([id], [name], [price], [quantity_limit], [view_count], [description], [create_date], [create_by], [is_display], [status]) VALUES (3, N'Bánh Mì', 25000, 70, 54, N'Bánh Mì', CAST(N'2022-11-16T00:00:00.000' AS DateTime), 1, 1, 3)
GO
INSERT [dbo].[foods] ([id], [name], [price], [quantity_limit], [view_count], [description], [create_date], [create_by], [is_display], [status]) VALUES (4, N'Cơm Tấm', 45000, 200, 150, N'Cơm Tấm', CAST(N'2022-11-17T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[foods] ([id], [name], [price], [quantity_limit], [view_count], [description], [create_date], [create_by], [is_display], [status]) VALUES (5, N'Trà Sữa Matcha', 34000, 300, 299, N'Trà Sữa Matcha', CAST(N'2022-11-18T00:00:00.000' AS DateTime), 1, 1, 2)
GO
INSERT [dbo].[foods] ([id], [name], [price], [quantity_limit], [view_count], [description], [create_date], [create_by], [is_display], [status]) VALUES (7, N'Bánh Phúc Long', 35000, 500, 203, N'Bánh Phúc Long', CAST(N'2022-11-19T00:00:00.000' AS DateTime), 1, 1, 3)
GO
INSERT [dbo].[foods] ([id], [name], [price], [quantity_limit], [view_count], [description], [create_date], [create_by], [is_display], [status]) VALUES (8, N'Trà Sữa Berry', 60000, 200, 120, N'Trà Sữa Berry', CAST(N'2022-11-20T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[foods] ([id], [name], [price], [quantity_limit], [view_count], [description], [create_date], [create_by], [is_display], [status]) VALUES (9, N'Trà Lài Kem Tuyết', 60000, 300, 100, N'Trà Lài Kem Tuyết', CAST(N'2022-11-21T00:00:00.000' AS DateTime), 1, 1, 2)
GO
INSERT [dbo].[foods] ([id], [name], [price], [quantity_limit], [view_count], [description], [create_date], [create_by], [is_display], [status]) VALUES (10, N'Trà Lài Sữa Coco', 50000, 400, 250, N'Trà Lài Sữa Coco', CAST(N'2022-11-22T00:00:00.000' AS DateTime), 1, 0, 3)
GO
INSERT [dbo].[foods] ([id], [name], [price], [quantity_limit], [view_count], [description], [create_date], [create_by], [is_display], [status]) VALUES (11, N'Trà Lài Hoa Muối', 60000, 100, 83, N'Trà Lài Hoa Muối', CAST(N'2022-11-23T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[foods] ([id], [name], [price], [quantity_limit], [view_count], [description], [create_date], [create_by], [is_display], [status]) VALUES (12, N'Trà Vải Sen', 50000, 500, 392, N'Trà Vải Sen', CAST(N'2022-11-24T00:00:00.000' AS DateTime), 1, 1, 2)
GO
INSERT [dbo].[foods] ([id], [name], [price], [quantity_limit], [view_count], [description], [create_date], [create_by], [is_display], [status]) VALUES (13, N'Trà Nhãn Lài', 50000, 400, 200, N'Trà Nhãn Lài', CAST(N'2022-11-25T00:00:00.000' AS DateTime), 1, 1, 3)
GO
INSERT [dbo].[foods] ([id], [name], [price], [quantity_limit], [view_count], [description], [create_date], [create_by], [is_display], [status]) VALUES (14, N'Trà Thảo Mộc', 50000, 600, 302, N'Trà Thảo Mộc', CAST(N'2022-11-26T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[foods] ([id], [name], [price], [quantity_limit], [view_count], [description], [create_date], [create_by], [is_display], [status]) VALUES (15, N'Mì Trộn Thập Cẩm', 48000, 300, 190, N'Mì Trộn Thập Cẩm', CAST(N'2022-11-27T00:00:00.000' AS DateTime), 1, 0, 2)
GO
INSERT [dbo].[foods] ([id], [name], [price], [quantity_limit], [view_count], [description], [create_date], [create_by], [is_display], [status]) VALUES (16, N'Mì Trộn Gà Mắm Tỏi', 48000, 700, 591, N'Mì Trộn Gà Mắm Tỏi', CAST(N'2022-11-28T00:00:00.000' AS DateTime), 1, 1, 3)
GO
INSERT [dbo].[foods] ([id], [name], [price], [quantity_limit], [view_count], [description], [create_date], [create_by], [is_display], [status]) VALUES (17, N'Mì Trộn Ba Rọi', 40000, 300, 197, N'Mì Trộn Ba Rọi', CAST(N'2022-11-29T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[foods] ([id], [name], [price], [quantity_limit], [view_count], [description], [create_date], [create_by], [is_display], [status]) VALUES (18, N'Nui Xào Bò', 45000, 600, 611, N'Nui Xào Bò', CAST(N'2022-11-30T00:00:00.000' AS DateTime), 1, 1, 2)
GO
INSERT [dbo].[foods] ([id], [name], [price], [quantity_limit], [view_count], [description], [create_date], [create_by], [is_display], [status]) VALUES (19, N'Nui Xào Hải Sản', 55000, 100, 89, N'Nui Xào Hải Sản', CAST(N'2022-11-01T00:00:00.000' AS DateTime), 1, 1, 3)
GO
INSERT [dbo].[foods] ([id], [name], [price], [quantity_limit], [view_count], [description], [create_date], [create_by], [is_display], [status]) VALUES (20, N'Nui Xào Thập Cẩm', 85000, 500, 349, N'Nui Xào Thập Cẩm', CAST(N'2022-11-02T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[foods] ([id], [name], [price], [quantity_limit], [view_count], [description], [create_date], [create_by], [is_display], [status]) VALUES (21, N'Hủ Tiếu Xào ', 60000, 400, 200, N'Hủ Tiếu Xào ', CAST(N'2022-11-03T00:00:00.000' AS DateTime), 1, 1, 2)
GO
INSERT [dbo].[foods] ([id], [name], [price], [quantity_limit], [view_count], [description], [create_date], [create_by], [is_display], [status]) VALUES (22, N'Hủ Tiếu Nam Vang', 85000, 900, 590, N'Hủ Tiếu Nam Vang', CAST(N'2022-11-04T00:00:00.000' AS DateTime), 1, 0, 3)
GO
SET IDENTITY_INSERT [dbo].[foods] OFF
GO
SET IDENTITY_INSERT [dbo].[histories] ON 
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (1, 1, CAST(N'2022-12-19T21:43:53.747' AS DateTime), 37, N'Category', N' update record ''a'' with ID ')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (2, 4, CAST(N'2022-12-19T22:23:22.757' AS DateTime), 37, N'Category', N' delete record ''a'' with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (3, 1, CAST(N'2022-12-19T22:25:35.043' AS DateTime), 38, N'Category', N' create a new record ''A'' with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (6, 1, CAST(N'2022-12-25T16:14:12.250' AS DateTime), 104, N'Order', N' (AUTO CREATE BY CUSTOMER) create new record of customer ''user'' with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (7, 3, CAST(N'2022-12-25T17:02:18.080' AS DateTime), 6, N'Customer', N' update a record ''ekee4'' with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (8, 4, CAST(N'2022-12-25T17:02:57.883' AS DateTime), 24, N'CategoryFood', N' create a new record ''monkho'' of ''Cơm Gà Xối Mỡ''  with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (9, 1, CAST(N'2022-12-25T20:01:41.460' AS DateTime), 202, N'Contact', N' create a new record ''123'' of customer ''user'' with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (10, 1, CAST(N'2022-12-25T20:04:12.723' AS DateTime), 203, N'Contact', N' create a new record ''123'' of customer ''user'' with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (11, 1, CAST(N'2022-12-25T20:05:23.863' AS DateTime), 204, N'Contact', N' create a new record ''456'' of customer ''user'' with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (12, 1, CAST(N'2022-12-25T20:06:11.873' AS DateTime), 205, N'Contact', N' create a new record ''789'' of customer ''user'' with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (13, 1, CAST(N'2022-12-25T20:10:37.673' AS DateTime), 206, N'Contact', N' create a new record ''111'' of customer ''user'' with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (14, 1, CAST(N'2022-12-25T20:11:24.967' AS DateTime), 205, N'Contact', N' delete a new record ''789'' of customer ''user'' with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (15, 1, CAST(N'2022-12-25T20:11:27.283' AS DateTime), 206, N'Contact', N' delete a new record ''111'' of customer ''user'' with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (16, 1, CAST(N'2022-12-25T20:31:32.677' AS DateTime), 207, N'Contact', N' create a new record ''Ho Chi Minh''of customer ''null'' with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (17, 1, CAST(N'2022-12-25T20:31:35.163' AS DateTime), 204, N'Contact', N' delete a new record ''456''of customer ''user'' with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (18, 1, CAST(N'2022-12-25T20:31:37.450' AS DateTime), 203, N'Contact', N' delete a new record ''123''of customer ''user'' with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (19, 1, CAST(N'2022-12-25T21:41:38.237' AS DateTime), 107, N'Order', N' (AUTO CREATE BY CUSTOMER) create new record of customer ''user'' with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (20, 1, CAST(N'2022-12-25T21:57:43.747' AS DateTime), 107, N'Order', N' update record of customer ''user'' with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (21, 1, CAST(N'2022-12-25T21:58:51.620' AS DateTime), 107, N'Order', N' update record of customer ''user'' with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (22, 1, CAST(N'2022-12-25T21:59:44.053' AS DateTime), 107, N'Order', N' update record of customer ''user'' with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (23, 1, CAST(N'2022-12-25T22:05:19.507' AS DateTime), 1, N'User', N' update record ''admin'' with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (24, 1, CAST(N'2022-12-25T22:05:51.697' AS DateTime), 18, N'UserRole', N' create a new record ''productmanager'' of ''admin'' with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (25, 1, CAST(N'2022-12-25T22:05:52.457' AS DateTime), 19, N'UserRole', N' create a new record ''chef'' of ''admin'' with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (26, 1, CAST(N'2022-12-25T22:07:29.143' AS DateTime), 104, N'RolePermission', N' create a new record ''USE01'' of ''productmanager''  with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (27, 1, CAST(N'2022-12-25T22:07:30.337' AS DateTime), 105, N'RolePermission', N' create a new record ''USE02'' of ''productmanager''  with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (28, 1, CAST(N'2022-12-25T22:07:31.003' AS DateTime), 106, N'RolePermission', N' create a new record ''USE03'' of ''productmanager''  with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (29, 1, CAST(N'2022-12-25T22:07:32.843' AS DateTime), 107, N'RolePermission', N' create a new record ''USE04'' of ''productmanager''  with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (30, 1, CAST(N'2022-12-25T22:07:35.547' AS DateTime), 107, N'RolePermission', N' delete record ''USE04'' of ''productmanager''  with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (31, 1, CAST(N'2022-12-25T22:07:37.623' AS DateTime), 108, N'RolePermission', N' create a new record ''USE04'' of ''productmanager''  with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (32, 1, CAST(N'2022-12-25T22:08:00.843' AS DateTime), 9, N'UserPermission', N' create a new record ''USE01'' of ''admin'' with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (33, 1, CAST(N'2022-12-25T22:08:01.430' AS DateTime), 10, N'UserPermission', N' create a new record ''USE02'' of ''admin'' with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (34, 1, CAST(N'2022-12-25T22:08:02.490' AS DateTime), 11, N'UserPermission', N' create a new record ''USE03'' of ''admin'' with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (35, 1, CAST(N'2022-12-25T22:08:12.040' AS DateTime), 11, N'UserPermission', N' delete record ''USE03'' of ''admin'' with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (36, 1, CAST(N'2022-12-25T22:08:12.547' AS DateTime), 10, N'UserPermission', N' delete record ''USE02'' of ''admin'' with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (37, 1, CAST(N'2022-12-25T22:08:13.063' AS DateTime), 9, N'UserPermission', N' delete record ''USE01'' of ''admin'' with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (38, 1, CAST(N'2022-12-25T22:09:08.290' AS DateTime), 16, N'Role', N' create a new record ''Quản Lý'' with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (39, 1, CAST(N'2022-12-25T22:09:24.593' AS DateTime), 109, N'RolePermission', N' create a new record ''USE01'' of ''quanlykho''  with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (40, 1, CAST(N'2022-12-25T22:09:25.557' AS DateTime), 110, N'RolePermission', N' create a new record ''USE02'' of ''quanlykho''  with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (41, 1, CAST(N'2022-12-25T22:09:26.097' AS DateTime), 111, N'RolePermission', N' create a new record ''USE03'' of ''quanlykho''  with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (42, 1, CAST(N'2022-12-25T22:09:26.597' AS DateTime), 112, N'RolePermission', N' create a new record ''USE04'' of ''quanlykho''  with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (43, 1, CAST(N'2022-12-25T22:09:27.123' AS DateTime), 113, N'RolePermission', N' create a new record ''CAT01'' of ''quanlykho''  with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (44, 1, CAST(N'2022-12-25T22:09:27.673' AS DateTime), 114, N'RolePermission', N' create a new record ''CAT02'' of ''quanlykho''  with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (45, 1, CAST(N'2022-12-25T22:09:28.187' AS DateTime), 115, N'RolePermission', N' create a new record ''CAT03'' of ''quanlykho''  with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (46, 1, CAST(N'2022-12-25T22:09:28.903' AS DateTime), 116, N'RolePermission', N' create a new record ''CAT04'' of ''quanlykho''  with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (47, 1, CAST(N'2022-12-25T22:09:49.023' AS DateTime), 20, N'UserRole', N' create a new record ''accounting'' of ''tuyen'' with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (48, 1, CAST(N'2022-12-25T22:10:04.530' AS DateTime), 6, N'UserRole', N' delete record ''chef'' of ''tuyen'' with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (49, 1, CAST(N'2022-12-25T22:13:15.813' AS DateTime), 16, N'Role', N' delete record ''Quản Lý'' with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (50, 1, CAST(N'2022-12-25T22:15:04.823' AS DateTime), 208, N'Contact', N' create a new record ''123456789'' of customer ''null'' with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (51, 1, CAST(N'2022-12-25T22:15:15.327' AS DateTime), 208, N'Contact', N' delete a new record ''123456789'' of customer ''lleidl1'' with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (52, 1, CAST(N'2022-12-25T22:16:06.513' AS DateTime), 7, N'Category', N' update record ''monkho'' with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (53, 1, CAST(N'2022-12-25T22:16:35.567' AS DateTime), 116, N'Image', N' create a new record ''bfed17b9.png'' with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (54, 1, CAST(N'2022-12-25T22:16:35.567' AS DateTime), 117, N'Image', N' create a new record ''d6f7bfb8.png'' with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (55, 1, CAST(N'2022-12-25T22:16:35.567' AS DateTime), 118, N'Image', N' create a new record ''c1a1f058.png'' with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (56, 1, CAST(N'2022-12-25T22:16:42.703' AS DateTime), 116, N'Image', N' delete record ''bfed17b9.png'' with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (57, 1, CAST(N'2022-12-25T22:16:43.610' AS DateTime), 117, N'Image', N' delete record ''d6f7bfb8.png'' with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (58, 1, CAST(N'2022-12-25T22:16:44.737' AS DateTime), 118, N'Image', N' delete record ''c1a1f058.png'' with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (59, 1, CAST(N'2022-12-25T22:17:32.720' AS DateTime), 25, N'CategoryFood', N' create a new record ''anvat'' of ''Cơm Gà Xối Mỡ''  with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (60, 1, CAST(N'2022-12-25T22:19:33.437' AS DateTime), 12, N'Discount', N' create a new record ''KM mì'' with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (61, 1, CAST(N'2022-12-25T22:21:16.463' AS DateTime), 13, N'Discount', N' create a new record ''KM mì'' with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (62, 1, CAST(N'2022-12-25T22:29:43.730' AS DateTime), 108, N'Order', N' (AUTO CREATE BY CUSTOMER) create new record of customer ''user'' with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (63, 1, CAST(N'2022-12-26T01:18:50.707' AS DateTime), 207, N'Contact', N' set default record ''Ho Chi Minh'' of customer ''user'' with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (64, 1, CAST(N'2022-12-26T01:19:44.803' AS DateTime), 110, N'Contact', N' set default record ''3 Chinook Street'' of customer ''user'' with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (65, 1, CAST(N'2022-12-26T01:24:13.907' AS DateTime), 207, N'Contact', N' set default record ''Ho Chi Minh'' of customer ''user'' with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (66, 1, CAST(N'2022-12-26T01:31:13.957' AS DateTime), 117, N'RolePermission', N' create a new record ''FOO04'' of ''accounting''  with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (67, 1, CAST(N'2022-12-26T01:31:14.810' AS DateTime), 117, N'RolePermission', N' delete record ''FOO04'' of ''accounting''  with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (68, 1, CAST(N'2022-12-26T01:32:22.150' AS DateTime), 12, N'UserPermission', N' create a new record ''USE01'' of ''admin'' with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (69, 1, CAST(N'2022-12-26T01:53:03.343' AS DateTime), 56, N'Contact', N' set default record ''+86 342 444 9753'' of customer ''user'' with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (70, 1, CAST(N'2022-12-26T01:59:28.673' AS DateTime), 108, N'Order', N' update record of customer ''user'' with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (71, 1, CAST(N'2022-12-26T02:00:59.580' AS DateTime), 100, N'Order', N' update record of customer ''psilverstone3'' with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (72, 1, CAST(N'2022-12-26T02:13:18.690' AS DateTime), 162, N'Contact', N' set default record ''1163 Blackbird Street'' of customer ''candrichuk2'' with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (73, 1, CAST(N'2022-12-26T02:13:21.477' AS DateTime), 191, N'Contact', N' set default record ''+994 476 532 6724'' of customer ''candrichuk2'' with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (74, 1, CAST(N'2022-12-26T02:13:32.780' AS DateTime), 9, N'Contact', N' set default record ''+51 595 307 7672'' of customer ''lleidl1'' with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (75, 1, CAST(N'2022-12-26T02:15:58.260' AS DateTime), 154, N'Contact', N' set default record ''+86 392 172 2106'' of customer ''psilverstone3'' with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (76, 1, CAST(N'2022-12-26T02:17:54.910' AS DateTime), 180, N'Contact', N' set default record ''+63 599 512 7419'' of customer ''psilverstone3'' with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (77, 1, CAST(N'2022-12-26T02:18:37.007' AS DateTime), 5, N'Customer', N' update a record ''psilverstone31'' with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (78, 1, CAST(N'2022-12-26T02:18:51.567' AS DateTime), 154, N'Contact', N' set default record ''+86 392 172 2106'' of customer ''psilverstone31'' with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (79, 1, CAST(N'2022-12-26T02:18:59.663' AS DateTime), 5, N'Customer', N' update a record ''psilverstone31'' with ID')
GO
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (80, 1, CAST(N'2022-12-26T02:20:17.120' AS DateTime), 180, N'Contact', N' set default record ''+63 599 512 7419'' of customer ''psilverstone31'' with ID')
GO
SET IDENTITY_INSERT [dbo].[histories] OFF
GO
SET IDENTITY_INSERT [dbo].[images] ON 
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (6, 2, N'23b6100e.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (7, 2, N'3bf80aad.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (8, 2, N'3c06222e.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (9, 2, N'af8922a1.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (10, 2, N'daa9aaac.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (11, 3, N'495c56e8.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (12, 3, N'f3d8e3a0.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (13, 3, N'88ad6080.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (14, 3, N'8891317e.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (15, 3, N'494027e6.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (16, 4, N'fb3a5366.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (17, 4, N'5a02c666.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (18, 4, N'9448ed08.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (19, 4, N'aa9e8ce6.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (20, 4, N'aababbe8.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (21, 5, N'2170c5e7.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (22, 5, N'4068a80.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (23, 5, N'e2b78545.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (24, 5, N'4e463b42.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (25, 5, N'e2c59cc6.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (26, 7, N'32c549f.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (27, 7, N'c79703a2.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (28, 7, N'c7a51b23.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (29, 7, N'11e4cbe5.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (30, 7, N'40d1163b.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (31, 8, N'b62af43.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (32, 8, N'aa258de5.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (33, 8, N'90fc8b9b.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (34, 8, N'a71c7ee6.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (35, 8, N'a70e6765.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (36, 9, N'188513ac.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (37, 9, N'7505d1f0.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (38, 9, N'7513e971.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (39, 9, N'f9524df3.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (40, 9, N'e5ca90cb.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (41, 10, N'9f5f2190.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (42, 10, N'5a0138cf.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (43, 10, N'1baebb51.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (44, 10, N'17be61b1.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (45, 10, N'1ba0a3d0.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (46, 11, N'927b192e.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (47, 11, N'9e8e3f9c.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (48, 11, N'f65de0f1.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (49, 11, N'9a9de5fc.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (50, 11, N'cd802a97.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (51, 22, N'9c17dbb2.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (52, 22, N'12a8e5b4.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (53, 22, N'12b6fd35.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (54, 22, N'e9c5d12.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (55, 22, N'ec6a395.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (56, 21, N'375de33c.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (57, 21, N'b116fb9.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (58, 21, N'376bfabd.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (59, 21, N'1f1be89d.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (60, 21, N'e089bf5d.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (61, 20, N'27451c69.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (62, 20, N'2f694bec.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (63, 20, N'3be48611.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (64, 20, N'2f77636d.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (65, 20, N'544cfc18.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (66, 19, N'8886e58d.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (67, 19, N'1513d6e0.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (68, 19, N'7d3b5b26.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (69, 19, N'7d4972a7.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (70, 19, N'11babcaa.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (71, 18, N'2926653c.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (72, 18, N'466783a.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (73, 18, N'fb40dec4.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (74, 18, N'75c82565.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (75, 18, N'75e45467.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (76, 12, N'a628befa.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (77, 12, N'5ff2fdbd.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (78, 12, N'47a2eb9d.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (79, 12, N'16f4afdc.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (80, 12, N'1702c75d.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (81, 13, N'd0af8078.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (82, 13, N'cfc1093e.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (83, 13, N'9144d4f7.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (84, 13, N'b71dccfb.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (85, 13, N'c3c4d9fd.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (86, 14, N'76197168.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (87, 14, N'589c9b2c.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (88, 14, N'7e759330.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (89, 14, N'7e83aab1.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (90, 14, N'8b2ab7b3.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (91, 15, N'93ec4729.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (92, 15, N'b53566ac.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (93, 15, N'54116d74.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (94, 15, N'541f84f5.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (95, 15, N'23714934.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (96, 16, N'f3fd7d44.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (97, 16, N'42804789.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (98, 16, N'429c768b.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (99, 16, N'42aa8e0c.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (100, 16, N'428e5f0a.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (101, 17, N'52b64d49.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (102, 17, N'374dd374.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (103, 17, N'c9982ed5.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (104, 17, N'175becb3.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (105, 17, N'1b18e431.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (110, 1, N'7d98667c.png')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (111, 1, N'6c491d2c.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (112, 1, N'6c2cee2a.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (113, 1, N'6c1ed6a9.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (114, 1, N'6c3b05ab.jpg')
GO
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (115, 1, N'd2b4b8e6.jpg')
GO
SET IDENTITY_INSERT [dbo].[images] OFF
GO
SET IDENTITY_INSERT [dbo].[notifications] ON 
GO
INSERT [dbo].[notifications] ([id], [customer_id], [record_id], [table_name], [content], [create_at], [is_watched], [color]) VALUES (1, 1, 117, N'order', N'Bạn đã đặt đơn hàng #117 thành công!', CAST(N'2022-11-29T22:21:39.533' AS DateTime), 1, N'#007BFF')
GO
INSERT [dbo].[notifications] ([id], [customer_id], [record_id], [table_name], [content], [create_at], [is_watched], [color]) VALUES (3, 1, 118, N'order', N'Bạn đã đặt đơn hàng #118 thành công!', CAST(N'2022-11-30T10:24:21.690' AS DateTime), 1, N'#007BFF')
GO
INSERT [dbo].[notifications] ([id], [customer_id], [record_id], [table_name], [content], [create_at], [is_watched], [color]) VALUES (4, 1, 119, N'order', N'Bạn đã đặt đơn hàng #119 thành công!', CAST(N'2022-12-04T00:41:22.810' AS DateTime), 1, N'#007BFF')
GO
INSERT [dbo].[notifications] ([id], [customer_id], [record_id], [table_name], [content], [create_at], [is_watched], [color]) VALUES (5, 1, 120, N'order', N'Bạn đã đặt đơn hàng #120 thành công!', CAST(N'2022-12-04T00:52:37.457' AS DateTime), 1, N'#007BFF')
GO
INSERT [dbo].[notifications] ([id], [customer_id], [record_id], [table_name], [content], [create_at], [is_watched], [color]) VALUES (6, 1, 101, N'order', N'Bạn đã đặt đơn hàng #101 thành công!', CAST(N'2022-12-18T22:59:46.350' AS DateTime), 1, N'#007BFF')
GO
INSERT [dbo].[notifications] ([id], [customer_id], [record_id], [table_name], [content], [create_at], [is_watched], [color]) VALUES (7, 1, 102, N'order', N'Bạn đã đặt đơn hàng #102 thành công!', CAST(N'2022-12-25T16:10:13.160' AS DateTime), 0, N'#007BFF')
GO
INSERT [dbo].[notifications] ([id], [customer_id], [record_id], [table_name], [content], [create_at], [is_watched], [color]) VALUES (8, 1, 103, N'order', N'Bạn đã đặt đơn hàng #103 thành công!', CAST(N'2022-12-25T16:12:55.360' AS DateTime), 1, N'#007BFF')
GO
INSERT [dbo].[notifications] ([id], [customer_id], [record_id], [table_name], [content], [create_at], [is_watched], [color]) VALUES (9, 1, 104, N'order', N'Bạn đã đặt đơn hàng #104 thành công!', CAST(N'2022-12-25T16:14:12.233' AS DateTime), 1, N'#007BFF')
GO
INSERT [dbo].[notifications] ([id], [customer_id], [record_id], [table_name], [content], [create_at], [is_watched], [color]) VALUES (12, 1, 107, N'order', N'Bạn đã đặt đơn hàng #107 thành công!', CAST(N'2022-12-25T21:41:38.233' AS DateTime), 0, N'#007BFF')
GO
INSERT [dbo].[notifications] ([id], [customer_id], [record_id], [table_name], [content], [create_at], [is_watched], [color]) VALUES (13, 1, 108, N'order', N'Bạn đã đặt đơn hàng #108 thành công!', CAST(N'2022-12-25T22:29:43.717' AS DateTime), 1, N'#007BFF')
GO
SET IDENTITY_INSERT [dbo].[notifications] OFF
GO
SET IDENTITY_INSERT [dbo].[order_details] ON 
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (1, 9, 12, 9, 33684, 33, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (2, 56, 10, 6, 86092, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (3, 69, 14, 3, 75058, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (4, 71, 21, 2, 81577, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (5, 11, 14, 2, 75484, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (6, 59, 3, 8, 53547, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (7, 100, 2, 1, 32590, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (8, 91, 17, 2, 60443, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (9, 23, 20, 8, 13016, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (10, 13, 4, 10, 54547, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (11, 81, 17, 7, 43048, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (12, 44, 8, 5, 33082, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (13, 21, 10, 2, 90765, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (14, 50, 21, 5, 82734, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (15, 49, 5, 2, 76464, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (16, 37, 19, 10, 83870, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (17, 40, 3, 3, 93695, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (18, 12, 2, 1, 36005, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (19, 91, 3, 3, 47895, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (20, 26, 5, 7, 43818, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (21, 81, 16, 1, 71441, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (22, 56, 17, 4, 48746, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (23, 88, 14, 1, 57269, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (24, 35, 3, 5, 10740, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (25, 13, 20, 4, 86955, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (26, 60, 2, 8, 87466, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (28, 90, 22, 2, 17046, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (29, 84, 3, 8, 61265, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (30, 80, 20, 7, 31301, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (31, 12, 21, 2, 11490, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (32, 23, 3, 6, 19079, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (33, 19, 3, 8, 89042, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (34, 11, 7, 10, 98819, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (35, 14, 18, 9, 44290, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (36, 39, 21, 6, 61156, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (37, 69, 22, 7, 33573, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (38, 63, 16, 2, 77205, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (39, 97, 7, 8, 88122, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (40, 24, 15, 4, 71051, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (41, 20, 19, 7, 30495, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (42, 100, 19, 7, 87764, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (43, 63, 9, 9, 38436, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (44, 59, 4, 2, 72205, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (45, 55, 10, 4, 88314, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (47, 9, 10, 1, 25529, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (48, 54, 22, 2, 15914, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (49, 68, 10, 1, 50274, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (50, 34, 16, 7, 31813, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (51, 5, 11, 3, 53129, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (52, 34, 19, 8, 36611, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (53, 66, 14, 10, 20546, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (54, 87, 20, 6, 92288, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (55, 31, 16, 10, 67274, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (56, 91, 3, 6, 80459, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (57, 9, 12, 7, 37140, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (58, 12, 14, 8, 67460, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (59, 71, 8, 4, 65042, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (60, 20, 3, 3, 72374, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (61, 55, 3, 1, 13168, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (62, 67, 7, 2, 76783, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (64, 14, 10, 10, 94174, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (65, 91, 2, 7, 89063, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (66, 33, 22, 2, 71942, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (67, 13, 17, 7, 56512, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (68, 48, 7, 4, 15761, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (69, 76, 12, 9, 18514, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (70, 15, 17, 3, 35077, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (71, 32, 19, 3, 87372, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (72, 60, 17, 3, 18364, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (73, 82, 4, 8, 70881, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (74, 77, 15, 10, 31346, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (75, 56, 21, 9, 21413, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (77, 58, 7, 5, 47888, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (78, 42, 18, 9, 15738, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (79, 82, 13, 2, 33640, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (80, 63, 14, 3, 32473, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (81, 79, 3, 3, 58130, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (82, 28, 7, 4, 13423, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (83, 46, 11, 1, 85859, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (84, 65, 2, 6, 23607, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (85, 24, 19, 6, 24835, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (87, 67, 1, 5, 57129, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (88, 3, 19, 3, 89200, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (89, 86, 1, 3, 49066, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (90, 20, 19, 3, 56650, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (92, 23, 18, 2, 78166, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (93, 78, 17, 9, 24038, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (94, 89, 3, 7, 78266, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (95, 58, 4, 5, 50966, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (97, 28, 22, 5, 86697, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (98, 94, 13, 9, 32030, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (99, 94, 4, 4, 41842, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (100, 85, 7, 2, 94659, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (101, 28, 7, 10, 75387, 0, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (102, 70, 13, 3, 81208, 16, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (103, 15, 7, 6, 22330, 19, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (104, 24, 7, 4, 25093, 20, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (105, 86, 22, 6, 79470, 47, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (106, 78, 12, 7, 40158, 42, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (107, 77, 11, 1, 25967, 45, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (108, 25, 7, 6, 35400, 44, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (110, 12, 20, 5, 23160, 46, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (111, 14, 18, 3, 87933, 42, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (112, 1, 8, 3, 59906, 14, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (113, 82, 19, 6, 22533, 37, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (114, 64, 19, 1, 56540, 36, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (115, 43, 15, 4, 18315, 41, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (116, 25, 9, 4, 97379, 14, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (117, 41, 2, 5, 73127, 32, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (118, 2, 12, 4, 81500, 24, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (119, 29, 20, 3, 85539, 39, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (120, 43, 5, 10, 61398, 50, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (121, 19, 19, 3, 11214, 40, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (122, 13, 7, 9, 83888, 30, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (123, 11, 15, 5, 91034, 28, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (124, 11, 9, 6, 68480, 45, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (125, 64, 17, 3, 55507, 31, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (126, 26, 2, 3, 64211, 32, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (127, 70, 12, 6, 29925, 28, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (128, 38, 5, 4, 76341, 20, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (129, 36, 7, 3, 28890, 31, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (130, 31, 5, 5, 54723, 30, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (131, 65, 20, 8, 68322, 46, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (132, 52, 21, 10, 33110, 44, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (133, 85, 20, 1, 41979, 47, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (134, 60, 1, 2, 36094, 6, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (135, 29, 21, 1, 23261, 22, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (136, 13, 13, 8, 53908, 27, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (137, 53, 5, 5, 94154, 44, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (138, 66, 2, 6, 25775, 20, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (139, 28, 21, 1, 77284, 21, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (140, 74, 12, 10, 50363, 26, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (141, 93, 13, 9, 28039, 37, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (142, 93, 13, 6, 10226, 23, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (143, 37, 14, 2, 27110, 12, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (144, 41, 11, 5, 34649, 34, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (145, 92, 2, 4, 69530, 2, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (146, 67, 9, 10, 27778, 4, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (147, 15, 16, 4, 91281, 47, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (148, 61, 20, 8, 17240, 25, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (149, 41, 14, 3, 60627, 6, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (150, 66, 21, 7, 76197, 10, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (151, 87, 15, 2, 88176, 4, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (153, 18, 15, 4, 73224, 3, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (154, 42, 10, 5, 34555, 4, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (155, 3, 19, 6, 85866, 20, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (156, 42, 1, 1, 99032, 27, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (157, 17, 7, 7, 71097, 15, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (158, 89, 16, 3, 40838, 27, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (159, 61, 8, 3, 25462, 1, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (160, 73, 11, 10, 35570, 43, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (161, 34, 1, 2, 27398, 32, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (162, 54, 4, 3, 74499, 35, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (163, 91, 20, 7, 16444, 28, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (164, 82, 20, 1, 59079, 8, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (165, 68, 9, 2, 27544, 20, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (166, 42, 14, 5, 98726, 4, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (167, 54, 8, 4, 98428, 37, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (168, 52, 4, 10, 23121, 40, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (169, 30, 7, 10, 75465, 7, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (170, 80, 2, 10, 91166, 39, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (171, 92, 5, 8, 51549, 16, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (172, 5, 3, 9, 70182, 42, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (173, 13, 10, 10, 56986, 22, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (174, 13, 13, 4, 53684, 1, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (175, 85, 3, 9, 97545, 5, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (176, 99, 10, 2, 32718, 5, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (177, 63, 9, 3, 40579, 49, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (178, 94, 1, 8, 21893, 19, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (179, 29, 22, 3, 76103, 15, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (181, 53, 20, 5, 80693, 22, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (182, 51, 7, 7, 32425, 47, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (183, 16, 22, 1, 82404, 8, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (184, 34, 18, 7, 39783, 9, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (185, 25, 4, 10, 95172, 23, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (186, 57, 18, 4, 14215, 26, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (187, 58, 16, 2, 68240, 46, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (188, 100, 9, 9, 73382, 40, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (189, 15, 21, 1, 63615, 19, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (190, 46, 3, 6, 48258, 40, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (191, 89, 18, 1, 22859, 44, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (192, 96, 19, 1, 90115, 29, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (193, 11, 19, 4, 59801, 26, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (194, 4, 17, 1, 57072, 21, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (195, 28, 14, 5, 86915, 19, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (196, 22, 11, 6, 82735, 7, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (197, 57, 1, 7, 79265, 33, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (198, 81, 21, 7, 43107, 35, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (199, 71, 17, 3, 25205, 9, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (200, 90, 17, 6, 81943, 27, 0, N'', 0, N'', 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (201, 101, 11, 1, 60000, 40000, 1, NULL, 0, NULL, 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (202, 102, 3, 6, 25000, 10000, 1, NULL, 0, NULL, 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (203, 102, 1, 1, 55000, 0, 0, NULL, 0, NULL, 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (204, 103, 5, 1, 34000, 0, 0, NULL, 0, NULL, 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (205, 103, 7, 1, 35000, 0, 0, NULL, 0, NULL, 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (206, 104, 17, 1, 40000, 0, 0, NULL, 0, NULL, 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (209, 107, 18, 1, 45000, 0, 0, NULL, 0, NULL, 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (210, 108, 3, 5, 25000, 10000, 1, NULL, 0, NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[order_details] OFF
GO
SET IDENTITY_INSERT [dbo].[orders] ON 
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (1, 55, 1, CAST(N'2022-05-04T11:53:00.000' AS DateTime), CAST(N'2021-05-23T19:03:00.000' AS DateTime), N'75 Elgar Alley', N'+995 912 670 6154', 16725, NULL, 0, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (2, 73, 2, CAST(N'2021-04-16T17:16:00.000' AS DateTime), CAST(N'2020-10-01T03:10:00.000' AS DateTime), N'010 Hoffman Circle', N'+595 187 367 3116', 1634, NULL, 0, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (3, 85, 2, CAST(N'2022-06-09T11:45:00.000' AS DateTime), CAST(N'2021-12-25T02:34:00.000' AS DateTime), N'12720 Forest Terrace', N'+1 574 268 6086', 33143, CAST(N'2021-05-27T03:57:00.000' AS DateTime), 3, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (4, 47, 1, CAST(N'2020-07-24T17:32:00.000' AS DateTime), CAST(N'2021-05-01T08:41:00.000' AS DateTime), N'2234 Tennyson Circle', N'+86 158 722 6298', 518, NULL, 3, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (5, 94, 3, CAST(N'2021-08-16T13:48:00.000' AS DateTime), CAST(N'2022-06-13T06:00:00.000' AS DateTime), N'57 Golf Lane', N'+1 318 927 1087', 1908, NULL, 0, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (6, 53, 1, CAST(N'2021-01-03T08:48:00.000' AS DateTime), NULL, N'198 Clarendon Point', N'+1 206 586 7939', 8688, NULL, 1, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (7, 9, 3, CAST(N'2020-10-24T10:53:00.000' AS DateTime), NULL, N'1 Corry Road', N'+33 329 802 9637', 9320, CAST(N'2021-09-09T23:22:00.000' AS DateTime), 3, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (8, 9, 1, CAST(N'2020-12-09T11:25:00.000' AS DateTime), CAST(N'2020-06-25T04:13:00.000' AS DateTime), N'891 Messerschmidt Crossing', N'+233 328 463 0729', 37600, CAST(N'2022-02-04T06:25:00.000' AS DateTime), 2, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (9, 93, 3, CAST(N'2022-06-09T05:33:00.000' AS DateTime), CAST(N'2022-04-22T14:18:00.000' AS DateTime), N'275 Manufacturers Court', N'+995 766 646 0593', 24758, CAST(N'2021-04-17T11:49:00.000' AS DateTime), 3, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (10, 55, 2, CAST(N'2020-02-17T13:27:00.000' AS DateTime), CAST(N'2021-01-25T13:41:00.000' AS DateTime), N'819 Bartelt Trail', N'+63 619 457 5248', 27857, NULL, 3, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (11, 80, 3, CAST(N'2020-10-10T02:13:00.000' AS DateTime), CAST(N'2021-06-22T05:42:00.000' AS DateTime), N'783 Reindahl Parkway', N'+54 196 600 0608', 10743, NULL, 1, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (12, 73, 1, CAST(N'2022-05-14T09:33:00.000' AS DateTime), CAST(N'2022-02-14T19:59:00.000' AS DateTime), N'503 Sutteridge Terrace', N'+1 601 751 8262', 39476, CAST(N'2021-08-14T21:17:00.000' AS DateTime), 4, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (13, 1, 1, CAST(N'2020-05-06T05:10:00.000' AS DateTime), CAST(N'2020-11-09T11:34:00.000' AS DateTime), N'2070 Lunder Way', N'+261 520 969 9803', 12492, NULL, 1, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (14, 77, 1, CAST(N'2022-01-09T02:26:00.000' AS DateTime), CAST(N'2020-06-25T05:40:00.000' AS DateTime), N'3016 Dayton Place', N'+86 222 192 2823', 37163, NULL, 4, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (15, 28, 1, CAST(N'2021-12-06T08:27:00.000' AS DateTime), CAST(N'2020-07-31T20:50:00.000' AS DateTime), N'93 Hooker Lane', N'+48 447 367 1354', 250, NULL, 4, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (16, 50, 1, CAST(N'2020-05-29T21:28:00.000' AS DateTime), CAST(N'2020-04-26T21:56:00.000' AS DateTime), N'02582 Walton Road', N'+33 131 573 1179', 5376, NULL, 2, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (17, 35, 1, CAST(N'2021-04-25T15:39:00.000' AS DateTime), CAST(N'2021-04-24T19:16:00.000' AS DateTime), N'1 Mallory Circle', N'+381 928 865 3670', 34673, CAST(N'2021-07-15T02:56:00.000' AS DateTime), 2, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (18, 50, 1, CAST(N'2021-01-09T03:13:00.000' AS DateTime), CAST(N'2020-08-06T21:05:00.000' AS DateTime), N'325 Sutherland Junction', N'+62 610 594 6311', 38191, CAST(N'2021-03-30T12:45:00.000' AS DateTime), 3, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (19, 30, 1, CAST(N'2021-08-31T08:25:00.000' AS DateTime), CAST(N'2021-10-26T17:45:00.000' AS DateTime), N'70542 Fair Oaks Court', N'+7 112 552 9748', 3406, CAST(N'2020-01-25T18:38:00.000' AS DateTime), 3, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (20, 78, 3, CAST(N'2020-02-13T10:12:00.000' AS DateTime), CAST(N'2021-03-26T22:45:00.000' AS DateTime), N'5 Manitowish Center', N'+86 486 106 3660', 14966, NULL, 4, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (21, 37, 2, CAST(N'2020-02-19T09:44:00.000' AS DateTime), CAST(N'2021-02-19T21:31:00.000' AS DateTime), N'5 Delaware Lane', N'+81 221 294 8509', 27210, NULL, 2, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (22, 56, 2, CAST(N'2022-04-30T04:05:00.000' AS DateTime), CAST(N'2021-07-15T19:45:00.000' AS DateTime), N'09051 Mitchell Drive', N'+86 565 890 9955', 14273, NULL, 3, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (23, 17, 3, CAST(N'2020-06-20T06:21:00.000' AS DateTime), CAST(N'2021-07-31T16:56:00.000' AS DateTime), N'44486 Stuart Lane', N'+48 565 657 4993', 3376, CAST(N'2020-11-05T16:31:00.000' AS DateTime), 4, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (24, 19, 3, CAST(N'2021-10-13T04:25:00.000' AS DateTime), CAST(N'2021-04-19T22:49:00.000' AS DateTime), N'7542 Lyons Trail', N'+48 435 691 4224', 24947, NULL, 3, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (25, 41, 2, CAST(N'2022-02-09T04:56:00.000' AS DateTime), CAST(N'2021-10-26T00:25:00.000' AS DateTime), N'40 Di Loreto Point', N'+48 373 491 3347', 25867, NULL, 3, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (26, 36, 2, CAST(N'2021-12-26T12:14:00.000' AS DateTime), CAST(N'2020-07-16T08:29:00.000' AS DateTime), N'1 Lighthouse Bay Parkway', N'+241 919 415 0740', 9054, CAST(N'2021-07-30T21:13:00.000' AS DateTime), 1, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (27, 29, 3, CAST(N'2022-02-12T20:20:00.000' AS DateTime), NULL, N'8 Amoth Avenue', N'+63 696 331 1259', 29411, CAST(N'2021-09-08T20:43:00.000' AS DateTime), 0, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (28, 6, 3, CAST(N'2020-09-01T01:24:00.000' AS DateTime), CAST(N'2021-10-31T22:31:00.000' AS DateTime), N'59147 Bluejay Terrace', N'+62 846 730 7882', 16437, CAST(N'2021-05-09T07:11:00.000' AS DateTime), 1, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (29, 63, 3, CAST(N'2021-11-01T20:12:00.000' AS DateTime), CAST(N'2020-08-06T16:59:00.000' AS DateTime), N'50 Clemons Point', N'+674 181 872 9836', 3681, NULL, 2, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (30, 10, 2, CAST(N'2021-08-22T20:35:00.000' AS DateTime), CAST(N'2021-02-16T21:50:00.000' AS DateTime), N'31 Grayhawk Street', N'+63 828 573 7349', 4262, NULL, 0, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (31, 52, 3, CAST(N'2021-09-10T09:39:00.000' AS DateTime), CAST(N'2021-03-22T00:56:00.000' AS DateTime), N'4192 Susan Point', N'+66 787 949 8625', 39749, NULL, 4, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (32, 61, 3, CAST(N'2020-03-23T01:38:00.000' AS DateTime), CAST(N'2022-06-26T17:50:00.000' AS DateTime), N'611 Merrick Center', N'+351 475 282 5706', 29600, NULL, 2, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (33, 50, 1, CAST(N'2022-02-12T03:50:00.000' AS DateTime), CAST(N'2021-02-06T18:44:00.000' AS DateTime), N'51 Bashford Crossing', N'+62 186 485 3841', 29572, NULL, 4, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (34, 38, 3, CAST(N'2022-03-02T15:30:00.000' AS DateTime), CAST(N'2020-01-12T01:53:00.000' AS DateTime), N'721 Autumn Leaf Crossing', N'+86 472 822 5913', 27708, NULL, 1, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (35, 4, 1, CAST(N'2020-05-02T12:24:00.000' AS DateTime), CAST(N'2020-01-15T15:55:00.000' AS DateTime), N'4939 Lunder Lane', N'+86 229 133 7474', 13732, NULL, 3, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (36, 100, 2, CAST(N'2021-12-19T00:25:00.000' AS DateTime), CAST(N'2021-09-27T01:07:00.000' AS DateTime), N'770 Thompson Road', N'+33 920 214 3994', 14793, NULL, 1, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (37, 71, 1, CAST(N'2020-04-26T08:26:00.000' AS DateTime), NULL, N'5721 Huxley Drive', N'+1 347 974 4247', 30737, NULL, 2, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (38, 53, 1, CAST(N'2021-10-23T02:58:00.000' AS DateTime), CAST(N'2021-04-29T00:39:00.000' AS DateTime), N'28 Moose Alley', N'+244 558 754 0180', 32475, NULL, 1, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (39, 23, 1, CAST(N'2020-10-06T14:50:00.000' AS DateTime), NULL, N'6197 Commercial Way', N'+218 302 222 0246', 34864, NULL, 0, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (40, 97, 2, CAST(N'2022-04-06T05:24:00.000' AS DateTime), CAST(N'2021-03-20T02:44:00.000' AS DateTime), N'09 Farwell Junction', N'+7 207 588 6352', 31275, NULL, 1, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (41, 42, 2, CAST(N'2020-12-23T09:58:00.000' AS DateTime), CAST(N'2022-03-14T00:58:00.000' AS DateTime), N'254 New Castle Plaza', N'+86 244 191 1286', 14769, NULL, 3, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (42, 78, 2, CAST(N'2021-01-28T13:04:00.000' AS DateTime), CAST(N'2020-03-20T07:28:00.000' AS DateTime), N'39591 Sommers Parkway', N'+52 730 937 9885', 23792, NULL, 1, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (43, 45, 2, CAST(N'2021-02-25T01:53:00.000' AS DateTime), NULL, N'6 Badeau Parkway', N'+380 715 770 6215', 20249, NULL, 1, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (44, 78, 1, CAST(N'2022-03-12T01:46:00.000' AS DateTime), CAST(N'2022-03-17T10:11:00.000' AS DateTime), N'4 Buell Circle', N'+7 333 827 4785', 31398, NULL, 0, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (45, 3, 3, CAST(N'2020-01-14T13:17:00.000' AS DateTime), CAST(N'2020-05-05T04:25:00.000' AS DateTime), N'62855 Rutledge Plaza', N'+7 469 152 0943', 11297, NULL, 3, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (46, 64, 1, CAST(N'2021-08-13T02:27:00.000' AS DateTime), CAST(N'2021-02-17T01:30:00.000' AS DateTime), N'8862 Anderson Drive', N'+1 303 423 8272', 21906, CAST(N'2020-05-15T05:17:00.000' AS DateTime), 4, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (47, 89, 1, CAST(N'2021-10-24T11:53:00.000' AS DateTime), CAST(N'2020-02-11T17:46:00.000' AS DateTime), N'85 Daystar Crossing', N'+98 447 516 7291', 20852, CAST(N'2021-06-14T21:38:00.000' AS DateTime), 4, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (48, 70, 1, CAST(N'2020-05-16T21:08:00.000' AS DateTime), CAST(N'2021-11-20T12:49:00.000' AS DateTime), N'98398 Dahle Point', N'+63 223 449 0256', 36060, NULL, 4, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (49, 21, 2, CAST(N'2021-05-08T22:35:00.000' AS DateTime), NULL, N'0 Esch Plaza', N'+86 643 689 7016', 4860, NULL, 4, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (50, 40, 2, CAST(N'2022-06-01T01:06:00.000' AS DateTime), CAST(N'2021-08-11T08:53:00.000' AS DateTime), N'96300 Arkansas Trail', N'+51 712 306 7081', 8792, NULL, 0, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (51, 72, 2, CAST(N'2021-08-11T12:35:00.000' AS DateTime), CAST(N'2020-10-27T08:10:00.000' AS DateTime), N'42934 Ohio Circle', N'+502 604 574 7166', 34752, NULL, 1, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (52, 59, 1, CAST(N'2020-10-17T21:25:00.000' AS DateTime), CAST(N'2020-12-12T15:35:00.000' AS DateTime), N'3 Ronald Regan Way', N'+375 966 426 5283', 4731, NULL, 3, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (53, 58, 3, CAST(N'2020-01-12T06:48:00.000' AS DateTime), CAST(N'2021-12-05T17:21:00.000' AS DateTime), N'8853 Hansons Alley', N'+46 129 759 9582', 28642, NULL, 4, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (54, 35, 3, CAST(N'2022-01-01T16:36:00.000' AS DateTime), CAST(N'2022-04-27T08:04:00.000' AS DateTime), N'767 Sommers Plaza', N'+86 835 581 9131', 13291, NULL, 2, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (55, 57, 1, CAST(N'2021-12-03T19:49:00.000' AS DateTime), CAST(N'2021-09-12T21:29:00.000' AS DateTime), N'5870 Tennessee Street', N'+54 469 308 9225', 1658, NULL, 4, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (56, 99, 1, CAST(N'2021-05-28T15:48:00.000' AS DateTime), CAST(N'2022-02-07T10:51:00.000' AS DateTime), N'8 Westend Lane', N'+351 231 190 6512', 18858, CAST(N'2020-11-01T13:52:00.000' AS DateTime), 4, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (57, 4, 1, CAST(N'2020-10-11T16:07:00.000' AS DateTime), CAST(N'2020-09-25T01:46:00.000' AS DateTime), N'7118 Katie Drive', N'+86 935 820 7145', 27804, NULL, 3, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (58, 72, 1, CAST(N'2021-01-31T11:16:00.000' AS DateTime), CAST(N'2021-06-28T09:09:00.000' AS DateTime), N'69 Quincy Court', N'+55 414 103 0334', 27223, NULL, 4, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (59, 66, 2, CAST(N'2022-05-12T20:36:00.000' AS DateTime), CAST(N'2021-10-26T12:11:00.000' AS DateTime), N'3 Gulseth Crossing', N'+504 209 275 8207', 3219, NULL, 2, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (60, 65, 1, CAST(N'2022-06-13T14:48:00.000' AS DateTime), CAST(N'2021-06-29T15:35:00.000' AS DateTime), N'0 Village Green Crossing', N'+32 419 692 1627', 10915, NULL, 3, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (61, 95, 1, CAST(N'2021-01-24T02:35:00.000' AS DateTime), CAST(N'2020-10-17T18:32:00.000' AS DateTime), N'7 Toban Lane', N'+86 854 980 9488', 21481, NULL, 0, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (62, 59, 1, CAST(N'2020-07-26T22:19:00.000' AS DateTime), CAST(N'2022-05-12T20:04:00.000' AS DateTime), N'63 Linden Plaza', N'+7 334 893 7740', 7108, CAST(N'2020-05-10T00:51:00.000' AS DateTime), 3, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (63, 50, 2, CAST(N'2020-01-12T05:49:00.000' AS DateTime), CAST(N'2021-01-20T10:45:00.000' AS DateTime), N'705 Mitchell Crossing', N'+94 546 231 0360', 923, CAST(N'2020-01-06T15:18:00.000' AS DateTime), 2, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (64, 74, 3, CAST(N'2020-08-03T11:31:00.000' AS DateTime), CAST(N'2021-09-06T19:13:00.000' AS DateTime), N'48 Golf View Trail', N'+33 902 628 9566', 26939, NULL, 0, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (65, 91, 2, CAST(N'2021-12-09T05:06:00.000' AS DateTime), CAST(N'2021-01-20T00:46:00.000' AS DateTime), N'00275 Ronald Regan Plaza', N'+62 720 514 7516', 4275, CAST(N'2021-08-28T19:29:00.000' AS DateTime), 3, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (66, 7, 2, CAST(N'2020-01-30T20:19:00.000' AS DateTime), CAST(N'2020-05-22T09:49:00.000' AS DateTime), N'07248 Warrior Place', N'+1 456 507 2442', 14269, NULL, 2, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (67, 72, 2, CAST(N'2021-01-16T02:00:00.000' AS DateTime), CAST(N'2020-10-01T13:50:00.000' AS DateTime), N'09 Scofield Trail', N'+1 614 840 1681', 11325, NULL, 0, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (68, 40, 1, CAST(N'2021-10-14T00:23:00.000' AS DateTime), CAST(N'2021-04-11T13:34:00.000' AS DateTime), N'60617 Prairieview Trail', N'+598 585 140 6759', 13039, CAST(N'2022-04-02T13:44:00.000' AS DateTime), 0, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (69, 91, 3, CAST(N'2021-06-02T02:04:00.000' AS DateTime), CAST(N'2020-02-19T18:00:00.000' AS DateTime), N'41 Autumn Leaf Lane', N'+86 315 647 7847', 36745, CAST(N'2022-05-16T10:01:00.000' AS DateTime), 3, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (70, 81, 1, CAST(N'2022-03-05T02:50:00.000' AS DateTime), CAST(N'2020-03-27T12:47:00.000' AS DateTime), N'86 Kedzie Circle', N'+251 991 554 1969', 14511, CAST(N'2021-10-24T09:31:00.000' AS DateTime), 4, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (71, 82, 2, CAST(N'2021-08-16T16:07:00.000' AS DateTime), CAST(N'2022-04-05T19:43:00.000' AS DateTime), N'00 Pepper Wood Trail', N'+54 806 988 5824', 27077, CAST(N'2020-08-20T18:57:00.000' AS DateTime), 0, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (72, 65, 1, CAST(N'2020-10-25T13:39:00.000' AS DateTime), CAST(N'2020-09-19T16:09:00.000' AS DateTime), N'10979 Reinke Junction', N'+62 655 198 8147', 12701, NULL, 2, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (73, 54, 2, CAST(N'2020-01-25T04:38:00.000' AS DateTime), CAST(N'2021-07-23T16:00:00.000' AS DateTime), N'1 School Place', N'+63 159 320 9059', 32446, NULL, 3, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (74, 90, 3, CAST(N'2021-04-28T05:44:00.000' AS DateTime), CAST(N'2020-03-17T23:25:00.000' AS DateTime), N'380 Welch Place', N'+48 160 459 0183', 31970, CAST(N'2020-12-10T12:40:00.000' AS DateTime), 4, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (75, 57, 1, CAST(N'2022-06-06T01:54:00.000' AS DateTime), CAST(N'2020-11-01T11:24:00.000' AS DateTime), N'11 Oak Valley Lane', N'+1 164 815 5259', 11272, CAST(N'2022-04-11T07:38:00.000' AS DateTime), 2, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (76, 6, 1, CAST(N'2022-05-22T10:03:00.000' AS DateTime), CAST(N'2020-07-24T16:50:00.000' AS DateTime), N'84 Straubel Center', N'+81 581 351 5573', 34114, NULL, 0, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (77, 23, 2, CAST(N'2021-10-03T07:18:00.000' AS DateTime), CAST(N'2021-09-20T22:05:00.000' AS DateTime), N'2958 Forest Junction', N'+7 591 885 6220', 16649, NULL, 1, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (78, 92, 2, CAST(N'2020-04-14T20:56:00.000' AS DateTime), CAST(N'2020-02-19T21:25:00.000' AS DateTime), N'22255 Lake View Point', N'+1 760 218 2683', 22633, NULL, 3, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (79, 89, 1, CAST(N'2022-03-23T21:56:00.000' AS DateTime), NULL, N'3 Mockingbird Terrace', N'+86 536 527 4343', 18075, CAST(N'2020-07-04T20:16:00.000' AS DateTime), 4, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (80, 33, 1, CAST(N'2021-07-10T05:34:00.000' AS DateTime), NULL, N'888 Rigney Parkway', N'+66 840 188 4675', 5058, NULL, 3, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (81, 51, 3, CAST(N'2022-06-22T06:15:00.000' AS DateTime), CAST(N'2020-05-01T10:05:00.000' AS DateTime), N'22815 Hansons Parkway', N'+62 704 578 1687', 28082, CAST(N'2021-10-20T20:34:00.000' AS DateTime), 3, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (82, 58, 3, CAST(N'2021-05-01T01:53:00.000' AS DateTime), CAST(N'2021-04-07T19:32:00.000' AS DateTime), N'7 Crowley Avenue', N'+504 693 573 8810', 12019, CAST(N'2021-09-02T19:39:00.000' AS DateTime), 2, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (83, 27, 2, CAST(N'2021-08-30T07:41:00.000' AS DateTime), CAST(N'2021-01-24T09:29:00.000' AS DateTime), N'7003 Dawn Terrace', N'+386 859 150 1470', 38442, NULL, 3, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (84, 76, 2, CAST(N'2020-01-28T17:34:00.000' AS DateTime), CAST(N'2021-09-02T04:13:00.000' AS DateTime), N'5 Hayes Way', N'+46 830 302 8086', 21749, NULL, 3, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (85, 51, 3, CAST(N'2021-08-29T22:59:00.000' AS DateTime), CAST(N'2021-07-06T12:11:00.000' AS DateTime), N'03 Gerald Road', N'+86 716 600 8834', 10086, NULL, 3, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (86, 88, 3, CAST(N'2021-12-26T02:34:00.000' AS DateTime), CAST(N'2020-04-17T11:25:00.000' AS DateTime), N'5 Pepper Wood Trail', N'+33 380 742 0455', 15771, NULL, 2, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (87, 20, 3, CAST(N'2020-07-10T04:13:00.000' AS DateTime), CAST(N'2020-02-11T19:09:00.000' AS DateTime), N'608 Hagan Alley', N'+420 989 845 9010', 3078, NULL, 3, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (88, 53, 3, CAST(N'2020-11-14T09:19:00.000' AS DateTime), CAST(N'2020-10-14T14:38:00.000' AS DateTime), N'9 Rowland Pass', N'+86 505 191 2033', 9953, NULL, 4, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (89, 22, 1, CAST(N'2021-01-19T15:37:00.000' AS DateTime), CAST(N'2021-08-20T18:22:00.000' AS DateTime), N'7 Scoville Street', N'+261 840 108 1187', 37861, NULL, 3, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (90, 8, 3, CAST(N'2020-11-23T15:24:00.000' AS DateTime), CAST(N'2020-11-11T15:27:00.000' AS DateTime), N'32550 Golf Course Pass', N'+62 570 254 4877', 20579, NULL, 4, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (91, 76, 3, CAST(N'2022-04-22T00:18:00.000' AS DateTime), CAST(N'2020-09-09T09:36:00.000' AS DateTime), N'24 Londonderry Trail', N'+86 283 211 6881', 35459, NULL, 0, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (92, 73, 1, CAST(N'2021-04-14T18:09:00.000' AS DateTime), NULL, N'0804 Hallows Avenue', N'+62 966 570 6747', 19056, NULL, 2, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (93, 53, 1, CAST(N'2020-01-22T03:06:00.000' AS DateTime), CAST(N'2021-02-08T08:24:00.000' AS DateTime), N'1 Loomis Point', N'+33 126 730 5077', 24879, CAST(N'2021-10-03T20:53:00.000' AS DateTime), 2, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (94, 70, 1, CAST(N'2022-05-07T23:45:00.000' AS DateTime), CAST(N'2020-03-03T05:12:00.000' AS DateTime), N'7 Ronald Regan Road', N'+86 844 113 7148', 7914, CAST(N'2022-04-07T16:24:00.000' AS DateTime), 2, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (95, 82, 2, CAST(N'2020-09-03T15:34:00.000' AS DateTime), CAST(N'2020-07-04T07:01:00.000' AS DateTime), N'2 Comanche Parkway', N'+33 346 686 2986', 15548, NULL, 4, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (96, 66, 2, CAST(N'2020-07-04T01:36:00.000' AS DateTime), CAST(N'2020-09-14T06:44:00.000' AS DateTime), N'28 Spenser Street', N'+86 410 834 0523', 31594, NULL, 4, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (97, 24, 3, CAST(N'2020-12-08T23:30:00.000' AS DateTime), CAST(N'2020-03-10T14:04:00.000' AS DateTime), N'06379 Hanson Parkway', N'+62 416 690 5691', 15749, CAST(N'2021-05-04T02:37:00.000' AS DateTime), 2, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (98, 1, 3, CAST(N'2020-01-16T19:08:00.000' AS DateTime), CAST(N'2021-11-05T08:33:00.000' AS DateTime), N'2001 Kings Drive', N'+976 815 310 9639', 36323, CAST(N'2020-06-24T08:47:00.000' AS DateTime), 2, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (99, 9, 1, CAST(N'2021-03-20T07:36:00.000' AS DateTime), CAST(N'2021-10-06T14:26:00.000' AS DateTime), N'5 Goodland Way', N'+62 917 750 4170', 3296, CAST(N'2020-06-02T00:21:00.000' AS DateTime), 0, 1, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (100, 5, 2, CAST(N'2020-12-19T01:17:00.000' AS DateTime), CAST(N'2021-03-26T05:45:00.000' AS DateTime), N'548 Milwaukee Circle', N'+1 420 569 9435', 38132, CAST(N'2021-02-20T17:42:00.000' AS DateTime), 0, 1, 0, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (101, 1, 1, CAST(N'2022-12-18T22:59:46.317' AS DateTime), NULL, N'HCM', NULL, 0, NULL, 0, 0, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (102, 1, 1, CAST(N'2022-12-25T16:10:13.123' AS DateTime), NULL, N'HCM', NULL, 0, NULL, 0, 0, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (103, 1, 1, CAST(N'2022-12-25T16:12:55.343' AS DateTime), NULL, N'HN', NULL, 0, NULL, 0, 0, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (104, 1, 1, CAST(N'2022-12-25T16:14:12.220' AS DateTime), NULL, N'DN', NULL, 0, NULL, 0, 0, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (107, 1, 1, CAST(N'2022-12-25T21:41:38.223' AS DateTime), NULL, N'HCM', NULL, 0, NULL, 3, 0, 1, NULL)
GO
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display], [is_deleted]) VALUES (108, 1, 1, CAST(N'2022-12-25T22:29:43.703' AS DateTime), NULL, N'HCM', NULL, 0, NULL, 0, 1, 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
SET IDENTITY_INSERT [dbo].[paymentmethods] ON 
GO
INSERT [dbo].[paymentmethods] ([id], [name], [description], [code], [status], [image_name], [is_display]) VALUES (1, N'Direct', NULL, NULL, 0, NULL, 1)
GO
INSERT [dbo].[paymentmethods] ([id], [name], [description], [code], [status], [image_name], [is_display]) VALUES (2, N'ATM', NULL, NULL, 0, NULL, 1)
GO
INSERT [dbo].[paymentmethods] ([id], [name], [description], [code], [status], [image_name], [is_display]) VALUES (3, N'Momo', NULL, NULL, 0, NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[paymentmethods] OFF
GO
SET IDENTITY_INSERT [dbo].[permissions] ON 
GO
INSERT [dbo].[permissions] ([id], [name], [display_name], [is_display]) VALUES (1, N'USE01', N'USER View', 1)
GO
INSERT [dbo].[permissions] ([id], [name], [display_name], [is_display]) VALUES (2, N'USE02', N'USER Update', 1)
GO
INSERT [dbo].[permissions] ([id], [name], [display_name], [is_display]) VALUES (3, N'USE03', N'USER Create', 1)
GO
INSERT [dbo].[permissions] ([id], [name], [display_name], [is_display]) VALUES (4, N'USE04', N'USER Delete', 1)
GO
INSERT [dbo].[permissions] ([id], [name], [display_name], [is_display]) VALUES (5, N'CAT01', N'CATEGORY View', 1)
GO
INSERT [dbo].[permissions] ([id], [name], [display_name], [is_display]) VALUES (6, N'CAT02', N'CATEGORY Update', 1)
GO
INSERT [dbo].[permissions] ([id], [name], [display_name], [is_display]) VALUES (7, N'CAT03', N'CATEGORY Create', 1)
GO
INSERT [dbo].[permissions] ([id], [name], [display_name], [is_display]) VALUES (8, N'CAT04', N'CATEGORY Delete', 1)
GO
INSERT [dbo].[permissions] ([id], [name], [display_name], [is_display]) VALUES (9, N'FOO01', N'FOOD View', 1)
GO
INSERT [dbo].[permissions] ([id], [name], [display_name], [is_display]) VALUES (10, N'FOO02', N'FOOD Update', 1)
GO
INSERT [dbo].[permissions] ([id], [name], [display_name], [is_display]) VALUES (11, N'FOO03', N'FOOD Create', 1)
GO
INSERT [dbo].[permissions] ([id], [name], [display_name], [is_display]) VALUES (12, N'FOO04', N'FOOD Delete', 1)
GO
INSERT [dbo].[permissions] ([id], [name], [display_name], [is_display]) VALUES (13, N'ORD01', N'ORDER View', 1)
GO
INSERT [dbo].[permissions] ([id], [name], [display_name], [is_display]) VALUES (14, N'ORD02', N'ORDER Update', 1)
GO
INSERT [dbo].[permissions] ([id], [name], [display_name], [is_display]) VALUES (15, N'ORD03', N'ORDER Create', 1)
GO
INSERT [dbo].[permissions] ([id], [name], [display_name], [is_display]) VALUES (16, N'ORD04', N'ORDER Delete', 1)
GO
INSERT [dbo].[permissions] ([id], [name], [display_name], [is_display]) VALUES (17, N'COU01', N'COUPON View', 1)
GO
INSERT [dbo].[permissions] ([id], [name], [display_name], [is_display]) VALUES (18, N'COU02', N'COUPON Update', 1)
GO
INSERT [dbo].[permissions] ([id], [name], [display_name], [is_display]) VALUES (19, N'COU03', N'COUPON Create', 1)
GO
INSERT [dbo].[permissions] ([id], [name], [display_name], [is_display]) VALUES (20, N'COU04', N'COUPON Delete', 1)
GO
INSERT [dbo].[permissions] ([id], [name], [display_name], [is_display]) VALUES (21, N'ROL01', N'ROLE View', 1)
GO
INSERT [dbo].[permissions] ([id], [name], [display_name], [is_display]) VALUES (22, N'ROL02', N'ROLE Update', 1)
GO
INSERT [dbo].[permissions] ([id], [name], [display_name], [is_display]) VALUES (23, N'ROL03', N'ROLE Create', 1)
GO
INSERT [dbo].[permissions] ([id], [name], [display_name], [is_display]) VALUES (24, N'ROL04', N'ROLE Delete', 1)
GO
INSERT [dbo].[permissions] ([id], [name], [display_name], [is_display]) VALUES (25, N'CUS01', N'CUSTOMER View', 1)
GO
INSERT [dbo].[permissions] ([id], [name], [display_name], [is_display]) VALUES (26, N'CUS02', N'CUSTOMER Update', 1)
GO
INSERT [dbo].[permissions] ([id], [name], [display_name], [is_display]) VALUES (27, N'CUS03', N'CUSTOMER Create', 1)
GO
INSERT [dbo].[permissions] ([id], [name], [display_name], [is_display]) VALUES (28, N'CUS04', N'CUSTOMER Delete', 1)
GO
INSERT [dbo].[permissions] ([id], [name], [display_name], [is_display]) VALUES (29, N'COM01', N'COMMENT View', 1)
GO
INSERT [dbo].[permissions] ([id], [name], [display_name], [is_display]) VALUES (30, N'COM02', N'COMMENT Update', 1)
GO
INSERT [dbo].[permissions] ([id], [name], [display_name], [is_display]) VALUES (31, N'COM03', N'COMMENT Create', 1)
GO
INSERT [dbo].[permissions] ([id], [name], [display_name], [is_display]) VALUES (32, N'COM04', N'COMMENT Delete', 1)
GO
INSERT [dbo].[permissions] ([id], [name], [display_name], [is_display]) VALUES (33, N'HIS01', N'HISTORY View', 1)
GO
INSERT [dbo].[permissions] ([id], [name], [display_name], [is_display]) VALUES (34, N'HIS02', N'HISTORY Update', 1)
GO
INSERT [dbo].[permissions] ([id], [name], [display_name], [is_display]) VALUES (35, N'HIS03', N'HISTORY Create', 1)
GO
INSERT [dbo].[permissions] ([id], [name], [display_name], [is_display]) VALUES (36, N'HIS04', N'HISTORY Delete', 1)
GO
INSERT [dbo].[permissions] ([id], [name], [display_name], [is_display]) VALUES (37, N'DIS01', N'DISCOUNT View', 1)
GO
INSERT [dbo].[permissions] ([id], [name], [display_name], [is_display]) VALUES (38, N'DIS02', N'DISCOUNT Update', 1)
GO
INSERT [dbo].[permissions] ([id], [name], [display_name], [is_display]) VALUES (39, N'DIS03', N'DISCOUNT Create', 1)
GO
INSERT [dbo].[permissions] ([id], [name], [display_name], [is_display]) VALUES (40, N'DIS04', N'DISCOUNT Delete', 1)
GO
INSERT [dbo].[permissions] ([id], [name], [display_name], [is_display]) VALUES (41, N'IMA01', N'IMAGE View', 1)
GO
INSERT [dbo].[permissions] ([id], [name], [display_name], [is_display]) VALUES (42, N'IMA02', N'IMAGE Update', 1)
GO
INSERT [dbo].[permissions] ([id], [name], [display_name], [is_display]) VALUES (43, N'IMA03', N'IMAGE Create', 1)
GO
INSERT [dbo].[permissions] ([id], [name], [display_name], [is_display]) VALUES (44, N'IMA04', N'IMAGE Delete', 1)
GO
INSERT [dbo].[permissions] ([id], [name], [display_name], [is_display]) VALUES (45, N'NOT01', N'NOTIFICATION View', 1)
GO
INSERT [dbo].[permissions] ([id], [name], [display_name], [is_display]) VALUES (46, N'NOT02', N'NOTIFICATION Update', 1)
GO
INSERT [dbo].[permissions] ([id], [name], [display_name], [is_display]) VALUES (47, N'NOT03', N'NOTIFICATION Create', 1)
GO
INSERT [dbo].[permissions] ([id], [name], [display_name], [is_display]) VALUES (48, N'NOT04', N'NOTIFICATION Delete', 1)
GO
INSERT [dbo].[permissions] ([id], [name], [display_name], [is_display]) VALUES (49, N'PHO01', N'PHONEADDRESS View', 1)
GO
INSERT [dbo].[permissions] ([id], [name], [display_name], [is_display]) VALUES (50, N'PHO02', N'PHONEADDRESS Update', 1)
GO
INSERT [dbo].[permissions] ([id], [name], [display_name], [is_display]) VALUES (51, N'PHO03', N'PHONEADDRESS Create', 1)
GO
INSERT [dbo].[permissions] ([id], [name], [display_name], [is_display]) VALUES (52, N'PHO04', N'PHONEADDRESS Delete', 1)
GO
INSERT [dbo].[permissions] ([id], [name], [display_name], [is_display]) VALUES (53, N'CAR01', N'CART View', 1)
GO
INSERT [dbo].[permissions] ([id], [name], [display_name], [is_display]) VALUES (54, N'CAR02', N'CART Update', 1)
GO
INSERT [dbo].[permissions] ([id], [name], [display_name], [is_display]) VALUES (55, N'CAR03', N'CART Create', 1)
GO
INSERT [dbo].[permissions] ([id], [name], [display_name], [is_display]) VALUES (56, N'CAR04', N'CART Delete', 1)
GO
INSERT [dbo].[permissions] ([id], [name], [display_name], [is_display]) VALUES (57, N'REV01', N'REVIEW View', 1)
GO
INSERT [dbo].[permissions] ([id], [name], [display_name], [is_display]) VALUES (58, N'REV02', N'REVIEW Update', 1)
GO
INSERT [dbo].[permissions] ([id], [name], [display_name], [is_display]) VALUES (59, N'REV03', N'REVIEW Create', 1)
GO
INSERT [dbo].[permissions] ([id], [name], [display_name], [is_display]) VALUES (60, N'REV04', N'REVIEW Delete', 1)
GO
SET IDENTITY_INSERT [dbo].[permissions] OFF
GO
SET IDENTITY_INSERT [dbo].[reviews] ON 
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (1, 15, 26, 2, 43, CAST(N'2021-02-24T00:00:00.000' AS DateTime), CAST(N'2020-04-17T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (2, 10, 51, 4, 34, CAST(N'2021-03-01T00:00:00.000' AS DateTime), CAST(N'2022-04-25T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (3, 20, 38, 2, 88, CAST(N'2020-08-14T00:00:00.000' AS DateTime), CAST(N'2021-04-11T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (4, 11, 10, 3, 6, CAST(N'2021-09-18T00:00:00.000' AS DateTime), CAST(N'2020-05-17T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (5, 10, 73, 2, 10, CAST(N'2021-03-08T00:00:00.000' AS DateTime), CAST(N'2021-10-28T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (6, 3, 43, 5, 4, CAST(N'2021-01-26T00:00:00.000' AS DateTime), CAST(N'2020-06-24T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (7, 9, 91, 1, 42, CAST(N'2022-03-22T00:00:00.000' AS DateTime), CAST(N'2020-04-17T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (8, 5, 79, 1, 86, CAST(N'2021-11-09T00:00:00.000' AS DateTime), CAST(N'2022-03-26T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (9, 10, 14, 4, 9, CAST(N'2022-02-15T00:00:00.000' AS DateTime), CAST(N'2021-04-10T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (10, 7, 94, 4, 5, CAST(N'2021-09-27T00:00:00.000' AS DateTime), CAST(N'2021-07-25T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (11, 21, 75, 2, 28, CAST(N'2020-04-09T00:00:00.000' AS DateTime), CAST(N'2021-01-27T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (12, 21, 22, 4, 83, CAST(N'2021-12-10T00:00:00.000' AS DateTime), CAST(N'2021-09-19T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (13, 20, 80, 3, 25, CAST(N'2021-12-15T00:00:00.000' AS DateTime), CAST(N'2021-08-15T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (14, 22, 87, 1, 66, CAST(N'2022-01-17T00:00:00.000' AS DateTime), CAST(N'2020-04-20T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (15, 3, 67, 4, 88, CAST(N'2020-12-25T00:00:00.000' AS DateTime), CAST(N'2021-09-13T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (16, 13, 59, 2, 45, CAST(N'2021-01-09T00:00:00.000' AS DateTime), CAST(N'2021-10-05T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (17, 2, 100, 2, 23, CAST(N'2020-06-27T00:00:00.000' AS DateTime), CAST(N'2022-01-05T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (18, 20, 98, 5, 95, CAST(N'2021-08-23T00:00:00.000' AS DateTime), CAST(N'2020-05-22T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (19, 11, 83, 2, 57, CAST(N'2021-02-23T00:00:00.000' AS DateTime), CAST(N'2021-05-01T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (20, 1, 98, 2, 1, CAST(N'2022-04-09T00:00:00.000' AS DateTime), CAST(N'2020-12-17T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (21, 15, 90, 4, 57, CAST(N'2020-09-09T00:00:00.000' AS DateTime), CAST(N'2022-03-31T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (23, 13, 4, 2, 54, CAST(N'2021-07-31T00:00:00.000' AS DateTime), CAST(N'2021-06-27T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (24, 11, 90, 5, 11, CAST(N'2020-10-29T00:00:00.000' AS DateTime), CAST(N'2021-07-17T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (25, 2, 24, 1, 91, CAST(N'2021-04-16T00:00:00.000' AS DateTime), CAST(N'2021-05-06T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (26, 16, 23, 3, 47, CAST(N'2021-03-06T00:00:00.000' AS DateTime), CAST(N'2020-05-14T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (27, 11, 78, 3, 56, CAST(N'2020-08-23T00:00:00.000' AS DateTime), CAST(N'2022-02-06T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (28, 14, 95, 3, 47, CAST(N'2021-09-28T00:00:00.000' AS DateTime), CAST(N'2022-05-29T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (29, 11, 22, 4, 83, CAST(N'2020-06-20T00:00:00.000' AS DateTime), CAST(N'2021-05-03T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (30, 5, 18, 2, 45, CAST(N'2021-02-19T00:00:00.000' AS DateTime), CAST(N'2020-01-18T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (32, 17, 14, 4, 22, CAST(N'2021-11-22T00:00:00.000' AS DateTime), CAST(N'2021-01-11T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (33, 5, 36, 1, 50, CAST(N'2021-07-16T00:00:00.000' AS DateTime), CAST(N'2021-02-15T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (34, 18, 89, 5, 59, CAST(N'2022-05-07T00:00:00.000' AS DateTime), CAST(N'2021-09-10T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (36, 3, 36, 4, 79, CAST(N'2021-12-29T00:00:00.000' AS DateTime), CAST(N'2020-02-24T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (37, 17, 94, 2, 98, CAST(N'2021-10-16T00:00:00.000' AS DateTime), CAST(N'2020-12-18T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (38, 2, 7, 3, 89, CAST(N'2021-12-30T00:00:00.000' AS DateTime), CAST(N'2020-03-18T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (39, 17, 7, 5, 13, CAST(N'2022-03-22T00:00:00.000' AS DateTime), CAST(N'2021-03-23T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (40, 7, 24, 3, 14, CAST(N'2020-08-24T00:00:00.000' AS DateTime), CAST(N'2022-05-26T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (41, 19, 66, 1, 46, CAST(N'2020-12-06T00:00:00.000' AS DateTime), CAST(N'2021-07-18T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (42, 10, 5, 5, 39, CAST(N'2020-08-14T00:00:00.000' AS DateTime), CAST(N'2021-04-24T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (43, 19, 89, 3, 99, CAST(N'2020-05-12T00:00:00.000' AS DateTime), CAST(N'2022-03-31T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (44, 5, 44, 3, 18, CAST(N'2020-05-17T00:00:00.000' AS DateTime), CAST(N'2021-11-02T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (46, 15, 77, 4, 14, CAST(N'2021-06-29T00:00:00.000' AS DateTime), CAST(N'2021-11-10T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (47, 20, 39, 1, 51, CAST(N'2021-09-11T00:00:00.000' AS DateTime), CAST(N'2021-10-29T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (48, 7, 34, 3, 30, CAST(N'2020-08-18T00:00:00.000' AS DateTime), CAST(N'2020-01-17T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (49, 14, 21, 2, 54, CAST(N'2021-05-28T00:00:00.000' AS DateTime), CAST(N'2021-07-03T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (50, 9, 29, 4, 64, CAST(N'2021-07-24T00:00:00.000' AS DateTime), CAST(N'2021-08-10T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (51, 9, 56, 4, 10, CAST(N'2020-10-21T00:00:00.000' AS DateTime), CAST(N'2022-02-04T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (52, 10, 85, 3, 90, CAST(N'2020-03-18T00:00:00.000' AS DateTime), CAST(N'2021-03-14T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (54, 13, 7, 3, 76, CAST(N'2021-01-23T00:00:00.000' AS DateTime), CAST(N'2022-02-16T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (55, 19, 51, 4, 59, CAST(N'2020-02-01T00:00:00.000' AS DateTime), CAST(N'2021-05-04T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (56, 2, 51, 3, 4, CAST(N'2021-03-04T00:00:00.000' AS DateTime), CAST(N'2021-08-30T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (57, 18, 41, 3, 5, CAST(N'2020-12-31T00:00:00.000' AS DateTime), CAST(N'2021-09-13T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (58, 5, 59, 1, 21, CAST(N'2020-08-06T00:00:00.000' AS DateTime), CAST(N'2020-11-26T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (59, 1, 86, 4, 99, CAST(N'2021-04-25T00:00:00.000' AS DateTime), CAST(N'2020-05-22T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (60, 7, 17, 1, 66, CAST(N'2020-01-17T00:00:00.000' AS DateTime), CAST(N'2021-05-02T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (61, 16, 46, 4, 24, CAST(N'2021-09-02T00:00:00.000' AS DateTime), CAST(N'2021-11-02T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (62, 18, 52, 1, 12, CAST(N'2020-07-06T00:00:00.000' AS DateTime), CAST(N'2022-04-11T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (63, 17, 38, 3, 85, CAST(N'2020-05-26T00:00:00.000' AS DateTime), CAST(N'2021-06-12T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (64, 21, 43, 1, 96, CAST(N'2020-12-19T00:00:00.000' AS DateTime), CAST(N'2022-05-30T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (65, 2, 99, 4, 93, CAST(N'2021-11-16T00:00:00.000' AS DateTime), CAST(N'2021-01-13T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (66, 16, 36, 5, 85, CAST(N'2020-08-07T00:00:00.000' AS DateTime), CAST(N'2020-02-25T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (67, 7, 65, 3, 73, CAST(N'2021-03-18T00:00:00.000' AS DateTime), CAST(N'2022-03-28T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (68, 2, 86, 1, 30, CAST(N'2021-12-05T00:00:00.000' AS DateTime), CAST(N'2020-12-21T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (70, 18, 18, 1, 36, CAST(N'2021-10-24T00:00:00.000' AS DateTime), CAST(N'2020-02-02T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (71, 1, 99, 4, 44, CAST(N'2021-12-24T00:00:00.000' AS DateTime), CAST(N'2020-11-05T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (72, 11, 59, 4, 78, CAST(N'2021-12-21T00:00:00.000' AS DateTime), CAST(N'2020-07-10T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (73, 2, 22, 5, 17, CAST(N'2020-03-23T00:00:00.000' AS DateTime), CAST(N'2020-07-12T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (74, 11, 75, 4, 13, CAST(N'2020-12-01T00:00:00.000' AS DateTime), CAST(N'2021-02-14T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (75, 20, 85, 1, 21, CAST(N'2021-12-13T00:00:00.000' AS DateTime), CAST(N'2020-08-30T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (76, 16, 49, 5, 85, CAST(N'2020-12-06T00:00:00.000' AS DateTime), CAST(N'2020-07-20T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (77, 12, 8, 2, 14, CAST(N'2021-07-16T00:00:00.000' AS DateTime), CAST(N'2022-03-20T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (78, 3, 18, 5, 66, CAST(N'2021-03-19T00:00:00.000' AS DateTime), CAST(N'2022-03-09T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (79, 21, 23, 4, 13, CAST(N'2020-08-10T00:00:00.000' AS DateTime), CAST(N'2021-03-08T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (80, 7, 79, 2, 49, CAST(N'2021-11-29T00:00:00.000' AS DateTime), CAST(N'2021-04-08T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (81, 22, 12, 5, 94, CAST(N'2021-02-22T00:00:00.000' AS DateTime), CAST(N'2022-02-27T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (82, 3, 55, 4, 4, CAST(N'2021-10-27T00:00:00.000' AS DateTime), CAST(N'2021-02-19T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (84, 16, 29, 3, 86, CAST(N'2021-06-24T00:00:00.000' AS DateTime), CAST(N'2022-05-27T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (85, 21, 47, 4, 64, CAST(N'2021-10-20T00:00:00.000' AS DateTime), CAST(N'2021-06-07T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (87, 13, 11, 2, 81, CAST(N'2020-08-13T00:00:00.000' AS DateTime), CAST(N'2021-08-31T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (88, 7, 60, 4, 25, CAST(N'2022-02-16T00:00:00.000' AS DateTime), CAST(N'2022-04-24T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (89, 3, 98, 4, 79, CAST(N'2022-01-25T00:00:00.000' AS DateTime), CAST(N'2021-01-26T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (90, 1, 66, 5, 25, CAST(N'2021-04-01T00:00:00.000' AS DateTime), CAST(N'2021-09-28T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (92, 8, 32, 1, 1, CAST(N'2020-08-02T00:00:00.000' AS DateTime), CAST(N'2020-03-28T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (93, 15, 29, 3, 71, CAST(N'2020-07-10T00:00:00.000' AS DateTime), CAST(N'2020-03-13T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (94, 15, 100, 3, 51, CAST(N'2021-11-14T00:00:00.000' AS DateTime), CAST(N'2020-08-05T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (95, 19, 81, 5, 29, CAST(N'2020-10-13T00:00:00.000' AS DateTime), CAST(N'2021-02-01T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (96, 12, 85, 2, 91, CAST(N'2021-10-21T00:00:00.000' AS DateTime), CAST(N'2022-04-04T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (97, 4, 25, 2, 41, CAST(N'2020-09-11T00:00:00.000' AS DateTime), CAST(N'2022-06-07T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (98, 10, 61, 5, 46, CAST(N'2021-07-31T00:00:00.000' AS DateTime), CAST(N'2020-05-23T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (99, 17, 20, 5, 26, CAST(N'2020-01-04T00:00:00.000' AS DateTime), CAST(N'2020-11-22T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (100, 22, 57, 2, 18, CAST(N'2020-08-13T00:00:00.000' AS DateTime), CAST(N'2021-06-05T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (101, 1, 50, 2, 39, CAST(N'2021-09-10T00:00:00.000' AS DateTime), CAST(N'2021-03-10T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (102, 13, 28, 2, 51, CAST(N'2021-11-13T00:00:00.000' AS DateTime), CAST(N'2022-04-05T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (103, 9, 26, 4, 77, CAST(N'2022-05-22T00:00:00.000' AS DateTime), CAST(N'2020-01-20T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (104, 9, 19, 4, 62, CAST(N'2020-05-20T00:00:00.000' AS DateTime), CAST(N'2020-07-17T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (105, 16, 88, 3, 94, CAST(N'2020-01-31T00:00:00.000' AS DateTime), CAST(N'2021-02-17T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (107, 16, 9, 3, 46, CAST(N'2020-07-24T00:00:00.000' AS DateTime), CAST(N'2021-01-20T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (108, 2, 5, 5, 42, CAST(N'2022-04-25T00:00:00.000' AS DateTime), CAST(N'2021-01-01T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (109, 22, 46, 1, 33, CAST(N'2021-05-18T00:00:00.000' AS DateTime), CAST(N'2020-04-11T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (110, 9, 81, 5, 70, CAST(N'2022-01-23T00:00:00.000' AS DateTime), CAST(N'2021-12-18T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (111, 17, 1, 5, 16, CAST(N'2020-06-24T00:00:00.000' AS DateTime), CAST(N'2022-05-31T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (112, 11, 46, 4, 32, CAST(N'2020-12-03T00:00:00.000' AS DateTime), CAST(N'2021-04-09T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (114, 3, 71, 1, 34, CAST(N'2020-01-21T00:00:00.000' AS DateTime), CAST(N'2021-08-21T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (115, 16, 96, 4, 86, CAST(N'2021-05-12T00:00:00.000' AS DateTime), CAST(N'2020-01-24T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (116, 1, 42, 5, 67, CAST(N'2021-06-30T00:00:00.000' AS DateTime), CAST(N'2020-09-09T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (117, 22, 42, 4, 63, CAST(N'2022-03-20T00:00:00.000' AS DateTime), CAST(N'2021-07-23T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (118, 21, 33, 2, 10, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-03-18T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (119, 1, 52, 4, 10, CAST(N'2021-05-24T00:00:00.000' AS DateTime), CAST(N'2021-11-10T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (120, 3, 99, 3, 45, CAST(N'2021-09-26T00:00:00.000' AS DateTime), CAST(N'2021-02-02T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (121, 3, 89, 5, 59, CAST(N'2021-04-26T00:00:00.000' AS DateTime), CAST(N'2021-12-20T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (122, 21, 20, 5, 77, CAST(N'2020-01-05T00:00:00.000' AS DateTime), CAST(N'2020-01-29T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (123, 10, 92, 2, 34, CAST(N'2020-01-05T00:00:00.000' AS DateTime), CAST(N'2021-12-24T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (124, 9, 49, 4, 23, CAST(N'2021-05-01T00:00:00.000' AS DateTime), CAST(N'2021-09-05T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (125, 10, 1, 2, 64, CAST(N'2021-08-12T00:00:00.000' AS DateTime), CAST(N'2021-03-31T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (126, 21, 64, 2, 63, CAST(N'2022-04-22T00:00:00.000' AS DateTime), CAST(N'2020-01-16T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (127, 12, 93, 5, 63, CAST(N'2020-10-06T00:00:00.000' AS DateTime), CAST(N'2021-06-22T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (128, 22, 74, 4, 8, CAST(N'2020-08-24T00:00:00.000' AS DateTime), CAST(N'2021-10-29T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (129, 19, 77, 5, 95, CAST(N'2021-05-05T00:00:00.000' AS DateTime), CAST(N'2020-08-31T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (130, 18, 37, 4, 4, CAST(N'2022-03-01T00:00:00.000' AS DateTime), CAST(N'2021-06-01T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (132, 9, 46, 2, 60, CAST(N'2021-04-02T00:00:00.000' AS DateTime), CAST(N'2021-05-03T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (133, 17, 79, 1, 1, CAST(N'2020-08-30T00:00:00.000' AS DateTime), CAST(N'2021-04-10T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (134, 17, 88, 2, 93, CAST(N'2020-01-21T00:00:00.000' AS DateTime), CAST(N'2021-02-10T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (135, 8, 30, 2, 49, CAST(N'2020-05-13T00:00:00.000' AS DateTime), CAST(N'2021-04-03T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (136, 12, 4, 4, 11, CAST(N'2020-11-14T00:00:00.000' AS DateTime), CAST(N'2020-07-06T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (137, 15, 38, 2, 52, CAST(N'2021-06-26T00:00:00.000' AS DateTime), CAST(N'2021-11-04T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (138, 3, 25, 1, 39, CAST(N'2022-05-11T00:00:00.000' AS DateTime), CAST(N'2020-11-06T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (140, 10, 25, 1, 89, CAST(N'2020-10-14T00:00:00.000' AS DateTime), CAST(N'2021-01-21T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (141, 20, 22, 2, 24, CAST(N'2021-05-14T00:00:00.000' AS DateTime), CAST(N'2021-11-17T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (142, 20, 17, 2, 90, CAST(N'2021-12-21T00:00:00.000' AS DateTime), CAST(N'2021-12-18T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (143, 17, 43, 2, 23, CAST(N'2020-11-16T00:00:00.000' AS DateTime), CAST(N'2021-10-04T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (144, 13, 74, 5, 28, CAST(N'2020-01-05T00:00:00.000' AS DateTime), CAST(N'2020-11-07T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (145, 19, 16, 4, 59, CAST(N'2022-05-30T00:00:00.000' AS DateTime), CAST(N'2021-06-03T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (146, 9, 30, 4, 94, CAST(N'2022-01-24T00:00:00.000' AS DateTime), CAST(N'2020-11-12T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (147, 9, 69, 2, 93, CAST(N'2020-01-15T00:00:00.000' AS DateTime), CAST(N'2021-09-02T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (149, 1, 48, 2, 39, CAST(N'2020-04-24T00:00:00.000' AS DateTime), CAST(N'2020-06-10T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (150, 15, 97, 5, 92, CAST(N'2020-01-03T00:00:00.000' AS DateTime), CAST(N'2021-03-19T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (151, 4, 20, 2, 55, CAST(N'2021-05-23T00:00:00.000' AS DateTime), CAST(N'2022-03-20T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (153, 9, 23, 4, 87, CAST(N'2021-02-11T00:00:00.000' AS DateTime), CAST(N'2021-04-01T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (154, 15, 63, 3, 48, CAST(N'2022-06-22T00:00:00.000' AS DateTime), CAST(N'2021-04-04T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (155, 5, 69, 5, 77, CAST(N'2021-02-25T00:00:00.000' AS DateTime), CAST(N'2022-01-24T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (156, 5, 40, 1, 17, CAST(N'2022-01-10T00:00:00.000' AS DateTime), CAST(N'2021-02-03T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (157, 20, 100, 2, 90, CAST(N'2021-05-20T00:00:00.000' AS DateTime), CAST(N'2021-12-17T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (158, 15, 67, 1, 31, CAST(N'2021-03-13T00:00:00.000' AS DateTime), CAST(N'2021-05-07T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (159, 2, 88, 1, 57, CAST(N'2022-02-03T00:00:00.000' AS DateTime), CAST(N'2020-04-06T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (160, 18, 14, 5, 43, CAST(N'2021-01-18T00:00:00.000' AS DateTime), CAST(N'2021-10-25T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (161, 12, 18, 3, 21, CAST(N'2020-05-15T00:00:00.000' AS DateTime), CAST(N'2022-02-18T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (162, 15, 80, 3, 39, CAST(N'2020-12-17T00:00:00.000' AS DateTime), CAST(N'2022-03-01T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (163, 18, 81, 4, 79, CAST(N'2021-02-08T00:00:00.000' AS DateTime), CAST(N'2020-09-27T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (165, 8, 45, 5, 42, CAST(N'2022-04-23T00:00:00.000' AS DateTime), CAST(N'2021-04-07T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (166, 17, 40, 3, 66, CAST(N'2020-09-11T00:00:00.000' AS DateTime), CAST(N'2022-05-22T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (167, 3, 26, 5, 98, CAST(N'2020-05-07T00:00:00.000' AS DateTime), CAST(N'2022-02-09T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (168, 4, 35, 5, 78, CAST(N'2022-03-29T00:00:00.000' AS DateTime), CAST(N'2021-05-12T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (169, 9, 8, 4, 38, CAST(N'2020-12-25T00:00:00.000' AS DateTime), CAST(N'2022-06-28T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (171, 14, 47, 4, 74, CAST(N'2020-08-10T00:00:00.000' AS DateTime), CAST(N'2021-12-31T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (174, 12, 56, 2, 57, CAST(N'2021-06-08T00:00:00.000' AS DateTime), CAST(N'2020-09-04T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (175, 9, 89, 5, 2, CAST(N'2021-12-10T00:00:00.000' AS DateTime), CAST(N'2022-02-20T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (176, 10, 68, 5, 79, CAST(N'2021-03-29T00:00:00.000' AS DateTime), CAST(N'2021-07-16T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (177, 21, 6, 3, 84, CAST(N'2022-01-07T00:00:00.000' AS DateTime), CAST(N'2021-03-04T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (178, 16, 1, 2, 6, CAST(N'2021-04-21T00:00:00.000' AS DateTime), CAST(N'2020-09-12T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (180, 5, 82, 5, 69, CAST(N'2020-07-07T00:00:00.000' AS DateTime), CAST(N'2020-12-01T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (181, 1, 55, 2, 86, CAST(N'2020-06-20T00:00:00.000' AS DateTime), CAST(N'2020-06-02T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (182, 17, 72, 1, 38, CAST(N'2021-10-14T00:00:00.000' AS DateTime), CAST(N'2022-01-20T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (184, 3, 59, 5, 42, CAST(N'2021-05-14T00:00:00.000' AS DateTime), CAST(N'2022-01-12T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (185, 10, 10, 3, 90, CAST(N'2021-10-31T00:00:00.000' AS DateTime), CAST(N'2021-11-12T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (187, 2, 98, 5, 52, CAST(N'2020-09-28T00:00:00.000' AS DateTime), CAST(N'2021-10-05T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (188, 8, 15, 2, 64, CAST(N'2021-05-11T00:00:00.000' AS DateTime), CAST(N'2020-10-28T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (192, 3, 42, 1, 80, CAST(N'2020-04-29T00:00:00.000' AS DateTime), CAST(N'2022-03-25T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (193, 4, 80, 1, 70, CAST(N'2021-06-06T00:00:00.000' AS DateTime), CAST(N'2020-10-02T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (194, 11, 93, 3, 43, CAST(N'2022-03-10T00:00:00.000' AS DateTime), CAST(N'2021-12-31T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (195, 1, 100, 5, 100, CAST(N'2020-01-12T00:00:00.000' AS DateTime), CAST(N'2020-09-26T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (196, 16, 5, 1, 88, CAST(N'2022-05-19T00:00:00.000' AS DateTime), CAST(N'2020-10-31T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (198, 3, 24, 2, 68, CAST(N'2022-06-06T00:00:00.000' AS DateTime), CAST(N'2022-01-25T00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (199, 7, 63, 1, 99, CAST(N'2021-05-23T00:00:00.000' AS DateTime), CAST(N'2021-01-20T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (200, 17, 51, 4, 2, CAST(N'2020-09-16T00:00:00.000' AS DateTime), CAST(N'2020-10-27T00:00:00.000' AS DateTime), 1, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (201, 1, 1, 4, 50, CAST(N'2022-11-30T03:28:57.967' AS DateTime), NULL, 0, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (202, 3, 1, 3, 8, CAST(N'2022-11-30T03:54:43.743' AS DateTime), NULL, 0, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (203, 18, 1, 0, 3, CAST(N'2022-12-04T00:56:55.667' AS DateTime), NULL, 0, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (204, 2, 1, 0, 1, CAST(N'2022-12-10T18:43:43.463' AS DateTime), NULL, 0, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (205, 7, 1, 0, 3, CAST(N'2022-12-18T22:57:51.457' AS DateTime), NULL, 0, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (206, 14, 1, 0, 1, CAST(N'2022-12-18T22:58:27.037' AS DateTime), NULL, 0, 0, 1)
GO
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (207, 11, 1, 0, 1, CAST(N'2022-12-18T22:59:27.003' AS DateTime), NULL, 0, 0, 1)
GO
SET IDENTITY_INSERT [dbo].[reviews] OFF
GO
SET IDENTITY_INSERT [dbo].[role_permissions] ON 
GO
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id]) VALUES (1, 1, 1)
GO
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id]) VALUES (2, 1, 2)
GO
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id]) VALUES (3, 1, 3)
GO
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id]) VALUES (4, 1, 4)
GO
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id]) VALUES (5, 1, 5)
GO
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id]) VALUES (6, 1, 6)
GO
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id]) VALUES (7, 1, 7)
GO
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id]) VALUES (8, 1, 8)
GO
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id]) VALUES (9, 1, 9)
GO
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id]) VALUES (10, 1, 10)
GO
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id]) VALUES (11, 1, 11)
GO
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id]) VALUES (12, 1, 12)
GO
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id]) VALUES (13, 1, 13)
GO
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id]) VALUES (14, 1, 14)
GO
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id]) VALUES (15, 1, 15)
GO
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id]) VALUES (16, 1, 16)
GO
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id]) VALUES (17, 1, 17)
GO
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id]) VALUES (18, 1, 18)
GO
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id]) VALUES (19, 1, 19)
GO
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id]) VALUES (20, 1, 20)
GO
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id]) VALUES (21, 1, 21)
GO
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id]) VALUES (22, 1, 22)
GO
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id]) VALUES (23, 1, 23)
GO
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id]) VALUES (24, 1, 24)
GO
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id]) VALUES (25, 1, 25)
GO
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id]) VALUES (26, 1, 26)
GO
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id]) VALUES (27, 1, 27)
GO
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id]) VALUES (28, 1, 28)
GO
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id]) VALUES (29, 1, 29)
GO
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id]) VALUES (30, 1, 30)
GO
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id]) VALUES (31, 1, 31)
GO
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id]) VALUES (32, 1, 32)
GO
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id]) VALUES (33, 1, 33)
GO
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id]) VALUES (34, 1, 34)
GO
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id]) VALUES (35, 1, 35)
GO
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id]) VALUES (36, 1, 36)
GO
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id]) VALUES (37, 1, 37)
GO
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id]) VALUES (38, 1, 38)
GO
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id]) VALUES (39, 1, 39)
GO
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id]) VALUES (40, 1, 40)
GO
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id]) VALUES (41, 1, 41)
GO
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id]) VALUES (42, 1, 42)
GO
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id]) VALUES (43, 1, 43)
GO
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id]) VALUES (44, 1, 44)
GO
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id]) VALUES (45, 1, 45)
GO
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id]) VALUES (46, 1, 46)
GO
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id]) VALUES (47, 1, 47)
GO
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id]) VALUES (48, 1, 48)
GO
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id]) VALUES (49, 1, 49)
GO
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id]) VALUES (50, 1, 50)
GO
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id]) VALUES (51, 1, 51)
GO
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id]) VALUES (52, 1, 52)
GO
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id]) VALUES (53, 1, 53)
GO
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id]) VALUES (54, 1, 54)
GO
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id]) VALUES (55, 1, 55)
GO
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id]) VALUES (56, 1, 56)
GO
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id]) VALUES (57, 1, 57)
GO
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id]) VALUES (58, 1, 58)
GO
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id]) VALUES (59, 1, 59)
GO
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id]) VALUES (60, 1, 60)
GO
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id]) VALUES (96, 2, 13)
GO
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id]) VALUES (97, 2, 14)
GO
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id]) VALUES (98, 2, 15)
GO
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id]) VALUES (99, 2, 16)
GO
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id]) VALUES (104, 3, 1)
GO
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id]) VALUES (105, 3, 2)
GO
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id]) VALUES (106, 3, 3)
GO
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id]) VALUES (108, 3, 4)
GO
SET IDENTITY_INSERT [dbo].[role_permissions] OFF
GO
SET IDENTITY_INSERT [dbo].[roles] ON 
GO
INSERT [dbo].[roles] ([id], [name], [display_name], [create_date], [create_by], [is_display]) VALUES (1, N'system', N'SYSTEM ADMIN', NULL, NULL, 1)
GO
INSERT [dbo].[roles] ([id], [name], [display_name], [create_date], [create_by], [is_display]) VALUES (2, N'accounting', N'ACCOUNTING', NULL, NULL, 0)
GO
INSERT [dbo].[roles] ([id], [name], [display_name], [create_date], [create_by], [is_display]) VALUES (3, N'productmanager', N'PRODUCT MANAGER', NULL, NULL, 1)
GO
INSERT [dbo].[roles] ([id], [name], [display_name], [create_date], [create_by], [is_display]) VALUES (4, N'chef', N'CHEF', NULL, NULL, 1)
GO
INSERT [dbo].[roles] ([id], [name], [display_name], [create_date], [create_by], [is_display]) VALUES (5, N'dataanalysis', N'DATA ANALYSIS', NULL, NULL, 1)
GO
INSERT [dbo].[roles] ([id], [name], [display_name], [create_date], [create_by], [is_display]) VALUES (6, N'seniormanagement', N'SENIOR MANAGEMENT', NULL, NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[roles] OFF
GO
SET IDENTITY_INSERT [dbo].[user_permissions] ON 
GO
INSERT [dbo].[user_permissions] ([id], [user_id], [permission_id]) VALUES (12, 1, 1)
GO
INSERT [dbo].[user_permissions] ([id], [user_id], [permission_id]) VALUES (2, 2, 5)
GO
INSERT [dbo].[user_permissions] ([id], [user_id], [permission_id]) VALUES (4, 2, 6)
GO
INSERT [dbo].[user_permissions] ([id], [user_id], [permission_id]) VALUES (3, 3, 6)
GO
INSERT [dbo].[user_permissions] ([id], [user_id], [permission_id]) VALUES (5, 3, 8)
GO
SET IDENTITY_INSERT [dbo].[user_permissions] OFF
GO
SET IDENTITY_INSERT [dbo].[user_roles] ON 
GO
INSERT [dbo].[user_roles] ([id], [user_id], [role_id]) VALUES (1, 1, 1)
GO
INSERT [dbo].[user_roles] ([id], [user_id], [role_id]) VALUES (18, 1, 3)
GO
INSERT [dbo].[user_roles] ([id], [user_id], [role_id]) VALUES (19, 1, 4)
GO
INSERT [dbo].[user_roles] ([id], [user_id], [role_id]) VALUES (9, 2, 2)
GO
INSERT [dbo].[user_roles] ([id], [user_id], [role_id]) VALUES (4, 3, 3)
GO
INSERT [dbo].[user_roles] ([id], [user_id], [role_id]) VALUES (5, 3, 4)
GO
INSERT [dbo].[user_roles] ([id], [user_id], [role_id]) VALUES (14, 4, 1)
GO
INSERT [dbo].[user_roles] ([id], [user_id], [role_id]) VALUES (20, 4, 2)
GO
INSERT [dbo].[user_roles] ([id], [user_id], [role_id]) VALUES (7, 5, 2)
GO
INSERT [dbo].[user_roles] ([id], [user_id], [role_id]) VALUES (8, 7, 5)
GO
SET IDENTITY_INSERT [dbo].[user_roles] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (1, N'admin', N'123', N'System Admin', 1, N'0123456789', N'kaykaku15@gmail.com', NULL, N'fc0487eb.png', NULL, NULL, NULL, 0, NULL, NULL, 1)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (2, N'phuong', N'321', N'Võ Đình Duy Phương', 1, N'0983213138', N'phuong@fpt.edu.vn', CAST(N'2001-08-05' AS Date), N'user.png', N'Công viên phần mềm quang trung', N'234', N'qwe', 1, CAST(N'2022-11-15T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (3, N'hau', N'234', N'Trần Phúc Hậu', 1, N'0799901243', N'hau@fpt.edu.vn', CAST(N'2001-11-28' AS Date), N'user.png', N'Thành phố tân an ', N'345', N'asd', 1, CAST(N'2022-11-16T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (4, N'tuyen', N'789', N'Nguyễn Thị Thanh Tuyền', 0, N'0381291291', N'tuyennttps15840@fpt.edu.vn', CAST(N'2002-05-06' AS Date), N'user.png', N'Thành phố bình dương', N'456', N'zxc', 1, CAST(N'2022-11-17T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (5, N'hieu', N'678', N'Dương Minh Hiếu', 1, N'0912821761', N'hieu@fpt.edu.vn', CAST(N'2002-03-12' AS Date), N'user.png', N'Công viên phần mềm quang trung', N'567', N'rty', 1, CAST(N'2022-11-18T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (6, N'thedgeman5', N'opE5RS', N'Tallie Hedgeman', 0, N'+351 953 760 7826', N'thedgeman5@bing.com', CAST(N'1988-07-11' AS Date), N'user.png', N'53489 American Terrace', N'', N'', 1, CAST(N'2020-02-29T00:00:00.000' AS DateTime), 1, 0)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (7, N'quan', N'987', N'Trà Minh Quân', 1, N'0381210121', N'quan@fpt.edu.vn', CAST(N'2002-10-12' AS Date), N'user.png', N'Tòa nhà P quang trung', N'678', N'mnb', 1, CAST(N'2022-11-19T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (8, N'tjerger7', N'lgFKBRHl430u', N'Tuck Jerger', 0, N'+385 945 569 9831', N'tjerger7@slate.com', CAST(N'1999-12-12' AS Date), N'user.png', N'87 Merrick Plaza', N'', N'', 1, CAST(N'2021-01-10T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (9, N'nharber8', N'fwT9IXYGfmj', N'Nessa Harber', 1, N'+1 570 318 4979', N'nharber8@ebay.co.uk', CAST(N'1982-07-29' AS Date), N'user.png', N'335 Meadow Ridge Park', N'', N'', 1, CAST(N'2020-04-10T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (10, N'rchander9', N'0d1UbQLBevmA', N'Raddy Chander', 1, N'+1 624 687 7678', N'rchander9@slideshare.net', CAST(N'1992-05-06' AS Date), N'user.png', N'13362 Hermina Road', N'', N'', 1, CAST(N'2020-05-11T00:00:00.000' AS DateTime), 1, 0)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (11, N'oridgedella', N'KFGZk5qHBP', N'Olwen Ridgedell', 1, N'+49 332 860 9886', N'oridgedella@cdc.gov', CAST(N'1991-03-25' AS Date), N'user.png', N'8 Truax Avenue', N'', N'', 1, CAST(N'2021-04-06T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (12, N'mhastedb', N'yLDn4OIrA', N'Man Hasted', 1, N'+63 697 955 3187', N'mhastedb@booking.com', CAST(N'1982-10-19' AS Date), N'user.png', N'82 Pawling Plaza', N'', N'', 1, CAST(N'2020-12-13T00:00:00.000' AS DateTime), 1, 0)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (13, N'mbentec', N'4tWXCB', N'Marten Bente', 1, N'+7 422 679 8888', N'mbentec@va.gov', CAST(N'2001-01-07' AS Date), N'user.png', N'2279 Lukken Road', N'', N'', 1, CAST(N'2021-10-22T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (14, N'ckleinlererd', N'ZC2AneD6ofCv', N'Clarita Kleinlerer', 0, N'+62 757 266 2538', N'ckleinlererd@fc2.com', CAST(N'1981-01-12' AS Date), N'user.png', N'823 Mockingbird Court', N'', N'', 1, CAST(N'2021-08-17T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (15, N'djoseburye', N'5hNTXXCnKws', N'Devlin Josebury', 1, N'+223 188 211 3991', N'djoseburye@php.net', CAST(N'1982-08-20' AS Date), N'user.png', N'8 Ramsey Court', N'', N'', 1, CAST(N'2021-12-11T00:00:00.000' AS DateTime), 1, 0)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (16, N'rtorrecillaf', N'YJvi3a5K', N'Raye Torrecilla', 0, N'+62 596 429 2617', N'rtorrecillaf@sogou.com', CAST(N'1989-07-31' AS Date), N'user.png', N'04 Vahlen Court', N'', N'', 1, CAST(N'2022-01-15T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (17, N'balderwickg', N'WbhIEuCla', N'Bunni Alderwick', 0, N'+373 879 630 3699', N'balderwickg@reference.com', CAST(N'1983-06-15' AS Date), N'user.png', N'3 Blackbird Center', N'', N'', 1, CAST(N'2020-10-27T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (18, N'jhuxhamh', N'zzKeGIt', N'Janifer Huxham', 0, N'+86 440 670 3425', N'jhuxhamh@google.com', CAST(N'1992-10-09' AS Date), N'user.png', N'25610 Scofield Court', N'', N'', 1, CAST(N'2021-08-04T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (19, N'hbabalolai', N'zoOppZGugQ', N'Harlin Babalola', 0, N'+63 974 915 7822', N'hbabalolai@vimeo.com', CAST(N'1983-09-24' AS Date), N'user.png', N'1 Talmadge Circle', N'', N'', 1, CAST(N'2021-04-08T00:00:00.000' AS DateTime), 1, 0)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (20, N'czanellij', N'EQ0Bh18bPg', N'Culley Zanelli', 1, N'+48 490 495 5395', N'czanellij@msu.edu', CAST(N'1984-10-02' AS Date), N'user.png', N'5158 Aberg Trail', N'', N'', 1, CAST(N'2020-03-11T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (21, N'ecoffeltk', N'fwg2el', N'Eustacia Coffelt', 0, N'+86 188 868 7457', N'ecoffeltk@vistaprint.com', CAST(N'1989-03-15' AS Date), N'user.png', N'89 Dorton Crossing', N'', N'', 1, CAST(N'2020-07-06T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (22, N'akulisl', N'BER8BX', N'Appolonia Kulis', 0, N'+86 590 828 3550', N'akulisl@ustream.tv', CAST(N'1989-03-26' AS Date), N'user.png', N'6324 Bonner Point', N'', N'', 1, CAST(N'2020-10-16T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (23, N'dskedgem', N'6IjiY9', N'Dalenna Skedge', 0, N'+7 131 778 6158', N'dskedgem@simplemachines.org', CAST(N'1985-03-02' AS Date), N'user.png', N'25567 Sugar Parkway', N'', N'', 1, CAST(N'2020-08-13T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (24, N'estrangmann', N'5X1wj5', N'Elroy Strangman', 1, N'+234 673 938 3635', N'estrangmann@e-recht24.de', CAST(N'1983-12-03' AS Date), N'user.png', N'3 Canary Road', N'', N'', 1, CAST(N'2021-12-09T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (25, N'dwoosnamo', N'i7lYaP2b', N'Danette Woosnam', 1, N'+86 394 621 6565', N'dwoosnamo@chronoengine.com', CAST(N'1995-11-23' AS Date), N'user.png', N'284 Old Gate Crossing', N'', N'', 1, CAST(N'2021-02-18T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (26, N'lwortmanp', N'x247ewdfA', N'Lynde Wortman', 0, N'+86 541 422 7645', N'lwortmanp@360.cn', CAST(N'1992-08-24' AS Date), N'user.png', N'470 Mayer Drive', N'', N'', 1, CAST(N'2021-10-06T00:00:00.000' AS DateTime), 1, 0)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (27, N'wfiltnessq', N'v6ht285rbJMA', N'Winona Filtness', 1, N'+372 464 803 1719', N'wfiltnessq@cmu.edu', CAST(N'1996-04-10' AS Date), N'user.png', N'4878 Arizona Circle', N'', N'', 1, CAST(N'2021-03-16T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (28, N'mder', N'CfksqKd9nQ', N'Mano De Bruyne', 1, N'+86 703 592 3820', N'mder@newyorker.com', CAST(N'1991-02-06' AS Date), N'user.png', N'95867 Chive Court', N'', N'', 1, CAST(N'2020-08-12T00:00:00.000' AS DateTime), 1, 0)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (29, N'clufkins', N'OjxsVn8', N'Cele Lufkin', 1, N'+212 673 185 6754', N'clufkins@kickstarter.com', CAST(N'1998-08-22' AS Date), N'user.png', N'162 Fallview Lane', N'', N'', 1, CAST(N'2020-06-14T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (30, N'bmuggacht', N'iJDOl6eO', N'Brittani Muggach', 1, N'+351 413 615 4145', N'bmuggacht@ibm.com', CAST(N'1986-01-10' AS Date), N'user.png', N'17255 Sherman Lane', N'', N'', 1, CAST(N'2021-05-12T00:00:00.000' AS DateTime), 1, 0)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (31, N'kjayneu', N'oGUAMV6', N'Katey Jayne', 0, N'+86 966 410 4431', N'kjayneu@patch.com', CAST(N'1999-03-15' AS Date), N'user.png', N'0386 Everett Park', N'', N'', 1, CAST(N'2021-01-16T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (32, N'randersenv', N'Y5j0cyi4', N'Rhodia Andersen', 1, N'+977 875 248 0820', N'randersenv@vistaprint.com', CAST(N'1995-09-07' AS Date), N'user.png', N'4 Fremont Way', N'', N'', 1, CAST(N'2021-07-06T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (33, N'ljohnseyw', N'JcIrdBF6Rw', N'Lilllie Johnsey', 0, N'+381 347 410 9723', N'ljohnseyw@redcross.org', CAST(N'1987-08-17' AS Date), N'user.png', N'058 Sachtjen Trail', N'', N'', 1, CAST(N'2020-12-05T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (34, N'smcduffiex', N'fOpNe6mbn2', N'Stu McDuffie', 1, N'+36 719 317 5414', N'smcduffiex@gnu.org', CAST(N'1990-01-15' AS Date), N'user.png', N'056 Atwood Lane', N'', N'', 1, CAST(N'2022-04-23T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (35, N'lpressliey', N'xHvbZtZ', N'Lucien Presslie', 0, N'+267 814 487 9564', N'lpressliey@liveinternet.ru', CAST(N'2001-06-23' AS Date), N'user.png', N'94761 Farwell Crossing', N'', N'', 1, CAST(N'2022-02-18T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (36, N'mcortesz', N'1ZPAwsiosLHu', N'Marshall Cortes', 0, N'+34 488 854 6250', N'mcortesz@dagondesign.com', CAST(N'1998-05-07' AS Date), N'user.png', N'729 Monument Junction', N'', N'', 1, CAST(N'2020-04-07T00:00:00.000' AS DateTime), 1, 0)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (37, N'fodocherty10', N'UyXG5cE0', N'Filia O''Docherty', 0, N'+62 883 677 3358', N'fodocherty10@free.fr', CAST(N'2002-01-24' AS Date), N'user.png', N'37055 Cascade Lane', N'', N'', 1, CAST(N'2022-02-16T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (38, N'mhachette11', N'CuyZLOmWS', N'Malissa Hachette', 1, N'+1 134 967 9269', N'mhachette11@tinypic.com', CAST(N'1980-04-22' AS Date), N'user.png', N'399 Amoth Plaza', N'', N'', 1, CAST(N'2021-05-10T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (39, N'mivel12', N'1g73WP4P6', N'Marjy Ivel', 0, N'+1 226 631 0735', N'mivel12@livejournal.com', CAST(N'1988-06-25' AS Date), N'user.png', N'3 Rieder Center', N'', N'', 1, CAST(N'2021-07-12T00:00:00.000' AS DateTime), 1, 0)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (40, N'bdanilovich13', N'gSrihbRq', N'Bridget Danilovich', 1, N'+593 674 317 3484', N'bdanilovich13@diigo.com', CAST(N'1984-04-15' AS Date), N'user.png', N'51 Transport Circle', N'', N'', 1, CAST(N'2022-02-19T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (41, N'tadvani14', N'I3pPpJEDz', N'Twyla Advani', 0, N'+52 657 209 3406', N'tadvani14@fda.gov', CAST(N'1985-08-03' AS Date), N'user.png', N'273 Rowland Park', N'', N'', 1, CAST(N'2021-04-14T00:00:00.000' AS DateTime), 1, 0)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (42, N'khughf15', N'qglgbxpgc6u0', N'Kinna Hughf', 1, N'+86 799 123 7691', N'khughf15@google.ca', CAST(N'1987-02-03' AS Date), N'user.png', N'02 Tennyson Drive', N'', N'', 1, CAST(N'2021-04-17T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (43, N'rborge16', N'rz0Qi6C', N'Rory Borge', 0, N'+86 685 100 1949', N'rborge16@mac.com', CAST(N'1983-12-05' AS Date), N'user.png', N'0 Golf View Alley', N'', N'', 1, CAST(N'2020-02-21T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (44, N'jyushankin17', N'E619IrH4T', N'Jerrie Yushankin', 0, N'+62 200 737 8547', N'jyushankin17@hhs.gov', CAST(N'1988-03-11' AS Date), N'user.png', N'1904 Muir Place', N'', N'', 1, CAST(N'2020-11-06T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (45, N'jcaveill18', N'ZSqHaqgeHsBb', N'Joey Caveill', 1, N'+7 531 647 7741', N'jcaveill18@taobao.com', CAST(N'1994-03-30' AS Date), N'user.png', N'4 Warrior Alley', N'', N'', 1, CAST(N'2021-03-01T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (46, N'rsimmons19', N'53GFvsWO05', N'Rosemarie Simmons', 1, N'+49 496 331 3327', N'rsimmons19@pcworld.com', CAST(N'1981-09-10' AS Date), N'user.png', N'91 Heffernan Center', N'', N'', 1, CAST(N'2022-02-21T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (47, N'ddunbar1a', N'GHOeyu', N'Dorrie Dunbar', 1, N'+355 468 812 3209', N'ddunbar1a@blogtalkradio.com', CAST(N'1984-02-07' AS Date), N'user.png', N'219 Aberg Lane', N'', N'', 1, CAST(N'2021-09-01T00:00:00.000' AS DateTime), 1, 0)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (48, N'aiczokvitz1b', N'ru7Gfd4VK', N'Ardelis Iczokvitz', 1, N'+86 718 676 4353', N'aiczokvitz1b@abc.net.au', CAST(N'1999-09-24' AS Date), N'user.png', N'8107 Redwing Alley', N'', N'', 1, CAST(N'2022-06-23T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (49, N'kperassi1c', N'Yg1qt5Oj', N'Kennedy Perassi', 1, N'+86 637 770 8313', N'kperassi1c@google.com', CAST(N'1990-03-08' AS Date), N'user.png', N'24641 Upham Lane', N'', N'', 1, CAST(N'2021-03-20T00:00:00.000' AS DateTime), 1, 0)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (50, N'pmethringham1d', N'JolREOoK', N'Pammy Methringham', 1, N'+62 285 730 9721', N'pmethringham1d@unesco.org', CAST(N'1980-01-05' AS Date), N'user.png', N'892 Di Loreto Parkway', N'', N'', 1, CAST(N'2021-10-25T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (51, N'fpetrak1e', N'ty7RvJCE3', N'Fredek Petrak', 0, N'+55 756 725 2698', N'fpetrak1e@prlog.org', CAST(N'2001-08-26' AS Date), N'user.png', N'6 Ridgeview Avenue', N'', N'', 1, CAST(N'2022-01-04T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (52, N'gwoloschin1f', N'9PavwTRqbb', N'Grace Woloschin', 0, N'+261 188 141 9618', N'gwoloschin1f@macromedia.com', CAST(N'2000-04-21' AS Date), N'user.png', N'55 Warbler Trail', N'', N'', 1, CAST(N'2020-01-28T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (53, N'myell1g', N'bQZHacKMzQ6', N'Mada Yell', 0, N'+51 681 304 7628', N'myell1g@vimeo.com', CAST(N'1999-03-27' AS Date), N'user.png', N'081 Carey Alley', N'', N'', 1, CAST(N'2021-02-27T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (54, N'mmortell1h', N'It2Lkw', N'Merilee Mortell', 1, N'+1 231 207 5986', N'mmortell1h@uol.com.br', CAST(N'1990-12-10' AS Date), N'user.png', N'12689 Prairieview Circle', N'', N'', 1, CAST(N'2020-04-09T00:00:00.000' AS DateTime), 1, 0)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (55, N'acutler1i', N'0hjmFP', N'Archibold Cutler', 0, N'+370 564 778 0592', N'acutler1i@redcross.org', CAST(N'1987-01-05' AS Date), N'user.png', N'46045 Fallview Avenue', N'', N'', 1, CAST(N'2020-09-28T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (56, N'kruse1j', N'ZcJhvTyIw', N'Kipp Ruse', 0, N'+86 432 634 9281', N'kruse1j@paypal.com', CAST(N'1997-03-19' AS Date), N'user.png', N'888 Little Fleur Alley', N'', N'', 1, CAST(N'2021-08-29T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (57, N'lubanks1k', N'juj2Go', N'Lynnette Ubanks', 0, N'+7 513 302 4665', N'lubanks1k@mapy.cz', CAST(N'1990-12-16' AS Date), N'user.png', N'70452 Prairieview Terrace', N'', N'', 1, CAST(N'2021-11-04T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (58, N'gmateiko1l', N'Qukdo2I', N'Gregory Mateiko', 1, N'+81 787 964 7763', N'gmateiko1l@freewebs.com', CAST(N'1996-10-12' AS Date), N'user.png', N'50 Dovetail Lane', N'', N'', 1, CAST(N'2021-05-13T00:00:00.000' AS DateTime), 1, 0)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (59, N'sgristhwaite1m', N'97osMP', N'Shayla Gristhwaite', 1, N'+63 869 343 1140', N'sgristhwaite1m@netscape.com', CAST(N'1993-03-07' AS Date), N'user.png', N'95574 Warrior Road', N'', N'', 1, CAST(N'2021-05-13T00:00:00.000' AS DateTime), 1, 0)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (60, N'egladebeck1n', N'll353AqWJ', N'Emory Gladebeck', 1, N'+62 506 642 4791', N'egladebeck1n@discovery.com', CAST(N'1985-10-19' AS Date), N'user.png', N'565 5th Center', N'', N'', 1, CAST(N'2021-01-26T00:00:00.000' AS DateTime), 1, 0)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (61, N'epetchell1o', N'FUZDJAJUZ4', N'Elihu Petchell', 0, N'+86 182 456 5115', N'epetchell1o@scribd.com', CAST(N'1988-03-24' AS Date), N'user.png', N'96398 Waywood Lane', N'', N'', 1, CAST(N'2020-06-20T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (62, N'bnealy1p', N'WeHqHD', N'Bernadine Nealy', 1, N'+251 928 398 8357', N'bnealy1p@amazonaws.com', CAST(N'1983-11-02' AS Date), N'user.png', N'9 Lyons Way', N'', N'', 1, CAST(N'2021-05-17T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (63, N'sharston1q', N'0wkvS3Q3m', N'Shel Harston', 0, N'+54 221 221 6880', N'sharston1q@nytimes.com', CAST(N'1993-09-11' AS Date), N'user.png', N'73 Acker Drive', N'', N'', 1, CAST(N'2022-01-25T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (64, N'gpitceathly1r', N'ZGBhjttYO0', N'Gun Pitceathly', 0, N'+216 668 289 7682', N'gpitceathly1r@weather.com', CAST(N'1996-09-03' AS Date), N'user.png', N'19147 Packers Court', N'', N'', 1, CAST(N'2020-01-08T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (65, N'kbrilleman1s', N'QNhDY6tAKnMA', N'Khalil Brilleman', 0, N'+62 470 698 2661', N'kbrilleman1s@ca.gov', CAST(N'1985-09-11' AS Date), N'user.png', N'484 Spenser Parkway', N'', N'', 1, CAST(N'2020-08-21T00:00:00.000' AS DateTime), 1, 0)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (66, N'scalyton1t', N'yBA95sRBZhZ', N'Sanderson Calyton', 1, N'+598 393 490 9782', N'scalyton1t@wiley.com', CAST(N'1982-11-03' AS Date), N'user.png', N'867 Tony Junction', N'', N'', 1, CAST(N'2020-02-01T00:00:00.000' AS DateTime), 1, 0)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (67, N'ngalloway1u', N'7d6r9UbJxoln', N'Noble Galloway', 0, N'+81 238 644 2477', N'ngalloway1u@ifeng.com', CAST(N'1988-11-28' AS Date), N'user.png', N'0887 Grayhawk Court', N'', N'', 1, CAST(N'2020-12-27T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (68, N'fcapelin1v', N'u845J15UoJ', N'Fitzgerald Capelin', 1, N'+51 413 275 0178', N'fcapelin1v@twitter.com', CAST(N'1993-10-03' AS Date), N'user.png', N'970 Dapin Trail', N'', N'', 1, CAST(N'2020-06-05T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (69, N'cfishlee1w', N'cEy4BEMrAb', N'Caril Fishlee', 0, N'+63 460 693 1087', N'cfishlee1w@artisteer.com', CAST(N'1980-04-27' AS Date), N'user.png', N'15 Sheridan Crossing', N'', N'', 1, CAST(N'2021-12-09T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (70, N'bkinvig1x', N'VpBU06', N'Bethany Kinvig', 0, N'+30 437 114 0749', N'bkinvig1x@csmonitor.com', CAST(N'1980-06-29' AS Date), N'user.png', N'49 Susan Place', N'', N'', 1, CAST(N'2020-05-23T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (71, N'rcurtiss1y', N'PkEqEhZS', N'Rex Curtiss', 1, N'+7 772 305 2952', N'rcurtiss1y@so-net.ne.jp', CAST(N'1998-07-02' AS Date), N'user.png', N'64 Acker Circle', N'', N'', 1, CAST(N'2021-02-28T00:00:00.000' AS DateTime), 1, 0)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (72, N'mgawkes1z', N'Tdh9x0JdL9', N'Matthus Gawkes', 0, N'+62 364 608 5334', N'mgawkes1z@ustream.tv', CAST(N'1984-06-19' AS Date), N'user.png', N'31 Bartelt Drive', N'', N'', 1, CAST(N'2021-08-13T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (73, N'rscammell20', N'kNPZSs', N'Ray Scammell', 1, N'+86 982 291 5746', N'rscammell20@symantec.com', CAST(N'1988-03-30' AS Date), N'user.png', N'5766 Jenna Drive', N'', N'', 1, CAST(N'2021-05-26T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (74, N'ncrosswaite21', N'Hq6f79mIhtFz', N'Nissy Crosswaite', 1, N'+7 279 748 4516', N'ncrosswaite21@plala.or.jp', CAST(N'1998-11-02' AS Date), N'user.png', N'02 Thompson Terrace', N'', N'', 1, CAST(N'2020-05-19T00:00:00.000' AS DateTime), 1, 0)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (75, N'nbabalola22', N'oyJ3HbCSilwq', N'Nikolos Babalola', 0, N'+62 857 240 3673', N'nbabalola22@washingtonpost.com', CAST(N'1982-01-14' AS Date), N'user.png', N'4 Columbus Crossing', N'', N'', 1, CAST(N'2021-09-30T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (76, N'odomenget23', N'Xy70dMNs', N'Onofredo Domenget', 1, N'+86 569 507 9016', N'odomenget23@archive.org', CAST(N'1988-03-17' AS Date), N'user.png', N'2203 Evergreen Junction', N'', N'', 1, CAST(N'2020-01-31T00:00:00.000' AS DateTime), 1, 0)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (77, N'adeinert24', N'r8DxUnQ2s', N'Aggie Deinert', 1, N'+381 134 487 1430', N'adeinert24@adobe.com', CAST(N'1999-09-05' AS Date), N'user.png', N'137 Swallow Junction', N'', N'', 1, CAST(N'2021-09-16T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (78, N'vcrippes25', N'KFzff9T1k6', N'Vite Crippes', 0, N'+86 138 750 6381', N'vcrippes25@qq.com', CAST(N'1985-11-23' AS Date), N'user.png', N'9 Hoepker Avenue', N'', N'', 1, CAST(N'2020-11-30T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (79, N'naldam26', N'Gk0OLZ9M4Os3', N'Nicoli Aldam', 1, N'+94 198 885 3952', N'naldam26@prlog.org', CAST(N'1988-06-13' AS Date), N'user.png', N'847 Westridge Alley', N'', N'', 1, CAST(N'2020-11-19T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (80, N'rseeking27', N'zjr31Op5O9', N'Rafaello Seeking', 0, N'+86 862 896 8682', N'rseeking27@stanford.edu', CAST(N'1992-07-19' AS Date), N'user.png', N'263 Warbler Avenue', N'', N'', 1, CAST(N'2021-11-02T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (81, N'holdershaw28', N'vUZSzpQNK', N'Hinze Oldershaw', 0, N'+590 818 712 2126', N'holdershaw28@privacy.gov.au', CAST(N'1992-12-15' AS Date), N'user.png', N'395 Bellgrove Drive', N'', N'', 1, CAST(N'2021-11-24T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (82, N'dlinzey29', N'SZOW0QPBEF', N'Dawn Linzey', 0, N'+7 204 233 4147', N'dlinzey29@whitehouse.gov', CAST(N'1997-04-23' AS Date), N'user.png', N'71703 Scofield Circle', N'', N'', 1, CAST(N'2020-10-15T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (83, N'fpetkov2a', N'qddGJ1kEE', N'Fania Petkov', 1, N'+86 721 833 4907', N'fpetkov2a@tuttocitta.it', CAST(N'1992-07-31' AS Date), N'user.png', N'7 Novick Place', N'', N'', 1, CAST(N'2021-11-13T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (84, N'chaugg2b', N'kZ73PR', N'Claudie Haugg', 1, N'+380 993 141 6939', N'chaugg2b@time.com', CAST(N'1992-04-13' AS Date), N'user.png', N'07525 Oak Street', N'', N'', 1, CAST(N'2022-06-21T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (85, N'thambright2c', N'9NoNI35pz', N'Tally Hambright', 1, N'+261 856 985 9472', N'thambright2c@businessweek.com', CAST(N'1986-01-31' AS Date), N'user.png', N'5931 Myrtle Hill', N'', N'', 1, CAST(N'2021-08-30T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (86, N'priggs2d', N'wwxsxu8Bj', N'Pattin Riggs', 0, N'+62 991 176 6086', N'priggs2d@bigcartel.com', CAST(N'1999-09-21' AS Date), N'user.png', N'5783 Nancy Street', N'', N'', 1, CAST(N'2021-07-12T00:00:00.000' AS DateTime), 1, 0)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (87, N'gbriat2e', N'5VESzkUHwT3', N'Gabbi Briat', 1, N'+49 883 321 9127', N'gbriat2e@nature.com', CAST(N'2001-04-08' AS Date), N'user.png', N'46 Valley Edge Court', N'', N'', 1, CAST(N'2020-12-07T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (88, N'bchilderhouse2f', N'T9Taji', N'Brigitte Childerhouse', 0, N'+994 557 455 4799', N'bchilderhouse2f@blogspot.com', CAST(N'1999-02-27' AS Date), N'user.png', N'4 Porter Trail', N'', N'', 1, CAST(N'2020-06-14T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (89, N'hkattenhorn2g', N'nhY9fo', N'Hannis Kattenhorn', 0, N'+7 436 488 9845', N'hkattenhorn2g@vk.com', CAST(N'1987-04-28' AS Date), N'user.png', N'44 Duke Terrace', N'', N'', 1, CAST(N'2022-04-17T00:00:00.000' AS DateTime), 1, 0)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (90, N'chugueville2h', N'QTzgC85eErx', N'Corissa Hugueville', 1, N'+86 940 412 9986', N'chugueville2h@youtu.be', CAST(N'2000-01-10' AS Date), N'user.png', N'42366 Heath Junction', N'', N'', 1, CAST(N'2020-03-29T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (91, N'ifenton2i', N'VKSMIhS', N'Ileana Fenton', 0, N'+1 304 756 0758', N'ifenton2i@google.ru', CAST(N'1996-05-17' AS Date), N'user.png', N'95 School Alley', N'', N'', 1, CAST(N'2020-07-17T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (92, N'swillavoys2j', N'q2XOhuZ4GUD', N'Steward Willavoys', 0, N'+62 741 872 2188', N'swillavoys2j@seesaa.net', CAST(N'2000-04-03' AS Date), N'user.png', N'4 Reindahl Court', N'', N'', 1, CAST(N'2020-10-10T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (93, N'fbouchard2k', N'KPaHZmb', N'Fidelity Bouchard', 0, N'+48 584 716 9293', N'fbouchard2k@cdbaby.com', CAST(N'1991-05-28' AS Date), N'user.png', N'1 Meadow Ridge Alley', N'', N'', 1, CAST(N'2020-02-17T00:00:00.000' AS DateTime), 1, 0)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (94, N'sde2l', N'8TmR09rqCge', N'Shannon De Filippo', 0, N'+976 924 556 8453', N'sde2l@joomla.org', CAST(N'1998-10-23' AS Date), N'user.png', N'61 Center Road', N'', N'', 1, CAST(N'2020-06-29T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (95, N'mlangmaid2m', N'GmDKRlmPkYib', N'Margaret Langmaid', 0, N'+62 641 238 5818', N'mlangmaid2m@sina.com.cn', CAST(N'1980-04-03' AS Date), N'user.png', N'9 Blackbird Pass', N'', N'', 1, CAST(N'2020-06-29T00:00:00.000' AS DateTime), 1, 0)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (96, N'lbarbe2n', N'tUMre46NBxia', N'Larine Barbe', 1, N'+81 960 180 0011', N'lbarbe2n@mail.ru', CAST(N'1990-09-28' AS Date), N'user.png', N'4 Holy Cross Pass', N'', N'', 1, CAST(N'2021-04-10T00:00:00.000' AS DateTime), 1, 0)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (97, N'kwalsh2o', N'LX5G9OYm', N'Korey Walsh', 1, N'+230 151 149 0056', N'kwalsh2o@jimdo.com', CAST(N'1988-07-06' AS Date), N'user.png', N'689 Thierer Terrace', N'', N'', 1, CAST(N'2021-04-29T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (98, N'wmatasov2p', N'5m3DJu', N'Waverly Matasov', 1, N'+55 704 790 5673', N'wmatasov2p@163.com', CAST(N'1992-09-20' AS Date), N'user.png', N'3 Corscot Court', N'', N'', 1, CAST(N'2022-03-21T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (99, N'klisett2q', N'ZyCGsl6C', N'Kellsie Lisett', 0, N'+385 189 110 6916', N'klisett2q@mysql.com', CAST(N'1989-11-10' AS Date), N'user.png', N'77 Bluestem Hill', N'', N'', 1, CAST(N'2021-01-23T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (100, N'xfliege2r', N'y3W99tKAG', N'Xenos Fliege', 1, N'+20 170 169 4753', N'xfliege2r@technorati.com', CAST(N'1982-05-24' AS Date), N'user.png', N'3 Mendota Hill', N'', N'', 1, CAST(N'2020-09-07T00:00:00.000' AS DateTime), 1, 1)
GO
SET IDENTITY_INSERT [dbo].[users] OFF
GO
/****** Object:  Index [UQ__category__47BA2D68D52BDBFF]    Script Date: 12/26/2022 4:47:52 AM ******/
ALTER TABLE [dbo].[category_foods] ADD UNIQUE NONCLUSTERED 
(
	[category_id] ASC,
	[food_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__customer__48E93DBC24093A1F]    Script Date: 12/26/2022 4:47:52 AM ******/
ALTER TABLE [dbo].[customer_coupons] ADD UNIQUE NONCLUSTERED 
(
	[customer_id] ASC,
	[coupon_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__customer__F3DBC5721E2EEC51]    Script Date: 12/26/2022 4:47:52 AM ******/
ALTER TABLE [dbo].[customers] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_customers_email]    Script Date: 12/26/2022 4:47:52 AM ******/
ALTER TABLE [dbo].[customers] ADD  CONSTRAINT [UQ_customers_email] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__food_cou__AAC0BBE1AA14C1D3]    Script Date: 12/26/2022 4:47:52 AM ******/
ALTER TABLE [dbo].[food_coupons] ADD UNIQUE NONCLUSTERED 
(
	[food_id] ASC,
	[coupon_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__images__63756948A4E636A4]    Script Date: 12/26/2022 4:47:52 AM ******/
ALTER TABLE [dbo].[images] ADD UNIQUE NONCLUSTERED 
(
	[image_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__paymentm__72E12F1B8CE2DD10]    Script Date: 12/26/2022 4:47:52 AM ******/
ALTER TABLE [dbo].[paymentmethods] ADD UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__permissi__2C57587618197A31]    Script Date: 12/26/2022 4:47:52 AM ******/
ALTER TABLE [dbo].[permissions] ADD UNIQUE NONCLUSTERED 
(
	[display_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__permissi__72E12F1B80A5670A]    Script Date: 12/26/2022 4:47:52 AM ******/
ALTER TABLE [dbo].[permissions] ADD UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__reviews__639A11611002FC82]    Script Date: 12/26/2022 4:47:52 AM ******/
ALTER TABLE [dbo].[reviews] ADD UNIQUE NONCLUSTERED 
(
	[food_id] ASC,
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__role_per__C85A5462E163C5EC]    Script Date: 12/26/2022 4:47:52 AM ******/
ALTER TABLE [dbo].[role_permissions] ADD UNIQUE NONCLUSTERED 
(
	[role_id] ASC,
	[permission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__roles__2C57587641F0D2FC]    Script Date: 12/26/2022 4:47:52 AM ******/
ALTER TABLE [dbo].[roles] ADD UNIQUE NONCLUSTERED 
(
	[display_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__roles__72E12F1BCA3F41CD]    Script Date: 12/26/2022 4:47:52 AM ******/
ALTER TABLE [dbo].[roles] ADD UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__user_per__07ED06A1293856E1]    Script Date: 12/26/2022 4:47:52 AM ******/
ALTER TABLE [dbo].[user_permissions] ADD UNIQUE NONCLUSTERED 
(
	[user_id] ASC,
	[permission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__user_rol__6EDEA1523A17EA77]    Script Date: 12/26/2022 4:47:52 AM ******/
ALTER TABLE [dbo].[user_roles] ADD UNIQUE NONCLUSTERED 
(
	[user_id] ASC,
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__users__F3DBC572C5623D70]    Script Date: 12/26/2022 4:47:52 AM ******/
ALTER TABLE [dbo].[users] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_email]    Script Date: 12/26/2022 4:47:52 AM ******/
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [UQ_email] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[cart]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[customers] ([id])
GO
ALTER TABLE [dbo].[cart]  WITH CHECK ADD FOREIGN KEY([food_id])
REFERENCES [dbo].[foods] ([id])
GO
ALTER TABLE [dbo].[categories]  WITH CHECK ADD  CONSTRAINT [FK__categorie__creat__440B1D61] FOREIGN KEY([create_by])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[categories] CHECK CONSTRAINT [FK__categorie__creat__440B1D61]
GO
ALTER TABLE [dbo].[category_foods]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[categories] ([id])
GO
ALTER TABLE [dbo].[category_foods]  WITH CHECK ADD FOREIGN KEY([food_id])
REFERENCES [dbo].[foods] ([id])
GO
ALTER TABLE [dbo].[comments]  WITH CHECK ADD FOREIGN KEY([review_id])
REFERENCES [dbo].[reviews] ([id])
GO
ALTER TABLE [dbo].[coupons]  WITH CHECK ADD  CONSTRAINT [FK__coupons__create___72C60C4A] FOREIGN KEY([create_by])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[coupons] CHECK CONSTRAINT [FK__coupons__create___72C60C4A]
GO
ALTER TABLE [dbo].[customer_coupons]  WITH CHECK ADD FOREIGN KEY([coupon_id])
REFERENCES [dbo].[coupons] ([id])
GO
ALTER TABLE [dbo].[customer_coupons]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[customers] ([id])
GO
ALTER TABLE [dbo].[customer_phone_address]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[customers] ([id])
GO
ALTER TABLE [dbo].[discounts]  WITH CHECK ADD  CONSTRAINT [FK__discounts__creat__5070F446] FOREIGN KEY([create_by])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[discounts] CHECK CONSTRAINT [FK__discounts__creat__5070F446]
GO
ALTER TABLE [dbo].[discounts]  WITH CHECK ADD FOREIGN KEY([food_id])
REFERENCES [dbo].[foods] ([id])
GO
ALTER TABLE [dbo].[food_coupons]  WITH CHECK ADD FOREIGN KEY([coupon_id])
REFERENCES [dbo].[coupons] ([id])
GO
ALTER TABLE [dbo].[food_coupons]  WITH CHECK ADD FOREIGN KEY([food_id])
REFERENCES [dbo].[foods] ([id])
GO
ALTER TABLE [dbo].[foods]  WITH CHECK ADD  CONSTRAINT [FK__foods__create_by__412EB0B6] FOREIGN KEY([create_by])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[foods] CHECK CONSTRAINT [FK__foods__create_by__412EB0B6]
GO
ALTER TABLE [dbo].[histories]  WITH CHECK ADD  CONSTRAINT [FK__histories__user___3E52440B] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[histories] CHECK CONSTRAINT [FK__histories__user___3E52440B]
GO
ALTER TABLE [dbo].[images]  WITH CHECK ADD FOREIGN KEY([food_id])
REFERENCES [dbo].[foods] ([id])
GO
ALTER TABLE [dbo].[notifications]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[foods] ([id])
GO
ALTER TABLE [dbo].[order_details]  WITH CHECK ADD FOREIGN KEY([food_id])
REFERENCES [dbo].[foods] ([id])
GO
ALTER TABLE [dbo].[order_details]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([id])
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[customers] ([id])
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([payment_id])
REFERENCES [dbo].[paymentmethods] ([id])
GO
ALTER TABLE [dbo].[reviews]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[customers] ([id])
GO
ALTER TABLE [dbo].[reviews]  WITH CHECK ADD FOREIGN KEY([food_id])
REFERENCES [dbo].[foods] ([id])
GO
ALTER TABLE [dbo].[role_permissions]  WITH CHECK ADD FOREIGN KEY([permission_id])
REFERENCES [dbo].[permissions] ([id])
GO
ALTER TABLE [dbo].[role_permissions]  WITH CHECK ADD FOREIGN KEY([role_id])
REFERENCES [dbo].[roles] ([id])
GO
ALTER TABLE [dbo].[user_permissions]  WITH CHECK ADD FOREIGN KEY([permission_id])
REFERENCES [dbo].[permissions] ([id])
GO
ALTER TABLE [dbo].[user_permissions]  WITH CHECK ADD  CONSTRAINT [FK__user_perm__user___35BCFE0A] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[user_permissions] CHECK CONSTRAINT [FK__user_perm__user___35BCFE0A]
GO
ALTER TABLE [dbo].[user_roles]  WITH CHECK ADD FOREIGN KEY([role_id])
REFERENCES [dbo].[roles] ([id])
GO
ALTER TABLE [dbo].[user_roles]  WITH CHECK ADD  CONSTRAINT [FK__user_role__user___30F848ED] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[user_roles] CHECK CONSTRAINT [FK__user_role__user___30F848ED]
GO
