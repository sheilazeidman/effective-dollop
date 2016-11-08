-- HELLO
SELECT 
A.gpTotalWeightedScaleScoreId,
G.gpStagingReportEntryId,
A.weightedScore AS [1year],
G.totalWeightedScore AS [2year],
A.lockDate,
A.gpEntryId,
B.gp_id,
G.currentgpid,
B.owner_id,
C.person_sso_id,
D.first_name,
D.last_name,
D.active_account,
F.site_name
  FROM [AFPlatinumTest].[dbo].[GpTotalWeightedScaleScore] A
  RIGHT JOIN [AFPlatinumTest].[dbo].[Gp_Entry] B ON A.gpEntryId = B.gp_entry_id
  INNER JOIN [AFPlatinumTest].[dbo].[person_sso] C ON B.owner_id = C.person_id
  INNER JOIN [AFPlatinumTest].[dbo].[person] D ON B.owner_id = D.person_id
  INNER JOIN [AFPlatinumTest].[dbo].[user_sites] E ON B.owner_id = E.person_id
  INNER JOIN [AFPlatinumTest].[dbo].[site] F ON E.site_id = F.site_id
  INNER JOIN [AFPlatinumTest].[dbo].[GpStagingReportEntry] G ON B.owner_id = G.ownerId
  WHERE G.currentGpId = 21 AND B.gp_id = 21 --AND B. owner_id = 13630
  ORDER BY A.gpTotalWeightedScaleScoreId