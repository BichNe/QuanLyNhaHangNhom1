﻿CREATE DATABASE QuanLyNhaHang;
GO
USE QuanLyNhaHang;
GO

CREATE TABLE Ban
(
    MaBan VARCHAR(10) PRIMARY KEY,
    TenBan NVARCHAR(50) NOT NULL,
    ViTri NVARCHAR(100) NOT NULL,
    TrangThai BIT NOT NULL
);

CREATE TABLE NhanVien
(
    MaNV VARCHAR(10) PRIMARY KEY,
    TenNV NVARCHAR(30) NOT NULL,
    MatKhau VARCHAR(30) NOT NULL,
    DiaChi NVARCHAR(255) NULL,
    SDT VARCHAR(15) NULL,
    Email VARCHAR(30) NULL,
    NgaySinh DATE NULL,
    GioiTinh BIT NOT NULL,
    AnhNV VARCHAR(30) NOT NULL,
    VaiTro BIT NOT NULL,
    TrangThai BIT NOT NULL,
);

CREATE TABLE SuKienKhuyenMai
(
    MaSKKM INT IDENTITY(1, 1) PRIMARY KEY,
    TenSKKM NVARCHAR(30) NOT NULL,
    GiaTriKM DECIMAL(5, 2) NOT NULL,
    NgayBatDau DATE NOT NULL,
    NgayKetThuc DATE NOT NULL,
    NgayTao DATE
        DEFAULT GETDATE(),
    MaNV VARCHAR(10) NOT NULL,
    TrangThai BIT NOT NULL,
    FOREIGN KEY (MaNV) REFERENCES dbo.NhanVien (MaNV),
);


CREATE TABLE KhachHang
(
    MaKH INT IDENTITY(1,1) PRIMARY KEY,
    TenKH NVARCHAR(50) NOT NULL,
    SDT VARCHAR(15) NULL,
    Email VARCHAR(30) NULL,
    NgaySinh DATE NULL,
    GioiTinh BIT NOT NULL,
	MaNV VARCHAR(10),
    TrangThai BIT NOT NULL,
	FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV)
);

CREATE TABLE LoaiSanPham
(
    MaLoaiSP VARCHAR(10) PRIMARY KEY,
    TenLoaiSP NVARCHAR(30) NOT NULL,
);
CREATE TABLE LoaiThucPham
(
    MaLoaiTP VARCHAR(10) PRIMARY KEY,
    TenLoaiTP NVARCHAR(30) NOT NULL,
);


CREATE TABLE ThucPham
(
    MaTP INT IDENTITY(1,1) PRIMARY KEY,
    MaLoaiTP VARCHAR(10) NOT NULL,
    TenTP NVARCHAR(30) NOT NULL,
    NgayNhap DATE NOT NULL,
    GiaNhap MONEY NOT NULL,
    SoLuong INT NOT NULL,
    DonViTinh NCHAR(20) NOT NULL,
    MaNV VARCHAR(10) NOT NULL,
    NCC VARCHAR(100) NOT NULL,
    GhiChu NVARCHAR(30) NOT NULL,
    TrangThai BIT NOT NULL,
    FOREIGN KEY (MaNV) REFERENCES dbo.NhanVien (MaNV),
    FOREIGN KEY (MaLoaiTP) REFERENCES dbo.LoaiThucPham (MaLoaiTP),
);

CREATE TABLE SanPham
(
    MaSP VARCHAR(10) PRIMARY KEY,
    MaLoaiSP VARCHAR(10) NOT NULL,
    TenSanPham NVARCHAR(30) NOT NULL,
    DonGia MONEY NOT NULL,
    DonViTinh NCHAR(20) NOT NULL,
    AnhSP VARCHAR(30) NOT NULL,
    MaNV VARCHAR(10) NOT NULL,
    ChiTiet NVARCHAR(50) NULL,
    TrangThai BIT NOT NULL,
    FOREIGN KEY (MaNV) REFERENCES dbo.NhanVien (MaNV),
    FOREIGN KEY (MaLoaiSP) REFERENCES dbo.LoaiSanPham (MaLoaiSP),
);

CREATE TABLE HoaDon
(
    MaHD INT IDENTITY(1, 1) PRIMARY KEY,
    MaKH INT NOT NULL,
    NgayTao DATE NOT NULL,
    GhiChu NVARCHAR(50) NULL,
    MaNV VARCHAR(10) NOT NULL,
    MaSKKM INT NOT NULL,
    MaBan VARCHAR(10) NOT NULL,
    TrangThai BIT NOT NULL,
    FOREIGN KEY (MaKH) REFERENCES dbo.KhachHang (MaKH),
    FOREIGN KEY (MaNV) REFERENCES dbo.NhanVien (MaNV),
    FOREIGN KEY (MaSKKM) REFERENCES dbo.SuKienKhuyenMai (MaSKKM),
    FOREIGN KEY (MaBan) REFERENCES dbo.Ban (MaBan),
);

CREATE TABLE HoaDonChiTiet
(	MaHD INT NOT NULL,
    MaSP VARCHAR(10) NOT NULL,
    SoLuong INT NOT NULL,
	Gia MONEY NOT NULL,
    TrangThai BIT NOT NULL,
	PRIMARY KEY(MaHD,MaSP),
    FOREIGN KEY (MaHD) REFERENCES dbo.HoaDon (MaHD),
	FOREIGN KEY (MaSP) REFERENCES dbo.SanPham(MaSP)
);
insert into NhanVien values ('Ok03',N'Nguyễn Bích','123',N'Hà Nội','0368721339','bichntph17469@fpt.edu.vn','2002-09-09',1,'logos.jpg',1,1);
insert into NhanVien values ('Ok04',N'Nguyễn Hà','123',N'Hà Nội','0368721338','bichntph17469@fpt.edu.vn','2002-09-07',1,'logos.jpg',1,1);
select*from nhanVien;

insert khachHang values(N'Nguyễn Thúy Linh', '036872130','linhntph17474@fpt.edu.vn','2002-09-27',1,'OK03',1);
select*from khachHang;
