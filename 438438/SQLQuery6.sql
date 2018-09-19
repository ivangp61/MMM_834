Use QNXTHub;


Select *
From stg.MemberPcp P
Where p.DIHMemberRecId = 24562
Order By EffDate Desc, TermDate
;


Select *
From tgt.MemberPcp MP
Where MP.DIHMemberRecId In(748871,712970,736371,713138,24562,20185,747056,738337,10426,10037)
Order By MP.DIHMemberRecId Desc
;

