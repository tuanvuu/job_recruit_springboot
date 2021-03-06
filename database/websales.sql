USE [job_recruit]
GO
/****** Object:  Table [dbo].[ApplyDetails]    Script Date: 4/13/2022 8:56:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplyDetails](
    [Id] [int] IDENTITY(1,1) NOT NULL,
    [OrderId] [int] NOT NULL,
    [ProductId] [int] NOT NULL,
    CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED
(
[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]

    GO
/****** Object:  Table [dbo].[Applys]    Script Date: 4/13/2022 8:56:29 AM ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[Applys](
    [Id] [int] IDENTITY(1,1) NOT NULL,
    [Name] [nvarchar](20) NOT NULL,
    [CustomerId] [nvarchar](20) NOT NULL,
    [OrderDate] [datetime] NOT NULL,
    [Address] [nvarchar](60) NOT NULL,
    [Description] [nvarchar](1000) NULL,
    [Status] [int] NULL,
    [Attach] [nvarchar](50) NULL,
    [OrderBy] [nvarchar](20) NULL,
    CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED
(
[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]

    GO
/****** Object:  Table [dbo].[Categories]    Script Date: 4/13/2022 8:56:29 AM ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[Categories](
    [Id] [int] IDENTITY(1,1) NOT NULL,
    [Name] [nvarchar](50) NOT NULL,
    [NameVN] [nvarchar](50) NOT NULL,
    CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED
(
[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]

    GO
/****** Object:  Table [dbo].[Customers]    Script Date: 4/13/2022 8:56:29 AM ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[Customers](
    [Id] [nvarchar](20) NOT NULL,
    [Password] [nvarchar](50) NOT NULL,
    [Fullname] [nvarchar](50) NOT NULL,
    [Email] [nvarchar](50) NOT NULL,
    [Photo] [nvarchar](50) NOT NULL,
    [Activated] [bit] NOT NULL,
    [Admin] [bit] NOT NULL,
    [RoleId] [int] NOT NULL,
    CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED
(
[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]

    GO
/****** Object:  Table [dbo].[Jobs]    Script Date: 4/13/2022 8:56:29 AM ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[Jobs](
    [Id] [int] IDENTITY(1,1) NOT NULL,
    [Name] [nvarchar](max) NOT NULL,
    [Image] [nvarchar](50) NOT NULL,
    [ProductDate] [date] NOT NULL,
    [Available] [bit] NOT NULL,
    [CategoryId] [int] NOT NULL,
    [Description] [nvarchar](max) NULL,
    [ViewCount] [int] NULL,
    [UnitPrice] [float] NULL,
    [Address] [nvarchar](50) NULL,
    [Title] [nvarchar](max) NULL,
    [CreateBy] [nvarchar](20) NOT NULL,
    [Skill] [nvarchar](50) NULL,
    CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED
(
[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

    GO
/****** Object:  Table [dbo].[Roles]    Script Date: 4/13/2022 8:56:29 AM ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[Roles](
    [Id] [int] NOT NULL,
    [Name] [nvarchar](50) NOT NULL,
    CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED
(
[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]

    GO
    SET IDENTITY_INSERT [dbo].[ApplyDetails] ON

    INSERT [dbo].[ApplyDetails] ([Id], [OrderId], [ProductId]) VALUES (1, 1, 2)
    INSERT [dbo].[ApplyDetails] ([Id], [OrderId], [ProductId]) VALUES (2, 2, 2)
    INSERT [dbo].[ApplyDetails] ([Id], [OrderId], [ProductId]) VALUES (3, 3, 2)
    INSERT [dbo].[ApplyDetails] ([Id], [OrderId], [ProductId]) VALUES (4, 4, 2)
    INSERT [dbo].[ApplyDetails] ([Id], [OrderId], [ProductId]) VALUES (5, 5, 6)
    SET IDENTITY_INSERT [dbo].[ApplyDetails] OFF
    SET IDENTITY_INSERT [dbo].[Applys] ON

    INSERT [dbo].[Applys] ([Id], [Name], [CustomerId], [OrderDate], [Address], [Description], [Status], [Attach], [OrderBy]) VALUES (1, N'trịnh tuấn vũ', N'test', CAST(N'2022-04-12 00:00:00.000' AS DateTime), N'bInhf Phước', N's', 1, N'Trinh Tuan Vu _Offer Letter.docx', NULL)
    INSERT [dbo].[Applys] ([Id], [Name], [CustomerId], [OrderDate], [Address], [Description], [Status], [Attach], [OrderBy]) VALUES (2, N'trịnh tuấn vũ', N'test', CAST(N'2022-04-12 00:00:00.000' AS DateTime), N'bInhf Phước', N'', 1, N'TRINH-TUAN-VU-JAVA.pdf', NULL)
    INSERT [dbo].[Applys] ([Id], [Name], [CustomerId], [OrderDate], [Address], [Description], [Status], [Attach], [OrderBy]) VALUES (3, N'Trịnh Tuấn Vũ', N'ungvien1', CAST(N'2022-04-12 00:00:00.000' AS DateTime), N'Hà Nội', N'test sádđss', 2, N'Topup.png', N'test1')
    INSERT [dbo].[Applys] ([Id], [Name], [CustomerId], [OrderDate], [Address], [Description], [Status], [Attach], [OrderBy]) VALUES (4, N'Trịnh Tuấn Vũ', N'ungvien1', CAST(N'2022-04-12 00:00:00.000' AS DateTime), N'Phước Long', N'&nbsp; ádasdasd dsss', 2, N'TRINH-TUAN-VU-JAVA.pdf', N'test1')
    INSERT [dbo].[Applys] ([Id], [Name], [CustomerId], [OrderDate], [Address], [Description], [Status], [Attach], [OrderBy]) VALUES (5, N'Trịnh Tuấn Vũ', N'ungvien1', CAST(N'2022-04-13 00:00:00.000' AS DateTime), N'Quảng Ngãi', N'note xác nhận', 2, N'TRINH-TUAN-VU-JAVA.pdf', N'test1')
    SET IDENTITY_INSERT [dbo].[Applys] OFF
    SET IDENTITY_INSERT [dbo].[Categories] ON

    INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (1, N'Java', N'Java Developer')
    INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (2, N'C#', N'.NET Developer')
    SET IDENTITY_INSERT [dbo].[Categories] OFF
    INSERT [dbo].[Customers] ([Id], [Password], [Fullname], [Email], [Photo], [Activated], [Admin], [RoleId]) VALUES (N'hien123', N'123456', N'Dương Thị Hiền', N'trinhtuanvuu@gmail.com', N'user.png', 1, 0, 1)
    INSERT [dbo].[Customers] ([Id], [Password], [Fullname], [Email], [Photo], [Activated], [Admin], [RoleId]) VALUES (N'recruit_chotot', N'1', N'Tuyển dụng', N'trinhtuanvuu@gmail.com', N'user.png', 1, 1, 1)
    INSERT [dbo].[Customers] ([Id], [Password], [Fullname], [Email], [Photo], [Activated], [Admin], [RoleId]) VALUES (N'test', N'123456', N'trịnh tuấn vũ', N'trinhtuanvuu@gmail.com', N'1.jpg', 1, 1, 0)
    INSERT [dbo].[Customers] ([Id], [Password], [Fullname], [Email], [Photo], [Activated], [Admin], [RoleId]) VALUES (N'test1', N'123456', N'Trịnh Tuấn Vũ', N'trinhtuanvuu@gmail.com', N'user.png', 1, 1, 1)
    INSERT [dbo].[Customers] ([Id], [Password], [Fullname], [Email], [Photo], [Activated], [Admin], [RoleId]) VALUES (N'test2', N'123456', N'Hoàng Thị Tiên', N'trinhtuanvuu@gmail.com', N'user.png', 1, 1, 1)
    INSERT [dbo].[Customers] ([Id], [Password], [Fullname], [Email], [Photo], [Activated], [Admin], [RoleId]) VALUES (N'ungvien1', N'1', N'Trịnh Tuấn Vũ', N'trinhtuanvuu@gmail.com', N'user.png', 1, 0, 2)
    INSERT [dbo].[Customers] ([Id], [Password], [Fullname], [Email], [Photo], [Activated], [Admin], [RoleId]) VALUES (N'ungvien2', N'1', N'ứng viên 2', N'trinhtuanvuu@gmail.com', N'user.png', 1, 0, 2)
    SET IDENTITY_INSERT [dbo].[Jobs] ON

    INSERT [dbo].[Jobs] ([Id], [Name], [Image], [ProductDate], [Available], [CategoryId], [Description], [ViewCount], [UnitPrice], [Address], [Title], [CreateBy], [Skill]) VALUES (2, N'Web Back-End Developer (.Net, .Net Core, Asp.Net , C# - Lương lên đến 35 triệu)', N'2.PNG', CAST(N'2022-04-10' AS Date), 1, 1, N'<div style="margin: 0px; padding: 0px; overflow-wrap: break-word; font-family: &quot;Roboto,Helvetica,Verdana,Arial&quot;, sans-serif; color: rgb(57, 62, 70);"><h2 style="margin: 0px; line-height: 1.2; font-size: 14px; padding: 0px; overflow-wrap: break-word; font-family: &quot;Roboto,Helvetica,Verdana,Arial&quot;, sans-serif !important;"><p style="margin-bottom: 0px; padding: 0px 0px 1em; overflow-wrap: break-word; font-size: 15px; line-height: 26px;"><span style="font-weight: 700;">Trách nhiệm công việc:</span></p></h2><div style="margin: 0px; padding: 0px; overflow-wrap: break-word;"><ul style="padding-left: 2rem; margin-bottom: 1rem;"><li style="text-align: justify;"><span style="font-family: Roboto, Helvetica, Verdana, Arial, sans-serif; font-size: 15px;">Tham gia phát triển các sản phẩm phục vụ cho hàng trăm nghìn khách hàng về các mảng Tài chính kế toán, Điều hành doanh nghiệp, Quản lý bán hàng cũng như eLearning</span></li><li style="text-align: justify;"><span style="font-family: Roboto, Helvetica, Verdana, Arial, sans-serif; font-size: 15px;">Xây dựng và tối ưu sản phẩm đáp ứng hàng trăm nghìn người sử dụng đồng thời</span></li><li style="text-align: justify;"><span style="font-family: Roboto, Helvetica, Verdana, Arial, sans-serif; font-size: 15px;">Tham gia nghiên cứu và ứng dụng các công nghệ mới vào sản phẩm: Blockchain, AI, Machine Learning, BigData, RPA, …</span></li><li style="text-align: justify;"><span style="font-family: Roboto, Helvetica, Verdana, Arial, sans-serif; font-size: 15px;">Phối hợp cùng đội ngũ BA phân tích, thiết kế, đưa ra giải pháp để phát triển phần mềm đáp ứng đúng, đủ, tiện các yêu cầu của người dùng cuối</span></li></ul></div></div><div style="margin: 0px; padding: 0px; overflow-wrap: break-word; font-family: &quot;Roboto,Helvetica,Verdana,Arial&quot;, sans-serif; color: rgb(57, 62, 70);"><h2 style="margin: 0px; line-height: 1.2; font-size: 14px; padding: 0px; overflow-wrap: break-word; font-family: &quot;Roboto,Helvetica,Verdana,Arial&quot;, sans-serif !important;"><p style="margin-bottom: 0px; padding: 0px 0px 1em; overflow-wrap: break-word; font-size: 15px; line-height: 26px;"><span style="font-weight: 700;">Kỹ năng &amp; Chuyên môn:</span></p></h2><div style="margin: 0px; padding: 0px; overflow-wrap: break-word;"><ul style="padding-left: 2rem; margin-bottom: 1rem;"><li style="text-align: justify;"><span style="font-family: Roboto, Helvetica, Verdana, Arial, sans-serif; font-size: 15px;">Tốt nghiệp ĐH/CĐ chuyên ngành CNTT hoặc các chuyên ngành liên quan</span></li><li style="text-align: justify;"><span style="font-family: Roboto, Helvetica, Verdana, Arial, sans-serif; font-size: 15px;">Có tối thiểu 6 tháng kinh nghiệm lập trình .NET trên nền tảng Web</span></li><li style="text-align: justify;"><span style="font-family: Roboto, Helvetica, Verdana, Arial, sans-serif; font-size: 15px;">Thành thạo các kiến thức về .NET Framework hoặc .NET Core (C#, ASP.NET, MVC, ...) Có kinh nghiệm xây dựng các hệ thống sử dụng .NET là lợi thế</span></li><li style="text-align: justify;"><span style="font-family: Roboto, Helvetica, Verdana, Arial, sans-serif; font-size: 15px;">Ưu tiên ứng viện có kinh nghiệm làm việc với Web API</span></li><li style="text-align: justify;"><span style="font-family: Roboto, Helvetica, Verdana, Arial, sans-serif; font-size: 15px;">Có kinh nghiệm với 1 trong các cơ sở dữ liệu SQL Server, MySQL, PostgreSQL. Đã từng làm sản phẩm sử dụng NoSQL: MongoDB, CouchBase, Redis, RabbitMQ, … là lợi thế</span></li><li style="text-align: justify;"><span style="font-family: Roboto, Helvetica, Verdana, Arial, sans-serif; font-size: 15px;">Có kiến thức về OOP, Design Pattern, nguyên lý SOLID, SOA/Micro Service</span></li><li style="text-align: justify;"><span style="font-family: Roboto, Helvetica, Verdana, Arial, sans-serif; font-size: 15px;">Ưu tiên ứng viên thích làm product, tư duy làm sản phẩm cao, sản phẩm hướng người dùng cuối.</span></li><li style="text-align: justify;"><span style="font-family: Roboto, Helvetica, Verdana, Arial, sans-serif; font-size: 15px;">Giao tiếp tốt, chủ động, khả năng làm việc nhóm tốt</span></li></ul></div></div>', 26, 13000000, N'Quận 5, TP HCM', NULL, N'test1', NULL)
    INSERT [dbo].[Jobs] ([Id], [Name], [Image], [ProductDate], [Available], [CategoryId], [Description], [ViewCount], [UnitPrice], [Address], [Title], [CreateBy], [Skill]) VALUES (4, N'IT - Technical Writer (Acting Team Leader)', N'acb.png', CAST(N'2022-04-12' AS Date), 1, 1, N'<div style="margin: 0px; padding: 0px; overflow-wrap: break-word; font-family: &quot;Roboto,Helvetica,Verdana,Arial&quot;, sans-serif; color: rgb(57, 62, 70);"><h2 style="margin: 0px; line-height: 1.2; font-size: 14px; padding: 0px; overflow-wrap: break-word; font-family: &quot;Roboto,Helvetica,Verdana,Arial&quot;, sans-serif !important;"><p style="margin-bottom: 0px; padding: 0px 0px 1em; overflow-wrap: break-word; font-size: 15px; line-height: 26px;"><span style="font-weight: 700;">Trách nhiệm công việc:</span></p></h2><div style="margin: 0px; padding: 0px; overflow-wrap: break-word;"><ul style="padding-left: 2rem; margin-bottom: 1rem;"><li style="text-align: justify;"><span style="font-size: 15px; font-family: Roboto, Helvetica, Verdana, Arial, sans-serif;">Join the IT development team, reporting directly to department&nbsp;manager.</span></li><li style="text-align: justify;"><span style="font-size: 15px; font-family: Roboto, Helvetica, Verdana, Arial, sans-serif;">Manage&nbsp;Technical Writer team</span></li><li style="text-align: justify;"><span style="font-size: 15px; font-family: Roboto, Helvetica, Verdana, Arial, sans-serif;">Plan, develop, organize, write and update documentation/specification needed for software development process</span></li><li style="text-align: justify;"><span style="font-size: 15px; font-family: Roboto, Helvetica, Verdana, Arial, sans-serif;">Participate&nbsp;in scrum team to deliver high quality documentation</span></li><li style="text-align: justify;"><span style="font-size: 15px; font-family: Roboto, Helvetica, Verdana, Arial, sans-serif;">Keep&nbsp;updating latest forms and maintain document versions</span></li><li style="text-align: justify;"><span style="font-size: 15px; font-family: Roboto, Helvetica, Verdana, Arial, sans-serif;">Proactively improve&nbsp;the quality of documentation</span></li><li style="text-align: justify;"><span style="font-size: 15px; font-family: Roboto, Helvetica, Verdana, Arial, sans-serif;">Collaboration with other teams to deliver correct and clear documentation</span></li></ul></div></div><div style="margin: 0px; padding: 0px; overflow-wrap: break-word; font-family: &quot;Roboto,Helvetica,Verdana,Arial&quot;, sans-serif; color: rgb(57, 62, 70);"><h2 style="margin: 0px; line-height: 1.2; font-size: 14px; padding: 0px; overflow-wrap: break-word; font-family: &quot;Roboto,Helvetica,Verdana,Arial&quot;, sans-serif !important;"><p style="margin-bottom: 0px; padding: 0px 0px 1em; overflow-wrap: break-word; font-size: 15px; line-height: 26px;"><span style="font-weight: 700;">Kỹ năng &amp; Chuyên môn:</span></p></h2><div style="margin: 0px; padding: 0px; overflow-wrap: break-word;"><ul style="padding-left: 2rem; margin-bottom: 1rem;"><li style="text-align: justify;"><span style="font-size: 15px; font-family: Roboto, Helvetica, Verdana, Arial, sans-serif;">BS/MS degree in computer science/software engineering/ Linguistics or a related field</span></li><li style="text-align: justify;"><span style="font-size: 15px; font-family: Roboto, Helvetica, Verdana, Arial, sans-serif;">2+ years of experience in leading team</span></li><li style="text-align: justify;"><span style="font-size: 15px; font-family: Roboto, Helvetica, Verdana, Arial, sans-serif;">5+ years of experience in writing software documentation</span></li><li style="text-align: justify;"><span style="font-size: 15px; font-family: Roboto, Helvetica, Verdana, Arial, sans-serif;">Good&nbsp;understanding of software products and release process</span></li><li style="text-align: justify;"><span style="font-size: 15px; font-family: Roboto, Helvetica, Verdana, Arial, sans-serif;">Experience in writing web&nbsp;or mobile documentation</span></li><li style="text-align: justify;"><span style="font-size: 15px; font-family: Roboto, Helvetica, Verdana, Arial, sans-serif;">Understanding of&nbsp;CI/CD&nbsp;software development environments</span></li><li style="text-align: justify;"><span style="font-size: 15px; font-family: Roboto, Helvetica, Verdana, Arial, sans-serif;">Experience in agile development&nbsp;teams, such as Scrum, Kanban</span></li><li style="text-align: justify;"><span style="font-size: 15px; font-family: Roboto, Helvetica, Verdana, Arial, sans-serif;">Interested in dealing&nbsp;with design&nbsp;challenges and keen&nbsp;on&nbsp;exploring new things</span></li><li style="text-align: justify;"><span style="font-size: 15px; font-family: Roboto, Helvetica, Verdana, Arial, sans-serif;">Good&nbsp;problem-solving, reporting skills and teamwork spirit</span></li><li style="text-align: justify;"><span style="font-size: 15px; font-family: Roboto, Helvetica, Verdana, Arial, sans-serif;">Strong communication skills to effectively collaborate with other developers&nbsp;and stakeholders</span></li><li style="text-align: justify;"><span style="font-size: 15px; font-family: Roboto, Helvetica, Verdana, Arial, sans-serif;">Good English communication and writing</span></li><li style="text-align: justify;"><span style="font-family: Roboto, Helvetica, Verdana, Arial, sans-serif; font-size: 15px;">Experience in Confluence, SharePoint, UML is a plus.</span></li></ul></div></div>', 3, 23000000, N'Ho Chi Minh', N'NGÂN HÀNG Á CHÂU (ACB)', N'test1', N'Java SpringBoot,Spring MVC')
    INSERT [dbo].[Jobs] ([Id], [Name], [Image], [ProductDate], [Available], [CategoryId], [Description], [ViewCount], [UnitPrice], [Address], [Title], [CreateBy], [Skill]) VALUES (5, N'Lập trình viên Web ', N'3.png', CAST(N'2022-04-12' AS Date), 1, 2, N'<div style="margin: 0px; padding: 0px; overflow-wrap: break-word; font-family: &quot;Roboto,Helvetica,Verdana,Arial&quot;, sans-serif; color: rgb(57, 62, 70);"><h2 style="margin: 0px; line-height: 1.2; font-size: 14px; padding: 0px; overflow-wrap: break-word; font-family: &quot;Roboto,Helvetica,Verdana,Arial&quot;, sans-serif !important;"><p style="margin-bottom: 0px; padding: 0px 0px 1em; overflow-wrap: break-word; font-size: 15px; line-height: 26px;"><span style="font-weight: 700;">Trách nhiệm công việc:</span></p></h2><div style="margin: 0px; padding: 0px; overflow-wrap: break-word;"><ul style="padding-left: 2rem; margin-bottom: 1rem;"><li style="text-align: justify;"><span style="font-family: Roboto, Helvetica, Verdana, Arial, sans-serif; font-size: 15px;">Tham gia phân tích yêu cầu, làm rõ nghiệp vụ để xây dựng ứng dụng web.</span></li><li style="text-align: justify;"><span style="font-family: Roboto, Helvetica, Verdana, Arial, sans-serif; font-size: 15px;">Thiết kế, phát triển, và unit test ứng dụng.</span></li><li style="text-align: justify;"><span style="font-family: Roboto, Helvetica, Verdana, Arial, sans-serif; font-size: 15px;">Tham gia nghiên cứu giải pháp, công nghệ để phát triển ứng dụng web cho công ty.</span></li></ul></div></div><div style="margin: 0px; padding: 0px; overflow-wrap: break-word; font-family: &quot;Roboto,Helvetica,Verdana,Arial&quot;, sans-serif; color: rgb(57, 62, 70);"><h2 style="margin: 0px; line-height: 1.2; font-size: 14px; padding: 0px; overflow-wrap: break-word; font-family: &quot;Roboto,Helvetica,Verdana,Arial&quot;, sans-serif !important;"><p style="margin-bottom: 0px; padding: 0px 0px 1em; overflow-wrap: break-word; font-size: 15px; line-height: 26px;"><span style="font-weight: 700;">Kỹ năng &amp; Chuyên môn:</span></p></h2><div style="margin: 0px; padding: 0px; overflow-wrap: break-word;"><ul style="padding-left: 2rem; margin-bottom: 1rem;"><li style="text-align: justify;"><span style="font-size: 15px; font-family: Roboto, Helvetica, Verdana, Arial, sans-serif;">Hiểu biết các ngôn ngữ thiết kế Web: Html, Html5, Css3, Bootstrap, Javascript.</span></li><li style="text-align: justify;"><span style="font-size: 15px; font-family: Roboto, Helvetica, Verdana, Arial, sans-serif;">Hiểu biết kiến thức về SQL, lập trình hướng đối tượng.</span></li><li style="text-align: justify;"><span style="font-size: 15px; font-family: Roboto, Helvetica, Verdana, Arial, sans-serif;">Có khả năng làm việc nhóm và làm việc độc lập tốt.</span></li><li style="text-align: justify;"><span style="font-size: 15px; font-family: Roboto, Helvetica, Verdana, Arial, sans-serif;">Có khả năng nghiên cứu, giải quyết vấn đề tốt, có thể chuyển đổi linh hoạt theo yêu cầu dự án.</span></li><li style="text-align: justify;"><span style="font-size: 15px; font-family: Roboto, Helvetica, Verdana, Arial, sans-serif;">Có kinh nghiệm làm việc với framework phát triển ứng dụng web như Laravel, Yii, VueJs, ReactJs, AngularJS… là một lợi thế.</span></li><li style="text-align: justify;"><span style="font-size: 15px; font-family: Roboto, Helvetica, Verdana, Arial, sans-serif;">Chấp nhận sinh viên mới ra trường.</span></li></ul></div></div>', 7, 13000000, N'Hà Nội', N'CÔNG TY TNHH CUNG CẤP GIẢI PHÁP DỊCH VỤ GIÁ TRỊ GIA TĂNG (VIVAS)', N'test2', N'Html, Html5, Css3, Bootstrap, Javascript')
    INSERT [dbo].[Jobs] ([Id], [Name], [Image], [ProductDate], [Available], [CategoryId], [Description], [ViewCount], [UnitPrice], [Address], [Title], [CreateBy], [Skill]) VALUES (6, N'Backend Engineer (Base in Đà Nẵng)', N'chotot.png', CAST(N'2022-04-13' AS Date), 1, 2, N'<div style="margin: 0px; padding: 0px; overflow-wrap: break-word; font-family: &quot;Roboto,Helvetica,Verdana,Arial&quot;, sans-serif; color: rgb(57, 62, 70);"><h2 style="margin: 0px; line-height: 1.2; font-size: 14px; padding: 0px; overflow-wrap: break-word; font-family: &quot;Roboto,Helvetica,Verdana,Arial&quot;, sans-serif !important;"><p style="margin-bottom: 0px; padding: 0px 0px 1em; overflow-wrap: break-word; font-size: 15px; line-height: 26px;"><span style="font-weight: 700;">Trách nhiệm công việc:</span></p></h2><div style="margin: 0px; padding: 0px; overflow-wrap: break-word;"><ul style="padding-left: 2rem; margin-bottom: 1rem;"><li style="text-align: justify;"><span style="font-family: Roboto, Helvetica, Verdana, Arial, sans-serif;">Solve engineering problems to enable a smart Marketplace ecosystem of products and services.</span></li><li style="text-align: justify;"><span style="font-family: Roboto, Helvetica, Verdana, Arial, sans-serif;">Design, Build, Run and improve backend services and framework of creating microservices.</span></li><li style="text-align: justify;"><span style="font-family: Roboto, Helvetica, Verdana, Arial, sans-serif;">Manage individual project priorities, deadlines, and deliverables.</span></li><li style="text-align: justify;"><span style="font-family: Roboto, Helvetica, Verdana, Arial, sans-serif;">Improve engineer efficiency with common libraries, tooling, and platform.</span></li></ul></div></div><div style="margin: 0px; padding: 0px; overflow-wrap: break-word; font-family: &quot;Roboto,Helvetica,Verdana,Arial&quot;, sans-serif; color: rgb(57, 62, 70);"><h2 style="margin: 0px; line-height: 1.2; font-size: 14px; padding: 0px; overflow-wrap: break-word; font-family: &quot;Roboto,Helvetica,Verdana,Arial&quot;, sans-serif !important;"><p style="margin-bottom: 0px; padding: 0px 0px 1em; overflow-wrap: break-word; font-size: 15px; line-height: 26px;"><span style="font-weight: 700;">Kỹ năng &amp; Chuyên môn:</span></p></h2><div style="margin: 0px; padding: 0px; overflow-wrap: break-word;"><ul style="padding-left: 2rem; margin-bottom: 1rem;"><li style="text-align: justify;"><span style="font-family: Roboto, Helvetica, Verdana, Arial, sans-serif; font-size: 15px;">Experience working with one or more from the following: web application development, Unix/Linux environments, distributed systems, machine learning, networking, developing large software systems.</span></li><li style="text-align: justify;"><span style="font-family: Roboto, Helvetica, Verdana, Arial, sans-serif; font-size: 15px;">At least 3 years of experience in Golang or confident that you can pick it up in no time.</span></li><li style="text-align: justify;"><span style="font-family: Roboto, Helvetica, Verdana, Arial, sans-serif; font-size: 15px;">Solid production experience with one or more general-purpose programming languages including but not limited to C/C++, Python, Java, Javascript ES6.</span></li><li style="text-align: justify;"><span style="font-family: Roboto, Helvetica, Verdana, Arial, sans-serif; font-size: 15px;">Experience with two or more data systems but not limited to Postgres, MongoDB, Elasticsearch, Redis, Kafka, Cassandra.</span></li><li style="text-align: justify;"><span style="font-family: Roboto, Helvetica, Verdana, Arial, sans-serif; font-size: 15px;">Experience with Docker, Kubernetes.</span></li><li style="text-align: justify;"><span style="font-family: Roboto, Helvetica, Verdana, Arial, sans-serif; font-size: 15px;">Familiar with Microservices, event-driven architecture.</span></li><li style="text-align: justify;"><span style="font-family: Roboto, Helvetica, Verdana, Arial, sans-serif; font-size: 15px;">BA or MA degree in engineering, computer science, or another technical related field. Or formerly competitive programmer.</span></li><li style="text-align: justify;"><span style="font-family: Roboto, Helvetica, Verdana, Arial, sans-serif; font-size: 15px;">Working proficiency and communication skills in verbal and written English.</span></li></ul></div></div>', 2, 23000000, N'Đà Nẵng', N'Chợ Tốt', N'recruit_chotot', N'Html, Html5, Css3, Bootstrap, Javascript')
    SET IDENTITY_INSERT [dbo].[Jobs] OFF
    INSERT [dbo].[Roles] ([Id], [Name]) VALUES (0, N'Quản trị viên')
    INSERT [dbo].[Roles] ([Id], [Name]) VALUES (1, N'Nhà tuyển dụng')
    INSERT [dbo].[Roles] ([Id], [Name]) VALUES (2, N'Ứng viên')
