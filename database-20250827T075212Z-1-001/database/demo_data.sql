USE heathcareSystem;
GO

-- ========== INSERT DEMO USERS ==========
INSERT INTO Users (Username, Email, PasswordHash, FullName)
VALUES 
('admin01', 'admin01@demo.com', 'hashed_password_1', N'Nguyễn Văn A'),
('doctor02', 'doctor02@demo.com', 'hashed_password_2', N'Trần Thị B'),
('patient03', 'patient03@demo.com', 'hashed_password_3', N'Lê Văn C');

-- ========== INSERT DEMO CHAT SESSIONS ==========
INSERT INTO ChatSessions (UserID, StartedAt, EndedAt)
VALUES
(1, GETDATE(), NULL),  -- admin01 đang chat
(2, DATEADD(MINUTE, -30, GETDATE()), GETDATE()), -- doctor02 chat cách đây 30 phút và đã kết thúc
(3, DATEADD(HOUR, -1, GETDATE()), NULL); -- patient03 chat 1 giờ trước và vẫn đang mở

-- ========== INSERT DEMO CHAT MESSAGES ==========
-- Session 1: admin01 chat với AI
INSERT INTO ChatMessages (SessionID, Sender, MessageText)
VALUES
(1, 'user', N'Xin chào, tôi muốn được hỗ trợ về hệ thống.'),
(1, 'ai', N'Chào bạn, bạn cần hỗ trợ về vấn đề gì?'),
(1, 'user', N'Hệ thống có lưu lịch sử trò chuyện không?'),
(1, 'ai', N'Có, tất cả tin nhắn được lưu trong cơ sở dữ liệu.');

-- Session 2: doctor02 chat với AI
INSERT INTO ChatMessages (SessionID, Sender, MessageText)
VALUES
(2, 'user', N'Tôi muốn kiểm tra lịch hẹn bệnh nhân.'),
(2, 'ai', N'Bạn có thể vào mục quản lý lịch hẹn trong dashboard.'),
(2, 'user', N'Cảm ơn, tôi đã thấy.');

-- Session 3: patient03 chat với AI
INSERT INTO ChatMessages (SessionID, Sender, MessageText)
VALUES
(3, 'user', N'Tôi bị đau đầu mấy hôm nay.'),
(3, 'ai', N'Bạn có thể mô tả rõ hơn về triệu chứng không?'),
(3, 'user', N'Đau âm ỉ, nhất là buổi sáng.'),
(3, 'ai', N'Bạn nên nghỉ ngơi và đi khám bác sĩ nếu triệu chứng kéo dài.');