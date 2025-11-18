use devdb;
drop table if exists personal; -- emp와 유사
drop table if exists division; -- dept와 유사
create table division(
	dno int, -- 부서번호
    dname varchar(20) not null, -- 부서명
    phone varchar(20) unique, -- 부서전화
    position varchar(20), -- 부서위치
    primary key(dno)
);
create table personal(
	pno int, -- 사번
    pname varchar(20) not null, -- 사원명
    job varchar(20) not null, -- 직책
    manager int, -- 상사의 사번
    startdate date, -- 입사일
    pay int, -- 급여
    bonus int, -- 상여
	dno int,
    primary key(pno),
    foreign key(dno) references division(dno)
);
insert into division values (10, 'finance', '02-2088-5679','신림');
insert into division values (20, 'research', '02-555-4321','강남');
insert into division values (30, 'sales', '02-717-4321','마포');
insert into division values (40, 'cs', '031-4444-4321','수원');

insert into personal values (1111,'smith','manager', 1001, '1990-12-17', 1000, null, 10);
insert into personal values (1112,'ally','salesman',1116,'1991-02-20',1600,500,30);
insert into personal values (1113,'word','salesman',1116,'1992-02-24',1450,300,30);
insert into personal values (1114,'james','manager',1001,'1990-04-12',3975,null,20);
insert into personal values (1001,'bill','president',null,'1989-01-10',7000,null,10);
insert into personal values (1116,'johnson','manager',1001,'1991-05-01',3550,null,30);
insert into personal values (1118,'martin','analyst',1111,'1991-09-09',3450,null,10);
insert into personal values (1121,'kim','clerk',1114,'1990-12-08',4000,null,20);
insert into personal values (1123,'lee','salesman',1116,'1991-09-23',1200,0,30);
insert into personal values (1226,'park','analyst',1111,'1990-01-03',2500,null,10);
-- 1. 사번, 이름, 급여를 출력
select pno, pname, pay from personal;
-- 2. 급여가 2000~5000 사이 모든 직원의 모든 필드
select * from personal where pay between 2000 and 5000;
-- 3. 부서번호가 10또는 20인 사원의 사번, 이름, 부서번호
select pno, pname, p.dno 
	from personal p, division d
    where p.dno = d.dno and p.dno=10 or p.dno=20;
-- 4. 보너스가 null인 사원의 사번, 이름, 급여 급여 큰 순정렬
select pno, pname, pay
	from personal
    where bonus is null
    ORDER BY pay desc;
-- 5. 사번, 이름, 부서번호, 급여. 부서코드 순 정렬 같으면 PAY 큰순
select pno, pname, p.dno, pay 
	from personal p, division d
    where p.dno = d.dno
    order by pay desc, p.dno;
-- 6. 사번, 이름, 부서명
select pno, pname, dname
	from personal p, division d
    where p.dno = d.dno;
-- 7. 사번, 이름, 상사이름
select p.pno, p.pname, m.pname managername
	from personal p, personal m, division d
    where p.dno = d.dno and p.manager= m.pno ;
-- 8. 사번, 이름, 상사이름(상사가 없는 사람도 출력하되 상사가 없는 경우 ★CEO★로 출력) 
select w.pno, w.pname, ifnull(m.pname, '★CEO★') manager_name
	from personal w  left outer join personal m
    on w.manager = m.pno; 
-- 8-1 사번, 이름, 상사사번(상사가 없으면 ceo로 출력. ifnull함수의 매개변수의 타입이 상이해도 상관없음)
select pno, pname, ifnull(manager,'ceo') manager from personal;
-- 8-2. 사번, 이름, 상사이름, 부서명(상사가 없는 사람도 출력) – 같이 합시다
select w.pno, w.pname, ifnull(m.pname, '★CEO★') manager, dname
	from division d, personal w  left outer join personal m
    on w.manager = m.pno;
-- 9. 이름이 s로 시작하는 사원 이름 (like 이용, substr함수이용, instr함수 이용등 다양하게 사용 가능)
select pname
	from personal
    where pname like 's%';
-- 10. 사번, 이름, 급여, 부서명, 상사이름
select p.pno, p.pname, p.pay, dname, m.pname managername
	from personal p, personal m, division d
    where p.dno = d.dno and p.manager= m.pno;