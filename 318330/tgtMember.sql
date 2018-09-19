DELETE tgt.MemberPcp;
DELETE tgt.MemberBenefitPlan;
DELETE tgt.MemberHeader;


SELECT *
FROM tgt.MemberPcp;

SELECT *
FROM tgt.MemberBenefitPlan;

SELECT *
FROM tgt.MemberHeader;

SELECT  keys.MemId, keys.Carriermemid, keys.SegType, keys.EffDate, keys.TermDate, keys.PrimaryStatus, keys.RateCode, keys.CoverageCodeId, keys.OrgPolicy FROM qnxt.MemberEnrollKeys keys WHERE keys.Carriermemid =  '030056790' and SegType = 'INT' ORDER BY EffDate ASC
;

--HAY UN PROBLEMA CON LA FECHA DE 2016-01-02 Y LA FECHA DE 2016-01-01 ACTIVA POR UN DIA. HAY QUE VALIDAR. CORRE EL PROCESO Y VALIDA ESA FECHA.