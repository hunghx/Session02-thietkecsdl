-- Ràng buộc dữ liệu / CONTRAINT 
-- • NOT NULL: Không cho phép giá trị NULL
-- • UNIQUE: Mỗi giá trị là duy nhất  trong trường 
-- • PRIMARY KEY:Khóa chính (Không NULL và là UNIQUE) đánh dấu định danh của 1 bảng, 1 bảng chỉ có duy nhất 1 khóa chính 
-- • FOREIGN KEY: Khóa ngoại (tham chiếu sang bảng khác)
-- • CHECK: Kiểm tra dựa vào một điều kiện
-- • DEFAULT:Quyđịnhgiátrịmặc địnhchotrường (nếukhôngcógiátrị
-- nào được nhậpvào)
-- • INDEX:Giúp tăng tốc độ truy vấn dữ liệu
create database demotkcsdl;
use demotkcsdl;
drop table Student;
create table Classes(
malh int primary key,
tenlh varchar(10)
);
insert into Classes (malh,tenlh) values(2,"11A1"),(3,"12A1");

create table Student  (
masv int primary key,
tensv varchar(100) NOT NULL unique,
tuoi int check(tuoi >15), -- tuổi phỉ lớn hơn 15
diachi varchar(255),
malh int ,-- đây là khóa ngoại tham chiếu đến khóa chính của bảng lớp học 
status bit default 1,
foreign key (malh) references classes(malh)
);
-- them mới dữu liệu vào 
insert into Student(masv,tensv,tuoi,diachi,malh) value
(13,"Nguyễn Văn M",16,"Hà Nội",null),
(5,"Nguyễn Văn A",16,"Hà Nội",3),
(6,"Nguyễn Văn B",16,"Hà Nội",3),
(7,"Nguyễn Văn E",16,"Hà Nội",3),
(8,"Nguyễn Văn F",16,"Hà Nội",3),
(9,"Nguyễn Văn G",16,"Hà Nội",3),
(10,"Nguyễn Văn H",16,"Hà Nội",3);

-- 1 , "Nguyễn Văn B", 22, "Nghệ An",2, "Lớp 11A1"


create table product(
id int primary key auto_increment , -- id tự tăng 
name varchar(100) not null,
price float check(price >0),
status bit default 1,
createdDate datetime 
);

insert into product(name, price, createdDate) values ("Quần âu",200,now());



-- Truy vấn đầy đủ 
-- SELECT , FROM , WHERE, GROUP BY, HAVING, ORDER BY 
-- SELECT  :  Lấy những cột nào của bảng
--  FROM  : từ những bảng nào 
--  WHERE : điều kiên lấy là gì
--  GROUP BY : dữ liệu có cần nhóm lại để tính toán và xử lí không 
--  HAVING : điều kiện lấy sau khi đã nhóm dữ liệu (đi kèm với group by)
--  ORDER BY  : dữ liệu được sắp xếp theo chiều nào

select s.tuoi,s.masv,s.tensv from student as s where s.tensv like "%__d%"; 
-- % đại điện cho 1 chuỗi bất kì
-- _ đại diện cho 1 kí tự 
 
 select s.tuoi,s.masv,s.tensv from student as s where s.masv in (1,3,5,7,9); 
-- nhiều điều kiện OR / AND (||  &&)
select s.tuoi,s.masv,s.tensv from student as s where (s.masv < 6) or (s.masv >8); 

-- Mệnh đề JOIN để kết hợp dữ liệu của nhiều bảng 
select * from Classes c join student s  on c.malh = s.malh ; 
-- INNER JOIN : chỉ lấy dữ liệu chung của 2 bảng
-- LEFT JOIN : Lấy toàn bộ bản ghi bên bảng tay trái mà không cần điểm chung của bảng bên tay phải
-- RIGHT  JOIN : Lấy toàn bộ bản ghi bên bảng tay phải mà không cần điểm chung của bảng bên tay trái
-- FULL OUTER  JOIN : Lấy toàn bộ bản ghi bên bảng tay phải và trái mà không cần khớp dữ liệu

select * from Classes c right join student s  on c.malh = s.malh
union
select * from Classes c left join student s  on c.malh = s.malh;