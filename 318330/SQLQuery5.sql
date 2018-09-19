SELECT TOP 50 *
FROM dbo.referral
WHERE authorizationid LIKE 'QL%'
	AND createid = 'william.martine'
;


SELECT DISTINCT createid
FROM dbo.referral
WHERE authorizationid LIKE 'QL%'
	AND 
;


SELECT TOP 50 *
FROM dbo.authcontact
WHERE 1 = 1
	--AND createid = 'william.martine'
	AND referralid = 'QLXRM037300'


SELECT        CONVERT(DATE, DATEADD(dd, 7 - DATEPART(dw, DATEADD([day], - 1, referral.createdate)), DATEADD([day], - 1, referral.createdate))) AS Date, 7 AS MetricID, COUNT(1)
                          AS Value, CASE WHEN LEFT(member.headofhouse, 2) = '01' THEN 'MMM' ELSE 'PMC' END AS Company, 1 AS LOB
FROM            dbo.referral WITH (nolock) INNER JOIN
                         dbo.member ON referral.memid COLLATE SQL_Latin1_General_Pref_CP1_CI_AS = member.memid COLLATE SQL_Latin1_General_Pref_CP1_CI_AS
WHERE        (DATEDIFF(WEEK, DATEADD([day], - 1, referral.createdate), GETDATE()) = 0) AND (referral.authorizationid LIKE 'RF%')
GROUP BY CONVERT(DATE, DATEADD(dd, 7 - DATEPART(dw, DATEADD([day], - 1, referral.createdate)), DATEADD([day], - 1, referral.createdate))), 
                         CASE WHEN LEFT(member.headofhouse, 2) = '01' THEN 'MMM' ELSE 'PMC' END




UNION ALL



SELECT        CONVERT(DATE, DATEADD(dd, 7 - DATEPART(dw, DATEADD([day], - 1, referral_1.createdate)), DATEADD([day], - 1, referral_1.createdate))) AS Date, 50 AS MetricID, 
                         COUNT(1) AS Value, CASE WHEN LEFT(member_1.headofhouse, 2) = '01' THEN 'MMM' ELSE 'PMC' END AS Company, 1 AS LOB
FROM            dbo.referral AS referral_1 WITH (nolock) INNER JOIN
                         dbo.member AS member_1 ON referral_1.memid = member_1.memid
WHERE        (DATEDIFF(WEEK, DATEADD([day], - 1, referral_1.createdate), GETDATE()) = 0) AND (referral_1.authorizationid LIKE 'QL%') AND (referral_1.createid = 'william.martine')
GROUP BY CONVERT(DATE, DATEADD(dd, 7 - DATEPART(dw, DATEADD([day], - 1, referral_1.createdate)), DATEADD([day], - 1, referral_1.createdate))), 
                         CASE WHEN LEFT(member_1.headofhouse, 2) = '01' THEN 'MMM' ELSE 'PMC' END







UNION ALL
SELECT        CONVERT(DATE, DATEADD(dd, 7 - DATEPART(dw, DATEADD([day], - 1, referral_4.createdate)), DATEADD([day], - 1, referral_4.createdate))) AS Date, 7 AS MetricID, 
                         COUNT(1) AS Value, CASE WHEN LEFT(member_4.headofhouse, 2) = '01' THEN 'MMM' ELSE 'PMC' END AS Company, - 1 AS LOB
FROM            dbo.referral AS referral_4 WITH (nolock) INNER JOIN
                         dbo.member AS member_4 ON referral_4.memid = member_4.memid
WHERE        (DATEDIFF(WEEK, DATEADD([day], - 1, referral_4.createdate), GETDATE()) = 0) AND (referral_4.authorizationid LIKE 'RF%')
GROUP BY CONVERT(DATE, DATEADD(dd, 7 - DATEPART(dw, DATEADD([day], - 1, referral_4.createdate)), DATEADD([day], - 1, referral_4.createdate))), 
                         CASE WHEN LEFT(member_4.headofhouse, 2) = '01' THEN 'MMM' ELSE 'PMC' END
UNION ALL
SELECT        CONVERT(DATE, DATEADD(dd, 7 - DATEPART(dw, DATEADD([day], - 1, referral_1.createdate)), DATEADD([day], - 1, referral_1.createdate))) AS Date, 50 AS MetricID, 
                         COUNT(1) AS Value, CASE WHEN LEFT(member_1.headofhouse, 2) = '01' THEN 'MMM' ELSE 'PMC' END AS Company, - 1 AS LOB
FROM            dbo.referral AS referral_1 WITH (nolock) INNER JOIN
                         dbo.member AS member_1 ON referral_1.memid = member_1.memid
WHERE        (DATEDIFF(WEEK, DATEADD([day], - 1, referral_1.createdate), GETDATE()) = 0) AND (referral_1.authorizationid LIKE 'QL%') AND (referral_1.createid = 'william.martine')
GROUP BY CONVERT(DATE, DATEADD(dd, 7 - DATEPART(dw, DATEADD([day], - 1, referral_1.createdate)), DATEADD([day], - 1, referral_1.createdate))), 
                         CASE WHEN LEFT(member_1.headofhouse, 2) = '01' THEN 'MMM' ELSE 'PMC' END
UNION ALL
SELECT        CONVERT(DATE, DATEADD(dd, 7 - DATEPART(dw, DATEADD([day], - 1, referral_3.createdate)), DATEADD([day], - 1, referral_3.createdate))) AS Date, 7 AS MetricID, 
                         COUNT(1) AS Value, 'ALL' AS Company, 1 AS LOB
FROM            dbo.referral AS referral_3 WITH (nolock) INNER JOIN
                         dbo.member AS member_3 ON referral_3.memid = member_3.memid
WHERE        (DATEDIFF(WEEK, DATEADD([day], - 1, referral_3.createdate), GETDATE()) = 0) AND (referral_3.authorizationid LIKE 'RF%')
GROUP BY CONVERT(DATE, DATEADD(dd, 7 - DATEPART(dw, DATEADD([day], - 1, referral_3.createdate)), DATEADD([day], - 1, referral_3.createdate)))
UNION ALL
SELECT        CONVERT(DATE, DATEADD(dd, 7 - DATEPART(dw, DATEADD([day], - 1, referral_1.createdate)), DATEADD([day], - 1, referral_1.createdate))) AS Date, 50 AS MetricID, 
                         COUNT(1) AS Value, 'ALL' AS Company, 1 AS LOB
FROM            dbo.referral AS referral_1 WITH (nolock) INNER JOIN
                         dbo.member AS member_1 ON referral_1.memid = member_1.memid
WHERE        (DATEDIFF(WEEK, DATEADD([day], - 1, referral_1.createdate), GETDATE()) = 0) AND (referral_1.authorizationid LIKE 'QL%') AND (referral_1.createid = 'william.martine')
GROUP BY CONVERT(DATE, DATEADD(dd, 7 - DATEPART(dw, DATEADD([day], - 1, referral_1.createdate)), DATEADD([day], - 1, referral_1.createdate)))
UNION ALL
SELECT        CONVERT(DATE, DATEADD(dd, 7 - DATEPART(dw, DATEADD([day], - 1, referral_2.createdate)), DATEADD([day], - 1, referral_2.createdate))) AS Date, 7 AS MetricID, 
                         COUNT(1) AS Value, 'ALL' AS Company, - 1 AS LOB
FROM            dbo.referral AS referral_2 WITH (nolock) INNER JOIN
                         dbo.member AS member_2 ON referral_2.memid = member_2.memid
WHERE        (DATEDIFF(WEEK, DATEADD([day], - 1, referral_2.createdate), GETDATE()) = 0) AND (referral_2.authorizationid LIKE 'RF%')
GROUP BY CONVERT(DATE, DATEADD(dd, 7 - DATEPART(dw, DATEADD([day], - 1, referral_2.createdate)), DATEADD([day], - 1, referral_2.createdate)))
UNION ALL
SELECT        CONVERT(DATE, DATEADD(dd, 7 - DATEPART(dw, DATEADD([day], - 1, referral_1.createdate)), DATEADD([day], - 1, referral_1.createdate))) AS Date, 50 AS MetricID, 
                         COUNT(1) AS Value, 'ALL' AS Company, - 1 AS LOB
FROM            dbo.referral AS referral_1 WITH (nolock) INNER JOIN
                         dbo.member AS member_1 ON referral_1.memid = member_1.memid
WHERE        (DATEDIFF(WEEK, DATEADD([day], - 1, referral_1.createdate), GETDATE()) = 0) AND (referral_1.authorizationid LIKE 'QL%') AND (referral_1.createid = 'william.martine')
GROUP BY CONVERT(DATE, DATEADD(dd, 7 - DATEPART(dw, DATEADD([day], - 1, referral_1.createdate)), DATEADD([day], - 1, referral_1.createdate)))
