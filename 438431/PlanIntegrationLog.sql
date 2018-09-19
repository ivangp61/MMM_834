select * 
from processlogheader H
where 1 = 1
	AND H.externalid = 'QnxtEHubSyncMember834EDIMMMV20171219180022'
--processlogid='QDXPRC94536930'
;


select TOP 10 * 
from processlogdetail 
where processlogid='QDXPRC94536934'
--Reference id: QLXM00000135207               
--QLXM00000286844
select * 
from processstate 
where logid in('QDXPRC94536934')


SELECT TOP 100 *
FROM [dbo].[statsprocessdata]


