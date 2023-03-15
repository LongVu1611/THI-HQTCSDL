--Câu 1c : -Nhân viên NV2 xóa số điện thoại của người có BusinessEntityID=(3 ký tự đầu của Mã SV của chính SV dự thi).
select * from Person.PersonPhone where BusinessEntityID = 095 

delete Person.PersonPhone where BusinessEntityID = 095