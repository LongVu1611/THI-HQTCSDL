
---Huỳnh Long Vũ
---MSSV:0950080119
---Lớp : 09_CNPM3
--Câu 1a:Tạo các login; tạo các user khai thác CSDL AdventureWorks2008R2 cho các nhân viên (tên login trùng tên user) (1đ).
-- Tạo login cho nhân viên hiệu chỉnh
CREATE LOGIN NV1 WITH PASSWORD = 'nhanvien1';
CREATE LOGIN NV2 WITH PASSWORD = 'nhanvien2';

-- Tạo login cho nhân viên quản lý
CREATE LOGIN QL WITH PASSWORD = 'quanly';

-- Tạo user cho nhân viên hiệu chỉnh
CREATE USER NV1 FOR LOGIN NV1;
CREATE USER NV2 FOR LOGIN NV2;

-- Tạo user cho nhân viên quản lý
CREATE USER QL FOR LOGIN QL;

--Câu 1b:Tạo role NhanVien, phân quyền cho role, thêm các user NV1, NV2, QL vào các role theo phân công ở trên để các nhân viên hoàn thành nhiệm vụ (1đ).
CREATE ROLE Nhanvien
go 
grant insert, delete, update on Person.PersonPhone
to Nhanvien

alter role Nhanvien
add member NV1

alter role Nhanvien
add member NV2

alter role db_datareader
add member QL

--Câu 1d: Chỉ có admin(sa) mới xem được bảng Person.Person vì là người có quản trị của database
SELECT * from Person.Person

--Câu 1e: Các nhân viên quản lý NV1, NV2, QL hoàn thành dự án, admin thu hồi quyền đã cấp. Xóa role NhanVien. (1đ).

alter role Nhanvien
drop member NV1

alter role Nhanvien
drop member NV2

alter role db_datareader
drop member QL

drop role Nhanvien

--Câu 2: 
--a
alter database AdventureWorks2008R2
set recovery full

backup database AdventureWorks2008R2
to disk = 'D:\HQTCSDL\filebackup\adventure-works-2008r2-oltp.bak'

--b
delete Purchasing.PurchaseOrderDetail
backup database AdventureWorks2008R2
to disk = 'D:\HQTCSDL\filebackup\adventure-works-2008r2-oltp.bak'
with differential 

--c
select*from Person.PersonPhone where BusinessEntityID = 0119
insert into Person.PersonPhone values(0119, '161102' , 2 ,getdate())

backup log AdventureWorks2008R2
to disk = 'D:\HQTCSDL\filebackup\adventure-works-2008r2-oltp.bak'

--d
use master
drop database AdventureWorks2008R2

restore database AdventureWorks2008R2
from disk = 'D:\HQTCSDL\filebackup\adventure-works-2008r2-oltp.bak'
with file = 1, replace , norecovery  





