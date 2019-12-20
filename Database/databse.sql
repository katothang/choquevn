USE [master]
GO
Create database ChoQueVN
USE [ChoQueVN]
GO
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[MaSanPham] [bigint] NULL,
	[TenSanPham] [nvarchar](50) NULL,
	[SoLuong] [int] NULL,
	[DonGia] [decimal](18, 0) NULL,
	[TongTien] [decimal](18, 0) NULL,
	[MaHoaDon] [varchar](50) NULL,
	[NgayGiaoHang] [date] NULL,
	[SoLuongDaGiao] [int] NULL,
 CONSTRAINT [PkChiTietHoaDon] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ChiTietHopDong]    Script Date: 20/12/2019 11:53:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHopDong](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[MaHopDong] [bigint] NULL,
	[MaSanPham] [bigint] NULL,
	[TenSanPham] [nvarchar](50) NULL,
	[SoLuong] [int] NULL,
	[DonGia] [decimal](18, 0) NULL,
	[ThanhTien] [decimal](18, 0) NULL,
 CONSTRAINT [PkChiTietHopDong] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DanhMucSanPham]    Script Date: 20/12/2019 11:53:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMucSanPham](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TenDanhMuc] [nvarchar](50) NULL,
 CONSTRAINT [PkDanhMucSanPham] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DeXuat]    Script Date: 20/12/2019 11:53:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeXuat](
	[Id] [bigint] NOT NULL,
	[DeXuat] [nvarchar](50) NULL,
	[MaNguoiDeXuat] [bigint] NULL,
	[MaNguoiXacNhan] [bigint] NULL,
	[KetQua] [bit] NULL,
 CONSTRAINT [PkDeXuat] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 20/12/2019 11:53:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHoaDon] [varchar](50) NOT NULL,
	[ThoiGianTao] [datetime] NULL,
	[TongTien] [decimal](18, 0) NULL,
	[MaNguoiDung] [bigint] NULL,
	[MaKhachHang] [bigint] NULL,
	[DaThanhToan] [bit] NULL,
	[NgayGiaoHang] [date] NULL,
	[NgayDatCoc] [date] NULL,
	[NgayThanhToan] [date] NULL,
	[HopDong] [bigint] NULL,
	[GiaiDoanGiaoHang] [nvarchar](255) NULL,
 CONSTRAINT [PkHoaDon] PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HopDong]    Script Date: 20/12/2019 11:53:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HopDong](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[NgayTao] [date] NULL,
	[MaNhanVien] [bigint] NULL,
	[MaGiamDoc] [bigint] NULL,
	[MaKhachHang] [bigint] NULL,
	[ThanhTien] [decimal](18, 0) NULL,
	[KhachHangXacNhan] [bit] NULL,
	[TienDatCoc] [int] NULL,
	[NgayBatDau] [date] NULL,
	[NgayKetThuc] [date] NULL,
	[LoaiHopDong] [varchar](1) NULL,
	[ThoiGian] [varchar](1) NULL,
	[TinhTrang] [varchar](255) NULL,
	[NoiDung] [nvarchar](max) NULL,
 CONSTRAINT [PkHopDong] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 20/12/2019 11:53:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KhachHang](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TaiKhoan] [nvarchar](50) NULL,
	[MatKhau] [nvarchar](50) NULL,
	[TenKhachHang] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[DienThoai] [varchar](11) NULL,
	[Email] [nvarchar](50) NULL,
	[NgaySinh] [datetime] NULL,
 CONSTRAINT [PkKhachHang] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoaiTaiKhoan]    Script Date: 20/12/2019 11:53:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiTaiKhoan](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](50) NULL,
 CONSTRAINT [PkLoaiTaiKhoan] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 20/12/2019 11:53:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TaiKhoan] [nvarchar](50) NULL,
	[MatKhau] [nvarchar](50) NULL,
	[HoTen] [nvarchar](50) NULL,
	[GioiTinh] [bit] NULL,
	[NgaySinh] [datetime] NULL,
	[DiaChi] [nvarchar](50) NULL,
	[Email] [varchar](50) NULL,
	[MaLoai] [bigint] NOT NULL,
 CONSTRAINT [PkNguoiDung] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 20/12/2019 11:53:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TenNhaCungCap] [nvarchar](50) NULL,
 CONSTRAINT [PkNhaCungCap] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 20/12/2019 11:53:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[MetaTitle] [ntext] NULL,
	[TenSanPham] [nvarchar](50) NULL,
	[MoTa] [ntext] NULL,
	[DonGia] [decimal](18, 0) NULL,
	[DonVi] [nvarchar](50) NULL,
	[MaCC] [bigint] NULL,
	[MaDanhMuc] [bigint] NULL,
	[HinhAnh] [nvarchar](100) NULL,
 CONSTRAINT [PkSanPham] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[ChiTietHoaDon] ON 

INSERT [dbo].[ChiTietHoaDon] ([Id], [MaSanPham], [TenSanPham], [SoLuong], [DonGia], [TongTien], [MaHoaDon], [NgayGiaoHang], [SoLuongDaGiao]) VALUES (42, 19, N'CÔNG DỤNG CỦA LÁ NẾP - BỘT LÁ NẾP', 1, CAST(70000 AS Decimal(18, 0)), CAST(70000 AS Decimal(18, 0)), N'HD637124815943231248', NULL, NULL)
SET IDENTITY_INSERT [dbo].[ChiTietHoaDon] OFF
SET IDENTITY_INSERT [dbo].[DanhMucSanPham] ON 

INSERT [dbo].[DanhMucSanPham] ([Id], [TenDanhMuc]) VALUES (6, N'Bột lá nếp (Bột lá dứa)')
INSERT [dbo].[DanhMucSanPham] ([Id], [TenDanhMuc]) VALUES (7, N'Bột lá cẩm tím cẩm đỏ')
INSERT [dbo].[DanhMucSanPham] ([Id], [TenDanhMuc]) VALUES (8, N'Hoa đậu biếc')
INSERT [dbo].[DanhMucSanPham] ([Id], [TenDanhMuc]) VALUES (9, N'Bột Gấc Khô (Dầu Gấc)')
INSERT [dbo].[DanhMucSanPham] ([Id], [TenDanhMuc]) VALUES (10, N'Bột lá khúc nguyên chất')
INSERT [dbo].[DanhMucSanPham] ([Id], [TenDanhMuc]) VALUES (11, N'Bột lá khúc nguyên chất')
INSERT [dbo].[DanhMucSanPham] ([Id], [TenDanhMuc]) VALUES (12, N'Bếp Quê')
INSERT [dbo].[DanhMucSanPham] ([Id], [TenDanhMuc]) VALUES (13, N'Video bếp quê')
SET IDENTITY_INSERT [dbo].[DanhMucSanPham] OFF
INSERT [dbo].[DeXuat] ([Id], [DeXuat], [MaNguoiDeXuat], [MaNguoiXacNhan], [KetQua]) VALUES (1, N'âsasasas', 1, 1, 1)
INSERT [dbo].[DeXuat] ([Id], [DeXuat], [MaNguoiDeXuat], [MaNguoiXacNhan], [KetQua]) VALUES (2, N'aaaaaaaaaaaaaaaaaaaa', 1, 1, NULL)
INSERT [dbo].[HoaDon] ([MaHoaDon], [ThoiGianTao], [TongTien], [MaNguoiDung], [MaKhachHang], [DaThanhToan], [NgayGiaoHang], [NgayDatCoc], [NgayThanhToan], [HopDong], [GiaiDoanGiaoHang]) VALUES (N'HD637124815943231248', CAST(0x0000AB2901842859 AS DateTime), CAST(70000 AS Decimal(18, 0)), NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([Id], [TaiKhoan], [MatKhau], [TenKhachHang], [DiaChi], [DienThoai], [Email], [NgaySinh]) VALUES (1, N'hoalan', N'e10adc3949ba59abbe56e057f20f883e', N'Nguyễn Anh', N'Thanh Hóa', N'123456789', N'anh123@gmail.com', CAST(0x0000A41900000000 AS DateTime))
INSERT [dbo].[KhachHang] ([Id], [TaiKhoan], [MatKhau], [TenKhachHang], [DiaChi], [DienThoai], [Email], [NgaySinh]) VALUES (2, N'minhnguyet', N'e10adc3949ba59abbe56e057f20f883e', N'Nguyễn Thị Minh Nguyệt', N'Hà Nội', N'1234567899', N'nguyet@gmail.com', CAST(0x0000A77700000000 AS DateTime))
INSERT [dbo].[KhachHang] ([Id], [TaiKhoan], [MatKhau], [TenKhachHang], [DiaChi], [DienThoai], [Email], [NgaySinh]) VALUES (3, N'trantien', N'e10adc3949ba59abbe56e057f20f883e', N'Trần Văn Tiến', N' Quảng Nam', N'1234567788', N'tien123@gmai.com', CAST(0x000087E400000000 AS DateTime))
INSERT [dbo].[KhachHang] ([Id], [TaiKhoan], [MatKhau], [TenKhachHang], [DiaChi], [DienThoai], [Email], [NgaySinh]) VALUES (4, N'ngocanh1234', N'e10adc3949ba59abbe56e057f20f883e', N'Trần Ngọc Ánh', N' Quảng Ngãi', N'123456789', N'ngocanh123@gmail.com', CAST(0x0000729C00000000 AS DateTime))
INSERT [dbo].[KhachHang] ([Id], [TaiKhoan], [MatKhau], [TenKhachHang], [DiaChi], [DienThoai], [Email], [NgaySinh]) VALUES (5, N'tunglamdeptrai', N'e10adc3949ba59abbe56e057f20f883e', N'Hoàng Tùng Lâm', N'Nam định', N'12345678', N'tunglam123@gmail.com', CAST(0xFFFFF31500000000 AS DateTime))
INSERT [dbo].[KhachHang] ([Id], [TaiKhoan], [MatKhau], [TenKhachHang], [DiaChi], [DienThoai], [Email], [NgaySinh]) VALUES (6, N'user', N'e10adc3949ba59abbe56e057f20f883e', N'user', N'user', N'dia chi', N'user@localhost', CAST(0x0000A8BA016872E7 AS DateTime))
INSERT [dbo].[KhachHang] ([Id], [TaiKhoan], [MatKhau], [TenKhachHang], [DiaChi], [DienThoai], [Email], [NgaySinh]) VALUES (7, N'admin2', N'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, NULL, CAST(0x00009E3900000000 AS DateTime))
INSERT [dbo].[KhachHang] ([Id], [TaiKhoan], [MatKhau], [TenKhachHang], [DiaChi], [DienThoai], [Email], [NgaySinh]) VALUES (8, N'kuthang', N'e10adc3949ba59abbe56e057f20f883e', N'Nguyen Van Thang', N'ha noi viet nam', N'0364561995', N'katothang@gmail.com', CAST(0x0000AB290183E3B9 AS DateTime))
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
SET IDENTITY_INSERT [dbo].[LoaiTaiKhoan] ON 

INSERT [dbo].[LoaiTaiKhoan] ([Id], [TenLoai]) VALUES (1, N'Người dùng')
INSERT [dbo].[LoaiTaiKhoan] ([Id], [TenLoai]) VALUES (2, N'Khách hàng')
INSERT [dbo].[LoaiTaiKhoan] ([Id], [TenLoai]) VALUES (3, N'Nhà cung cấp')
SET IDENTITY_INSERT [dbo].[LoaiTaiKhoan] OFF
SET IDENTITY_INSERT [dbo].[NguoiDung] ON 

INSERT [dbo].[NguoiDung] ([Id], [TaiKhoan], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [Email], [MaLoai]) VALUES (1, N'âs', NULL, N'aaa', 1, CAST(0x00008A4000000000 AS DateTime), N'dssd', NULL, 1)
INSERT [dbo].[NguoiDung] ([Id], [TaiKhoan], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [Email], [MaLoai]) VALUES (2, N'admin', N'123456', N'Admin', 1, CAST(0x00008A4000000000 AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[NguoiDung] OFF
SET IDENTITY_INSERT [dbo].[NhaCungCap] ON 

INSERT [dbo].[NhaCungCap] ([Id], [TenNhaCungCap]) VALUES (7, N'Trại quê Hà Hội')
INSERT [dbo].[NhaCungCap] ([Id], [TenNhaCungCap]) VALUES (8, N'Nông trại nam định')
SET IDENTITY_INSERT [dbo].[NhaCungCap] OFF
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([Id], [MetaTitle], [TenSanPham], [MoTa], [DonGia], [DonVi], [MaCC], [MaDanhMuc], [HinhAnh]) VALUES (18, NULL, N'Bột lá cẩm tím nguyên chất tự nhiên', N'<h1>Bột lá cẩm tím nguyên chất tự nhiên | đảm bảo VSATTP | bán tại Chợ Quê</h1><p><em>Chợ Quê bán <strong><a href="http://choquevn.com/quy-trinh-lam-bot-la-cam-tim-cam-do-100-nguyen-chat-don-gian-tai-nha-4059">bột lá cẩm tím</a> </strong>100% nguyên chất từ cây lá cẩm tím<strong>,</strong> cẩm đỏ <strong>đảm bảo tiêu chuẩn chứng nhận VSATTP </strong>sản phẩm tạo màu thực phẩm hoàn toàn từ tự nhiên. Sử dụng bột lá cẩm tím dùng để tạo màu cho các món ăn có màu tím bắt mắt, lạ miệng. </em></p><p><br /><img alt="bột lá cẩm tím" src="http://choquevn.com/Upload/files/BOT%20LA%20CAM/636511659469206361.png" /></p><p><br /><strong>Bột lá cẩm chứng nhận và cam kết nguyên chất</strong><br /> </p><ul>	<li><strong>Sản phẩm bột lá cẩm</strong> chứng nhận An toàn Vệ sinh thực phẩm (ATVSTP).</li>	<li><strong>Sản phẩm bột lá cẩm</strong> đảm bảo 100% nguyên chất từ cành lá cây lá cẩm.</li>	<li><strong>Sản phẩm bột lá cẩm</strong> đảm bảo không có chất tạo màu, chất bảo quản.</li>	<li><strong>Bột lá cẩm</strong> sản phẩm chất lượng tạo màu sắc đẹp cho các thực phẩm, đồ uống.</li>	<li><strong>Bột lá cẩm tím</strong> đảm bảo mùi vị thơm đặc trưng.</li></ul><p><br /><img alt="Bột lá cẩm tím 100% nguyên chất" src="http://choquevn.com/Upload/files/BOT%20LA%20CAM/636798388109369917.png" /></p><p> </p><p> Bột lá cẩm tím nguyên chất<br /> </p><p><strong>Vì sao nên dùng bột lá cẩm tím thay phẩm màu?</strong><br /><br />Với sự phát triển của xã hội nhận thức mỗi người ngày càng cao hơn từ cuộc sống sinh hoạt ăn uống hàng ngày càng trở nên quan trọng, hơn nữa việc đảm bảo "<em>vệ sinh an toàn thực phẩm</em>" hiện nay ngày càng được mọi người quan tâm và chú trọng nhiều hơn. </p><p> </p><p>Đặc biệt là các món ăn không phẩm màu tốt cho sức khỏe lành mạnh hoàn toàn từ tự nhiên trong đó có <strong>bột lá cẩm tím</strong> một trong những sản phẩm "bột tạo màu thực phẩm" hoàn toàn 100% từ tự nhiên được nhiều người Việt Nam tin tưởng và sử dụng rộng rãi trong đời sống nhất là trong ẩm thực với nhiều công dụng.<br /> </p><p><strong>Bột lá cẩm tím tạo màu thực phẩm:</strong><br /><br />Sử dụng bột lá cẩm tím dùng để tạo màu cho các món ăn thêm hấp dẫn, lạ mắt bởi sắc tím từ lá cẩm. Những món ăn được làm ra mang màu tím chỉ cần nhìn thôi đủ thấy ngon miệng rồi. Chúng ta cùng đi khám phá một vài món ăn ngon từ bột lá cẩm tím: </p><p> </p><p>☑<em> Xôi bột lá cẩm tím</em></p><p><br />Thay vì những món xôi quen thuộc, bạn có thể làm món xôi bột lá lẩm tím dẻo thơm, dễ chế biến lại có màu tím bắt mắt nhằm đổi món cho cả gia đình. Nguyên liệu để hoàn thành được món xôi này bao gồm: 500g gạo nếp, 8g bột lá cẩm tím, đường, nước cốt dừa, dừa tươi.</p><p> </p><p><strong><img alt="xôi vị, xôi ngũ sắc bột lá cẩm" src="http://choquevn.com/Upload/files/BOT%20LA%20CAM/636798372444960919.png" /><br /><br />Xôi vị, xôi ngũ sắc bột lá cẩm</strong></p><p> </p><p>☑<em> Thạch rau câu bột lá cẩm tím:</em></p><p><br />Chỉ với một chút biến tấu nhỏ, ta đã "thay áo" cho món thạch truyền thống bằng màu tím hấp dẫn từ các nguyên liệu: 4g bột rau câu, 1g bột lá cẩm tím, 350ml nước lọc.</p><p> </p><p><img alt="Thạch rau câu bột lá cẩm" src="http://choquevn.com/Upload/files/BOT%20LA%20CAM/636798382155919367.png" /><br /><br /><strong>Thạch, bánh bột lá cẩm tím</strong></p><p> </p><p>☑<em> Mứt dừa màu tím từ bột lá cẩm tím:</em></p><p><br />Mứt dừa màu tím từ bột lá cẩm tím là một trong năm màu tạo nên đĩa mứt dừa ngũ sắc thơm ngon, hấp dẫn chiêu đãi gia đình và khách ngày Tết. Bạn cần phải chuẩn bị: 200g dừa tươi, 3g bột lá cẩm tím, 80g đường, 50ml sữa tươi không đường.</p><p> </p><p><img alt="mứt dừa bột lá cẩm" src="http://choquevn.com/Upload/files/BOT%20LA%20CAM/636772484733702751.png" /></p><p><strong>Mứt dừa bột lá cẩm tím</strong></p><p> </p><p>☑<em> Chè bột lá cẩm:</em></p><p><br />Ly chè mát lạnh với đậu ngự bùi, quyện lẫn với vị thơm của lá cẩm chắc chắn sẽ là một món chè thanh mát cho mùa hè. Để có được 1 ly chè bạn cần phải chuẩn bị: 300g đậu ngự, 1 bát bột năng, 2g bột lá cẩm tím, đường phèn, vài lá nếp.</p><p> </p><p><img alt="bột lá cẩm" src="http://choquevn.com/Upload/files/BOT%20LA%20CAM/637054998488897752.png" /></p><p> </p><p>☑<em> Bánh da lợn bột lá cẩm tím:</em></p><p><br />Món bánh da lợn dai dai, hấp dẫn bởi màu tím từ bột lá cẩm tím tin rằng sẽ mang đến cho người thưởng thức một món ăn vừa quen mà lại vừa lạ này. Nguyên liệu gồm có 200g đậu xanh, 50g bột năng, 100g bột nếp, 2g bột lá cẩm tím, nước cốt dừa, muối.</p><p> </p><p><img alt="bột lá cẩm" src="http://choquevn.com/Upload/files/bot-la-cam/637054999948744657.png" /></p><p> </p><p>☑<em> Bánh trôi bột lá cẩm tím: </em></p><p> </p><p>Từ lâu bột lá cẩm tím mang lại nhiều món ăn thêm hấp dẫn, ngon mắt hơn rất nhiều nhờ màu sắc tím thủy chung nổi bật trong đó phải kể đến món bánh trôi. Bạn cần chuẩn bị những gì để hoàn thành được món bánh trôi sắc tím đây? 150g bột gạo nếp, 2g bột lá cẩm tím, đường phên, vừng rang. </p><p> </p><p><img alt="Bánh trôi bột lá cẩm" src="http://choquevn.com/Upload/files/BOT%20LA%20CAM/636798375345748442.png" /></p><p> </p><p><strong>Bánh trôi bột lá cẩm tím</strong></p><p> </p><p>☑ <em>Bánh chưng sắc tím: </em></p><p> </p><p>Bên cạnh những chiếc bánh chưng truyền thống màu xanh nguyên chất từ lá dong thì hiện nay có sự sáng tạo mới bánh chưng có sự biến tấu mới lạ được tô thêm vào sắc. Với màu sắc tím từ bột lá cẩm tím chắc chắn sẽ mang đến cho bạn một loại bánh hấp dẫn. Để làm được chiếc bánh chưng cần chuẩn bị: 1kg gạo nếp, 15g bột lá cẩm tím, 100g đậu xanh, 50g thịt lợn, hành khô, gia vị.</p><p> </p><p><img alt="bột lá cẩm tím" src="http://choquevn.com/Upload/files/bot-la-cam/637056742973590313.png" /></p><p><br />Để đảm bảo được quyền lợi và sức khỏe của quý khách hàng sử dụng bột lá cẩm tím tại Chợ Quê, Chúng tôi xin được cam kết sản phẩm <strong>bột lá cẩm tím tốt</strong> và chất lượng nhất. Sản phẩm đã được chứng nhận đảm bảo tiêu chuẩn an toàn sản phẩm, vậy nên mọi quý khách sử dụng sản phẩm của Chúng Tôi hãy cứ yên tâm về độ "<strong>An Toàn + Uy Tín + Chất Lượng</strong>" hàng Việt Nam chất lượng cao:<br /> </p><p><img alt="cây lá cẩm tím cẩm đỏ" src="http://choquevn.com/Upload/files/BOT%20LA%20CAM/636115957580105199.png" style="width:75%" /><strong> </strong><br /><strong>Cây lá cẩm tím</strong><br /> </p><p>Quy trình sản xuất bột lá cẩm tím là khâu cực kỳ quan trọng để quyết định sản phẩm bột lá cẩm tím có đảm bảo chất lượng, vệ sinh độ an toàn sản phẩm và màu sắc và mùi vị có giữ được nguyên chất hay không. Vậy nên khi sản xuất bột lá cẩm tím cần chú ý thật kỹ đến khâu này để có sản phẩm tốt nhất đạt được theo mong muốn, Quý khách có thể tham khảo quy trình sản xuất bột lá cẩm tím ngay dưới đây.<br /> </p><p><strong><a href="http://choquevn.com/quy-trinh-lam-bot-la-cam-tim-cam-do-100-nguyen-chat-don-gian-tai-nha-4059">Quy trình sản xuất bột lá cẩm</a></strong><br /> </p><p><strong><img alt="" src="http://choquevn.com/Upload/files/icon/637042054196939088.png" /> Thu hoạch:</strong> Khi cây cẩm có chiều cao từ 35 - 40cm là thời điểm tốt nhất để thu hoạch cây cẩm.</p><p> </p><p><strong><img alt="" src="http://choquevn.com/Upload/files/icon/637042054196939088.png" /> Sơ chế:</strong> Sau khi thu hoạch xong tiến hành cắt bớt phần thân già, rửa sạch, để ráo.</p><p> </p><p><strong><img alt="" src="http://choquevn.com/Upload/files/icon/637042054196939088.png" /> Chế biến:</strong> Tiến hành chế biến bằng công nghệ sấy tiên tiến sấy lạnh công nghiệp với nhiệt độ thích hợp, chế biến thành dạng bột mịn khô.</p><p> </p><p><strong><img alt="" src="http://choquevn.com/Upload/files/icon/637042054196939088.png" /> Đóng gói</strong>: Đóng gói, bảo quản trong kho lạnh.<br /> </p><p><strong>Bột lá cẩm của Chợ Quê</strong> được sản xuất từ lá tươi ngay sau khi thu hoạch xong nên vẫn có màu xanh lá tươi sáng và mịn chứ không bị tối sậm như lá cẩm phải qua quá trình thu hoạch và vận chuyển dài ngày. Đặc biệt, bột lá cẩm của Chợ Quê vẫn còn mùi hắc nguyên chất của lá tươi. Tuy nhiên vị hắc này của lá khi chế biến các món ăn uống hầu như không còn.<br /> </p><p><img alt="Quy trình sản xuất bột lá cẩm tím chợ quê" src="http://choquevn.com/Upload/files/BOT%20LA%20CAM/636480837353880272.png" /></p><p><strong>Quy trình sản xuất bột lá cẩm tím  </strong></p><p> </p><p>Sau khi sản tiến hành chế biến và sản xuất ra thành bột phải cần đến đến khâu bảo quản bột. "<strong>Bảo quản bột lá cẩm</strong>" là một trong những khâu rất quan trọng và cũng đòi hỏi yêu cầu khắt khe nhất để sản phẩm có hạn sử dụng lâu nhất mà vẫn giữ được chất lượng, màu sắc, mùi vị không bị thay đổi và hơn nữa độ an toàn sản phẩm vẫn phải đảm bảo. Và dưới đây là một số cách để quý khách có thể bảo quản bột lá cẩm tốt nhất.<br /> </p><p><strong>Chia sẻ 3 cách bảo quản bột lá cẩm tím</strong><br /> </p><ul>	<li><strong>Cách 1:</strong> Bảo quản bột tốt nhất là buộc kín (để trong ngăn mát tủ lạnh) sử dụng từ 10-12 tháng. </li>	<li><strong>Cách 2:</strong> Bảo quản trong kho lạnh (số lượng lớn).</li>	<li><strong>Cách 3:</strong> Bảo quản túi hoặc hộp kín để bột không bị ẩm và mất mùi vị, nên bột để ở nhiệt độ thoáng mát bình thường, tránh ánh nắng mặt trời và các tia sáng chiếu trực tiếp vào bột sẽ khiến chất lượng bột kém chất lượng. </li></ul><p> </p><p><img alt="Kho bảo quản bột lá cẩm tím Chợ Quê" src="http://choquevn.com/Upload/files/BOT%20LA%20CAM/636480843472680248.png" /><br /><strong> Hình 8: Kho bảo quản bột lá cẩm tím</strong><br /> </p><h2><strong>Hướng dẫn cách dùng, sử dụng bột lá cẩm tím</strong></h2><p><br /><strong><img alt="nước bột lá cẩm tím khi hòa nước nóng" src="http://choquevn.com/Upload/files/BOT%20LA%20CAM/636491821247013024.png" /></strong></p><p><strong>Cách lấy màu bột lá cẩm tím</strong><br /> </p><p><strong>Các bước lấy màu bột lá cẩm tím: </strong></p><p> </p><p><strong>Bước 1:</strong> Hòa 1g bột lá cẩm tím với 40ml nước sôi nóng già.</p><p><strong>Bước 2:</strong> Sau đó khuấy đều lọc qua rây chờ cho đến khi bột lên màu khoảng 30 phút. </p><p><strong>Bước 3:</strong> Sau đó lọc qua rây hoặc gạn lấy nước rồi đem đi chế biến (làm bánh, xôi, thạch...).</p><p> </p><h2><img alt="sản phẩm bột lá cẩm đã được hoàn thành và đóng gói" src="http://choquevn.com/Upload/files/BOT%20LA%20CAM/636464170821139127.png" style="width:75%" /></h2><h2>Thành phẩm bột lá cẩm tím<br /> </h2><p><strong><img alt="" src="http://choquevn.com/Upload/files/icon/note/637042923642560599.png" /> Một vài lưu ý khi sử dụng bột lá cẩm lấy màu: </strong></p><p> </p><p><img alt="" src="http://choquevn.com/Upload/files/icon/637042216152443951.png" /> Pha bột theo tỷ lệ: 10g bột lá cẩm - 400ml nước sôi nóng già (>90 độ C). </p><p> </p><p><img alt="" src="http://choquevn.com/Upload/files/icon/637042216152443951.png" /> Không nên pha quá đặc sẽ không nên được màu tím như bạn mong muốn. </p><p> </p><p><img alt="" src="http://choquevn.com/Upload/files/icon/637042216152443951.png" /> Bột lá cẩm tím phải pha với nước sôi nóng già, không pha với nước lạnh hoặc nước ấm cũng không lên được màu mà bắt buộc phải là nước sôi nóng già. </p><p> </p><p><img alt="" src="http://choquevn.com/Upload/files/icon/637042216152443951.png" /> Ngoài việc hòa với nước sôi, bạn có thể cho bột vào nồi khi nước đã sôi nóng già, đun khoảng 20 giây, sau đó cho ra bát đợi lên màu. </p><p> </p><p><img alt="" src="http://choquevn.com/Upload/files/icon/637042216152443951.png" /> Sau khi hòa bột với nước sôi thì phải đợi khoảng 30 phút cho bột ra hết màu thì màu lên mới đẹp. Không nên để quá lâu màu cũng sẽ bị biến đổi. </p><p> </p><p><img alt="" src="http://choquevn.com/Upload/files/icon/637042216152443951.png" /> Khi bột đã lên màu chú ý lọc bỏ phần cặn trước khi đem đi chế biến. </p><p> </p><p><img alt="" src="http://choquevn.com/Upload/files/icon/637042216152443951.png" /> Đối với món xôi bột lá cẩm thì cần phải ngâm gạo trước cho mềm, sau đó ngâm tiếp với nước cốt bột lá cẩm tím khoảng 1h cho lên màu. Trong quá trình ngâm gạo kiểm tra thấy màu ưng ý có thể vớt ra xả nhanh với nước cho sạch phần cặn còn sót lại rồi đem đi hấp chín. </p><p> </p><p><img alt="" src="http://choquevn.com/Upload/files/icon/637042216152443951.png" /> Bột lá cẩm tím khi không sử dụng hết nên bảo quản cho lần sử dụng tiếp theo. </p><p> </p><p><strong>Thành phần & công dụng có trong bột lá cẩm</strong></p><p> </p><ul>	<li>Có tác dụng kháng khuẩn, kháng nấm, có khả năng hấp thụ tia UV: </li></ul><p> </p><p>Trong bột lá cẩm có chứa thành phần chất anthocyanin, đây là một hợp chất hữu cơ có tính kháng khuẩn, kháng nấm, có khả năng hấp thụ tia UV nhằm bảo bệ tế bào da trước các tia tử ngoại độc hại từ ánh nắng mặt trời.</p><p> </p><ul>	<li>Chống lão hóa, và sự phát triển khối u, bướu: </li></ul><p> </p><p>Ngoài công dụng giúp bảo vệ da thì hợp chất anthocyanin có trong lá cẩm còn có tác dụng chống oxy hóa, ngăn ngừa sự phát triển của các khối u, hạn chế nguy cơ đột quỵ, ngăn ngừa và phòng chống nguy cơ mắc bệnh ung thư.</p><p> </p><ul>	<li>Tác dụng trị ho, cầm máu: </li></ul><p><br />Từ lâu y học cổ truyền đã chứng minh lá cẩm được dùng trong nhiều bài thuốc trị bệnh như lao phổi, ho ra máu, viêm phế quản. Do cây lá cẩm có vị ngọt, tính mát có tác dụng thanh phế nhiệt trị ho, cầm máu.</p><p> </p><p>Bột lá cẩm tím có rất nhiều loại vậy nên để chọn mua được sản phẩm bột lá cẩm tím chất lượng tốt nhất từ mùi vị, màu sắc đến chất lượng sản phẩm có nguyên chất hay không đang là sự băn khoăn của mỗi khách hàng khi mua sản phẩm. Tuy nhiên đến với công ty Chợ Quê quý khách sẽ hoàn toàn yên tâm đặt mua sản phẩm <strong>bột lá cẩm </strong>đã được kiểm nghiệm và chứng nhận từ quy trình thu hoạch, đóng gói cho đến khi quý khách nhận được hàng.</p>', CAST(60000 AS Decimal(18, 0)), N'VND', 7, 7, N'18.png')
INSERT [dbo].[SanPham] ([Id], [MetaTitle], [TenSanPham], [MoTa], [DonGia], [DonVi], [MaCC], [MaDanhMuc], [HinhAnh]) VALUES (19, NULL, N'CÔNG DỤNG CỦA LÁ NẾP - BỘT LÁ NẾP', N'<h1>Công dụng của lá nếp - bột lá nếp</h1><p><em>Với sắc xanh mướt tuyệt đẹp và hương thơm đặc trưng, lá dứa từ xưa đến nay được sử dụng rộng rãi trong ẩm thực của người Việt. Tuy nhiên đó chỉ là một phần công dụng của lá dứa mà không biết rằng lá dứa còn có công dụng tuyệt vời đối với sức khỏe. Hãy cùng tìm hiểu thật chi tiết về <strong>công dụng của lá dứa, bột lá dứa</strong> qua bài viết bạn nhé. </em></p><p> </p><p><img alt="Cộng dụng của bột lá nếp, lá dứa" src="http://choquevn.com/Upload/files/Bot%20la%20nep%20-%20la%20dua/636802885847311781.png" /></p><p> </p><p><strong>Tìm hiểu cây lá nếp (lá dứa)</strong></p><p><br />Lá nếp là loại cây nhiệt đới trong chi Pandanus, được sử dụng rộng rãi trong ẩm thực Đông Nam Á như một hương liệu.</p><p><br />Cây lá nếp (dứa thơm, nếp thơm, cây cơm nếp) mọc thành bụi, lùm cao đến 1m, thân rộng 1-3cm, chia nhánh. Lá cây lá dứa hình dài, hẹp và thẳng như lưỡi gươm tụm lại ở gốc như nan quạt, lá có mùi thơm nếp hương, không lông, xếp hình máng xối, dài 30-50cm, rộng 3-4cm, mép không gai, mặt dưới màu nhạt, mặt trên láng. Cây không có hoa.</p><p> </p><p><img alt="" src="http://choquevn.com/Upload/files/Bot%20la%20nep%20-%20la%20dua/636743928885951250.png" style="width:60%" /> </p><p> </p><p>Hình ảnh: Cây lá dứa và bột lá dứa</p><p> </p><p><strong>Công dụng của<a href="http://choquevn.com/quy-trinh-lam-bot-la-nep-bot-la-dua-dam-bao-chat-luong-vsattp-4058"> Bột lá nếp</a></strong></p><p> </p><p><strong>1. Công dụng của lá nếp - bột lá nếp trong chế biến ẩm thực </strong></p><p> </p><p>Lá nếp - bột lá nếp từ xa xưa đã được sử dụng để tạo mùi thơm và màu xanh tươi mát trong ẩm thực của người Việt.</p><p><br />Hiện nay bột lá nếp cũng được sử dụng nhiều để thay thế cho lá nếp tươi nhằm rút ngắn thời gian chế biến cũng như dễ dàng sử dụng.</p><p><br />Sử dụng bột lá nếp để tạo màu cho một số món ăn như: xôi, thạch, bánh trôi, mứt dừa, các loại bánh khác....</p><p> </p><p><img alt="" src="http://choquevn.com/Upload/files/Bot%20la%20nep%20-%20la%20dua/636743928893451173.png" style="width:60%" /></p><p> </p><p>Hình ảnh: Bánh chưng và bánh tét lá dứa</p><p> </p><p><img alt="" src="http://choquevn.com/Upload/files/Bot%20la%20nep%20-%20la%20dua/636743928886576245.png" style="width:60%" /></p><p> </p><p>Hình ảnh: Các món ăn bằng bột lá dứa</p><p> </p><p><img alt="" src="http://choquevn.com/Upload/files/Bot%20la%20nep%20-%20la%20dua/636743928887357474.png" style="width:60%" /></p><p> </p><p>Hình ảnh: Các món ăn bằng bột lá dứa</p><p> </p><p><strong>2. Công dụng tuyệt vời đối với sức khỏe của con người</strong></p><p><br />- Lá nếp giúp kích thích đổ mồ hôi, giải độc tố hiệu quả và đốt cháy lượng mỡ dư thừa ra khỏi cơ thể, giúp chăm sóc sức khỏe con người tốt hơn.</p><p><br />- Lá nếp, bột lá nếp có tác dụng giảm lượng đường trong máu và tăng cường chức năng của tim thận, giúp giảm đau đầu, viêm khớp, điều trị đau tai. </p><p><br />- <strong>Công dụng của lá nếp, bột lá nếp</strong> giúp giảm bớt cơn đau ngực, phục hồi sức khỏe của phụ nữ sau sinh và vẫn còn yếu.</p><p><br /><em> - Điều trị bệnh thấp khớp:</em><em> </em>Tinh dầu lá nếp (lá dứa) có chứa alkaloid và glycosodes - các chất giúp ích trong trị các bệnh đau khớp. Do đó, lá dứa mang lại hiệu quả trong việc xoa bóp những vùng bị sưng, đau khớp.</p><p> </p><p><em>- Hỗ trợ điều trị cho người bị thần kinh yếu: </em>Alkaloid trong tinh dầu lá nếp có khả năng kích thích hệ thần kinh. Vì thế, người bị thần kinh yếu hoặc lao động trí óc có thể bồi bổ bằng nước lá nếp để giữ cho não bộ minh mẫn, làm việc hiệu quả cao hơn. </p><p> </p><p><em>- Giảm căng thẳng, lo âu: </em>Để giảm bớt những căng thẳng lo âu trong công việc hằng ngày bạn có thể sử dụng nước sắc từ lá nếp. Vì hàm lượng trong lá nếp sẽ giúp bạn cải thiện tâm trạng của bạn hiệu quả.</p><p> </p><p><em>- Hỗ trợ điều trị cao huyết áp: </em>Lá nếp có chứa chất tannin giúp giảm lượng cholesterol trong máu, tránh cơ vữa động mạch hiệu quả. Do đó bạn chỉ cần uống 2 cốc lá nếp đun sôi mỗi ngày là có thể ngăn ngừa bị tăng huyết áp.</p><p> </p><p><em>- Tạo cảm giác ngon miệng: </em>Lá nếp được xem là nguyên liệu thích hợp với những người gầy và biếng ăn. Bữa ăn sẽ ngon miệng và bạn cảm thấy thèm ăn hơn trong các bữa ăn có tinh dầu lá nếp. </p><p> </p><p><em>- Trị gàu</em>: Khi da đầu thay lớp quá nhanh sẽ dẫn đến rối loạn và xuất hiện gàu. Tuy không phải là bệnh nguy hiểm, nhưng hiện tượng này sẽ làm mất thẩm mỹ, lấy mất sự tự tin của bạn.</p><p> </p><p><img alt="Cộng dụng của bột lá nếp, lá dứa" src="http://choquevn.com/Upload/files/Bot%20la%20nep%20-%20la%20dua/636802886282156326.png" /></p><p> </p><h3> </h3><h3><strong>3. Công dụng của lá nếp - bột lá nếp trong cuộc sống hằng ngày</strong></h3><p><br />Mùi xe ôtô đôi khi khiến người ngồi trong xe khó chịu. Với phương pháp dân gian có thể áp dụng cách khử mùi đơn giản là đặt một ít lá dứa hoặc bột lá nếp trong xe để khử mùi.</p><p><br />Hay bạn có thể khử mùi trong nhà, trong phòng, thậm chí là trong nhà vệ sinh bằng lá nếp, bột lá nếp. Mùi thơm từ bột lá nếp sẽ giúp đánh bay mùi khó chịu có trong phòng, giúp bạn sẽ cảm thấy thoải mái và thư giản mỗi khi về nhà.</p><p> </p><h2><img alt="Cộng dụng của bột lá nếp, lá dứa" src="http://choquevn.com/Upload/files/Bot%20la%20nep%20-%20la%20dua/636802886550750724.png" /></h2><p> </p><h2><strong>Mua bột lá nếp ở đâu chất lượng</strong> </h2><p> </p><p>Nếu bạn quan tâm đến <strong>bột lá nếp lá dứa nguyên chất</strong> và đang không biết tìm kiếm <strong>địa chỉ mua bột lá nếp</strong> ở đâu đảm bảo an toàn và chất lượng, hãy liên hệ ngay đến Chợ Quê. </p><p><br /><a href="http://choquevn.com/"><strong>Chợ quê Việt Nam</strong> </a>chuyên cung cấp sỉ lẻ các loại bột màu tự nhiên, được sấy khô theo công nghệ tân tiến hàng đầu, không hóa chất, không pha trộn, không chất bảo quản. Được chứng nhận vệ sinh ATTP.</p><p> </p>', CAST(70000 AS Decimal(18, 0)), N'VND', 7, 6, N'19.png')
INSERT [dbo].[SanPham] ([Id], [MetaTitle], [TenSanPham], [MoTa], [DonGia], [DonVi], [MaCC], [MaDanhMuc], [HinhAnh]) VALUES (20, NULL, N'CHỢ QUÊ BÁN SỈ, LẺ BỘT LÁ CẨM TÍM NGUYÊN CHẤT', N'<h1>Chợ quê bán sỉ, lẻ bột lá cẩm tím nguyên chất</h1><p><em>Chợ quê bán sỉ, lẻ <a href="http://choquevn.com/quy-trinh-lam-bot-la-cam-tim-cam-do-100-nguyen-chat-don-gian-tai-nha-4059"><strong>bột lá cẩm tím nguyên chất</strong></a>, cung cấp cho khách hàng với số lượng lớn bột lá cẩm tím nguyên chất cũng như các loại bột tạo màu tự nhiên để nhuộm màu tự nhiên an toàn khi làm bánh, nấu xôi, làm thạch,... đảm bảo an toàn cho sức khỏe người sử dụng.</em></p><p><br /><em><img alt="Chợ quê cung cấp, bán sỉ, lẻ bột lá cẩm" src="http://choquevn.com/Upload/files/BOT%20LA%20CAM/636640372366709840.png" style="width:85%" /></em><br /><em>Chợ quê cung cấp, bán sỉ, lẻ bột lá cẩm</em><br /> </p><h2><strong>Bột lá cẩm nguyên chất, uy tín, đảm bảo tại Chợ quê</strong></h2><p><br />Với quy trình sản xuất hiện đại, khép kín <strong>bột lá cẩm tím của Chợ Quê</strong> đảm bảo những yếu tố sau:</p><p> </p><p>- Không sử dụng chất bảo quản, không dùng tạp chất, không thêm các chất phụ gia, tạo màu tạo mùi.</p><p> </p><p>- Được cấp giấy chứng nhận đảm bảo vệ sinh an toàn thực phẩm.</p><p> </p><p>- Bột lá cẩm tím nguyên chất 100% của Chợ Quê được làm hoàn toàn từ cây lá cẩm với 2 màu sắc là cẩm tím hồng và cẩm tím Huế.</p><p> </p><p>- Bột lá cẩm có nhiều ưu điểm khi thay thế cây lá cẩm tím tươi để nhuộm màu thực phẩm, nhất là ưu điểm trong cách bảo quản và rút gọn thời gian sơ chế, dọn dẹp trong nấu nướng.</p><p> </p><p><img alt="địa chỉ bán sỉ lẻ bột lá cẩm" src="http://choquevn.com/Upload/files/bot-la-cam/636813914447855890.png" /></p><p> </p><h2><strong>Cách bảo quản bột lá cẩm tím</strong></h2><p> </p><p>- Khi sử dụng <strong>bột lá cẩm</strong> mà chưa dùng hết thì chỉ cần đem buộc chặt bột còn dư trong hũ hoặc trong túi kín.</p><p> </p><p>- Để nơi khô ráo, thoáng mát tránh ánh nắng trực tiếp mặt trời và được bảo quản tốt nhất trong tủ lạnh.</p><p> </p><p>- Bột lá cẩm có hạn sử dụng từ 6 – 12 tháng kể từ ngày sản xuất.<br /> </p><h2><strong>Bán sỉ, lẻ bột lá cẩm tím</strong><br /> </h2><p><img alt="Trang trại trồng cây lá cẩm" src="http://choquevn.com/Upload/files/BOT%20LA%20CAM/636640373516145584.png" style="width:85%" /><br /><em>Trang trại trồng cây lá cẩm</em><br /> </p><p>Với trang trại trồng cây lá cẩm có diện tích lớn và sự đầu tư quy mô về máy móc cũng như nhân công sản xuất. Chợ Quê đảm bảo cung cấp đầy đủ khối lượng sản phẩm <strong>bột lá cẩm tím nguyên chất</strong> theo khối lượng mà khách hàng yêu cầu.</p><p> </p><p>Với 2 địa chỉ bán <strong><a href="http://choquevn.com/dia-chi-ban-bot-la-cam-tim-tai-ha-noi-4220">bán bột lá cẩm</a> </strong>và các loại bột tạo màu tự nhiên khác:</p><p> </p><p><strong><em>Tại khu vực Hà Nội: </em></strong></p><p><em>- Địa chỉ mua trực tiếp tại</em> <em>Hà Nội</em></p><p><em>- Mua qua website</em>: Choquevn.com</p><p><em>- Liên hệ:</em> 0963.274.216</p><p><em>- Hình thức vận chuyển sản phẩm:</em></p><p>+ Tại các khu vực nội thành Hà Nội như các khu vực Cầu Giấy, Ba Đình, Hoàn Kiếm, Thanh Xuân, Hai Bà Trưng, Đống Đa... Quý khách có thể mua trực tiếp tại cửa hàng hoặc nếu không đến trực tiếp có thể đặt hàng chúng tôi có dịch vụ ship trong ngày.</p><p>+ Tại các khu vực ngoại thành Hà Nội như các khu vực Hà Đông, Gia Lâm, Ba Vì, Thường Tín...khi quý khách đặt hàng, Chợ Quê sẽ gửi qua bưu điện, khách hàng có thể nhận được hàng sau 1-2 ngày.</p><p><strong><em> </em></strong></p><p><strong><em>Tại khu vực TP.HCM: </em></strong></p><p><br /><em>- Địa chỉ mua trực tiếp tại Tp.HCM (Sài Gòn). </em></p><p><em>- Mua qua website:</em> Choquevn.com</p><p><em>- Liên hệ:</em> 0915.434.189</p><p><em>- Hình thức vận chuyển:</em></p><p>+ Tại các khu vực nội thành TPHCM như Quận Tân Bình, Quận Bình Thạnh, Quận Tân Phú, Quận 1, Quận 3, Quận 10, Quận 11,... Qúy khách có thể nhận hàng trong ngày qua hình thức ship. </p><p>+ Tại các khu vực ngoại thành và khu vực xa tại TPHCM như Quận 9. Quận 2, Quận 7, Huyện Bình Chánh... Hàng sẽ được vận chuyển đến tay quý khách qua đường bưu điện. </p><p> </p><p>Để đặt mua bột lá cẩm số lượng sỉ, lẻ trên toàn quốc các bạn có thể liên hệ theo số hotline hoặc truy cập vào <strong>choquevn.com</strong> để đặt hàng cũng như được sự hướng dẫn từ các bạn tư vấn viên.<br /> </p><p>Quy cách đóng gói theo yêu cầu của khách hàng vào túi tráng bạc, túi tráng nhôm, túi nilon,... được hàn kín theo các khối lượng từ: 50g, 100g, 500g,...</p><p> </p><p><img alt="địa chỉ bán sỉ lẻ bột lá cẩm " src="http://choquevn.com/Upload/files/bot-la-cam/636813914884575588.png" /></p><p> </p><h2><strong>Giá bán bột lá cẩm tím tại chợ quê</strong></h2><p><br /><strong>Giá bán bột lá cẩm tím</strong> niêm yết công khai trên toàn hệ thống gian hàng online cũng như tại cửa hàng trưng bày sản phẩm:</p><p> </p><p>- Giá bán bột lá cẩm tím 100g: 120.000VNĐ</p><p> </p><p>- Giá bán bột lá cẩm tím 1kg: 950.000VNĐ</p><p> </p><p>Chợ Quê bán sỉ, bán lẻ <strong><a href="http://choquevn.com/san-pham-moi-bot-la-cam-3513">bột lá cẩm tím</a> </strong>trên toàn quốc, nhanh tay đặt hàng để nhận được nhiều chương trình khuyến mại của Chợ quê nhé.</p>', CAST(60000 AS Decimal(18, 0)), N'VND', 7, 7, N'20.png')
INSERT [dbo].[SanPham] ([Id], [MetaTitle], [TenSanPham], [MoTa], [DonGia], [DonVi], [MaCC], [MaDanhMuc], [HinhAnh]) VALUES (21, NULL, N'BÁN BỘT LÁ KHÚC NGUYÊN CHẤT 100% ĐẢM BẢO VSATTP', N'<h1>Bán bột lá khúc nguyên chất 100% đảm bảo VSATTP</h1><p><em><strong>Chợ Quê chuyên bán bột lá khúc (bột rau khúc) khô nguyên chất 100% từ cây lá khúc </strong>tại Hà Nội, Tp.HCM (Sài Gòn) có chứng nhận VSATTP không chứa hóa chất, chất bảo quản, an toàn cho người sử dụng và hướng dẫn chi tiết cách làm món bánh khúc, xôi khúc đơn giản tiết kiệm thời gian từ bột lá khúc.</em></p><p><br /><img alt="bột lá khúc nguyên chất" src="http://choquevn.com/Upload/files/bot-la-khuc/637093115308999475.png" /></p><p> </p><h2><strong>Giới thiệu về cây lá khúc ? Cây lá khúc có mấy loại?</strong> <br /> </h2><p><strong>Tên khoa học:</strong> Gnaphalium affine D. Don (Gnaphalium multiceps Wall.) </p><p><br /><strong>Tên thường gọi:</strong> "Cây lá khúc, cây lùng khúc, cây rau khúc" cây lá khúc có 2 loại cây lá khúc nếp (rau khúc nếp), cây lá khúc tẻ (rau khúc tẻ) hay còn gọi "cây lá khúc ông, cây rau lá khúc bà", rau khúc nếp có mùi thơm hơn khúc tẻ và được nhiều người sử dụng hơn.</p><p><br /><strong>Đặc điểm cây lá khúc: </strong>Cây mọc như cây cỏ dại thường mọc ở các ruộng sau khi được cắt lúa và mọc vào mùa đông phát triển mạnh vào dịp đầu xuân, cây khúc nhìn thoáng qua sẽ rất giống với cây rau cải cúc từ cành, lá và thân cây.</p><p> </p><p><strong>Chiều cao cây khúc</strong>: Cây cao khoảng 10-15cm.</p><p> </p><p><strong>Thân cây khúc</strong>: Lúc cây khúc còn nhỏ sẽ có rất nhiều lông tơ màu trắng trên thân cây để cây có thể chống chịu được thời tiết lạnh buốt trong thời điểm cuối năm và chuẩn bị sinh trưởng và phát triển vào dịp đầu xuân. Thân cây khúc nhỏ mọng nước khi còn tươi vắt mạnh hoặc xay nhuyễn sẽ ra nhiều nước, thân cây dạng sợi rất dẻo và dai khi được chế biến khô.</p><p> </p><p><strong>Lá cây khúc</strong>: Lá dài khoảng 3-4cm, rộng 0,5- 1cm được mọc so le có hình bầu dục dài, có màu xanh lá nhạt.</p><p> </p><p><strong>Hoa cây khúc</strong>: Thường mọc thành chùm ở đỉnh ngọn cây, hoặc ở cẳng các lá cây có màu vàng nhạt.<br /> </p><p><img alt="cây lá khúc tươi" src="http://choquevn.com/Upload/files/bot-la-khuc/636674179422910103.png" /><br /><br /><strong>HÌNH ẢNH CÂY RAU KHÚC - CÂY LÁ KHÚC</strong><br /> </p><p>Cây lá khúc thường chỉ phát triển vào thời gian ngắn khoảng 4 tháng trong 1 năm nên để thuận lợi hơn cho việc chế biến món ăn "<strong>bánh khúc</strong>". Chính vì rau khúc chỉ có theo mùa nên đôi khi cần sẽ khó tìm thấy. Quý khách muốn làm bánh quanh năm có thể mua bột lá khúc thay cho lá bởi vì dùng bột sẽ thuận tiện cho việc chế biến, tăng thời gian bảo quản, và dễ vận chuyển.</p><p> </p><h2><strong>Đặc điểm bột lá khúc</strong></h2><p> </p><p>Màu xanh bạc và có mùi thơm đặc trưng của cây khúc, sau khi được làm khô và chế biến thành dạng bột rất nhẹ và bông tơi khó thấm nước nên khi pha bột lá khúc vào nước cần khuấy đều khoảng 3-5 phút nước mới ngấm đều được vào bột. </p><h2><br /><strong>Công dụng bột lá khúc khô</strong><br /><br /><strong>1. Tác dụng trong chế biến thực phẩm</strong></h2><p> </p><p>Bột lá khúc có tác dụng làm món bánh khúc, hoặc món xôi lá khúc, một trong những món ăn được mọi người rất yêu thích với mùi vị đặc trưng rất hấp dẫn từ cây lá khúc. Món bánh dân dã có thể là món ăn sáng lót dạ tuyệt vời, cũng có thể làm món ăn khuya trong những ngày mùa đông rét mướt. </p><p> </p><p>Trước kia mọi người sử dụng lá khúc tươi nhiều hơn nhưng lại tốn rất nhiều công sức bỏ ra trong khâu chế biến và lá khúc chỉ có theo mùa nên đôi khi cần không có. Hiện nay bột lá khúc được chế biến nhằm rút ngắn được rất nhiều thời gian chế biến lại rất tiện lợi khi sử dụng. </p><p><br /><img alt="bánh khúc, xôi bột lá khúc" src="http://choquevn.com/Upload/files/bot%20la%20khuc/636827765544742328.png" /><br /><br /><strong>RAU KHÚC LÀM BÁNH - BỘT LÁ KHÚC LÀM BÁNH</strong></p><p> </p><p><strong>2. Tác dụng của lá khúc trong y học: </strong><br /> </p><p>Theo Đông y, rau khúc có vị ngọt, tính bình, không độc đi vào kinh phế. Có tác dụng hóa đàm, trừ phong hàn. Dùng chữa ho nhiều đờm, suyễn thở, cảm lạnh phát sốt, đau gân cốt, mạch đới, ung thũng. </p><p> </p><p>Bên cạnh đó cây ra khúc còn chứa nhiều thành phần như scopoletin, quercetin, luteolin các chất này có tác dụng ức chế ngưng tiểu cầu.</p><p> </p><p><em><strong>Một số bài thuốc sử dụng rau khúc: </strong></em></p><p> </p><p><em>+ Điều trị cảm lạnh,phát sốt, ho:</em> Rau khúc khô 15- 20g (hoặc 30- 40g tươi), sắc lấy nước uống trong ngày, có thể thêm tía tô, kinh giới, mỗi thứ 9g, sắc cùng để tăng công dụng. </p><p> </p><p><em>+ Điều trị chữa cảm nắng, phát sốt, ho: </em>Rau khúc khô 30g, thanh cao 15g, bạc hà 9g, sắc lấy nước uống trong ngày. </p><p> </p><p><em>+ Điều trị chữa ho, viêm họng: </em>30g rau khúc, 5g củ rẻ quạt, 50g diếp cá. Sắc uống ngày 1 thang. Chữa hen suyễn: 30g rau khúc, 20g lá bồng bồng, 15g, cam thảo đất. Sắc uống ngày 1 thang, chia 2, 3 lần. Chữa tăng huyết áp: 30g rau khúc, lá dâu 20g. Nấu canh hằng ngày.</p><p> </p><p><em>+ Điều trị ho nhiều đờm: </em>Rau khúc khô 15- 20g, đường phèn 15- 20g, sắc nước uống trong ngày. </p><p> </p><p><em>+ Điều trị đầy bụng, tiêu chảy:</em> Rau khúc khô 30- 60g, kê nội kim (màng mề gà) 1 cái, sắc lấy nước uống trong ngày. </p><p> </p><p><em>+ Điều trị đau nhức do thống phong </em>(Gut - Guoty Arthiritis): Dùng lá và cành non cây rau khúc, rửa sạch, giã nát đắp vào chỗ đau sưng, băng cố định lại, có tác dụng giảm đau. </p><p> </p><p><em>+ Điều trị vết thương sưng tấy, vết thương không liền miệng: </em>Rau khúc khô 30g, sắc nước uống trong ngày, đồng thời giã lá rau khúc tươi trộn giã nát đắp lên vết thương.<br /> </p><p><img alt="công dụng cây lá khúc trong y học" src="http://choquevn.com/Upload/files/bot%20la%20khuc/637123421751768621.png" /></p><p> </p><h2><strong>Cách sử dụng bột lá khúc làm bánh</strong></h2><h3> </h3><h3><strong>Cách dùng bột lá khúc</strong></h3><p> </p><p><strong>Bột </strong>lá khúc được xay nhỏ ở dạng khô mịn nên cách sử dụng đơn giản như các loại bột tạo màu khác. Bạn không cần phải tốn quá nhiều thời gian trong khâu chế biến. </p><p> </p><p>Về cách sử dụng: Hòa bột lá khúc với lượng nước lọc vừa đủ, khuấy đều cho tan bột, sau đó đem phần nước cốt đi nhào cùng bột gạo nếp để làm vỏ bánh.</p><p> </p><h2><strong>Hướng dẫn làm bánh khúc ngon chuẩn vị</strong></h2><h2><br /><strong><img alt="" src="http://choquevn.com/Upload/files/icon/637042054196315310.png" /> <em>Nguyên liệu chuẩn bị làm vỏ bánh khúc</em></strong><em>:</em><br /> </h2><p><img alt="" src="http://choquevn.com/Upload/files/icon/637042882485440899.png" /> 500gr gạo nếp</p><p><img alt="" src="http://choquevn.com/Upload/files/icon/637042882485440899.png" /> 300gr bột nếp</p><p><img alt="" src="http://choquevn.com/Upload/files/icon/637042882485440899.png" /> 15-17gr bột lá khúc</p><p><img alt="" src="http://choquevn.com/Upload/files/icon/637042882485440899.png" /> 1/2 muỗng cà phê muối<br /> </p><h2><strong><img alt="" src="http://choquevn.com/Upload/files/icon/637042054196315310.png" /> </strong><em><strong>Nguyên liệu chuẩn bị làm nhân bánh khúc: </strong></em></h2><p><strong> </strong></p><p><img alt="" src="http://choquevn.com/Upload/files/icon/637042882485440899.png" /> 100gr thịt lợn (thịt heo)</p><p><img alt="" src="http://choquevn.com/Upload/files/icon/637042882485440899.png" /> 200gr đậu xanh (đã được xay, tách vỏ)</p><p><img alt="" src="http://choquevn.com/Upload/files/icon/637042882485440899.png" /> Hành lá 1 muỗng cà phê</p><p><img alt="" src="http://choquevn.com/Upload/files/icon/637042882485440899.png" /> Nước mắm 1/2 muỗng cà phê</p><p><img alt="" src="http://choquevn.com/Upload/files/icon/637042882485440899.png" /> Muối 1 nhúm hạt tiêu (đã xay nhỏ)</p><p><img alt="" src="http://choquevn.com/Upload/files/icon/637042882485440899.png" /> Hành phi, chà bông</p><p><br /><img alt="nguyên liệu chuẩn bị nấu món bánh khúc" src="http://choquevn.com/Upload/files/bot-la-khuc/636737430459228702.png" /><br /><strong>NGUYÊN LIỆU LÀM BÁNH KHÚC - XÔI KHÚC</strong><br /> </p><h2><strong><img alt="" src="http://choquevn.com/Upload/files/icon/637042054196315310.png" />  Cách làm món bánh khúc, xôi khúc hấp dẫn, bắt mắt</strong></h2><p><strong> </strong></p><p><strong>Bước 1:</strong> Rửa sạch gạo nếp và đậu xanh, cho nước vào nồi để ngâm gạo và ngâm đậu xanh, ngâm ngập nước khoảng 3-4 tiếng đợi cho đến khi gạo và đậu xanh nở và mềm ra trước khi đem đi nấu sẽ nhanh hơn (chế biến).</p><p> </p><p><strong>Bước 2:</strong> Hòa bột lá khúc cùng với nước lọc với lượng nước vừa đủ, khuấy đều, sau đó lọc qua rây lấy nước cốt và trộn với bột bánh. </p><p><img alt="pha bột lá khúc" src="http://choquevn.com/Upload/files/bot-la-khuc/636654922100385196.png" /></p><p><strong>Bước 3:</strong> Nhào bột cùng với nước lá khúc, nêm thêm 1 chút muối, dầu ăn, nhào đều tay để bột bánh và nước bột lá khúc được hòa quyện đều vào nhau cho đến khi bột vừa nhuyễn vừa dẻo (chú ý: không nên pha quá nhiều nước, hoặc quá ít nước dẫn đến bột bị khô hoặc nhão sẽ ảnh hưởng đến công đoạn nặn và chất lượng của bánh)<br /> </p><p><img alt="nhào bột lá khúc với bột bánh" src="http://choquevn.com/Upload/files/bot-la-khuc/636654498950805017.png" /><br /> </p><p><strong>Bước 4:</strong> Nấu chín đậu xanh, dùng chày nghiền nhuyễn đậu khi còn nóng.<br /> </p><p><img alt="giã nhuyễn nhân đậu xanh" src="http://choquevn.com/Upload/files/bot-la-khuc/636663572212857555.png" /><br /> </p><p><strong>Bước 5:</strong> Cắt nhỏ thịt heo, ướp sơ với nước mắm, hành, tiêu khoảng 30p rồi xào thịt cho đến khi săn lại.</p><p> </p><p><strong>Bước 6:</strong> Cho đậu xanh đã nghiền nhuyễn vào trộn đều với thịt heo.<br /> </p><p><img alt="nhào đậu xanh với thịt lợn" src="http://choquevn.com/Upload/files/bot-la-khuc/636663575197508267.png" /></p><p><strong>Bước 7:</strong> Nặn phần bột và nhân thành những viên tròn nhỏ, đều nhau.<br /> </p><p><img alt="nặn nhân bánh khúc" src="http://choquevn.com/Upload/files/bot-la-khuc/636663577176701471.png" /></p><p><strong>Bước 8:</strong> Cho viên bột vào lòng bàn tay, ấn dẹt rồi cho nhân vào vo viên.<br /> </p><p><img alt="nặn bột bánh khúc" src="http://choquevn.com/Upload/files/bot-la-khuc/636654492709518036.png" /></p><p><strong>Bước 9:</strong> Gạo nếp đã rửa sạch, để ráo rồi phủ thật kín viên bánh.<br /> </p><p><img alt="phủ gạo lên bánh" src="http://choquevn.com/Upload/files/bot-la-khuc/636797486524485032.png" /><br /> </p><p><strong>Bước 10:</strong> Xếp bánh vào nồi, hấp bánh cho đến khi thấy gạo nếp đã chín mềm khoảng 45 phút là được. Xôi chín cho ra đĩa rắc hành phi lên và bạn có thể ăn kèm cùng chút chà bông. </p><p><br /><br /><img alt="bánh khúc đã chín" src="http://choquevn.com/Upload/files/bot-la-khuc/636797487023236339.png" /><br /><br /><strong>BÁNH KHÚC</strong></p><p> </p><p><strong><img alt="cho bánh khúc ra đĩa" src="http://choquevn.com/Upload/files/bot-la-khuc/636797487329174287.png" /></strong></p><p> </p><p><img alt="trang trí đĩa bánh khúc" src="http://choquevn.com/Upload/files/bot-la-khuc/636797487767612786.png" /></p><p> </p><p>Trang trí đĩa bánh khúc</p><p> </p><p><strong><em><img alt="" src="http://choquevn.com/Upload/files/icon/note/637042923571935471.png" /> Lưu ý khi sử dụng bôt lá khúc: </em></strong></p><p> </p><p><img alt="" src="http://choquevn.com/Upload/files/icon/637042216152443951.png" /> Lượng bột khúc có thể điều chỉnh liều lượng bột đậm nhạt cho bánh khúc tùy vào từng khẩu vị của người ăn trong mỗi lần làm bánh. </p><p> </p><p><img alt="" src="http://choquevn.com/Upload/files/icon/637042216152443951.png" /> Không trộn trực tiếp bột lá khúc với bột bánh.</p><p><br /><img alt="" src="http://choquevn.com/Upload/files/icon/637042216152443951.png" /> Hòa bột lá khúc với lượng nước vừa đủ để nhào cùng bột, không nên hòa quá nhiều nước bột sẽ bị nhão.</p><p><br /><img alt="" src="http://choquevn.com/Upload/files/icon/637042216152443951.png" /> Đổ từ từ lượng nước cốt bột lá khúc vào nhào cùng bột tránh đổ hết phần nước cốt một lúc bột sẽ bị nhão.</p><p><br /><img alt="" src="http://choquevn.com/Upload/files/icon/637042216152443951.png" /> Tùy từng loại bột có độ hút nước khác nhau, nếu sau khi nhào hết phần nước cốt hoa đậu biếc, bột vẫn còn khô thì đổ thêm nước lọc vào nhào cùng.</p><p><br /><img alt="" src="http://choquevn.com/Upload/files/icon/637042216152443951.png" /> Nên bảo quản bột nơi khô ráo, hoặc bảo quản trong tủ lạnh là tốt nhất. Nên buộc kín trước khi cất tránh để bột bị ẩm mốc ảnh hưởng tới chất lượng.</p><p> </p><p><strong>Giá bán bột lá khúc: </strong><br /> </p><p><strong>=> Giá lẻ bột lá khúc</strong>: 95.000VNĐ/100g</p><p><strong>=> Giá bán 1kg bột lá khúc</strong> : 750.000 VNĐ/1kg</p><p><strong>=> Giá bán sỉ 3kg bột lá khúc</strong>: 550.000VNĐ/1kg<br /> </p><h2><strong>Địa chỉ bán bột lá khúc? Mua lá khúc, rau khúc, bột lá khúc ở đâu?</strong><br /> </h2><p><strong>Mua </strong>lá khúc nguyên chất chất lượng ở đâu nếu như quý khách hàng có nhu cầu cần về sử dụng thì hãng liên hệ ngay đến Chợ Quê. Chúng tôi chuyên cung cấp các mặt hàng bột màu nói chung và bột lá khúc nói riêng nhằm phục vụ tốt nhất cho quý khách hàng có nhu cầu sừ dụng. </p><p> </p><p>Sản phẩm bột lá khúc của Chợ Quê được sản xuất theo quy trình chế biến hiện đại, dựa theo công nghệ tiên tiến, thành phẩm sau khi được sản xuất ở dạng bột khô, thời gian bảo quản được lâu hơn dễ dàng sử dụng hơn rất nhiều lần, không mất nhiều. </p><p> </p><p>Nếu bạn có nhu cầu mua bột lá khúc thì hãy liên hệ ngay đến Chợ Quê để sở hữu được những gói bột lá khúc thơm ngon để nấu bánh khúc, xôi khúc. </p><p> </p><p><strong>+ Bán bột lá khúc tại Hà Nội</strong>: 0967.694.021 hỗ trợ 24/7</p><p><strong>+ Bán bột lá khúc tại Tp.HCM </strong>(sài gòn): 0915.434.189 hỗ trợ 24/7</p><p><strong>+ Mua lá khúc, rau khúc, bột lá khúc ở Sài Gòn</strong> (tphcm) theo Hotline: 0915.731.468</p><p><strong>+ Mua lá khúc, rau khúc, bột lá khúc ở Hà Nội</strong> theo Hotline: 0963.274.216</p>', CAST(60000 AS Decimal(18, 0)), N'VND', 7, 10, N'21.png')
SET IDENTITY_INSERT [dbo].[SanPham] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__KhachHan__D5B8C7F09C7B5368]    Script Date: 20/12/2019 11:53:10 PM ******/
ALTER TABLE [dbo].[KhachHang] ADD UNIQUE NONCLUSTERED 
(
	[TaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ChiTietHoaDon] ADD  DEFAULT ((0)) FOR [SoLuongDaGiao]
GO
ALTER TABLE [dbo].[HoaDon] ADD  DEFAULT (N'Đã tiếp nhận') FOR [GiaiDoanGiaoHang]
GO
ALTER TABLE [dbo].[HopDong] ADD  DEFAULT ((0)) FOR [TienDatCoc]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FkChiTietHoaDon] FOREIGN KEY([MaHoaDon])
REFERENCES [dbo].[HoaDon] ([MaHoaDon])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FkChiTietHoaDon]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FkChiTietHoaDonSanPham] FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([Id])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FkChiTietHoaDonSanPham]
GO
ALTER TABLE [dbo].[ChiTietHopDong]  WITH CHECK ADD  CONSTRAINT [FkChiTietHopDong] FOREIGN KEY([MaHopDong])
REFERENCES [dbo].[HopDong] ([Id])
GO
ALTER TABLE [dbo].[ChiTietHopDong] CHECK CONSTRAINT [FkChiTietHopDong]
GO
ALTER TABLE [dbo].[ChiTietHopDong]  WITH CHECK ADD  CONSTRAINT [FkChiTietHopDongSanPham] FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([Id])
GO
ALTER TABLE [dbo].[ChiTietHopDong] CHECK CONSTRAINT [FkChiTietHopDongSanPham]
GO
ALTER TABLE [dbo].[DeXuat]  WITH CHECK ADD  CONSTRAINT [FkDeXuatNguoiDung] FOREIGN KEY([MaNguoiDeXuat])
REFERENCES [dbo].[NguoiDung] ([Id])
GO
ALTER TABLE [dbo].[DeXuat] CHECK CONSTRAINT [FkDeXuatNguoiDung]
GO
ALTER TABLE [dbo].[DeXuat]  WITH CHECK ADD  CONSTRAINT [FkDeXuatNguoiDung1] FOREIGN KEY([MaNguoiXacNhan])
REFERENCES [dbo].[NguoiDung] ([Id])
GO
ALTER TABLE [dbo].[DeXuat] CHECK CONSTRAINT [FkDeXuatNguoiDung1]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FkHoaDonKhachHang] FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[KhachHang] ([Id])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FkHoaDonKhachHang]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FkHoaDonNguoiDung] FOREIGN KEY([MaNguoiDung])
REFERENCES [dbo].[NguoiDung] ([Id])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FkHoaDonNguoiDung]
GO
ALTER TABLE [dbo].[HopDong]  WITH CHECK ADD  CONSTRAINT [FkHopDongKhachHang] FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[KhachHang] ([Id])
GO
ALTER TABLE [dbo].[HopDong] CHECK CONSTRAINT [FkHopDongKhachHang]
GO
ALTER TABLE [dbo].[HopDong]  WITH CHECK ADD  CONSTRAINT [FkHopDongNguoiDung] FOREIGN KEY([MaNhanVien])
REFERENCES [dbo].[NguoiDung] ([Id])
GO
ALTER TABLE [dbo].[HopDong] CHECK CONSTRAINT [FkHopDongNguoiDung]
GO
ALTER TABLE [dbo].[HopDong]  WITH CHECK ADD  CONSTRAINT [FkHopDongNguoiDung1] FOREIGN KEY([MaGiamDoc])
REFERENCES [dbo].[NguoiDung] ([Id])
GO
ALTER TABLE [dbo].[HopDong] CHECK CONSTRAINT [FkHopDongNguoiDung1]
GO
ALTER TABLE [dbo].[NguoiDung]  WITH CHECK ADD  CONSTRAINT [FkNguoiDungLoaiTaiKhoan] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[LoaiTaiKhoan] ([Id])
GO
ALTER TABLE [dbo].[NguoiDung] CHECK CONSTRAINT [FkNguoiDungLoaiTaiKhoan]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FkSanPhamDanhMucSanPham] FOREIGN KEY([MaDanhMuc])
REFERENCES [dbo].[DanhMucSanPham] ([Id])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FkSanPhamDanhMucSanPham]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FkSanPhamNhaCungCap] FOREIGN KEY([MaCC])
REFERENCES [dbo].[NhaCungCap] ([Id])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FkSanPhamNhaCungCap]
GO
USE [master]
GO
ALTER DATABASE [BanHangDoGo] SET  READ_WRITE 
GO
