USE QNXTHub;
GO

-- select * from qnxt.MemberEnrollKeys where Carriermemid = '010204424'

DECLARE
   @subid varchar( 10 ) = '010176510' ,
   @id int = 10085 ,
   @memid char( 15 ) = 'QLXM00000128596';

SELECT 'TgtHead'                     'tbl'
      ,h.MaintIdentCd
      ,h.SubscriberIdent             'Aveta'
      ,h.SubscriberSupplementalIdent 'HicNumber'
      ,h.MemId
      ,h.SecondaryId
  FROM tgt.MemberHeader h
  WHERE 1 = 1
	--AND SubscriberIdent = '010176510'
    AND MemId = @memid;
--AND DIHMemberRecId = @id;

SELECT 'StgPlan'                                'tbl'
      ,CONVERT( varchar( 10 ) ,p.EffDate ,101 ) 'effdate'
      ,CONVERT( varchar( 10 ) ,p.TermDate ,101 )'termdate'
      ,p.SourceCode
      ,p.BenefitPlan
  FROM
       stg.MemberBenefitPlan p
       JOIN stg.MemberHeader h
            ON h.DIHMemberRecId = p.DIHMemberRecId
  WHERE 1 = 1
        -- AND DIHMemberRecId = @id
    AND MemId = @memid
  ORDER BY p.EffDate;

SELECT 'StgHosp'                                'tbl'
      ,CONVERT( varchar( 10 ) ,h.EffDate ,101 ) 'effdate'
      ,CONVERT( varchar( 10 ) ,h.TermDate ,101 )'termdate'
  FROM
       stg.MemberHospice h
       JOIN stg.MemberHeader p
            ON h.DIHMemberRecId = p.DIHMemberRecId
  WHERE 1 = 1
        -- AND DIHMemberRecId = @id
    AND MemId = @memid
  ORDER BY h.effdate;

SELECT 'QnxtHic'                              'tbl'
      ,HicNumber
      ,CONVERT( varchar( 10 ) ,effdate ,101 ) 'effdate'
      ,CONVERT( varchar( 10 ) ,termdate ,101 )'termdate'
  FROM qnxt.MemberHic h
  WHERE 1 = 1
    AND MemId = @memid;

SELECT 'QnxtKeys'                               'tbl'
      ,
       -- k.SegType
       CONVERT( varchar( 10 ) ,k.EffDate ,101 ) 'effdate'
      ,CONVERT( varchar( 10 ) ,k.TermDate ,101 )'termdate'
      ,k.PrimaryStatus                          's'
      ,k.CoverageCodeId                         'Ins'
      ,k.RateCode                               'Rate'
      ,k.orgpolicy                              'Pol'
  FROM qnxt.MemberEnrollKeys k
  WHERE 1 = 1
        -- AND Carriermemid = @subid
    AND k.MemId = @memid--'QLXM00000128596'
  -- and k.PrimaryStatus = 'P'
  ORDER BY k.effdate;

SELECT 'TgtPlan'                                                           'tbl'
      ,CONVERT( varchar( 10 ) ,CAST( p.EnrollDateBegin AS datetime ) ,101 )'effdate'
      ,CONVERT( varchar( 10 ) ,CAST( p.EnrollDateEnd AS datetime ) ,101 )  'termdate'
       --,p.TransactionGroupCd                                                'Tg'
      ,p.MaintIdentCd                                                      'M'
      ,p.InsuranceLineCd                                                   'Ins'
      ,p.PlanCoverageDesc                                                  'Rate'
       --,p.EnrollDateBeginIdentCd      
       --,p.EnrollDateEndIdentCd
       --,p.ClientRptCatIdentCd
       -- ,p.ClientRptCatident
       --,p.PolicyGroupIdentCd
      ,p.PolicyGroupIdent                                                  'Pol'
  FROM
       tgt.MemberBenefitPlan p
       JOIN stg.MemberHeader h
            ON h.DIHMemberRecId = p.DIHMemberRecId
  WHERE 1 = 1
        -- AND DIHMemberRecId = @id
--    AND h.memid = @memid
  ORDER BY p.EnrollDateBegin;

SELECT --pcp.EntityIdentCd
       --,pcp.EntityTypeQualifier
       'TgtPcp' 'tbl'
      ,pcp.Firstname
      ,pcp.Middlename
      ,pcp.Lastname
      ,pcp.IdentCdQualifier
       --,pcp.IdentCd
      ,pcp.EffectiveDate
      ,pcp.MaintReasonCd
  FROM
       tgt.MemberPcp pcp
       JOIN stg.MemberHeader h
            ON h.DIHMemberRecId = pcp.DIHMemberRecId
  WHERE 1 = 1
    AND h.memid = @memid;
--AND DIHMemberRecId = @id;


