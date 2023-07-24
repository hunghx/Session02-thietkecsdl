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
(4,"Nguyễn Văn C",16,"Hà Nội",3);

-- 1 , "Nguyễn Văn B", 22, "Nghệ An",2, "Lớp 11A1"


create table product(
id int primary key auto_increment , -- id tự tăng 
name varchar(100) not null,
price float check(price >0),
status bit default 1,
createdDate datetime 
);

insert into product(name, price, createdDate) values ("Quần âu",200,now());
