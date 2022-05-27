Expand-Archive -LiteralPath c:\windows\temp\gpo.zip -DestinationPath c:\windows\temp
import-gpo -backupgponame "Default Domain Policy" -TargetName "Default Domain Policy" -path c:\windows\temp