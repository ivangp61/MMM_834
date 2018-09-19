select * 
from processlogheader H
where 1 = 1
	AND H.externalid IN('QnxtEHubSyncMember834EDIPMCA20180103014821',
						'QnxtEHubSyncMember834EDIPMCU20180103014822',
						'QnxtEHubSyncMember834EDIPMCV20180103014822')
	AND CONVERT(VARCHAR,CREATEDATE,112) =  '20180103'
	AND processlogid='QDXPRC94536930'
;
--010241553

--QLPRC096436221 
select *
from processlogdetail  D
where 1 = 1 
	AND processlogid IN('QLPRC096437699', 'QLPRC096436221', 'QLPRC096432682') 
	AND D.customerrmsg LIKE '%QLXM00000286844%'
--Reference id: QLXM00000135207

select * 
from processstate 
where logid in('QDXPRC94536934')


SELECT TOP 100 *
FROM [dbo].[statsprocessdata]


