CREATE TABLE `tb_chat_message` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_id` int(11) NOT NULL,
  `message` varchar(2048) NOT NULL,
  `id` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `unread_cnt` int(11) NOT NULL,
  `regdt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8

CREATE TABLE `tb_chat_room` (
  `room_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` varchar(50) NOT NULL,
  `member_name` varchar(50) NOT NULL,
  `member_img` varchar(1024) DEFAULT NULL,
  `master_id` varchar(50) NOT NULL,
  `master_name` varchar(50) NOT NULL,
  `master_img` varchar(1024) DEFAULT NULL,
  `unread_cnt` int(11) NOT NULL,
  `member_state` varchar(50) NOT NULL,
  `master_state` varchar(50) NOT NULL,
  `create_date` timestamp NULL DEFAULT NULL,
  `member_update_date` timestamp NULL DEFAULT NULL,
  `master_update_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`member_id`,`master_id`),
  UNIQUE KEY `room_id` (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8

CREATE TABLE `tb_consult` (
  `consult_seq` int(11) NOT NULL AUTO_INCREMENT COMMENT '상담글 시퀀스',
  `member_id` varchar(50) NOT NULL COMMENT '작성자',
  `consult_title` varchar(256) NOT NULL COMMENT '상담글 제목',
  `consult_cont` varchar(1024) NOT NULL COMMENT '상담글 내용',
  `consult_depth` int(11) NOT NULL COMMENT '상담글 depth',
  `consult_parent_seq` int(11) DEFAULT NULL COMMENT '상담글 부모 시퀀스',
  `consult_tpo` varchar(50) NOT NULL COMMENT '상담글 분야',
  `consult_count` int(11) NOT NULL COMMENT '상담글 조회수',
  `consult_good_cnt` int(11) NOT NULL COMMENT '함께 궁금해요',
  `regdt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '등록날짜',
  PRIMARY KEY (`consult_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='상담글(지식인)'

CREATE TABLE `tb_coupon` (
  `coupon_seq` int(11) NOT NULL AUTO_INCREMENT COMMENT '쿠폰 시퀀스',
  `coupon_code` varchar(50) NOT NULL COMMENT '쿠폰 코드',
  `coupon_title` varchar(256) NOT NULL COMMENT '쿠폰 제목',
  `coupon_cont` varchar(1024) NOT NULL COMMENT '쿠폰 내용',
  `coupon_saleprice` varchar(50) NOT NULL COMMENT '쿠폰 할인 금액',
  `coupon_sdate` date DEFAULT NULL COMMENT '쿠폰 시작날짜',
  `coupon_edate` date DEFAULT NULL COMMENT '쿠폰 종료날짜',
  `regdt` date NOT NULL COMMENT '쿠폰 작성날짜',
  PRIMARY KEY (`coupon_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='쿠폰'


CREATE TABLE `tb_faq` (
  `faq_seq` int(11) NOT NULL AUTO_INCREMENT COMMENT '자주묻는질문 시퀀스',
  `faq_title` varchar(256) NOT NULL COMMENT '제목',
  `faq_cont` varchar(1024) NOT NULL COMMENT '내용',
  `regdt` date NOT NULL COMMENT '등록날짜',
  PRIMARY KEY (`faq_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='자주묻는질문'

CREATE TABLE `tb_file_upload` (
  `file_seq` int(11) NOT NULL AUTO_INCREMENT,
  `original_file_name` varchar(1024) NOT NULL,
  `save_file_name` varchar(1024) NOT NULL,
  `file_path` varchar(1024) NOT NULL,
  `regdt` date NOT NULL,
  PRIMARY KEY (`file_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8

CREATE TABLE `tb_keyword` (
  `keyword_seq` int(11) NOT NULL AUTO_INCREMENT COMMENT '업무분야 시퀀스',
  `keyword_code` varchar(50) NOT NULL COMMENT 'tpo code',
  `keyword_title` varchar(256) NOT NULL COMMENT '업무 분야 제목',
  `keyword_sort` int(11) NOT NULL COMMENT '정렬순서',
  `keword_icon` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`keyword_code`),
  UNIQUE KEY `keyword_seq` (`keyword_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='업무 분야'


CREATE TABLE `tb_member` (
  `member_seq` int(11) NOT NULL AUTO_INCREMENT COMMENT '유저시퀀스',
  `member_id` varchar(50) NOT NULL COMMENT '유저 아이디(이메일)',
  `member_pwd` varchar(100) DEFAULT NULL COMMENT '유저 비밀번호',
  `member_mail` varchar(100) NOT NULL COMMENT '유저 이메일',
  `member_name` varchar(50) NOT NULL COMMENT '유저 이름',
  `member_phone` varchar(50) NOT NULL COMMENT '유저 전화번호',
  `member_birthd` varchar(50) DEFAULT NULL COMMENT '유저 생년월일',
  `member_gender` varchar(50) DEFAULT NULL COMMENT '유저 성별',
  `member_alram` varchar(50) DEFAULT NULL COMMENT '유저 안내 수신 유무',
  `member_gubun` varchar(50) NOT NULL COMMENT '유저 구분(사용자, 전문가, 관리자)',
  `member_state` varchar(50) NOT NULL COMMENT '유저 탈퇴 유무',
  `member_img` varchar(50) DEFAULT NULL COMMENT '유저 프로필 사진',
  `pro_career` varchar(1024) DEFAULT NULL COMMENT '전문가 경력사항',
  `pro_tpo` varchar(50) DEFAULT NULL COMMENT '전문가 직종',
  `pro_state` varchar(50) DEFAULT NULL COMMENT '전문가 승인 유무',
  `regdt` date NOT NULL DEFAULT '0000-00-00' COMMENT '유저 가입날짜',
  PRIMARY KEY (`member_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='사용자'


CREATE TABLE `tb_member_coupon` (
  `coupon_code` varchar(50) NOT NULL COMMENT '쿠폰코드',
  `member_id` varchar(50) NOT NULL COMMENT '유저아이디',
  `coupon_sdate` date NOT NULL COMMENT '시작날짜',
  `coupon_edate` date NOT NULL COMMENT '종료날짜',
  `coupon_state` varchar(50) NOT NULL COMMENT '사용유무',
  `regdt` varchar(50) NOT NULL COMMENT '등록날짜',
  PRIMARY KEY (`coupon_code`,`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='사용자별 쿠폰'


CREATE TABLE `tb_notice` (
  `notice_seq` int(11) NOT NULL AUTO_INCREMENT COMMENT '시퀀스',
  `notice_title` varchar(256) NOT NULL COMMENT '제목',
  `notice_cont` varchar(1024) NOT NULL COMMENT '내용',
  `member_id` varchar(50) NOT NULL COMMENT '작성자',
  `notice_sort` int(11) NOT NULL DEFAULT 1 COMMENT '정렬순서',
  `regdt` date NOT NULL COMMENT '작성날짜',
  PRIMARY KEY (`notice_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='공지사항'


CREATE TABLE `tb_oneask` (
  `oneask_seq` int(11) NOT NULL AUTO_INCREMENT COMMENT '1:1문의 시퀀스',
  `member_id` varchar(50) NOT NULL COMMENT '작성자',
  `oneask_title` varchar(256) NOT NULL COMMENT '제목',
  `oneask_cont` varchar(1024) NOT NULL COMMENT '내용',
  `oneask_parent_seq` int(11) DEFAULT NULL COMMENT '부모 시퀀스',
  `regdt` date NOT NULL COMMENT '등록날짜',
  PRIMARY KEY (`oneask_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='1:1문의'


CREATE TABLE `tb_prodetail_1` (
  `member_id` varchar(50) CHARACTER SET utf8 NOT NULL,
  `license_title` varchar(100) CHARACTER SET utf8 NOT NULL,
  `license_publish` varchar(100) CHARACTER SET utf8 NOT NULL,
  `license_date` varchar(100) CHARACTER SET utf8 NOT NULL,
  `license_img` varchar(200) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='전문가 상세'


CREATE TABLE `tb_prodetail_2` (
  `member_id` varchar(50) CHARACTER SET utf8 NOT NULL,
  `office_name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `office_address` varchar(200) CHARACTER SET utf8 NOT NULL,
  `office_tel` varchar(50) CHARACTER SET utf8 NOT NULL,
  `pro_keyword` varchar(300) CHARACTER SET utf8 NOT NULL,
  `pro_introduction` varchar(300) CHARACTER SET utf8 NOT NULL,
  `pro_chattSet` varchar(50) DEFAULT NULL,
  `pro_phone` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `consult_callcheck` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `consult_phone` int(11) DEFAULT NULL,
  `consult_visit` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='전문가 상세'


CREATE TABLE `tb_request` (
  `request_seq` int(11) NOT NULL COMMENT '의뢰 시퀀스',
  `pro_id` varchar(50) NOT NULL COMMENT '전문가 아이디',
  `member_id` varchar(50) NOT NULL COMMENT '사용자 아이디',
  `request_title` varchar(256) NOT NULL COMMENT '의뢰 신청 제목',
  `request_cont` varchar(1024) NOT NULL COMMENT '의뢰 신청 내용',
  `request_keyword` varchar(50) NOT NULL COMMENT '의뢰 신청 분야',
  `request_kind` varchar(50) NOT NULL COMMENT '의뢰 신청 방법',
  `request_date` date NOT NULL COMMENT '의뢰 신청 날짜',
  `request_time` varchar(50) NOT NULL COMMENT '의뢰 신청 시간',
  `regdt` date NOT NULL COMMENT '등록날짜',
  PRIMARY KEY (`request_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='상담 의뢰'



CREATE TABLE `tb_review` (
  `review_seq` int(11) NOT NULL AUTO_INCREMENT COMMENT '후기시퀀스',
  `request_seq` int(11) NOT NULL COMMENT '상담 시퀀스',
  `member_id` varchar(50) NOT NULL COMMENT '후기 작성자',
  `review_title` varchar(256) NOT NULL COMMENT '후기 제목',
  `review_cont` varchar(1024) NOT NULL COMMENT '후기 내용',
  `review_score` varchar(50) NOT NULL COMMENT '후기 별점',
  `regdt` date NOT NULL COMMENT '작성 날짜',
  PRIMARY KEY (`request_seq`,`member_id`),
  UNIQUE KEY `review_seq` (`review_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='상담 후기'


CREATE TABLE `tb_schedule` (
  `schedule_date` date NOT NULL COMMENT '일정 날짜',
  `member_id` varchar(50) NOT NULL COMMENT '전문가 아이디',
  `schedule_time` varchar(50) NOT NULL COMMENT '일정 시간',
  PRIMARY KEY (`schedule_date`,`member_id`,`schedule_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='전문가 일정'


CREATE TABLE `tb_scrap` (
  `scrap_seq` int(11) NOT NULL AUTO_INCREMENT COMMENT '관심목록시퀀스',
  `scrap_id` varchar(50) NOT NULL COMMENT '관심목록 등록된 전문가 아이디',
  `member_id` varchar(50) NOT NULL COMMENT '관심목록 등록하는 사용자 아이디',
  `regdt` date NOT NULL COMMENT '등록날짜',
  PRIMARY KEY (`scrap_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='관심목록'


CREATE TABLE `tb_solution` (
  `solution_seq` int(11) NOT NULL COMMENT '해결사례 시퀀스',
  `tpo_code` varchar(50) NOT NULL COMMENT '전문가 종류코드',
  `solution_title` varchar(256) NOT NULL COMMENT '제목',
  `solution_cont` varchar(1024) NOT NULL COMMENT '내용',
  `member_id` varchar(50) NOT NULL COMMENT '작성자',
  `solution_sort` int(11) NOT NULL COMMENT '정렬순서',
  `solution_file` varchar(1024) DEFAULT NULL COMMENT '파일이름',
  `solution_state` varchar(2) NOT NULL DEFAULT 'N' COMMENT '승인유무',
  `regdt` date NOT NULL COMMENT '등록날짜',
  PRIMARY KEY (`solution_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='해결사례'


CREATE TABLE `tb_tpo` (
  `tpo_code` varchar(50) NOT NULL COMMENT '전문가 종류코드',
  `tpo_title` varchar(50) NOT NULL COMMENT '전문가 종류제목',
  `tpo_sort` int(11) NOT NULL COMMENT '정렬순서',
  `tpo_icon` varchar(50) NOT NULL COMMENT '아이콘',
  `regdt` date NOT NULL COMMENT '등록날짜',
  PRIMARY KEY (`tpo_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='전문가 종류'