--Câu 1c:-Nhân viên NV1 sửa số điện thoại của người có BusinessEntityID=(3 ký tự cuối của Mã SV của chính SV dự thi) thành 123-456-7890

select * from Person.PersonPhone where BusinessEntityID = 119

update Person.PersonPhone set PhoneNumber = '123-456-7890' where BusinessEntityID = 119

