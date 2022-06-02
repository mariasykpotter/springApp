DROP TABLE PERSON CASCADE;
DROP TABLE CATEGORY CASCADE;
DROP TABLE ACTIVITY;
DROP TABLE TIME_LOG;
----------------------------------------------------------------
DELETE FROM PERSON;
DELETE FROM CATEGORY;
DELETE FROM ACTIVITY;
DELETE FROM TIME_LOG;
----------------------------------------------------------------
-- PERSON
----------------------------------------------------------------
INSERT INTO PERSON VALUES (DEFAULT, 'Andriy', 'Petrov', 'a_petov', 0, DEFAULT, '123');
SELECT * FROM PERSON;
----------------------------------------------------------------
-- CATEGORY
----------------------------------------------------------------
INSERT INTO CATEGORY VALUES (DEFAULT,'документація');
INSERT INTO CATEGORY VALUES (DEFAULT,'тестування');
INSERT INTO CATEGORY VALUES (DEFAULT,'удосконалення');
INSERT INTO CATEGORY VALUES (DEFAULT,'функціонал');
INSERT INTO CATEGORY VALUES (DEFAULT,'комунікація');
INSERT INTO CATEGORY VALUES (DEFAULT,'інфраструктура');
INSERT INTO CATEGORY VALUES (DEFAULT,'підготовка');
INSERT INTO CATEGORY VALUES (DEFAULT,'безпека');
----------------------------------------------------------------
-- ACTIVITY
----------------------------------------------------------------
INSERT INTO ACTIVITY VALUES (DEFAULT,'прочитання документації',1);
INSERT INTO ACTIVITY VALUES (DEFAULT,'юніт-тестування',2);
INSERT INTO ACTIVITY VALUES (DEFAULT,'дейлі-мітинг',5);
INSERT INTO ACTIVITY VALUES (DEFAULT,'мануальне тестування',2);
INSERT INTO ACTIVITY VALUES (DEFAULT,'написання нового коду',4);
INSERT INTO ACTIVITY VALUES (DEFAULT,'формування вимог',5);
INSERT INTO ACTIVITY VALUES (DEFAULT,'налаштування білда',6);
INSERT INTO ACTIVITY VALUES (DEFAULT,'автоматизоване тестування',2);
INSERT INTO ACTIVITY VALUES (DEFAULT,'перегляд пул ріквестів',5);
INSERT INTO ACTIVITY VALUES (DEFAULT,'налаштування середовища',7);
INSERT INTO ACTIVITY VALUES (DEFAULT,'трансфер знань',5);
INSERT INTO ACTIVITY VALUES (DEFAULT,'виправлення багів',3);
INSERT INTO ACTIVITY VALUES (DEFAULT,'налаштування деплою',6);
INSERT INTO ACTIVITY VALUES (DEFAULT,'рефакторинг',3);
INSERT INTO ACTIVITY VALUES (DEFAULT,'написання документації',1);
INSERT INTO ACTIVITY VALUES (DEFAULT,'статичний аналіз коду',3);
INSERT INTO ACTIVITY VALUES (DEFAULT,'аналіз безпеки коду',8);
INSERT INTO ACTIVITY VALUES (DEFAULT,'демо-мітинг',5);
----------------------------------------------------------------
SELECT * FROM CATEGORY;
SELECT * FROM ACTIVITY;
SELECT * FROM PERSON;
SELECT * FROM TIME_LOG;