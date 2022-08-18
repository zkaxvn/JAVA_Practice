INSERT INTO pro.tb_solution (tpo_code,solution_title,solution_cont,member_id,solution_sort,solution_file,solution_state,regdt) VALUES
	 ('A0001','일번','일번','testtest',1,'eeeeewwwww.jpg@eeeeewwwww.jpg@eeeeewwwww.jpg','Y','2022-02-23'),
	 ('A0001','제목제목제목','내용내용내용','testtest',2,'wwww223zxs.png','N','2022-02-23'),
	 ('A0001','제목제목제목','내용내용내용','testtest',3,'wwww223zxs.png','Y','2022-02-23'),
	 ('A0001','제목제목제목','내용내용내용','testtest',4,'wwww223zxs.png','N','2022-02-23'),
	 ('A0001','제목제목제목','내용내용내용','testtest',5,'wwww223zxs.png','N','2022-02-23'),
	 ('C0002','일번일번','일번일번','ttttt2',1,'wwww223zxs.png','Y','2022-02-23'),
	 ('C0002','제목제목제목','내용내용내용','ttttt2',2,'wwww223zxs.png','N','2022-02-23'),
	 ('C0002','zzz','내용내용내용','ttttt2',3,'eeeeewwwww.jpg','N','2022-02-23'),
	 ('C0002','zzz','내용내용내용','ttttt2',4,'eeeeewwwww.jpg','N','2022-02-23'),
	 ('C0002','제목제목제목','내용내용내용','ttttt2',5,'eeeeewwwww.jpg','N','2022-02-23');
INSERT INTO pro.tb_solution (tpo_code,solution_title,solution_cont,member_id,solution_sort,solution_file,solution_state,regdt) VALUES
	 ('C0002','제목제목제목','내용내용내용','ttttt2',6,'eeeeewwwww.jpg','N','2022-02-23'),
	 ('C0002','제목제목제목','내용내용내용','ttttt2',7,'eeeeewwwww.jpg','N','2022-02-23'),
	 ('C0002','제목제목제목','내용내용내용','ttttt2',7,'eeeeewwwww.jpg','N','2022-02-23'),
	 ('C0002','제목제목제목','내용내용내용','ttttt2',7,'eeeeewwwww.jpg','N','2022-02-23');
	 
	 
	 
	 
	 insert INTO pro.tb_scrap(scrap_id,member_id,regdt) VALUES ('admin2','admin','2022-06-13')
	 
	 
	 
	 SELECT * FROM tb_member
	 WHERE 	 
	 
	 
	 
	 
	 
tb_notice	 
	 CREATE TABLE `tb_notice` (
	`notice_seq` INT(11) NOT NULL AUTO_INCREMENT COMMENT '시퀀스',
	`notice_title` VARCHAR(256) NOT NULL COMMENT '제목' COLLATE 'utf8_general_ci',
	`notice_cont` VARCHAR(1024) NOT NULL COMMENT '내용' COLLATE 'utf8_general_ci',
	`member_id` VARCHAR(50) NOT NULL COMMENT '작성자' COLLATE 'utf8_general_ci',
	`notice_sort` INT(11) NOT NULL DEFAULT '1' COMMENT '정렬순서',
	`regdt` DATE NOT NULL COMMENT '작성날짜',
	PRIMARY KEY (`notice_seq`) USING BTREE
)
COMMENT='공지사항'
COLLATE='utf8_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=3
;






UPDATE tb_notice SET member_id = '이지안2' WHERE notice_seq = 3;
SELECT * FROM tb_notice