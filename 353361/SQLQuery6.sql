SELECT comm2.MemberRecId
      ,comm2.CommTypeMRefId
      ,comm2.CommDetailRecId
      ,dtl1.CommValue
  FROM
       ( 
         SELECT comm.MemberRecId
               ,MAX( comm.CommDetailRecId )'CommDetailRecId'
           FROM
                dbo.MemberCommunication comm
                JOIN dbo.MemberCommunicationDetail dtl
                     ON dtl.CommDetailRecId = comm.CommDetailRecId
           WHERE 1 = 1
             AND comm.CommTypeMRefId = 7
           GROUP BY comm.MemberRecId )comm1
       JOIN dbo.MemberCommunication comm2
            ON comm2.MemberRecId = comm1.MemberRecId
           AND comm2.CommDetailRecId = comm1.CommDetailRecId
       JOIN dbo.MemberCommunicationDetail dtl1
            ON dtl1.CommDetailRecId = comm1.CommDetailRecId
  WHERE 1 = 1
    AND comm2.CommTypeMRefId = 7