-- board.sql
drop table board purge;

create table board(
board_no int primary key,
board_name varchar(20) not null,
board_title varchar(50) not null,
board_cont varchar(4000),
board_pwd varchar(20) not null,
board_regdate date
);


-- 시퀀스 생성
drop sequence board_seq;

create sequence board_seq
       increment by 1 start with 1;
-- 레코드 추가
insert into board values(board_seq.nextval,'도인호',
      '상담좀 부탁드립니다.','제가 취업 준비중이고 현재 모아놓은 자산이 없는데 재무설계가 가능할까요? ','1234',sysdate);
insert into board values(board_seq.nextval,'안재형',
      '답답합니다.','결혼 후 자산이 좀처럼 늘지 않고 오히려 마이너스입니다. 직접 만나서 자세한 상담 가능할까요? ','1234',sysdate);
insert into board values(board_seq.nextval,'조성대',
      '재무설계 도와주세요.','집 한채가 있으며 저축,투자 여력은 없고 자녀가 둘 있습니다. 은퇴자금을 어떻게 마련해야 할까요?','1234',sysdate);
delete from board where board_name='도인호';
delete from board where board_name='임재형';
delete from board where board_name='조성대';
select * from BOARD;
commit work;
