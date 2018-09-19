								SELECT M.MemberRecId
								FROM MemberCompany M
									INNER JOIN Xref.Member XM
									ON M.MemberRecId = XM.MemberRecId AND M.CompanyMRefId = XM.CompanyMRefId
									INNER JOIN mref.ExternalType ET
									ON XM.ExternalTypeMRefId = ET.ExternalTypeMRefId AND ET.Code = 'AVETA'--ET.Code = 'MP'--
								WHERE 1 = 1
									AND xm.ExternalValue IN('010013318')