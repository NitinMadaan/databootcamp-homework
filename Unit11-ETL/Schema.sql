drop database if exists ETLPROJECT;
create database ETLPROJECT;
use ETLPROJECT;

drop table if exists youtube_data;

create table youtube_data (

video_id varchar(100),
cat_id int,
views int,
likes int,
dislikes int,
comment_count int,
category varchar(100)

);

drop table if exists billboard_data;

create table billboard_data (

Artist varchar(100),
Song_Title varchar(100)

);


