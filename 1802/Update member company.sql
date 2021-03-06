update  [EnterpriseHub].[dbo].[MemberBenefitPackage] set companyMrefID = 1
  where 
  BenefitPkgMRefId = 243
  and MemberRecId in
  (241576,
	207188,
	227918,
	708145,
	236829,
	209578,
	707799,
	708146)

update dbo.MemberPCP set CompanyMRefId = 1
where  PCPRecId in 
	(23683267,
	23683268,
	23683117)

update xref.Member set CompanyMRefId = 1
where  MemberXRefId in 
	(27610003,
	27601199,
	27601200)

update  dbo.MemberIndicator set CompanyMRefId = 1
where IndicatorRecId in 
	(373789407,
	373791240,
	373794459,
	373794536,
	373792535,
	373809792,
	373809793,
	373810928,
	373810927,
	373810930,
	373804369,
	373804370,
	373803234,
	373803233,
	373803235,
	373804371,
	373803236)

Update dbo.MemberCompany set CompanyMRefId = 1
where MemberCompanyRecId in 
	(706633,
	706667,
	706729)

update dbo.MemberEnrollmentStatus set CompanyMRefId = 1
where MemberStatusRecId in 
	(126538670,
	126539057,
	126539853)

update dbo.MemberContact set CompanyMRefId = 1
where ContactRecId in 
	(1314456,
	1313643,
	1313642,
	1314455,
	1314454,
	1313641,
	1059888,
	1060599,
	1060598)

Update dbo.MemberCMSFiles set CompanyMRefId = 1
where MemberCMSFilesRecId in 
	(8190,
	12249,
	18677,
	4086)

Update dbo.MemberCommunication set CompanyMRefId = 1
where CommRecId in
	(1109357,
	1110114)

update dbo.MemberAddress set CompanyMRefId = 1
 where AddrRecId in (
	1448912,
	1449574,
	1449576,
	1448914,
	1449577,
	1448915)