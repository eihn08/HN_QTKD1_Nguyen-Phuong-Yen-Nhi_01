create database studentcoremanagement;
use studentcoremanagement;
create table student(
studentid varchar(10) primary key,
fullname varchar(100) not null, 
dateofbirth date,
gender enum('Nam', 'Nu') default  'Nam',
email varchar(100) unique
);
create table subjects(
subjectid varchar(10) primary key,
subjectname varchar(100) not null,
credit int not null
);
create table result(
studentid varchar(10),
foreign key (studentid) references student(studentid),
subjectid varchar(10) ,
foreign key (subjectid) references subjects(subjectid),
score decimal(4,2)
);

-- thêm dữ liệu vào bảng 
insert into student( studentid, fullname , dateofbirth , gender , email ) values 
('SV001', 'Nguyen Van A', '2000-01-15', 'Nam', 'a.nguyen@email.com'),
('SV002', 'Tran Thi B', '2001-05-20', 'Nu', 'b.tran@email.com'),
('SV003', 'Le Van C', '1999-11-02', 'Nam', 'c.le@email.com'),
('SV004', 'Pham Thi D', '2002-03-10', 'Nu', 'd.pham@email.com'),
('SV005', 'Hoang Van E', '2000-08-25', 'Nam', 'e.hoang@email.com');
insert into subjects( subjectid, subjectname, credit ) values 
('MH01', 'Co So Du Lieu', 3),
('MH02', 'Lap Trinh Java', 4),
('MH03', 'Lap Trinh Web', 3);
insert into result(studentid, subjectid,score) values 
('SV001', 'MH01', 8.5),
('SV001', 'MH02', 7.0),
('SV002', 'MH01', 9.0),
('SV002', 'MH02', 6.5),
('SV003', 'MH01', 5.5),
('SV003', 'MH03', 8.0),
('SV004', 'MH02', 4.0);
-- Sửa tên môn học có mã 'MH01' thành 'Co So Du Lieu Nang Cao'.
update subjects
set subjectname = 'Co So Du Lieu Nang Cao' 
where subjectid = 'MH01'; 
-- Cập nhật điểm thi của sinh viên có mã 'SV004' trong môn 'MH02' thành 5.5.
update result 
set score = 5.5
where studentid = 'SV004'
and subjectid = 'MH02'; 
-- Xóa kết quả thi của sinh viên có mã 'SV001' và mã môn 'MH02' khỏi bảng Result.
delete from result 
where studentid = 'SV001'
and subjectid = 'MH02'; 

-- Lấy ra toàn bộ thông tin (StudentId, FullName, DateOfBirth, Gender, Email) của các sinh viên có giới tính là 'Nu'.
select * 
from student 
where gender like '%Nu%'; 
-- Lấy ra danh sách kết quả thi (StudentId, SubjectId, Score) của môn học có mã là 'MH01', sắp xếp theo điểm thi giảm dần.
select (studentid, subjectid, score)
from result
where subjectid = 'MH01'
order by score DESC; 
-- Lấy ra tất cả thông tin của các sinh viên có họ là "Nguyen".
select * from student 
where fullname = 'Nguyen'; 
-- Lấy ra danh sách các môn học có số tín chỉ lớn hơn hoặc bằng 4, hiển thị các cột SubjectId, SubjectName, Credit.
-- Lấy ra 3 sinh viên đầu tiên trong danh sách sinh viên, sắp xếp theo ngày sinh tăng dần.


