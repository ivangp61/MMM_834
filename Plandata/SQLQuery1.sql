--==================Member_Demographics===================
SELECT Memb.memid
      ,Memb.secondaryid
      ,Memb.ssn
      ,Memb.sex
      ,Memb.dob     
      ,ent.firstname
      ,ent.middlename
      ,ent.lastname
FROM
       dbo.member Memb WITH ( NOLOCK )     
       JOIN dbo.entity ent WITH ( NOLOCK )
            ON ent.entid = Memb.entityid
WHERE 1 = 1
	AND Memb.memid = 'QLXM00000121146'
;
--==================Member_Demographics===================



--==================Member_Demographics===================
SELECT Memb.*
FROM
       dbo.member Memb WITH ( NOLOCK )     
WHERE 1 = 1
	AND Memb.memid = 'QLXM00000121146'
;
--==================Member_Demographics===================


--==================Member_Demographics===================
SELECT Memb.memid
      ,Memb.secondaryid
      ,ent.*
FROM
       dbo.member Memb WITH ( NOLOCK )     
       JOIN dbo.entity ent WITH ( NOLOCK )
            ON ent.entid = Memb.entityid
WHERE 1 = 1
	AND Memb.memid = 'QLXM00000121146'
;
--==================Member_Demographics===================

SELECT M.memid
      ,M.secondaryid
      ,ent.*
	  , K.effdate
	  , K.termdate
FROM dbo.member M WITH ( NOLOCK )     
	JOIN dbo.entity ent WITH ( NOLOCK )
	ON ent.entid = M.entityid
	JOIN dbo.enrollkeys K WITH(NOLOCK)
	ON M.memid = K.memid
WHERE 1 = 1
	AND M.memid = 'QLXM00000358914'
;


SELECT  M.memid
	  , K.effdate
	  , K.termdate
	  , K.ratecode
	  --, K.
FROM dbo.member M WITH (NOLOCK)
	JOIN dbo.enrollkeys K WITH(NOLOCK)
	ON M.memid = K.memid
WHERE 1 = 1
	AND M.memid = 'QLXM00000358914'
	--AND K.segtype <> 'DEL'
ORDER BY K.effdate DESC
;


