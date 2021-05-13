drop table Graph;

create table Graph (
    vertex BIGINT,
    neighbour BIGINT)
row format delimited fields terminated by ',' stored as textfile;

load data local inpath '${hiveconf:G}' overwrite into table Graph;

select CountNeighbours, count(CountNeighbours) from 
(select vertex as Vertex,count(neighbour) as CountNeighbours from Graph group by vertex) as CountOfNeighbours
group by CountNeighbours;
