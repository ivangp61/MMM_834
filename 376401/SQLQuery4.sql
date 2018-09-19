use QNXTHub
go

select * 
from stg.MemberWorkingList

select * 
from stg.MemberHeader

select * 
from trn.TransactionException

--insert into stg.MemberWorkingList values(newid(), 28378);
--insert into stg.MemberWorkingList values(newid(), 147903);
--insert into stg.MemberWorkingList values(newid(), 486144);
--insert into stg.MemberWorkingList values(newid(), 697057);

SELECT *
FROM stg.MemberPcp
;

select * 
from EnterpriseHub.xref.member
where ExternalValue = '010001203'
;

SELECT EL.ExecutionStatus
FROM EnterpriseManagement.dbo.ExecutionLog EL
;


SELECT *
FROM tgt.MemberBenefitPlan

--delete from EnterpriseManagement.dbo.ExecutionLog WHERE ExecutionStatus = 'EXECUTING' 

	USE EnterpriseManagement;

		DELETE
		FROM DBO.ExecutionAuditHdr
		WHERE ExecutionLogID IN (
					SELECT DISTINCT EL.ExecutionLogID
					FROM DBO.ExecutionLog EL
					WHERE 1 = 1 
						--AND EL.JobId = 100507
						AND CONVERT(DATE, EL.ProcessStart) >= CONVERT(DATE, '2017-03-06')
			  )
		;

		DELETE
		FROM DBO.ExecutionDetail
		WHERE ExecutionLogID IN (
					SELECT DISTINCT EL.ExecutionLogID
					FROM DBO.ExecutionLog EL
					WHERE 1 = 1 
						--AND EL.JobId = 100507
						AND CONVERT(DATE, EL.ProcessStart) >= CONVERT(DATE, '2017-03-06')
			  )
		;


		DELETE
		FROM DBO.ExecutionLog
		WHERE 1 = 1 
						--AND JobId = 100507
			AND CONVERT(DATE, ProcessStart) >= CONVERT(DATE, '2017-03-06')
		;



		--MMMHC_MEM_QNXT_EHub_CreateFile.MMM

		--100505: 'MMMHC_MEM_QNXT_EHub_ExtrEHubMember.MMM'

		DELETE
		FROM DBO.ExecutionAuditHdr
		WHERE ExecutionLogID IN (
					SELECT DISTINCT EL.ExecutionLogID
					FROM DBO.ExecutionLog EL
					WHERE 1 = 1 
						--AND EL.JobId = 100505
						AND CONVERT(DATE, EL.ProcessStart) >= CONVERT(DATE, '2017-03-06')
			  )
		;

		DELETE
		FROM DBO.ExecutionDetail
		WHERE ExecutionLogID IN (
					SELECT DISTINCT EL.ExecutionLogID
					FROM DBO.ExecutionLog EL
					WHERE 1 = 1 
						--AND EL.JobId = 100505
						AND CONVERT(DATE, EL.ProcessStart) >= CONVERT(DATE, '2017-03-06')
			  )
		;


		DELETE
		FROM DBO.ExecutionLog
		WHERE 1 = 1 
						--AND JobId = 100505
			AND CONVERT(DATE, ProcessStart) >= CONVERT(DATE, '2017-03-06')
		;



