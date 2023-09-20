INSERT INTO Faculty (facultyID, facultyName, dean, numberOfLecturer, numberOfStudent) 
VALUES 
    ('ITD01', 'Khoa Công nghệ thông tin ', 'Nguyễn Văn A', NULL, NULL),
    ('ITD02', 'Khoa học máy tính', 'Trần Thị B', NULL, NULL),
    ('ITD03', 'Mạng máy tính và Truyền thông', 'Lê Văn C', NULL, NULL),
    ('ITD04', 'Khoa học dữ liệu', 'Phạm Thị D', NULL, NULL);

INSERT INTO Classroom (classroomID)
VALUES
  ('C001'),
  ('C002'),
  ('C003'),
  ('C004'),
  ('C005'),
  ('C006'),
  ('C007'),
  ('C008'),
  ('C009'),
  ('C010'),
  ('C011'),
  ('C012'),
  ('C013'),
  ('C014'),
  ('C015'),
  ('C016'),
  ('C017'),
  ('C018'),
  ('C019'),
  ('C020');

INSERT INTO Lecturer (lecturerID, name, dateOfBirth, gender, address, email, phoneNumber, facultyID)
VALUES 
('LT000001', 'Nguyen Van X', '1990-01-01', 'M', '123 Nguyen Van Cu, Quan 5, TP. Ho Chi Minh', 'nx@itd.edu.vn', '0123456789', 'ITD01'),
('LT000002', 'Tran Thi Y', '1985-02-10', 'F', '456 Le Van Sy, Quan 3, TP. Ho Chi Minh', 'ty@itd.edu.vn', '0987654321', 'ITD01'),
('LT000003', 'Pham Van Z', '1977-07-15', 'M', '789 Pham Van Dong, Quan 12, TP. Ho Chi Minh', 'pz@itd.edu.vn', '0111222333', 'ITD02'),
('LT000004', 'Hoang Thi T', '1989-06-20', 'F', '321 Nguyen Tri Phuong, Quan 10, TP. Ho Chi Minh', 'ht@itd.edu.vn', '0333444555', 'ITD02'),
('LT000005', 'Le Van U', '1980-12-31', 'M', '555 Ly Thuong Kiet, Quan 10, TP. Ho Chi Minh', 'lvu@itd.edu.vn', '0123456789', 'ITD03'),
('LT000006', 'Nguyen Thi V', '1992-05-05', 'F', '888 Tran Hung Dao, Quan 5, TP. Ho Chi Minh', 'ntv@itd.edu.vn', '0987654321', 'ITD03'),
('LT000007', 'Tran Van W', '1983-09-30', 'M', '777 Le Hong Phong, Quan 10, TP. Ho Chi Minh', 'tvw@itd.edu.vn', '0111222333', 'ITD03'),
('LT000008', 'Pham Thi X', '1981-03-25', 'F', '999 Hoang Sa, Quan 3, TP. Ho Chi Minh', 'ptx@itd.edu.vn', '0333444555', 'ITD04'),
('LT000009', 'Hoang Van Y', '1984-01-10', 'M', '123 Pham Ngu Lao, Quan 1, TP. Ho Chi Minh', 'hvy@itd.edu.vn', '0123456789', 'ITD04'),
('LT000010', 'Le Thi Z', '1986-08-15', 'F', '456 Vo Thi Sau, Quan 3, TP. Ho Chi Minh', 'ltz@itd.edu.vn', '0987654321', 'ITD04'),
('LT000011', 'Nguyen Van A', '1975-01-01', 'M', '123 Nguyen Van Cu, Quan 5, TP. Ho Chi Minh', 'vana@itd.edu.vn', '0111222333', 'ITD03'),
('LT000012', 'Tran Thi B', '1980-05-20', 'F', '456 Le Van Sy, Quan 3, TP. Ho Chi Minh', 'btran@itd.edu.vn', '0333444555', 'ITD03'),
('LT000013', 'John Doe', '1980-01-01', 'M', '123 Main St., Anytown, USA', 'johndoe@example.com', '1234567890', 'ITD01'),
('LT000014', 'Jane Smith', '1985-05-15', 'F', '456 Elm St., Anytown, USA', 'janesmith@example.com', '2345678901', 'ITD02'),
('LT000015', 'Peter Parker', '1989-07-01', 'M', '789 5th Ave., New York, NY', 'peterparker@example.com', '3456789012', 'ITD03'),
('LT000016', 'Mary Jane Watson', '1991-09-15', 'F', '456 6th St., New York, NY', 'maryjanewatson@example.com', '4567890123', 'ITD04');

INSERT INTO StudentClass (classID, academicYear, numberOfStudent, lecturerID) 
VALUES
('CNTT2021', 2021, NULL, 'LT000001'),
('CNTT2020', 2020, NULL, 'LT000005'),
('KHMT2020', 2020, NULL, 'LT000009'),
('KHMT2021', 2021, NULL, 'LT000013'),
('MMT2021', 2022, NULL, 'LT000016');
INSERT INTO faculty_class(facultyid,classid)
VALUES
('ITD01','CNTT2020'),
('ITD01','CNTT2021'),
('ITD02','KHMT2020'),
('ITD02','KHMT2021'),
('ITD03','MMT2021');

INSERT INTO Student (studentID, name, dateOfBirth, gender, address, email, phoneNumber, classID)
VALUES 
('ST000001', 'Nguyễn Văn A', '2000-01-01', 'M', 'Hà Nội', 'nguyenvana@gmail.com', '0123456789', 'CNTT2021'),
('ST000002', 'Trần Thị B', '2000-02-02', 'F', 'Hải Phòng', 'tranthib@gmail.com', '0123456789', 'CNTT2021'),
('ST000003', 'Lê Văn C', '2000-03-03', 'M', 'Hồ Chí Minh', 'levanc@gmail.com', '0123456789', 'CNTT2021'),
('ST000004', 'Phạm Thị D', '2000-04-04', 'F', 'Đà Nẵng', 'phamthid@gmail.com', '0123456789', 'CNTT2021'),
('ST000005', 'Hoàng Văn E', '2000-05-05', 'M', 'Hà Tĩnh', 'hoangvane@gmail.com', '0123456789', 'CNTT2021'),
('ST000006', 'Nguyễn Thị F', '2000-06-06', 'F', 'Hà Nội', 'nguyenthif@gmail.com', '0123456789', 'CNTT2021'),
('ST000007', 'Trần Văn G', '2000-07-07', 'M', 'Hải Phòng', 'tranvang@gmail.com', '0123456789', 'CNTT2021'),
('ST000008', 'Lê Thị H', '2000-08-08', 'F', 'Hồ Chí Minh', 'lethih@gmail.com', '0123456789', 'CNTT2021'),
('ST000009', 'Phạm Văn I', '2000-09-09', 'M', 'Đà Nẵng', 'phamvani@gmail.com', '0123456789', 'CNTT2021'),
('ST000010', 'Hoàng Thị K', '2000-10-10', 'F', 'Hà Tĩnh', 'hoangthik@gmail.com', '0123456789', 'CNTT2021'),
('ST000011', 'Nguyễn Văn L', '2000-11-11', 'M', 'Hà Nội', 'nguyenvanl@gmail.com', '0123456789', 'CNTT2021'),
('ST000012', 'Trần Thị M', '2000-12-12', 'F', 'Hải Phòng', 'tranthim@gmail.com', '0123456789', 'CNTT2021'),
('ST000013', 'Lê Văn N', '2001-01-01', 'M', 'Hồ Chí Minh', 'levann@gmail.com', '0123456789', 'CNTT2021'),
('ST000014', 'Phạm Thị O', '2001-02-02', 'F', 'Đà Nẵng', 'phamthio@gmail.com', '0123456789', 'CNTT2021'),
('ST000015', 'Hoàng Văn P', '2001-03-03', 'M', 'Hà Tĩnh', 'hoangvanp@gmail.com', '0123456789', 'CNTT2021'),
('ST000016', 'Nguyễn Thị Q', '2001-04-04', 'F', 'Hà Nội', 'nguyenthiq@gmail.com', '0123456789', 'CNTT2021'),
('ST000017', 'Trần Văn R', '2001-05-05', 'M', 'Hải Phòng', 'tranvanr@gmail.com', '0123456789', 'CNTT2021');

INSERT INTO Student (studentID, name, dateOfBirth, gender, address, email, phoneNumber, classID)
VALUES
    ('ST000018', 'Nguyễn Văn An', '2003-01-01', 'M', 'Số 1, Đường A, Quận B, Hà Nội', 'hs1@example.com', '123456789', 'CNTT2020'),
    ('ST000019', 'Trần Thị Bình', '2003-01-02', 'F', 'Số 2, Đường X, Quận Y, Hồ Chí Minh', 'hs2@example.com', '234567890', 'CNTT2020'),
    ('ST000020', 'Lê Văn Cường', '2003-01-03', 'M', 'Số 3, Đường Z, Quận T, Đà Nẵng', 'hs3@example.com', '345678901', 'CNTT2020'),
    ('ST000021', 'Phạm Thị Đào', '2003-01-04', 'F', 'Số 4, Đường M, Quận N, Hải Phòng', 'hs4@example.com', '456789012', 'CNTT2020'),
    ('ST000022', 'Hoàng Văn Em', '2003-01-05', 'M', 'Số 5, Đường E, Quận F, Cần Thơ', 'hs5@example.com', '567890123', 'CNTT2020'),
    ('ST000023', 'Vũ Thị F', '2003-01-06', 'F', 'Số 6, Đường G, Quận H, Đồng Nai', 'hs6@example.com', '678901234', 'CNTT2020'),
    ('ST000024', 'Nguyễn Văn G', '2003-01-07', 'M', 'Số 7, Đường I, Quận J, Thanh Hóa', 'hs7@example.com', '789012345', 'CNTT2020'),
    ('ST000025', 'Trần Thị H', '2003-01-08', 'F', 'Số 8, Đường K, Quận L, Nghệ An', 'hs8@example.com', '890123456', 'CNTT2020'),
    ('ST000026', 'Lê Văn I', '2003-01-09', 'M', 'Số 9, Đường O, Quận P, Hà Tĩnh', 'hs9@example.com', '901234567', 'CNTT2020'),
    ('ST000027', 'Phạm Thị J', '2003-01-10', 'F', 'Số 10, Đường Q, Quận R, Bình Định', 'hs10@example.com', '012345678', 'CNTT2020'),
    ('ST000028', 'Hoàng Văn K', '2003-01-11', 'M', 'Số 11, Đường S, Quận T, Đồng Tháp', 'hs11@example.com', '123456789', 'CNTT2020'),
    ('ST000029', 'Vũ Thị L', '2003-01-12', 'F', 'Số 12, Đường U, Quận V, Long An', 'hs12@example.com', '234567890', 'CNTT2020'),
    ('ST000030', 'Nguyễn Văn M', '2003-01-13', 'M', 'Số 13, Đường W, Quận X, An Giang', 'hs13@example.com', '345678901', 'CNTT2020'),
    ('ST000031', 'Trần Thị N', '2003-01-14', 'F', 'Số 14, Đường Y, Quận Z, Bà Rịa - Vũng Tàu', 'hs14@example.com', '456789012', 'CNTT2020'),
    ('ST000032', 'Lê Văn O', '2003-01-15', 'M', 'Số 15, Đường A1, Quận B1, Bắc Giang', 'hs15@example.com', '567890123', 'CNTT2020'),
    ('ST000033', 'Phạm Thị P', '2003-01-16', 'F', 'Số 16, Đường C1, Quận D1, Bắc Kạn', 'hs16@example.com', '678901234', 'CNTT2020'),
    ('ST000034', 'Hoàng Văn Q', '2003-01-17', 'M', 'Số 17, Đường E1, Quận F1, Bạc Liêu', 'hs17@example.com', '789012345', 'CNTT2020'),
    ('ST000035', 'Vũ Thị R', '2003-01-18', 'F', 'Số 18, Đường G1, Quận H1, Bắc Ninh', 'hs18@example.com', '890123456', 'CNTT2020'),
    ('ST000036', 'Nguyễn Văn S', '2003-01-19', 'M', 'Số 19, Đường I1, Quận J1, Bến Tre', 'hs19@example.com', '901234567', 'CNTT2020'),
    ('ST000037', 'Trần Thị T', '2003-01-20', 'F', 'Số 20, Đường K1, Quận L1, Bình Dương', 'hs20@example.com', '012345678', 'CNTT2020'),
    ('ST000038', 'Lê Văn U', '2003-01-21', 'M', 'Số 21, Đường M1, Quận N1, Bình Phước', 'hs21@example.com', '123456789', 'CNTT2020'),
    ('ST000039', 'Phạm Thị V', '2003-01-22', 'F', 'Số 22, Đường O1, Quận P1, Cà Mau', 'hs22@example.com', '234567890', 'CNTT2020'),
    ('ST000040', 'Hoàng Văn W', '2003-01-23', 'M', 'Số 23, Đường Q1, Quận R1, Cao Bằng', 'hs23@example.com', '345678901', 'CNTT2020'),
    ('ST000041', 'Vũ Thị X', '2003-01-24', 'F', 'Số 24, Đường S1, Quận T1, Đắk Lắk', 'hs24@example.com', '456789012', 'CNTT2020'),
    ('ST000042', 'Nguyễn Văn Y', '2003-01-25', 'M', 'Số 25, Đường U1, Quận V1, Đắk Nông', 'hs25@example.com', '567890123', 'CNTT2020'),
    ('ST000043', 'Trần Thị Z', '2003-01-26', 'F', 'Số 26, Đường W1, Quận X1, Điện Biên', 'hs26@example.com', '678901234', 'CNTT2020'),
    ('ST000044', 'Lê Văn AA', '2003-01-27', 'M', 'Số 27, Đường Y1, Quận Z1, Đồng Tháp', 'hs27@example.com', '789012345', 'CNTT2020'),
    ('ST000045', 'Phạm Thị BB', '2003-01-28', 'F', 'Số 28, Đường A2, Quận B2, Gia Lai', 'hs28@example.com', '890123456', 'CNTT2020'),
    ('ST000046', 'Hoàng Văn CC', '2003-01-29', 'M', 'Số 29, Đường C2, Quận D2, Hà Giang', 'hs29@example.com', '901234567', 'CNTT2020'),
    ('ST000047', 'Vũ Thị DD', '2003-01-30', 'F', 'Số 30, Đường E2, Quận F2, Hà Nam', 'hs30@example.com', '012345678', 'CNTT2020');

INSERT INTO Course (courseID, courseName, facultyID, credit, description, previousCourse, followingCourse)
VALUES
    ('IT100', 'Cấu trúc dữ liệu và giải thuật', 'ITD01', 3, NULL, NULL, 'IT101'),
    ('IT101', 'Lập trình C/C++', 'ITD01', 4, NULL, NULL, 'IT102'),
    ('IT102', 'Lập trình Java', 'ITD01', 4, NULL, NULL, 'IT103'),
    ('IT103', 'Lập trình Python', 'ITD01', 3, NULL, NULL, 'IT104'),
    ('IT104', 'Hệ điều hành', 'ITD01', 3, NULL, NULL, 'IT105'),
    ('IT105', 'Mạng máy tính', 'ITD01', 3, NULL, 'IT102', 'IT106'),
    ('IT106', 'Cơ sở dữ liệu', 'ITD01', 3, NULL, 'IT101', 'IT107'),
    ('IT107', 'Quản lý dự án phần mềm', 'ITD01', 3, NULL, 'IT103', 'IT108'),
    ('IT108', 'Hệ thống thông tin', 'ITD01', 3, NULL, 'IT105', 'IT109'),
    ('IT109', 'An toàn thông tin', 'ITD01', 3, NULL, 'IT104', 'IT110'),
    ('IT110', 'Kỹ thuật truyền thông', 'ITD01', 3, NULL, 'IT109', 'IT111'),
    ('IT111', 'Trí tuệ nhân tạo', 'ITD01', 3, NULL, 'IT107', 'IT112'),
    ('IT112', 'Thiết kế giao diện người dùng', 'ITD01', 3, NULL, 'IT101', 'IT113'),
    ('IT113', 'Phân tích và thiết kế hệ thống thông tin', 'ITD01', 3, NULL, 'IT102', 'IT114'),
    ('IT114', 'Lập trình web', 'ITD01', 3, NULL, 'IT113', 'IT107'),
    ('IT115', 'Học máy (Machine Learning)', 'ITD01', 3, NULL, 'IT104', 'IT116'),
    ('IT116', 'Phân tích dữ liệu (Data Analytics)', 'ITD01', 3, NULL, 'IT105', 'IT117'),
    ('IT117', 'Mạng xã hội và phân tích mạng xã hội', 'ITD01', 3, NULL, 'IT106', 'IT118'),
    ('IT118', 'Kỹ thuật phần mềm', 'ITD01', 3, NULL, 'IT107', 'IT119'),
    ('IT119', 'Đồ án tốt nghiệp', 'ITD01', 4, NULL, 'IT108', NULL);

INSERT INTO Course (courseID, courseName, facultyID, credit, description, previousCourse, followingCourse)
VALUES 
('CN100', 'Giới thiệu về Mạng máy tính', 'ITD03', 3, 'Khóa học này cung cấp một giới thiệu về mạng máy tính.', NULL, 'CN101'),
('CN101', 'Các giao thức mạng', 'ITD03', 3, 'Khóa học này bao gồm các nguyên tắc và thực hành của các giao thức mạng.', NULL, 'CN102'),
('CN102', 'Bảo mật mạng', 'ITD03', 3, 'Khóa học này bao gồm các nguyên tắc và thực hành của bảo mật mạng.', NULL, 'CN103'),
('CN103', 'Thiết kế mạng', 'ITD03', 3, 'Khóa học này cung cấp kiến thức về thiết kế mạng.', NULL, 'CN104'),
('CN104', 'Quản trị mạng', 'ITD03', 3, 'Khóa học này cung cấp kiến thức về quản trị mạng.', NULL, 'CN105'),
('CN105', 'Mạng không dây', 'ITD03', 3, 'Khóa học này cung cấp kiến thức về mạng không dây.', 'CN101', 'CN106'),
('CN106', 'Mạng viễn thông', 'ITD03', 3, 'Khóa học này cung cấp kiến thức về mạng viễn thông.', 'CN102', 'CN107'),
('CN107', 'Mạng di động', 'ITD03', 3, 'Khóa học này cung cấp kiến thức về mạng di động.', 'CN102', 'CN108'),
('CN108', 'Mạng máy tính công nghiệp', 'ITD03', 3, 'Khóa học này cung cấp kiến thức về mạng máy tính công nghiệp.', 'CN103', 'CN109'),
('CN109', 'Mạng máy tính vô tuyến', 'ITD03', 3, 'Khóa học này cung cấp kiến thức về mạng máy tính vô tuyến.', 'CN104', 'CN110'),
('CN110', 'Mạng máy tính cá nhân', 'ITD03', 3, 'Khóa học này cung cấp kiến thức về mạng máy tính cá nhân.', 'CN109', 'CN111'),
('CN111', 'Mạng máy tính doanh nghiệp', 'ITD03', 3, 'Khóa học này cung cấp kiến thức về mạng máy tính doanh nghiệp.', 'CN108', 'CN112'),
('CN112', 'Mạng máy tính truyền thông', 'ITD03', 3, 'Khóa học này cung cấp kiến thức về mạng máy tính truyền thông.', 'CN101', NULL);
INSERT INTO Course (courseID, courseName, facultyID, credit, description, previousCourse, followingCourse)
VALUES 
  ('CS101', 'Lập trình căn bản', 'ITD02', 3, 'Học về cú pháp, kiến thức căn bản và logic lập trình.', NULL, 'CS102'),
  ('CS102', 'Cấu trúc dữ liệu và giải thuật', 'ITD02', 4, 'Nắm vững các cấu trúc dữ liệu và thuật toán để giải quyết các vấn đề phức tạp.', NULL, 'CS103'),
  ('CS103', 'Hệ điều hành', 'ITD02', 3, 'Tìm hiểu về nguyên lý hoạt động của hệ điều hành và quản lý tài nguyên hệ thống.', NULL, 'CS104'),
  ('CS104', 'Cơ sở dữ liệu', 'ITD02', 4, 'Học về thiết kế, triển khai và quản lý cơ sở dữ liệu.', NULL, 'CS105'),
  ('CS105', 'Mạng máy tính', 'ITD02', 3, 'Tìm hiểu về mạng máy tính, giao thức truyền thông và quản lý mạng.', NULL, 'CS106'),
  ('CS106', 'Ngôn ngữ lập trình nâng cao', 'ITD02', 3, 'Nghiên cứu các ngôn ngữ lập trình phức tạp hơn như Java, C++, Python.', 'CS100', 'CS107'),
  ('CS107', 'Trực quan hóa dữ liệu', 'ITD02', 3, 'Học cách biểu diễn dữ liệu một cách trực quan thông qua đồ họa và các công cụ tương tự.', 'CS101', 'CS108'),
  ('CS108', 'Trí tuệ nhân tạo', 'ITD02', 4, 'Tìm hiểu về các thuật toán và kỹ thuật trong lĩnh vực trí tuệ nhân tạo như học máy và thị giác máy tính.', 'CS102', 'CS109'),
  ('CS109', 'Xử lý ngôn ngữ tự nhiên', 'ITD02', 3, 'Học cách xử lý và hiểu ngôn ngữ tự nhiên bằng các phương pháp và thuật toán.', 'CS104', 'CS110'),
  ('CS110', 'An toàn thông tin', 'ITD02', 3, 'Tìm hiểu về các phương pháp bảo mật và quản lý rủi ro thông tin.', 'CS105', 'CS111'),
  ('CS111', 'Đồ họa máy tính', 'ITD02', 4, 'Nghiên cứu về đồ họa máy tính, thiết kế giao diện người dùng và thị giác máy tính.', 'CS110', 'CS112'),
  ('CS112', 'Công nghệ web', 'ITD02', 3, 'Học về phát triển ứng dụng web, các ngôn ngữ lập trình web như HTML, CSS, JavaScript và các framework như React, Angular, Django.', 'CS101', 'CS113'),
  ('CS113', 'Công nghệ di động', 'ITD02', 3, 'Tìm hiểu về phát triển ứng dụng di động trên các nền tảng như Android và iOS.', 'CS102', 'CS114'),
  ('CS114', 'Khai phá dữ liệu', 'ITD02', 4, 'Nghiên cứu về các kỹ thuật khai phá dữ liệu để tìm hiểu thông tin tiềm ẩn và mô hình dữ liệu.', 'CS105', 'CS115'),
  ('CS115', 'Quản lý dự án phần mềm', 'ITD02', 3, 'Học về quy trình phát triển phần mềm, quản lý dự án và công cụ hỗ trợ quản lý.', 'CS114', NULL);

INSERT INTO Course (courseID, courseName, facultyID, credit, description, previousCourse, followingCourse)
VALUES 
('DC100', 'Cơ sở dữ liệu', 'ITD04', 3, 'Nền tảng về cách tổ chức, quản lý và truy xuất dữ liệu.', NULL, 'DC101'),
('DC101', 'Xử lý dữ liệu', 'ITD04', 3, 'Phân tích và biến đổi dữ liệu để chuẩn bị cho quá trình phân tích dữ liệu.', NULL, 'DC102'),
('DC102', 'Thống kê', 'ITD04', 3, 'Áp dụng các phương pháp thống kê để phân tích dữ liệu và rút ra kết luận.', NULL, 'DC103'),
('DC103', 'Học máy', 'ITD04', 3, 'Nghiên cứu cách xây dựng mô hình dự đoán và phân loại dữ liệu.', NULL, 'DC104'),
('DC104', 'Khai phá dữ liệu', 'ITD04', 3, 'Tìm hiểu các phương pháp để khám phá tri thức và thông tin tiềm ẩn trong dữ liệu.', NULL, 'DC105'),
('DC105', 'Xử lý ngôn ngữ tự nhiên', 'ITD04', 3, 'Nghiên cứu về cách xử lý và hiểu ngôn ngữ tự nhiên bằng các thuật toán máy học.', 'DC104', 'DC106'),
('DC106', 'Trí tuệ nhân tạo', 'ITD04', 3, 'Nghiên cứu về cách xây dựng các hệ thống thông minh và học máy có khả năng tự học.', 'DC104', 'DC107'),
('DC107', 'Mạng neuron', 'ITD04', 3, 'Nghiên cứu về cách xây dựng và huấn luyện mạng neuron nhân tạo.', 'DC102', 'DC108'),
('DC108', 'Khám phá dữ liệu', 'ITD04', 3, 'Áp dụng các phương pháp khám phá dữ liệu để tìm ra thông tin hữu ích.', 'DC103', 'DC109'),
('DC109', 'Khai thác dữ liệu', 'ITD04', 3, 'Xác định và trích xuất tri thức từ dữ liệu có cấu trúc và không có cấu trúc.', 'DC101', 'DC110'),
('DC110', 'Đại số tuyến tính', 'ITD04', 3, 'Nghiên cứu về các phép toán và ánh xạ tuyến tính để phân tích dữ liệu.', 'DC109', 'DC111'),
('DC111', 'Lập trình Python', 'ITD04', 3, 'Học ngôn ngữ lập trình phổ biến trong khoa học dữ liệu và machine learning.', 'DC109', 'DC112'),
('DC112', 'Visual Analytics', 'ITD04', 3, 'Khám phá và biểu đồ hóa dữ liệu để hiểu thông tin từ dữ liệu.', 'DC108', 'DC113'),
('DC113', 'Data Mining', 'ITD04', 3, 'Sử dụng các phương pháp và thuật toán để khai thác tri thức từ dữ liệu lớn.', 'DC102', 'DC114'),
('DC114', 'Big Data Analytics', 'ITD04', 3, 'Nghiên cứu về cách xử lý và phân tích dữ liệu lớn để tìm ra thông tin quan trọng và xu hướng.', 'DC113',NULL);

INSERT INTO Lecturer (lecturerID, name, dateOfBirth, gender, address, email, phoneNumber, facultyID)
VALUES 
('LT000020', 'John Doe', '1980-01-01', 'M', '123 Đường Chính, Thành phố HCM', 'johndoe@example.com', '0123456789', 'ITD01'),
('LT000021', 'Jane Doe', '1985-05-05', 'F', '456 Đường Phụ, Thành phố Hà Nội', 'janedoe@example.com', '0987654321', 'ITD01'),
('LT000022', 'Nguyễn Văn A', '1975-12-31', 'M', '789 Đường Chính, Thành phố Đà Nẵng', 'vana@example.com', '0123456789', 'ITD01'),
('LT000023', 'Trần Thị B', '1982-06-15', 'F', '321 Đường Phụ, Thành phố Hải Phòng', 'thib@example.com', '0987654321', 'ITD01'),
('LT000024', 'Lê Văn C', '1990-03-20', 'M', '654 Đường Chính, Thành phố Cần Thơ', 'levanc@example.com', '0123456789', 'ITD01'),
('LT000025', 'Phạm Thị D', '1988-09-10', 'F', '987 Đường Phụ, Thành phố Hồ Chí Minh', 'thid@example.com', '0987654321', 'ITD01'),
('LT000026', 'Hoàng Văn E', '1983-11-25', 'M', '741 Đường Chính, Thành phố Hà Nội', 'vanhe@example.com', '0123456789', 'ITD01'),
('LT000027', 'Nguyễn Thị F', '1986-07-01', 'F', '852 Đường Phụ, Thành phố Đà Lạt', 'thif@example.com', '0987654321', 'ITD01'),
('LT000028', 'Trần Văn G', '1979-04-05', 'M', '963 Đường Chính, Thành phố Nha Trang', 'vang@example.com', '0123456789', 'ITD01'),
('LT000029', 'Lê Thị H', '1984-08-15', 'F', '159 Đường Phụ, Thành phố Hải Dương', 'thih@example.com', '0987654321', 'ITD01');

INSERT INTO schedule (scheduleID, courseID, day, time, classroomID, lecturerID,semester)
VALUES 
('SC6', 'CS115', 'thu', '09:00:00', 'C002', 'LT000001','2023.2'),
('SC7', 'CN101', 'wed', '14:00:00', 'C003', 'LT000001','2023.2'),
('SC8', 'CN112', 'fri', '11:00:00', 'C004', 'LT000001','2023.2'),
('SC9', 'DC113', 'mon', '07:00:00', 'C013', 'LT000002','2023.2'),
('SC10', 'DC114', 'tue', '10:00:00', 'C007', 'LT000002','2023.2');

INSERT INTO student_schedule (studentid,scheduleid) 
VALUES
('ST000003','SC6'),
('ST000003','SC7'),
('ST000003','SC8'),
('ST000003','SC9'),
('ST000003','SC10'),
('ST000002','SC6'),
('ST000002','SC7'),
('ST000002','SC8'),
('ST000002','SC9'),
('ST000002','SC10'),
('ST000001','SC6'),
('ST000001','SC7'),
('ST000001','SC8'),
('ST000001','SC9'),
('ST000001','SC10');

INSERT INTO AdminUser (staffID, name, dateOfBirth, gender, address, email, phoneNumber, departmentID)
VALUES
('AD000001', 'Nguyễn Văn A', '1980-01-01', 'M', 'Số 10, Đường 3/2, Quận 10, TP. Hồ Chí Minh', 'nguyenvana@gmail.com', '0901234567', 'DPT001'),
('AD000002', 'Trần Thị B', '1985-05-15', 'F', 'Số 20, Đường Lê Văn Việt, Quận 9, TP. Hồ Chí Minh', 'tranthib@gmail.com', '0902345678', 'DPT002'),
('AD000003', 'Phạm Thành C', '1990-10-20', 'M', 'Số 30, Đường Phan Đăng Lưu, Quận Phú Nhuận, TP. Hồ Chí Minh', 'phamthanhc@gmail.com', '0903456789', 'DPT003'),
('AD000004', 'Lê Thị D', '1982-06-05', 'F', 'Số 40, Đường Trần Quang Khải, Quận 1, TP. Hồ Chí Minh', 'lethid@gmail.com', '0904567890', 'DPT004'),
('AD000005', 'Hoàng Thanh E', '1987-03-10', 'M', 'Số 50, Đường Trần Hưng Đạo, Quận 5, TP. Hồ Chí Minh', 'hoangthanhe@gmail.com', '0905678901', 'DPT005');


--bảng account nên có mã hóa mật khẩu
INSERT INTO Account (username, password)
VALUES ('st000001', HASHBYTES('SHA2_256', 'password'));

INSERT INTO Account (username, password)
VALUES ('lt000001', HASHBYTES('SHA2_256', 'password1'));

INSERT INTO Account (username, password)
VALUES ('ad000001', HASHBYTES('SHA2_256', 'password1'));

INSERT INTO Account (username, password)
VALUES ('adminadmin', HASHBYTES('SHA2_256', 'admin123'));
