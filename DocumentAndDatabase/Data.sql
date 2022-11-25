USE [DATN_FoodStore]
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (6, N'luc', N'123', N'Dương Tấn Lực', 1, N'0394568769', N'luc@fpt.edu.vn', CAST(N'2001-11-30' AS Date), N'luc.jpg', N'Thành phố củ chi', N'123', N'abc', 1, CAST(N'2022-11-14T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (2, N'phuong', N'321', N'Võ Đình Duy Phương', 1, N'0983213138', N'phuong@fpt.edu.vn', CAST(N'2001-08-05' AS Date), N'phuong.jpg', N'Công viên phần mềm quang trung', N'234', N'qwe', 1, CAST(N'2022-11-15T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (3, N'hau', N'234', N'Trần Phúc Hậu', 1, N'0799901243', N'hau@fpt.edu.vn', CAST(N'2001-11-28' AS Date), N'hau.jpg', N'Thành phố tân an ', N'345', N'asd', 1, CAST(N'2022-11-16T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (4, N'tuyen', N'789', N'Nguyễn Thị Thanh Tuyền', 0, N'0381291291', N'tuyen@fpt.edu.vn', CAST(N'2002-05-06' AS Date), N'tuyen.jpg', N'Thành phố bình dương', N'456', N'zxc', 1, CAST(N'2022-11-17T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (5, N'hieu', N'678', N'Dương Minh Hiếu', 1, N'0912821761', N'hieu@fpt.edu.vn', CAST(N'2002-03-12' AS Date), N'hieu.jpg', N'Công viên phần mềm quang trung', N'567', N'rty', 1, CAST(N'2022-11-18T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[users] ([id], [username], [password], [fullname], [gender], [phone], [email], [birthday], [avatar], [address], [remember_token], [code], [status], [create_date], [create_by], [is_display]) VALUES (7, N'quan', N'987', N'Trà Minh Quân', 1, N'0381210121', N'quan@fpt.edu.vn', CAST(N'2002-10-12' AS Date), N'quan.jpg', N'Tòa nhà P quang trung', N'678', N'mnb', 1, CAST(N'2022-11-19T00:00:00.000' AS DateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[users] OFF
GO
SET IDENTITY_INSERT [dbo].[roles] ON 

INSERT [dbo].[roles] ([id], [name], [display_name], [create_date], [create_by], [is_display]) VALUES (1, N'Customers', N'luc', CAST(N'2022-11-14T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[roles] ([id], [name], [display_name], [create_date], [create_by], [is_display]) VALUES (2, N'Directors', N'phuong', CAST(N'2022-11-15T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[roles] ([id], [name], [display_name], [create_date], [create_by], [is_display]) VALUES (3, N'Staffs', N'tuyen', CAST(N'2022-11-16T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[roles] ([id], [name], [display_name], [create_date], [create_by], [is_display]) VALUES (4, N'Views', N'hau', CAST(N'2022-11-17T00:00:00.000' AS DateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[roles] OFF
GO
SET IDENTITY_INSERT [dbo].[user_roles] ON 

INSERT [dbo].[user_roles] ([id], [user_id], [role_id]) VALUES (1, 1, 1)
INSERT [dbo].[user_roles] ([id], [user_id], [role_id]) VALUES (2, 2, 4)
INSERT [dbo].[user_roles] ([id], [user_id], [role_id]) VALUES (3, 3, 2)
INSERT [dbo].[user_roles] ([id], [user_id], [role_id]) VALUES (4, 4, 3)
INSERT [dbo].[user_roles] ([id], [user_id], [role_id]) VALUES (6, 5, 3)
INSERT [dbo].[user_roles] ([id], [user_id], [role_id]) VALUES (5, 5, 4)
SET IDENTITY_INSERT [dbo].[user_roles] OFF
GO
SET IDENTITY_INSERT [dbo].[permissions] ON 

INSERT [dbo].[permissions] ([id], [name], [display_name], [is_display]) VALUES (3, N'Customers', N'luc', 1)
INSERT [dbo].[permissions] ([id], [name], [display_name], [is_display]) VALUES (4, N'Directors', N'phuong', 1)
INSERT [dbo].[permissions] ([id], [name], [display_name], [is_display]) VALUES (5, N'Staffs', N'tuyen', 1)
INSERT [dbo].[permissions] ([id], [name], [display_name], [is_display]) VALUES (6, N'Views', N'hau', 0)
SET IDENTITY_INSERT [dbo].[permissions] OFF
GO
SET IDENTITY_INSERT [dbo].[user_permissions] ON 

INSERT [dbo].[user_permissions] ([id], [user_id], [permission_id]) VALUES (2, 1, 3)
INSERT [dbo].[user_permissions] ([id], [user_id], [permission_id]) VALUES (3, 2, 5)
INSERT [dbo].[user_permissions] ([id], [user_id], [permission_id]) VALUES (4, 3, 4)
INSERT [dbo].[user_permissions] ([id], [user_id], [permission_id]) VALUES (5, 4, 6)
INSERT [dbo].[user_permissions] ([id], [user_id], [permission_id]) VALUES (6, 5, 3)
INSERT [dbo].[user_permissions] ([id], [user_id], [permission_id]) VALUES (8, 7, 5)
SET IDENTITY_INSERT [dbo].[user_permissions] OFF
GO
SET IDENTITY_INSERT [dbo].[role_permissions] ON 

INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id]) VALUES (1, 1, 3)
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id]) VALUES (2, 2, 4)
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id]) VALUES (3, 3, 5)
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id]) VALUES (4, 4, 6)
SET IDENTITY_INSERT [dbo].[role_permissions] OFF
GO
SET IDENTITY_INSERT [dbo].[histories] ON 

INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (1, 1, CAST(N'2022-11-14T00:00:00.000' AS DateTime), 1, N'orders', N'Gọi món')
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (2, 2, CAST(N'2022-11-15T00:00:00.000' AS DateTime), 1, N'foods', N'Thức ăn')
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (3, 3, CAST(N'2022-11-16T00:00:00.000' AS DateTime), 1, N'foods', N'Thức ăn')
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (4, 4, CAST(N'2022-11-17T00:00:00.000' AS DateTime), 1, N'orders', N'Gọi món')
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (5, 5, CAST(N'2022-11-18T00:00:00.000' AS DateTime), 1, N'foods', N'Thức ăn')
INSERT [dbo].[histories] ([id], [user_id], [create_date], [record_id], [table_name], [memo]) VALUES (6, 7, CAST(N'2022-11-19T00:00:00.000' AS DateTime), 1, N'orders', N'Gọi món')
SET IDENTITY_INSERT [dbo].[histories] OFF
GO
SET IDENTITY_INSERT [dbo].[foods] ON 

INSERT [dbo].[foods] ([id], [name], [price], [quantity_limit], [view_count], [description], [create_date], [create_by], [is_display], [status]) VALUES (1, N'Cơm Gà Xối Mỡ', 55000, 100, 25, N'Cơm Gà Xối Mỡ', CAST(N'2022-11-14T00:00:00.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[foods] ([id], [name], [price], [quantity_limit], [view_count], [description], [create_date], [create_by], [is_display], [status]) VALUES (2, N'Bánh Tráng Chấm', 30000, 50, 2, N'Bánh Tráng Chấm', CAST(N'2022-11-15T00:00:00.000' AS DateTime), 1, 1, 2)
INSERT [dbo].[foods] ([id], [name], [price], [quantity_limit], [view_count], [description], [create_date], [create_by], [is_display], [status]) VALUES (3, N'Bánh Mì', 25000, 70, 50, N'Bánh Mì', CAST(N'2022-11-16T00:00:00.000' AS DateTime), 1, 0, 3)
INSERT [dbo].[foods] ([id], [name], [price], [quantity_limit], [view_count], [description], [create_date], [create_by], [is_display], [status]) VALUES (4, N'Cơm Tấm', 45000, 200, 150, N'Cơm Tấm', CAST(N'2022-11-17T00:00:00.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[foods] ([id], [name], [price], [quantity_limit], [view_count], [description], [create_date], [create_by], [is_display], [status]) VALUES (5, N'Trà Sữa Matcha', 34000, 300, 299, N'Trà Sữa Matcha', CAST(N'2022-11-18T00:00:00.000' AS DateTime), 1, 1, 2)
INSERT [dbo].[foods] ([id], [name], [price], [quantity_limit], [view_count], [description], [create_date], [create_by], [is_display], [status]) VALUES (7, N'Bánh Phúc Long', 35000, 500, 200, N'Bánh Phúc Long', CAST(N'2022-11-19T00:00:00.000' AS DateTime), 1, 0, 3)
INSERT [dbo].[foods] ([id], [name], [price], [quantity_limit], [view_count], [description], [create_date], [create_by], [is_display], [status]) VALUES (8, N'Trà Sữa Berry', 60000, 200, 120, N'Trà Sữa Berry', CAST(N'2022-11-20T00:00:00.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[foods] ([id], [name], [price], [quantity_limit], [view_count], [description], [create_date], [create_by], [is_display], [status]) VALUES (9, N'Trà Lài Kem Tuyết', 60000, 300, 100, N'Trà Lài Kem Tuyết', CAST(N'2022-11-21T00:00:00.000' AS DateTime), 1, 1, 2)
INSERT [dbo].[foods] ([id], [name], [price], [quantity_limit], [view_count], [description], [create_date], [create_by], [is_display], [status]) VALUES (10, N'Trà Lài Sữa Coco', 50000, 400, 250, N'Trà Lài Sữa Coco', CAST(N'2022-11-22T00:00:00.000' AS DateTime), 1, 0, 3)
INSERT [dbo].[foods] ([id], [name], [price], [quantity_limit], [view_count], [description], [create_date], [create_by], [is_display], [status]) VALUES (11, N'Trà Lài Hoa Muối', 60000, 100, 79, N'Trà Lài Hoa Muối', CAST(N'2022-11-23T00:00:00.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[foods] ([id], [name], [price], [quantity_limit], [view_count], [description], [create_date], [create_by], [is_display], [status]) VALUES (12, N'Trà Vải Sen', 50000, 500, 390, N'Trà Vải Sen', CAST(N'2022-11-24T00:00:00.000' AS DateTime), 1, 1, 2)
INSERT [dbo].[foods] ([id], [name], [price], [quantity_limit], [view_count], [description], [create_date], [create_by], [is_display], [status]) VALUES (13, N'Trà Nhãn Lài', 50000, 400, 200, N'Trà Nhãn Lài', CAST(N'2022-11-25T00:00:00.000' AS DateTime), 1, 0, 3)
INSERT [dbo].[foods] ([id], [name], [price], [quantity_limit], [view_count], [description], [create_date], [create_by], [is_display], [status]) VALUES (14, N'Trà Thảo Mộc', 50000, 600, 300, N'Trà Thảo Mộc', CAST(N'2022-11-26T00:00:00.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[foods] ([id], [name], [price], [quantity_limit], [view_count], [description], [create_date], [create_by], [is_display], [status]) VALUES (15, N'Mì Trộn Thập Cẩm', 48000, 300, 190, N'Mì Trộn Thập Cẩm', CAST(N'2022-11-27T00:00:00.000' AS DateTime), 1, 1, 2)
INSERT [dbo].[foods] ([id], [name], [price], [quantity_limit], [view_count], [description], [create_date], [create_by], [is_display], [status]) VALUES (16, N'Mì Trộn Gà Mắm Tỏi', 48000, 700, 590, N'Mì Trộn Gà Mắm Tỏi', CAST(N'2022-11-28T00:00:00.000' AS DateTime), 1, 0, 3)
INSERT [dbo].[foods] ([id], [name], [price], [quantity_limit], [view_count], [description], [create_date], [create_by], [is_display], [status]) VALUES (17, N'Mì Trộn Ba Rọi', 40000, 300, 189, N'Mì Trộn Ba Rọi', CAST(N'2022-11-29T00:00:00.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[foods] ([id], [name], [price], [quantity_limit], [view_count], [description], [create_date], [create_by], [is_display], [status]) VALUES (18, N'Nui Xào Bò', 45000, 600, 599, N'Nui Xào Bò', CAST(N'2022-11-30T00:00:00.000' AS DateTime), 1, 1, 2)
INSERT [dbo].[foods] ([id], [name], [price], [quantity_limit], [view_count], [description], [create_date], [create_by], [is_display], [status]) VALUES (19, N'Nui Xào Hải Sản', 55000, 100, 89, N'Nui Xào Hải Sản', CAST(N'2022-11-01T00:00:00.000' AS DateTime), 1, 0, 3)
INSERT [dbo].[foods] ([id], [name], [price], [quantity_limit], [view_count], [description], [create_date], [create_by], [is_display], [status]) VALUES (20, N'Nui Xào Thập Cẩm', 85000, 500, 349, N'Nui Xào Thập Cẩm', CAST(N'2022-11-02T00:00:00.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[foods] ([id], [name], [price], [quantity_limit], [view_count], [description], [create_date], [create_by], [is_display], [status]) VALUES (21, N'Hủ Tiếu Xào ', 60000, 400, 200, N'Hủ Tiếu Xào ', CAST(N'2022-11-03T00:00:00.000' AS DateTime), 1, 1, 2)
INSERT [dbo].[foods] ([id], [name], [price], [quantity_limit], [view_count], [description], [create_date], [create_by], [is_display], [status]) VALUES (22, N'Hủ Tiếu Nam Vang', 85000, 900, 590, N'Hủ Tiếu Nam Vang', CAST(N'2022-11-04T00:00:00.000' AS DateTime), 1, 0, 3)
SET IDENTITY_INSERT [dbo].[foods] OFF
GO
SET IDENTITY_INSERT [dbo].[categories] ON 

INSERT [dbo].[categories] ([id], [name], [display_name], [description], [image_name], [color], [create_date], [create_by], [is_display], [type]) VALUES (1, N'doan', N'Đồ Ăn', N'ĐỒ ĂN', N'doan.jpg', N'Black', CAST(N'2022-11-14T00:00:00.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[categories] ([id], [name], [display_name], [description], [image_name], [color], [create_date], [create_by], [is_display], [type]) VALUES (2, N'douong', N'Đồ Uống', N'ĐỒ UỐNG', N'douong.jpg', N'White', CAST(N'2022-11-15T00:00:00.000' AS DateTime), 2, 1, 2)
INSERT [dbo].[categories] ([id], [name], [display_name], [description], [image_name], [color], [create_date], [create_by], [is_display], [type]) VALUES (3, N'dochay', N'Đồ Chay', N'ĐỒ CHAY', N'dochay.jpg', N'Red', CAST(N'2022-11-16T00:00:00.000' AS DateTime), 3, 0, 3)
INSERT [dbo].[categories] ([id], [name], [display_name], [description], [image_name], [color], [create_date], [create_by], [is_display], [type]) VALUES (4, N'banhkem', N'Bánh Kem', N'BÁNH KEM', N'banhkem.jpg', N'Yellow', CAST(N'2022-11-17T00:00:00.000' AS DateTime), 4, 1, 1)
INSERT [dbo].[categories] ([id], [name], [display_name], [description], [image_name], [color], [create_date], [create_by], [is_display], [type]) VALUES (5, N'trangmieng', N'Tráng Miệng', N'TRÁNG MIỆNG', N'trangmieng.jpg', N'Brown', CAST(N'2022-11-18T00:00:00.000' AS DateTime), 5, 1, 2)
INSERT [dbo].[categories] ([id], [name], [display_name], [description], [image_name], [color], [create_date], [create_by], [is_display], [type]) VALUES (6, N'monga', N'Món Gà', N'MÓN GÀ', N'monga.jpg', N'Orange', CAST(N'2022-11-19T00:00:00.000' AS DateTime), 7, 0, 3)
INSERT [dbo].[categories] ([id], [name], [display_name], [description], [image_name], [color], [create_date], [create_by], [is_display], [type]) VALUES (7, N'monlau', N'Món Lẩu', N'MÓN LẨU', N'monlau.jpg', N'Pink', CAST(N'2022-11-20T00:00:00.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[categories] ([id], [name], [display_name], [description], [image_name], [color], [create_date], [create_by], [is_display], [type]) VALUES (8, N'mipho', N'Mì Phở', N'MÌ PHỞ', N'mipho.jpg', N'Blue', CAST(N'2022-11-21T00:00:00.000' AS DateTime), 3, 1, 2)
INSERT [dbo].[categories] ([id], [name], [display_name], [description], [image_name], [color], [create_date], [create_by], [is_display], [type]) VALUES (9, N'comhop', N'Cơm Hộp', N'CƠM HỘP', N'comhop.jpg', N'Green', CAST(N'2022-11-22T00:00:00.000' AS DateTime), 5, 0, 3)
SET IDENTITY_INSERT [dbo].[categories] OFF
GO
SET IDENTITY_INSERT [dbo].[category_foods] ON 

INSERT [dbo].[category_foods] ([id], [category_id], [food_id]) VALUES (19, 1, 5)
INSERT [dbo].[category_foods] ([id], [category_id], [food_id]) VALUES (1, 1, 22)
INSERT [dbo].[category_foods] ([id], [category_id], [food_id]) VALUES (17, 2, 7)
INSERT [dbo].[category_foods] ([id], [category_id], [food_id]) VALUES (2, 2, 21)
INSERT [dbo].[category_foods] ([id], [category_id], [food_id]) VALUES (20, 3, 4)
INSERT [dbo].[category_foods] ([id], [category_id], [food_id]) VALUES (16, 3, 8)
INSERT [dbo].[category_foods] ([id], [category_id], [food_id]) VALUES (3, 3, 20)
INSERT [dbo].[category_foods] ([id], [category_id], [food_id]) VALUES (15, 4, 9)
INSERT [dbo].[category_foods] ([id], [category_id], [food_id]) VALUES (4, 4, 19)
INSERT [dbo].[category_foods] ([id], [category_id], [food_id]) VALUES (21, 5, 3)
INSERT [dbo].[category_foods] ([id], [category_id], [food_id]) VALUES (14, 5, 10)
INSERT [dbo].[category_foods] ([id], [category_id], [food_id]) VALUES (5, 5, 18)
INSERT [dbo].[category_foods] ([id], [category_id], [food_id]) VALUES (13, 6, 11)
INSERT [dbo].[category_foods] ([id], [category_id], [food_id]) VALUES (6, 6, 17)
INSERT [dbo].[category_foods] ([id], [category_id], [food_id]) VALUES (22, 7, 2)
INSERT [dbo].[category_foods] ([id], [category_id], [food_id]) VALUES (12, 7, 12)
INSERT [dbo].[category_foods] ([id], [category_id], [food_id]) VALUES (7, 7, 16)
INSERT [dbo].[category_foods] ([id], [category_id], [food_id]) VALUES (11, 8, 13)
INSERT [dbo].[category_foods] ([id], [category_id], [food_id]) VALUES (8, 8, 15)
INSERT [dbo].[category_foods] ([id], [category_id], [food_id]) VALUES (23, 9, 1)
INSERT [dbo].[category_foods] ([id], [category_id], [food_id]) VALUES (9, 9, 14)
SET IDENTITY_INSERT [dbo].[category_foods] OFF
GO
SET IDENTITY_INSERT [dbo].[images] ON 

INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (1, 1, N'comga.jpg')
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (2, 2, N'banhtrang.jpg')
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (3, 3, N'banhmi.jpg')
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (4, 4, N'comtam.jpg')
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (5, 5, N'trasuamatcha.jpg')
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (7, 7, N'banhphuclong.jpg')
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (8, 8, N'trasuaberry.jpg')
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (9, 9, N'tralaikemtuyet.jpg')
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (10, 10, N'tralaisuacoco.jpg')
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (11, 11, N'tralaihoamuoi.jpg')
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (12, 12, N'travaisen.jpg')
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (13, 13, N'tranhanlai.jpg')
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (14, 14, N'trathaomoc.jpg')
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (15, 15, N'mithapcam.jpg')
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (16, 16, N'migamamtoi.jpg')
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (17, 17, N'mibaroi.jpg')
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (18, 18, N'nuixaobo.jpg')
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (19, 19, N'nuixaohaisan.jpg')
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (20, 20, N'nuixaothapcam.jpg')
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (21, 21, N'hutieuxao.jpg')
INSERT [dbo].[images] ([id], [food_id], [image_name]) VALUES (22, 22, N'hutieunamvang.jpg')
SET IDENTITY_INSERT [dbo].[images] OFF
GO
SET IDENTITY_INSERT [dbo].[discounts] ON 

INSERT [dbo].[discounts] ([id], [food_id], [name], [amount], [is_fixed], [start_date], [end_date], [create_date], [create_by], [is_display]) VALUES (1, 1, N'Cơm Gà Xối Mỡ', 100, 1, CAST(N'2022-11-15T00:00:00.000' AS DateTime), CAST(N'2022-12-15T00:00:00.000' AS DateTime), CAST(N'2022-11-14T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[discounts] ([id], [food_id], [name], [amount], [is_fixed], [start_date], [end_date], [create_date], [create_by], [is_display]) VALUES (2, 2, N'Bánh Tráng Chấm', 50, 1, CAST(N'2022-11-16T00:00:00.000' AS DateTime), CAST(N'2022-12-16T00:00:00.000' AS DateTime), CAST(N'2022-11-15T00:00:00.000' AS DateTime), 2, 1)
INSERT [dbo].[discounts] ([id], [food_id], [name], [amount], [is_fixed], [start_date], [end_date], [create_date], [create_by], [is_display]) VALUES (3, 3, N'Bánh Mì', 70, 0, CAST(N'2022-11-17T00:00:00.000' AS DateTime), CAST(N'2022-12-17T00:00:00.000' AS DateTime), CAST(N'2022-11-16T00:00:00.000' AS DateTime), 3, 0)
INSERT [dbo].[discounts] ([id], [food_id], [name], [amount], [is_fixed], [start_date], [end_date], [create_date], [create_by], [is_display]) VALUES (4, 4, N'Cơm Tấm', 200, 1, CAST(N'2022-11-18T00:00:00.000' AS DateTime), CAST(N'2022-12-18T00:00:00.000' AS DateTime), CAST(N'2022-11-17T00:00:00.000' AS DateTime), 4, 1)
INSERT [dbo].[discounts] ([id], [food_id], [name], [amount], [is_fixed], [start_date], [end_date], [create_date], [create_by], [is_display]) VALUES (5, 5, N'Trà Sữa Matcha', 300, 1, CAST(N'2022-11-19T00:00:00.000' AS DateTime), CAST(N'2022-12-19T00:00:00.000' AS DateTime), CAST(N'2022-11-18T00:00:00.000' AS DateTime), 5, 1)
INSERT [dbo].[discounts] ([id], [food_id], [name], [amount], [is_fixed], [start_date], [end_date], [create_date], [create_by], [is_display]) VALUES (8, 7, N'Bánh Phúc Long', 500, 0, CAST(N'2022-11-20T00:00:00.000' AS DateTime), CAST(N'2022-12-20T00:00:00.000' AS DateTime), CAST(N'2022-11-19T00:00:00.000' AS DateTime), 7, 0)
INSERT [dbo].[discounts] ([id], [food_id], [name], [amount], [is_fixed], [start_date], [end_date], [create_date], [create_by], [is_display]) VALUES (10, 8, N'Trà Sữa Berry', 200, 1, CAST(N'2022-11-21T00:00:00.000' AS DateTime), CAST(N'2022-12-21T00:00:00.000' AS DateTime), CAST(N'2022-11-20T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[discounts] ([id], [food_id], [name], [amount], [is_fixed], [start_date], [end_date], [create_date], [create_by], [is_display]) VALUES (11, 9, N'Trà Lài Kem Tuyết', 300, 1, CAST(N'2022-11-22T00:00:00.000' AS DateTime), CAST(N'2022-12-22T00:00:00.000' AS DateTime), CAST(N'2022-11-21T00:00:00.000' AS DateTime), 2, 1)
INSERT [dbo].[discounts] ([id], [food_id], [name], [amount], [is_fixed], [start_date], [end_date], [create_date], [create_by], [is_display]) VALUES (12, 10, N'Trà Lài Sữa Coco', 400, 0, CAST(N'2022-11-23T00:00:00.000' AS DateTime), CAST(N'2022-12-23T00:00:00.000' AS DateTime), CAST(N'2022-11-22T00:00:00.000' AS DateTime), 3, 0)
INSERT [dbo].[discounts] ([id], [food_id], [name], [amount], [is_fixed], [start_date], [end_date], [create_date], [create_by], [is_display]) VALUES (13, 11, N'Trà Lài Hoa Muối', 100, 1, CAST(N'2022-11-24T00:00:00.000' AS DateTime), CAST(N'2022-12-24T00:00:00.000' AS DateTime), CAST(N'2022-11-23T00:00:00.000' AS DateTime), 4, 1)
INSERT [dbo].[discounts] ([id], [food_id], [name], [amount], [is_fixed], [start_date], [end_date], [create_date], [create_by], [is_display]) VALUES (14, 12, N'Trà Vải Sen', 500, 1, CAST(N'2022-11-25T00:00:00.000' AS DateTime), CAST(N'2022-12-25T00:00:00.000' AS DateTime), CAST(N'2022-11-24T00:00:00.000' AS DateTime), 5, 1)
INSERT [dbo].[discounts] ([id], [food_id], [name], [amount], [is_fixed], [start_date], [end_date], [create_date], [create_by], [is_display]) VALUES (15, 13, N'Trà Nhãn Lài', 400, 0, CAST(N'2022-11-26T00:00:00.000' AS DateTime), CAST(N'2022-12-26T00:00:00.000' AS DateTime), CAST(N'2022-11-25T00:00:00.000' AS DateTime), 7, 0)
INSERT [dbo].[discounts] ([id], [food_id], [name], [amount], [is_fixed], [start_date], [end_date], [create_date], [create_by], [is_display]) VALUES (16, 14, N'Trà Thảo Mộc', 600, 1, CAST(N'2022-11-27T00:00:00.000' AS DateTime), CAST(N'2022-12-27T00:00:00.000' AS DateTime), CAST(N'2022-11-26T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[discounts] ([id], [food_id], [name], [amount], [is_fixed], [start_date], [end_date], [create_date], [create_by], [is_display]) VALUES (17, 15, N'Mì Trộn Thập Cẩm', 300, 1, CAST(N'2022-11-28T00:00:00.000' AS DateTime), CAST(N'2022-12-28T00:00:00.000' AS DateTime), CAST(N'2022-11-27T00:00:00.000' AS DateTime), 2, 1)
INSERT [dbo].[discounts] ([id], [food_id], [name], [amount], [is_fixed], [start_date], [end_date], [create_date], [create_by], [is_display]) VALUES (19, 16, N'Mì Trộn Gà Mắm Tỏi', 700, 0, CAST(N'2022-11-29T00:00:00.000' AS DateTime), CAST(N'2022-12-29T00:00:00.000' AS DateTime), CAST(N'2022-11-28T00:00:00.000' AS DateTime), 3, 0)
INSERT [dbo].[discounts] ([id], [food_id], [name], [amount], [is_fixed], [start_date], [end_date], [create_date], [create_by], [is_display]) VALUES (20, 17, N'Mì Trộn Ba Rọi', 300, 1, CAST(N'2022-11-30T00:00:00.000' AS DateTime), CAST(N'2022-12-30T00:00:00.000' AS DateTime), CAST(N'2022-11-29T00:00:00.000' AS DateTime), 4, 1)
INSERT [dbo].[discounts] ([id], [food_id], [name], [amount], [is_fixed], [start_date], [end_date], [create_date], [create_by], [is_display]) VALUES (22, 18, N'Nui Xào Bò', 600, 1, CAST(N'2022-11-02T00:00:00.000' AS DateTime), CAST(N'2022-12-02T00:00:00.000' AS DateTime), CAST(N'2022-11-01T00:00:00.000' AS DateTime), 5, 1)
INSERT [dbo].[discounts] ([id], [food_id], [name], [amount], [is_fixed], [start_date], [end_date], [create_date], [create_by], [is_display]) VALUES (23, 19, N'Nui Xào Hải Sản', 100, 0, CAST(N'2022-11-03T00:00:00.000' AS DateTime), CAST(N'2022-12-03T00:00:00.000' AS DateTime), CAST(N'2022-11-02T00:00:00.000' AS DateTime), 7, 0)
INSERT [dbo].[discounts] ([id], [food_id], [name], [amount], [is_fixed], [start_date], [end_date], [create_date], [create_by], [is_display]) VALUES (24, 20, N'Nui Xào Thập Cẩm', 500, 1, CAST(N'2022-11-04T00:00:00.000' AS DateTime), CAST(N'2022-12-04T00:00:00.000' AS DateTime), CAST(N'2022-11-03T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[discounts] ([id], [food_id], [name], [amount], [is_fixed], [start_date], [end_date], [create_date], [create_by], [is_display]) VALUES (25, 21, N'Hủ Tiếu Xào ', 400, 1, CAST(N'2022-11-05T00:00:00.000' AS DateTime), CAST(N'2022-12-05T00:00:00.000' AS DateTime), CAST(N'2022-11-04T00:00:00.000' AS DateTime), 2, 1)
INSERT [dbo].[discounts] ([id], [food_id], [name], [amount], [is_fixed], [start_date], [end_date], [create_date], [create_by], [is_display]) VALUES (26, 22, N'Hủ Tiếu Nam Vang', 900, 0, CAST(N'2022-11-06T00:00:00.000' AS DateTime), CAST(N'2022-12-06T00:00:00.000' AS DateTime), CAST(N'2022-11-05T00:00:00.000' AS DateTime), 3, 0)
SET IDENTITY_INSERT [dbo].[discounts] OFF
GO
SET IDENTITY_INSERT [dbo].[customers] ON 

INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (1, N'lam', N'123', N'Đặng Văn Lâm', 1, N'lam@fpt.edu.vn', CAST(N'2001-12-01T00:00:00.000' AS DateTime), N'lam.jpg', N'123', N'qwe', 1, CAST(N'2022-11-15T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (5, N'trong', N'321', N'Trần Đình Trọng', 1, N'trong@fpt.edu.vn', CAST(N'2001-12-02T00:00:00.000' AS DateTime), N'trong.jpg', N'234', N'rty', 1, CAST(N'2022-11-16T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (6, N'thanh', N'345', N'Vũ Văn Thanh', 1, N'thanh@fpt.edu.vn', CAST(N'2001-12-03T00:00:00.000' AS DateTime), N'thanh.jpg', N'345', N'uio', 1, CAST(N'2022-11-17T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (7, N'hai', N'456', N'Quế Ngọc Hải ', 1, N'hai@fpt.edu.vn', CAST(N'2001-12-04T00:00:00.000' AS DateTime), N'hai.jpg', N'456', N'asd', 1, CAST(N'2022-11-18T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (8, N'dung', N'131', N'Bùi Tiến Dũng', 1, N'dung@fpt.edu.vn', CAST(N'2001-12-05T00:00:00.000' AS DateTime), N'dung.jpg', N'567', N'fgh', 1, CAST(N'2022-11-19T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (9, N'duc', N'567', N'Nguyễn Hoàng Đức', 1, N'duc@fpt.edu.vn', CAST(N'2001-12-06T00:00:00.000' AS DateTime), N'duc.jpg', N'678', N'jkl', 1, CAST(N'2022-11-20T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (10, N'truong', N'681', N'Lương Xuân Trường', 1, N'truong@fpt.edu.vn', CAST(N'2001-12-07T00:00:00.000' AS DateTime), N'truong.jpg', N'789', N'zxc', 1, CAST(N'2022-11-21T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (11, N'anh', N'132', N'Nguyễn Tuấn Anh ', 1, N'anh@fpt.edu.vn', CAST(N'2001-12-08T00:00:00.000' AS DateTime), N'anh.jpg', N'987', N'vbn', 1, CAST(N'2022-11-22T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (12, N'linh', N'156', N'Nguyễn Tiến Linh', 1, N'linh@fpt.edu.vn', CAST(N'2001-12-09T00:00:00.000' AS DateTime), N'linh.jpg', N'876', N'mlp', 1, CAST(N'2022-11-23T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [gender], [email], [birthday], [avatar], [remember_token], [code], [status], [create_date], [is_display]) VALUES (13, N'toan', N'125', N'Nguyễn Văn Toàn ', 1, N'toan@fpt.edu.vn', CAST(N'2001-12-10T00:00:00.000' AS DateTime), N'toan.jpg', N'765', N'nko', 1, CAST(N'2022-11-24T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[customers] OFF
GO
SET IDENTITY_INSERT [dbo].[customer_phone_address] ON 

INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (1, 1, 1, N'0799901232', 0)
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (2, 5, 0, N'0891287128', 0)
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (3, 6, 0, N'0931239183', 1)
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (4, 7, 1, N'0712991291', 1)
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (5, 8, 1, N'0921387321', 0)
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (6, 9, 0, N'0931123131', 0)
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (7, 10, 0, N'0931123913', 1)
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (8, 11, 1, N'0982882191', 1)
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (9, 12, 1, N'0781298219', 0)
INSERT [dbo].[customer_phone_address] ([id], [customer_id], [is_address], [phone_or_address], [is_default]) VALUES (10, 13, 0, N'0301291221', 1)
SET IDENTITY_INSERT [dbo].[customer_phone_address] OFF
GO
SET IDENTITY_INSERT [dbo].[reviews] ON 

INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (1, 22, 1, 5, 19, CAST(N'2022-11-01T00:00:00.000' AS DateTime), CAST(N'2022-11-02T00:00:00.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (2, 21, 5, 4, 4, CAST(N'2022-11-02T00:00:00.000' AS DateTime), CAST(N'2022-11-03T00:00:00.000' AS DateTime), 2, 1, 1)
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (3, 20, 6, 3, 2, CAST(N'2022-11-03T00:00:00.000' AS DateTime), CAST(N'2022-11-04T00:00:00.000' AS DateTime), 1, 0, 0)
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (4, 19, 7, 5, 29, CAST(N'2022-11-04T00:00:00.000' AS DateTime), CAST(N'2022-11-05T00:00:00.000' AS DateTime), 2, 1, 1)
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (5, 18, 8, 4, 12, CAST(N'2022-11-05T00:00:00.000' AS DateTime), CAST(N'2022-11-06T00:00:00.000' AS DateTime), 1, 1, 0)
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (6, 17, 9, 3, 10, CAST(N'2022-11-06T00:00:00.000' AS DateTime), CAST(N'2022-11-07T00:00:00.000' AS DateTime), 2, 1, 1)
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (7, 16, 10, 5, 40, CAST(N'2022-11-07T00:00:00.000' AS DateTime), CAST(N'2022-11-08T00:00:00.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (8, 15, 12, 4, 30, CAST(N'2022-11-08T00:00:00.000' AS DateTime), CAST(N'2022-11-09T00:00:00.000' AS DateTime), 2, 1, 1)
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (9, 14, 13, 3, 19, CAST(N'2022-11-09T00:00:00.000' AS DateTime), CAST(N'2022-11-10T00:00:00.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (10, 13, 11, 5, 89, CAST(N'2022-11-10T00:00:00.000' AS DateTime), CAST(N'2022-11-11T00:00:00.000' AS DateTime), 2, 1, 1)
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (11, 12, 13, 4, 46, CAST(N'2022-11-11T00:00:00.000' AS DateTime), CAST(N'2022-11-12T00:00:00.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (12, 11, 12, 3, 89, CAST(N'2022-11-12T00:00:00.000' AS DateTime), CAST(N'2022-11-13T00:00:00.000' AS DateTime), 2, 1, 1)
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (13, 10, 11, 5, 67, CAST(N'2022-11-13T00:00:00.000' AS DateTime), CAST(N'2022-11-14T00:00:00.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (14, 9, 10, 4, 56, CAST(N'2022-11-14T00:00:00.000' AS DateTime), CAST(N'2022-11-15T00:00:00.000' AS DateTime), 2, 1, 1)
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (15, 8, 9, 3, 44, CAST(N'2022-11-15T00:00:00.000' AS DateTime), CAST(N'2022-11-16T00:00:00.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (16, 7, 8, 5, 90, CAST(N'2022-11-16T00:00:00.000' AS DateTime), CAST(N'2022-11-17T00:00:00.000' AS DateTime), 2, 1, 1)
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (18, 5, 7, 3, 23, CAST(N'2022-11-17T00:00:00.000' AS DateTime), CAST(N'2022-11-18T00:00:00.000' AS DateTime), 1, 0, 0)
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (19, 4, 6, 4, 78, CAST(N'2022-11-18T00:00:00.000' AS DateTime), CAST(N'2022-11-19T00:00:00.000' AS DateTime), 2, 1, 1)
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (20, 3, 5, 5, 87, CAST(N'2022-11-19T00:00:00.000' AS DateTime), CAST(N'2022-11-20T00:00:00.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (21, 2, 1, 5, 123, CAST(N'2022-11-20T00:00:00.000' AS DateTime), CAST(N'2022-11-21T00:00:00.000' AS DateTime), 2, 1, 1)
INSERT [dbo].[reviews] ([id], [food_id], [customer_id], [rating], [views], [create_date], [update_date], [status], [is_favorite], [is_display]) VALUES (22, 1, 11, 5, 321, CAST(N'2022-11-21T00:00:00.000' AS DateTime), CAST(N'2022-11-22T00:00:00.000' AS DateTime), 2, 1, 1)
SET IDENTITY_INSERT [dbo].[reviews] OFF
GO
SET IDENTITY_INSERT [dbo].[cart] ON 

INSERT [dbo].[cart] ([id], [food_id], [customer_id], [quantity]) VALUES (1, 1, 1, 5)
INSERT [dbo].[cart] ([id], [food_id], [customer_id], [quantity]) VALUES (2, 2, 5, 4)
INSERT [dbo].[cart] ([id], [food_id], [customer_id], [quantity]) VALUES (3, 3, 6, 3)
INSERT [dbo].[cart] ([id], [food_id], [customer_id], [quantity]) VALUES (4, 4, 7, 2)
INSERT [dbo].[cart] ([id], [food_id], [customer_id], [quantity]) VALUES (5, 5, 8, 1)
INSERT [dbo].[cart] ([id], [food_id], [customer_id], [quantity]) VALUES (8, 7, 9, 5)
INSERT [dbo].[cart] ([id], [food_id], [customer_id], [quantity]) VALUES (9, 8, 10, 4)
INSERT [dbo].[cart] ([id], [food_id], [customer_id], [quantity]) VALUES (10, 9, 11, 3)
INSERT [dbo].[cart] ([id], [food_id], [customer_id], [quantity]) VALUES (11, 10, 12, 2)
INSERT [dbo].[cart] ([id], [food_id], [customer_id], [quantity]) VALUES (12, 11, 13, 1)
INSERT [dbo].[cart] ([id], [food_id], [customer_id], [quantity]) VALUES (13, 12, 11, 1)
INSERT [dbo].[cart] ([id], [food_id], [customer_id], [quantity]) VALUES (14, 13, 9, 2)
INSERT [dbo].[cart] ([id], [food_id], [customer_id], [quantity]) VALUES (15, 14, 7, 3)
INSERT [dbo].[cart] ([id], [food_id], [customer_id], [quantity]) VALUES (16, 15, 5, 4)
INSERT [dbo].[cart] ([id], [food_id], [customer_id], [quantity]) VALUES (18, 16, 1, 5)
INSERT [dbo].[cart] ([id], [food_id], [customer_id], [quantity]) VALUES (19, 17, 6, 1)
INSERT [dbo].[cart] ([id], [food_id], [customer_id], [quantity]) VALUES (20, 18, 8, 2)
INSERT [dbo].[cart] ([id], [food_id], [customer_id], [quantity]) VALUES (21, 19, 10, 3)
INSERT [dbo].[cart] ([id], [food_id], [customer_id], [quantity]) VALUES (22, 20, 12, 4)
INSERT [dbo].[cart] ([id], [food_id], [customer_id], [quantity]) VALUES (23, 21, 13, 5)
INSERT [dbo].[cart] ([id], [food_id], [customer_id], [quantity]) VALUES (24, 22, 1, 5)
SET IDENTITY_INSERT [dbo].[cart] OFF
GO
SET IDENTITY_INSERT [dbo].[comments] ON 

INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (2, 1, N'Bình luận', N'Shop giao hàng nhanh', CAST(N'2022-12-01T00:00:00.000' AS DateTime), CAST(N'2022-12-02T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (5, 2, N'Bình luận', N'Hàng chuẩn ảnh', CAST(N'2022-12-02T00:00:00.000' AS DateTime), CAST(N'2022-12-03T00:00:00.000' AS DateTime), 2, 1)
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (6, 3, N'Bình luận', N'Đã mua rất nhiều lần giao hàng nhanh', CAST(N'2022-12-03T00:00:00.000' AS DateTime), CAST(N'2022-12-04T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (7, 4, N'Bình luận', N'Giao hàng nhanh đóng gói cẩn thận', CAST(N'2022-12-04T00:00:00.000' AS DateTime), CAST(N'2022-12-05T00:00:00.000' AS DateTime), 2, 1)
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (8, 5, N'Bình luận', N'Mua của shop nhiều rồi mỗi lần mua toàn 5 món', CAST(N'2022-12-05T00:00:00.000' AS DateTime), CAST(N'2022-12-06T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (9, 6, N'Bình luận', N'Mua lần thứ hai rồi con nhà mình rất thích ăn', CAST(N'2022-12-06T00:00:00.000' AS DateTime), CAST(N'2022-12-07T00:00:00.000' AS DateTime), 2, 1)
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (11, 7, N'Bình luận', N'Shop giao hàng nhanh', CAST(N'2022-12-07T00:00:00.000' AS DateTime), CAST(N'2022-12-08T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (12, 8, N'Bình luận', N'Hàng chuẩn ảnh', CAST(N'2022-12-08T00:00:00.000' AS DateTime), CAST(N'2022-12-09T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (13, 9, N'Bình luận', N'Đã mua rất nhiều lần giao hàng nhanh', CAST(N'2022-12-09T00:00:00.000' AS DateTime), CAST(N'2022-12-10T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (14, 10, N'Bình luận', N'Giao hàng nhanh đóng gói cẩn thận', CAST(N'2022-12-10T00:00:00.000' AS DateTime), CAST(N'2022-12-11T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (16, 11, N'Bình luận', N'Mua của shop nhiều rồi mỗi lần mua toàn 5 món', CAST(N'2022-12-11T00:00:00.000' AS DateTime), CAST(N'2022-12-12T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (17, 12, N'Bình luận', N'Mua lần thứ hai rồi con nhà mình rất thích ăn', CAST(N'2022-12-12T00:00:00.000' AS DateTime), CAST(N'2022-12-13T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (18, 13, N'Bình luận', N'Giao hàng nhanh đóng gói cẩn thận', CAST(N'2022-12-13T00:00:00.000' AS DateTime), CAST(N'2022-12-14T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (19, 14, N'Bình luận', N'Shop giao hàng nhanh', CAST(N'2022-12-14T00:00:00.000' AS DateTime), CAST(N'2022-12-15T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (20, 15, N'Bình luận', N'Hàng chuẩn ảnh', CAST(N'2022-12-15T00:00:00.000' AS DateTime), CAST(N'2022-12-16T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (21, 16, N'Bình luận', N'Đã mua rất nhiều lần giao hàng nhanh', CAST(N'2022-12-16T00:00:00.000' AS DateTime), CAST(N'2022-12-17T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (24, 18, N'Bình luận', N'Giao hàng nhanh đóng gói cẩn thận', CAST(N'2022-12-17T00:00:00.000' AS DateTime), CAST(N'2022-12-18T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (25, 19, N'Bình luận', N'Mua của shop nhiều rồi mỗi lần mua toàn 5 món', CAST(N'2022-12-18T00:00:00.000' AS DateTime), CAST(N'2022-12-19T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (26, 20, N'Bình luận', N'Mua lần thứ hai rồi con nhà mình rất thích ăn', CAST(N'2022-12-19T00:00:00.000' AS DateTime), CAST(N'2022-12-20T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (27, 21, N'Bình luận', N'Shop giao hàng nhanh', CAST(N'2022-12-20T00:00:00.000' AS DateTime), CAST(N'2022-12-21T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[comments] ([id], [review_id], [title], [content], [create_date], [update_date], [status], [is_display]) VALUES (28, 22, N'Bình luận', N'Hàng chuẩn ảnh', CAST(N'2022-12-21T00:00:00.000' AS DateTime), CAST(N'2022-12-22T00:00:00.000' AS DateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[comments] OFF
GO
SET IDENTITY_INSERT [dbo].[paymentmethods] ON 

INSERT [dbo].[paymentmethods] ([id], [name], [description], [code], [status], [image_name], [is_display]) VALUES (1, N'Thanh toán ví điện tử MoMo', N'THANH TOÁN VÍ ĐIỆN TỬ MOMO', N'qwe', 1, N'momo.jpg', 1)
INSERT [dbo].[paymentmethods] ([id], [name], [description], [code], [status], [image_name], [is_display]) VALUES (2, N'Thẻ ATM nội địa', N'THẺ ATM NỘI ĐỊA', N'asd', 1, N'atm.jpg', 1)
INSERT [dbo].[paymentmethods] ([id], [name], [description], [code], [status], [image_name], [is_display]) VALUES (3, N'Thanh toán khi nhận hàng', N'THANH TOÁN KHI NHẬN HÀNG', N'zxc', 1, N'ttknh.jpg', 1)
SET IDENTITY_INSERT [dbo].[paymentmethods] OFF
GO
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display]) VALUES (1, 1, 3, CAST(N'2022-12-01T00:00:00.000' AS DateTime), CAST(N'2022-12-04T00:00:00.000' AS DateTime), N'23 Bình định', N'0799901243', 25000, CAST(N'2022-12-01T00:00:00.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display]) VALUES (2, 5, 2, CAST(N'2022-12-02T00:00:00.000' AS DateTime), CAST(N'2022-12-05T00:00:00.000' AS DateTime), N'78 Bình định', N'0799901243', 25000, CAST(N'2022-12-02T00:00:00.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display]) VALUES (5, 6, 1, CAST(N'2022-12-03T00:00:00.000' AS DateTime), CAST(N'2022-12-06T00:00:00.000' AS DateTime), N'17 Gia lai', N'0799901243', 35000, CAST(N'2022-12-03T00:00:00.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display]) VALUES (6, 7, 3, CAST(N'2022-12-04T00:00:00.000' AS DateTime), CAST(N'2022-12-07T00:00:00.000' AS DateTime), N'3/3 Nghệ an', N'0799901243', 45000, CAST(N'2022-12-04T00:00:00.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display]) VALUES (7, 8, 2, CAST(N'2022-12-05T00:00:00.000' AS DateTime), CAST(N'2022-12-08T00:00:00.000' AS DateTime), N'Công viên phần mềm Quang Trung', N'0799901243', 55000, CAST(N'2022-12-05T00:00:00.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display]) VALUES (8, 9, 1, CAST(N'2022-12-06T00:00:00.000' AS DateTime), CAST(N'2022-12-09T00:00:00.000' AS DateTime), N'11 Hóc môn', N'0329102912', 15000, CAST(N'2022-12-06T00:00:00.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display]) VALUES (9, 10, 3, CAST(N'2022-12-07T00:00:00.000' AS DateTime), CAST(N'2022-12-10T00:00:00.000' AS DateTime), N'Công viên phần mềm Quang Trung', N'0993181381', 15000, CAST(N'2022-12-07T00:00:00.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display]) VALUES (10, 11, 2, CAST(N'2022-12-08T00:00:00.000' AS DateTime), CAST(N'2022-12-11T00:00:00.000' AS DateTime), N'Cao đẳng Viễn Đông', N'0391321391', 12000, CAST(N'2022-12-08T00:00:00.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display]) VALUES (11, 12, 1, CAST(N'2022-12-09T00:00:00.000' AS DateTime), CAST(N'2022-12-12T00:00:00.000' AS DateTime), N'Công viên phần mềm Quang Trung', N'0398129166', 15000, CAST(N'2022-12-09T00:00:00.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[orders] ([id], [customer_id], [payment_id], [order_date], [shipped_date], [shipped_address], [shipped_phone], [fee], [paid_date], [status], [is_watched], [is_display]) VALUES (12, 13, 2, CAST(N'2022-12-10T00:00:00.000' AS DateTime), CAST(N'2022-12-13T00:00:00.000' AS DateTime), N'78 Đà nẵng', N'0792133217', 35000, CAST(N'2022-12-10T00:00:00.000' AS DateTime), 1, 1, 1)
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
SET IDENTITY_INSERT [dbo].[order_details] ON 

INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (1, 1, 2, 4, 235000, 15000, 1, N'abc', 1, N'Đã giảm giá', 1)
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (2, 2, 4, 3, 185000, 12000, 1, N'zxc', 1, N'Đã giảm giá', 1)
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (4, 5, 8, 2, 110000, 10000, 1, N'asd', 1, N'Đã giảm giá', 1)
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (5, 6, 10, 1, 55000, 5000, 1, N'qwe', 1, N'Đã giảm giá', 1)
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (6, 7, 12, 4, 235000, 15000, 1, N'abc', 1, N'Đã giảm giá', 1)
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (7, 8, 14, 3, 185000, 12000, 1, N'zxc', 1, N'Đã giảm giá', 1)
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (8, 9, 16, 2, 110000, 10000, 1, N'asd', 1, N'Đã giảm giá', 1)
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (9, 10, 18, 1, 55000, 5000, 1, N'qwe', 1, N'Đã giảm giá', 1)
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (10, 11, 20, 4, 235000, 15000, 1, N'abc', 1, N'Đã giảm giá', 1)
INSERT [dbo].[order_details] ([id], [order_id], [food_id], [quantity], [price], [discount_amount], [is_fixed], [coupon_code], [status], [memo], [is_display]) VALUES (11, 12, 22, 3, 185000, 12000, 1, N'zxc', 1, N'Đã giảm giá', 1)
SET IDENTITY_INSERT [dbo].[order_details] OFF
GO
SET IDENTITY_INSERT [dbo].[notifications] ON 

INSERT [dbo].[notifications] ([id], [customer_id], [record_id], [table_name], [content], [create_at], [is_watched]) VALUES (1, 1, 1, N'foods', N'Thông báo', CAST(N'2022-11-15T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[notifications] ([id], [customer_id], [record_id], [table_name], [content], [create_at], [is_watched]) VALUES (2, 5, 2, N'orders', N'Thông báo', CAST(N'2022-11-16T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[notifications] OFF
GO
SET IDENTITY_INSERT [dbo].[coupons] ON 

INSERT [dbo].[coupons] ([id], [name], [code], [description], [user_limit], [food_limit], [amount], [is_fixed], [start_date], [end_date], [create_date], [create_by], [is_display], [status]) VALUES (3, N'Giảm 30,000đ', N'qwe', N'Giảm 30,000đ Đơn tối thiểu 0đ', 100, 100, 200, 1, CAST(N'2022-11-15T00:00:00.000' AS DateTime), CAST(N'2022-12-15T00:00:00.000' AS DateTime), CAST(N'2022-11-14T00:00:00.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[coupons] ([id], [name], [code], [description], [user_limit], [food_limit], [amount], [is_fixed], [start_date], [end_date], [create_date], [create_by], [is_display], [status]) VALUES (4, N'Giảm 15,000đ', N'asd', N'Giảm 15,000đ Đơn tối thiểu 99,000đ', 200, 200, 400, 1, CAST(N'2022-11-16T00:00:00.000' AS DateTime), CAST(N'2022-12-16T00:00:00.000' AS DateTime), CAST(N'2022-11-15T00:00:00.000' AS DateTime), 2, 1, 1)
INSERT [dbo].[coupons] ([id], [name], [code], [description], [user_limit], [food_limit], [amount], [is_fixed], [start_date], [end_date], [create_date], [create_by], [is_display], [status]) VALUES (5, N'Giảm 12%', N'zxc', N'Giảm 12% Giảm tối đa 80,000đ Đơn tối thiểu 250,000đ', 500, 500, 1000, 1, CAST(N'2022-11-17T00:00:00.000' AS DateTime), CAST(N'2022-12-17T00:00:00.000' AS DateTime), CAST(N'2022-11-16T00:00:00.000' AS DateTime), 3, 1, 1)
INSERT [dbo].[coupons] ([id], [name], [code], [description], [user_limit], [food_limit], [amount], [is_fixed], [start_date], [end_date], [create_date], [create_by], [is_display], [status]) VALUES (6, N'Giảm 10%', N'rty', N'Giảm 10% Giảm tối đa 300,000đ Đơn tối thiểu 499,000đ', 300, 300, 600, 1, CAST(N'2022-11-18T00:00:00.000' AS DateTime), CAST(N'2022-12-18T00:00:00.000' AS DateTime), CAST(N'2022-11-17T00:00:00.000' AS DateTime), 4, 1, 1)
INSERT [dbo].[coupons] ([id], [name], [code], [description], [user_limit], [food_limit], [amount], [is_fixed], [start_date], [end_date], [create_date], [create_by], [is_display], [status]) VALUES (7, N'Giảm 10,000đ', N'vbn', N'Giảm 10,000đ Đơn tối thiểu 120,000đ', 100, 100, 200, 1, CAST(N'2022-11-19T00:00:00.000' AS DateTime), CAST(N'2022-12-19T00:00:00.000' AS DateTime), CAST(N'2022-11-18T00:00:00.000' AS DateTime), 5, 1, 1)
INSERT [dbo].[coupons] ([id], [name], [code], [description], [user_limit], [food_limit], [amount], [is_fixed], [start_date], [end_date], [create_date], [create_by], [is_display], [status]) VALUES (9, N'Giảm 7% ', N'bnm', N'Giảm 7% Giảm tối đa 1,500,000đ Đơn tối thiểu 17,500,000đ', 50, 50, 100, 1, CAST(N'2022-11-20T00:00:00.000' AS DateTime), CAST(N'2022-12-20T00:00:00.000' AS DateTime), CAST(N'2022-11-19T00:00:00.000' AS DateTime), 7, 1, 1)
SET IDENTITY_INSERT [dbo].[coupons] OFF
GO
SET IDENTITY_INSERT [dbo].[food_coupons] ON 

INSERT [dbo].[food_coupons] ([id], [food_id], [coupon_id], [create_date], [status]) VALUES (1, 1, 3, CAST(N'2022-11-18T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[food_coupons] ([id], [food_id], [coupon_id], [create_date], [status]) VALUES (2, 2, 4, CAST(N'2022-11-19T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[food_coupons] ([id], [food_id], [coupon_id], [create_date], [status]) VALUES (3, 3, 5, CAST(N'2022-11-20T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[food_coupons] ([id], [food_id], [coupon_id], [create_date], [status]) VALUES (4, 4, 6, CAST(N'2022-11-21T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[food_coupons] ([id], [food_id], [coupon_id], [create_date], [status]) VALUES (5, 5, 7, CAST(N'2022-11-22T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[food_coupons] ([id], [food_id], [coupon_id], [create_date], [status]) VALUES (7, 7, 9, CAST(N'2022-11-23T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[food_coupons] ([id], [food_id], [coupon_id], [create_date], [status]) VALUES (9, 8, 3, CAST(N'2022-11-18T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[food_coupons] ([id], [food_id], [coupon_id], [create_date], [status]) VALUES (10, 9, 4, CAST(N'2022-11-19T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[food_coupons] ([id], [food_id], [coupon_id], [create_date], [status]) VALUES (11, 10, 5, CAST(N'2022-11-20T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[food_coupons] ([id], [food_id], [coupon_id], [create_date], [status]) VALUES (12, 11, 6, CAST(N'2022-11-21T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[food_coupons] ([id], [food_id], [coupon_id], [create_date], [status]) VALUES (13, 12, 7, CAST(N'2022-11-22T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[food_coupons] ([id], [food_id], [coupon_id], [create_date], [status]) VALUES (14, 13, 9, CAST(N'2022-11-23T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[food_coupons] ([id], [food_id], [coupon_id], [create_date], [status]) VALUES (15, 14, 3, CAST(N'2022-11-18T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[food_coupons] ([id], [food_id], [coupon_id], [create_date], [status]) VALUES (16, 15, 4, CAST(N'2022-11-19T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[food_coupons] ([id], [food_id], [coupon_id], [create_date], [status]) VALUES (17, 16, 5, CAST(N'2022-11-20T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[food_coupons] ([id], [food_id], [coupon_id], [create_date], [status]) VALUES (18, 17, 6, CAST(N'2022-11-21T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[food_coupons] ([id], [food_id], [coupon_id], [create_date], [status]) VALUES (19, 18, 7, CAST(N'2022-11-22T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[food_coupons] ([id], [food_id], [coupon_id], [create_date], [status]) VALUES (21, 19, 9, CAST(N'2022-11-23T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[food_coupons] ([id], [food_id], [coupon_id], [create_date], [status]) VALUES (22, 20, 3, CAST(N'2022-11-18T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[food_coupons] ([id], [food_id], [coupon_id], [create_date], [status]) VALUES (23, 21, 4, CAST(N'2022-11-19T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[food_coupons] ([id], [food_id], [coupon_id], [create_date], [status]) VALUES (24, 22, 5, CAST(N'2022-11-20T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[food_coupons] OFF
GO
SET IDENTITY_INSERT [dbo].[customer_coupons] ON 

INSERT [dbo].[customer_coupons] ([id], [customer_id], [coupon_id], [create_date], [status]) VALUES (1, 1, 3, CAST(N'2022-11-19T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[customer_coupons] ([id], [customer_id], [coupon_id], [create_date], [status]) VALUES (2, 5, 4, CAST(N'2022-11-20T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[customer_coupons] ([id], [customer_id], [coupon_id], [create_date], [status]) VALUES (3, 6, 5, CAST(N'2022-11-21T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[customer_coupons] ([id], [customer_id], [coupon_id], [create_date], [status]) VALUES (4, 7, 6, CAST(N'2022-11-22T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[customer_coupons] ([id], [customer_id], [coupon_id], [create_date], [status]) VALUES (5, 8, 7, CAST(N'2022-11-23T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[customer_coupons] ([id], [customer_id], [coupon_id], [create_date], [status]) VALUES (6, 9, 9, CAST(N'2022-11-24T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[customer_coupons] ([id], [customer_id], [coupon_id], [create_date], [status]) VALUES (7, 10, 3, CAST(N'2022-11-19T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[customer_coupons] ([id], [customer_id], [coupon_id], [create_date], [status]) VALUES (8, 11, 4, CAST(N'2022-11-20T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[customer_coupons] ([id], [customer_id], [coupon_id], [create_date], [status]) VALUES (9, 12, 5, CAST(N'2022-11-21T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[customer_coupons] ([id], [customer_id], [coupon_id], [create_date], [status]) VALUES (10, 13, 6, CAST(N'2022-11-22T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[customer_coupons] ([id], [customer_id], [coupon_id], [create_date], [status]) VALUES (11, 1, 7, CAST(N'2022-11-23T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[customer_coupons] ([id], [customer_id], [coupon_id], [create_date], [status]) VALUES (13, 5, 9, CAST(N'2022-11-24T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[customer_coupons] ([id], [customer_id], [coupon_id], [create_date], [status]) VALUES (14, 6, 3, CAST(N'2022-11-19T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[customer_coupons] ([id], [customer_id], [coupon_id], [create_date], [status]) VALUES (15, 7, 4, CAST(N'2022-11-20T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[customer_coupons] ([id], [customer_id], [coupon_id], [create_date], [status]) VALUES (16, 8, 5, CAST(N'2022-11-21T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[customer_coupons] ([id], [customer_id], [coupon_id], [create_date], [status]) VALUES (17, 9, 6, CAST(N'2022-11-22T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[customer_coupons] ([id], [customer_id], [coupon_id], [create_date], [status]) VALUES (18, 10, 7, CAST(N'2022-11-23T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[customer_coupons] ([id], [customer_id], [coupon_id], [create_date], [status]) VALUES (19, 11, 9, CAST(N'2022-11-24T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[customer_coupons] ([id], [customer_id], [coupon_id], [create_date], [status]) VALUES (20, 12, 3, CAST(N'2022-11-19T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[customer_coupons] ([id], [customer_id], [coupon_id], [create_date], [status]) VALUES (21, 13, 4, CAST(N'2022-11-20T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[customer_coupons] OFF
GO
