select M.MemberRecId, isnull(mbi.ExternalValue, hic.ExternalValue) AS ExternalValue
from dbo.membercompany m
left outer join xref.Member mbi on m.memberrecid = mbi.memberrecid and mbi.ExternalTypeMRefId = 11
left outer join xref.member hic on m.memberrecid = hic.memberrecid and hic.ExternalTypeMRefId = 12
