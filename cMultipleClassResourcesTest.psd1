@{

RootModule = '.\cMultipleClassResourcesTest.psm1'

DscResourcesToExport = @(
        'cTestResource1',
        'cTestResource2'
    )

# Version number of this module.
ModuleVersion = '1.0.0'

# ID used to uniquely identify this module
GUID = 'b26a99ab-c3a4-4910-9a70-dd6a30ba3cb4'

# Description of the functionality provided by this module
Description = 'DSC Resources to test class resources'

# Minimum version of the Windows PowerShell engine required by this module
PowerShellVersion = '5.0'

} 
