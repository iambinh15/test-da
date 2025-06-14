 	
create database du_An1
use du_An1

create table nxb(
	id_NXB int identity(1,1) primary key not null,
	tenNhaXuatBan nvarchar(255) not null,
	ngayThem date,
	ngaySua date,
	trangThai bit
)
create table tacGia(
	id_TacGia int identity(1,1) primary key not null,
	tenTacGia nvarchar(255) not null,
	ngayThem date,
	ngaySua date,
	trangThai bit
)
create table nhaCungCap(
	id_NhaCungCap int identity(1,1) primary key not null,
	tenNhaCungCap nvarchar(255) not null,
	ngayThem date,
	ngaySua date,
	trangThai bit
)
create table TheLoai(
	id_TheLoai int identity(1,1) primary key not null,
	tenTheLoai nvarchar(128) not null,
	ngayThem date,
	ngaySua date,
);
create table sanPham(
	id_SanPham int identity(1,1) primary key not null,
	tenSanPham nvarchar(255) not null,
	ngayTao date not null,
	ngaySua date,
)
create table SanPhamChiTiet(
	id_SanPhamChiTiet int identity(1,1) primary key not null,
	id_NXB int,
	id_TacGia int,
	id_NhaCungCap int,
	id_SanPham int,
	theLoai nvarchar(255) not null,
	giaBan float not null,
	soLuong int not null,
	ngayTao date not null,
	ngaySua date ,
	trangThai bit not null,
	foreign key(id_NXB) references nxb(id_NXB),
	foreign key(id_TacGia) references tacGia(id_TacGia),
	foreign key(id_NhaCungCap) references nhaCungCap(id_NhaCungCap),
	foreign key(id_SanPham) references sanPham(id_SanPham),
);

create table khachHang(
	id_KhachHang int identity(1,1) primary key,
	tenKhachHang nvarchar(255) not null,
	gioiTinh bit ,
	sdt nvarchar(15) unique not null,
	ngayThem date not null,
	ngaySua date,
	trangThai bit not null
)
create table nhanVien(
	id_NhanVien int identity(1,1) primary key,
	userName varchar(64) unique not null,
	password varchar(128) not null,
	tenNhanVien nvarchar(255) not null,
	gioiTinh bit not null,
	email varchar(128) unique,
	sdt varchar(15) unique,
	ngayTao date not null,
	ngaySua date,
	trangThai bit not null,
	vaitro bit not null
)
create table CTKM_HoaDon(
	id_CTKM_HoaDon int identity(1,1) primary key,
	tenCTKM nvarchar(128) not null,
	giaTriGiam int not null,
	soLuong int not null,
	hoaDonToiThieu float not null,
	ngayBatDau date not null,
	ngayKetThuc date not null,
	trangThai bit,
) 
create table hoaDon(
	id_hoaDon int identity(1,1) primary key,
	id_KhachHang int ,
	id_NhanVien int,
	id_CTKM_HoaDon int,
	phuongThucThanhToan bit ,
	tienHang float ,
	chietKhau float,
	tongTien float,
	ngayTao date ,
	ngaySua date,
	trangThai bit default(0),
	foreign key(id_KhachHang) references khachHang(id_KhachHang),
	foreign key(id_NhanVien) references nhanVien(id_NhanVien), 
	foreign key(id_CTKM_HoaDon) references CTKM_HoaDon(id_CTKM_HoaDon), 
)

create table hoaDonChiTiet(
	id_HoaDonChiTiet int identity(1,1) primary key,
	id_HoaDon int,
	id_SanPhamChiTiet int,
	giaBan bigint not null,
	soLuong int not null,
	foreign key(id_HoaDon) references hoaDon(id_HoaDon),
	foreign key(id_SanPhamChiTiet) references SanPhamChiTiet(id_SanPhamChiTiet)
)


insert into khachHang(tenKhachHang, gioiTinh, sdt,ngayThem,trangThai)
		values(N'Nguyen Minh Tu',1,'0334921271', GETDATE(),1),
			(N'Ngo Ngoc Khai',1,'0334821271', GETDATE(),1),
			(N'Pham Duc Duy',0,'0335921271', GETDATE(),1)

insert into nhanVien(userName, password, tenNhanVien, gioiTinh, email, sdt,ngayTao, trangThai, vaitro )
			values('h1', 'h1', N'Nguyen Xuan Hoang', 1, 'maket28122004@gmail.com', '0334921271', GETDATE(),1, 1),
			('t1', 't1', N'Nguyen Manh Tuan', 1, 'tuan1@gmail.com', '0334954545', GETDATE(),1, 1),
			('huy1', 'huy1', N'Nguyen Duc Huy', 0, 'huy1@gmail.com', '033543543', GETDATE(),1, 0)
		
insert into nxb(tenNhaXuatBan,trangThai)
		VALUES  (N'NXB Tuoi Tre',1),
				(N'NXB Kim Dong',1),
				(N'NXB PHu Nu',1)

insert into nhaCungCap(tenNhaCungCap,trangThai)
VALUES(N'NS Fahasa',1),
		(N'NS Tien Tho',1),
		(N'NS Booksquare',1)

insert into tacGia(tenTacGia,trangThai)
VALUES(N'To Huu',1),
		(N'To Hoai',1),
		(N'Nam Cao',1)
		
insert into sanPham(tenSanPham,ngayTao)
  VALUES(N'Sach Ngu Van', getDate()),
		(N'Sach Toan',getDate()),
		(N'Sách Tieng Anh',getDate())

insert into TheLoai(tenTheLoai)
		values(N'Thần thoại'),
		(N'Truyền thuyết'),
		(N'Cổ tích'),
		(N'Sử thi'),
		(N'Truyện cười'),
		(N'Ca dao'),
		(N'Kinh Dị'),
		(N'Đời Sống'),
		(N'Viễn Tưởng'),
		(N'Anime'),
		(N'Ký sự')
		
		
insert into CTKM_HoaDon(tenCTKM, giaTriGiam, soLuong, ngayBatDau,ngayKetThuc, trangThai,hoaDonToiThieu)
			values	
					(N'HoaDon>500k', 100000, 10, GETDATE(),GETDATE()+3, 1,500000),
					(N'HoaDon>1tr', 200000, 20, GETDATE()+3,GETDATE()+6, 1,1000000),
					(N'HoaDon>1tr5', 300000, 30, GETDATE()+6,GETDATE()+9, 1,1500000)
UPDATE CTKM_HoaDon
SET trangThai = CASE
    WHEN ngayBatDau > GETDATE() THEN 0
    WHEN ngayKetThuc < GETDATE() THEN 0
    ELSE 1
END;
select * from CTKM_HoaDon
insert into SanPhamChiTiet(id_NXB, id_TacGia,id_NhaCungCap, id_SanPham,theLoai, giaBan, soLuong, ngayTao, trangThai )
values(1,1,1,1,N'Thần Thoại',100000,200,getdate(),1),
(2,2,2,2,N'Văn Học',200000,300,getdate(),1),
(3,3,3,3,N'Lịch Sử',300000,400,getdate(),1)





--Select 
select SanPhamChiTiet.id_SanPhamChiTiet,sanPham.id_SanPham, sanPham.tenSanPham, nxb.tenNhaXuatBan, nhaCungCap.tenNhaCungCap, tacGia.tenTacGia,TheLoai, giaBan, soLuong, sanPhamChiTiet.ngayTao,sanPhamChiTiet.ngaySua, sanPhamChiTiet.trangThai
from tacGia inner join SanPhamChiTiet on tacGia.id_TacGia = SanPhamChiTiet.id_TacGia
join nhaCungCap on nhaCungCap.id_NhaCungCap = SanPhamChiTiet.id_NhaCungCap
join nxb on nxb.id_NXB = SanPhamChiTiet.id_NXB
join sanPham on sanPham.id_SanPham = SanPhamChiTiet.id_SanPham

		select * from SanPhamChiTiet
		select * from TheLoai
		SELECT * FROM nxb
		SELECT * FROM nhaCungCap
		SELECT * FROM tacGia
		SELECT * FROM sanPham
		select * from khachHang where sdt like 123
		select * from CTKM_HoaDon

select SanPhamChiTiet.id_SanPhamChiTiet, sanPham.tenSanPham, giaBan, soLuong 
from SanPhamChiTiet join sanPham on sanPham.id_SanPham = SanPhamChiTiet.id_SanPham 

-------
insert into nxb(tenNhaXuatBan, ngayThem, trangThai)

select SanPhamChiTiet.id_SanPhamChiTiet, sanPham.tenSanPham, giaBan, soLuong 
from SanPhamChiTiet join sanPham on sanPham.id_SanPham = SanPhamChiTiet.id_SanPham 
where tenSanPham like ?  and SanPhamChiTiet.trangThai like 1

select id_hoaDon, nhanVien.tenNhanVien, khachHang.tenKhachHang,hoaDon.ngayTao, hoaDon.trangThai
from nhanVien join hoaDon on nhanVien.id_NhanVien = hoaDon.id_NhanVien
join khachHang on khachHang.id_KhachHang = hoaDon.id_KhachHang
where hoaDon.trangThai like 0


select * from hoaDon
insert into hoaDon(id_NhanVien, id_KhachHang, ngayTao, trangThai)
				values(1,1,GETDATE(),1)
delete hoaDonChiTiet
where id_HoaDon like ?
delete hoaDon
where id_hoaDon like ?



select hoaDonChiTiet.id_SanPhamChiTiet, sanPham.tenSanPham, hoaDonChiTiet.soLuong, hoaDonChiTiet.giaBan, hoaDonChiTiet.soLuong * hoaDonChiTiet.giaBan 
from sanPham join SanPhamChiTiet on sanPham.id_SanPham = SanPhamChiTiet.id_SanPham
join hoaDonChiTiet on hoaDonChiTiet.id_SanPhamChiTiet = SanPhamChiTiet.id_SanPhamChiTiet
where hoaDonChiTiet.id_HoaDon = 61
select * from sanPham
select * from hoaDon
select * from hoaDonChiTiet
select * from CTKM_HoaDon
select * from SanPhamChiTiet
insert into hoaDonChiTiet(id_HoaDon, id_SanPhamChiTiet, soLuong, giaBan)
			values(?,?,?,(select giaBan from SanPhamChiTiet where id_SanPhamChiTiet like ? ))
select * from hoaDonChiTiet

update SanPhamChiTiet
set soLuong = soLuong - ?, 
where id_SanPhamChiTiet like ?

update hoaDonChiTiet
set soLuong = soLuong + ?
where hoaDonChiTiet.id_HoaDon like ? and hoaDonChiTiet.id_SanPhamChiTiet like ?

delete hoaDonChiTiet
where hoaDonChiTiet.id_HoaDon like ? and hoaDonChiTiet.id_SanPhamChiTiet like ?

select * from hoaDonChiTiet
update hoaDon
set phuongThucThanhToan = ?,tienHang=?, chietKhau = ?, tongTien = ?, ngaySua = GETDATE()
where id_hoaDon like ?

update hoaDon
set trangThai = ?
where id_hoaDon like ?

update CTKM_HoaDon
set soLuong = soLuong - 1
where id_CTKM_HoaDon like 1

select * from CTKM_HoaDon

select * from TheLoai

select id_hoaDon,khachHang.tenKhachHang,nhanVien.tenNhanVien,hoaDon.tienHang,hoaDon.chietKhau,hoaDon.tongTien,hoaDon.ngayTao,hoaDon.ngaySua , hoaDon.trangThai
from khachHang join hoaDon on khachHang.id_KhachHang = hoaDon.id_KhachHang
full outer join  nhanVien on nhanVien.id_NhanVien = hoaDon.id_NhanVien

select * from hoaDonChiTiet
	select * from hoaDon

