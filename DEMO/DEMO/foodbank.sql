
USE [Foodbank]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ============================================================
-- Tabla: FoodItems
-- ============================================================
CREATE TABLE [dbo].[FoodItems](
    [FoodItemID]        [int] IDENTITY(1,1) NOT NULL,
    [Name]              [nvarchar](100) NOT NULL,
    [Category]          [nvarchar](50) NULL,
    [Brand]             [nvarchar](50) NULL,
    [Description]       [nvarchar](255) NULL,
    [Price]             [decimal](10, 2) NOT NULL,
    [Unit]              [nvarchar](20) NULL,
    [QuantityInStock]   [int] NULL,
    [ExpirationDate]    [date] NULL,
    [IsPerishable]      [bit] NULL,
    [CaloriesPerServing][int] NULL,
    [Ingredients]       [nvarchar](500) NULL,
    [Barcode]           [nvarchar](50) NULL,
    [Supplier]          [nvarchar](100) NULL,
    [DateAdded]         [datetime] NULL,
    [IsActive]          [bit] NULL,
    [RoleId]            [int] NULL,
    CONSTRAINT [PK_FoodItems] PRIMARY KEY CLUSTERED ([FoodItemID] ASC),
    CONSTRAINT [UQ_FoodItems_Barcode] UNIQUE NONCLUSTERED ([Barcode] ASC)
)
GO

-- ============================================================
-- Tabla: Roles
-- ============================================================
CREATE TABLE [dbo].[Roles](
    [RoleId]      [int] IDENTITY(1,1) NOT NULL,
    [RoleName]    [nvarchar](50) NOT NULL,
    [Description] [nvarchar](255) NULL,
    CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED ([RoleId] ASC),
    CONSTRAINT [UQ_Roles_RoleName] UNIQUE NONCLUSTERED ([RoleName] ASC)
)
GO

-- ============================================================
-- Tabla: Users
-- ============================================================
CREATE TABLE [dbo].[Users](
    [UserId]    [int] IDENTITY(1,1) NOT NULL,
    [Username]  [nvarchar](50) NOT NULL,
    [Email]     [nvarchar](255) NOT NULL,
    [FullName]  [nvarchar](100) NULL,
    [IsActive]  [bit] NOT NULL,
    [CreatedAt] [datetime] NOT NULL,
    [LastLogin] [datetime] NULL,
    CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED ([UserId] ASC),
    CONSTRAINT [UQ_Users_Username] UNIQUE NONCLUSTERED ([Username] ASC),
    CONSTRAINT [UQ_Users_Email] UNIQUE NONCLUSTERED ([Email] ASC)
)
GO

-- ============================================================
-- Tabla: UserRoles
-- ============================================================
CREATE TABLE [dbo].[UserRoles](
    [UserId]      [int] NOT NULL,
    [RoleId]      [int] NOT NULL,
    [Description] [nchar](10) NULL,
    CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED ([UserId] ASC, [RoleId] ASC)
)
GO

-- ============================================================
-- Defaults
-- ============================================================
ALTER TABLE [dbo].[FoodItems] ADD DEFAULT ((0))       FOR [QuantityInStock]
GO
ALTER TABLE [dbo].[FoodItems] ADD DEFAULT ((0))       FOR [IsPerishable]
GO
ALTER TABLE [dbo].[FoodItems] ADD DEFAULT (getdate()) FOR [DateAdded]
GO
ALTER TABLE [dbo].[FoodItems] ADD DEFAULT ((1))       FOR [IsActive]
GO
ALTER TABLE [dbo].[Users] ADD DEFAULT ((1))           FOR [IsActive]
GO
ALTER TABLE [dbo].[Users] ADD DEFAULT (getdate())     FOR [CreatedAt]
GO

-- ============================================================
-- Foreign Keys
-- ============================================================
ALTER TABLE [dbo].[FoodItems]  WITH CHECK ADD FOREIGN KEY([RoleId])  REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD FOREIGN KEY([RoleId])  REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD FOREIGN KEY([UserId])  REFERENCES [dbo].[Users] ([UserId])
GO
