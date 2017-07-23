# Test repository for using class based resources
This repository demonstrates a minimized case of problems I've been having with class based resources in Powershell.

## The first problem to work through
As of some point this morning, when I run [cTestResource1.Integration.Tests.ps1]() I am presented with the following output :

```
Already up-to-date.
WARNING: There is no operation running currently. Stop will return without any action.

Describing cTestResource1_Integration - Ensure is set to Enabled

  Context InitialTest
System.Collections.Hashtable
cTestResource1_Config
VERBOSE: Perform operation 'Invoke CimMethod' with following parameters, ''methodName' = SendConfigurationApply,'className' = MSFT_DSCLocalConfigurationManager,'namespaceName' = root/Microsoft/Windows/DesiredStateConfiguration'.
VERBOSE: An LCM method call arrived from computer DESKTOP-DFNN1UM with user sid S-1-5-21-1411698690-687353840-2363859020-1001.
VERBOSE: [DESKTOP-DFNN1UM]: LCM:  [ Start  Set      ]
VERBOSE: [DESKTOP-DFNN1UM]: LCM:  [ Start  Resource ]  [[cTestResource1]BasicTest1]
VERBOSE: [DESKTOP-DFNN1UM]: LCM:  [ Start  Test     ]  [[cTestResource1]BasicTest1]
VERBOSE: [DESKTOP-DFNN1UM]: LCM:  [ End    Test     ]  [[cTestResource1]BasicTest1]  in 0.1480 seconds.
Could not find the generate schema file C:\WINDOWS\system32\config\systemprofile\AppData\Local\dsc\cTestResource1.1.0.cTestResource1.schema.mof.
    + CategoryInfo          : InvalidData: (:) [], CimException
    + FullyQualifiedErrorId : ProviderSchemaNotFound
    + PSComputerName        : localhost
 
VERBOSE: [DESKTOP-DFNN1UM]: LCM:  [ Start  Resource ]  [[cTestResource2]BasicTest2]
VERBOSE: [DESKTOP-DFNN1UM]: LCM:  [ Start  Test     ]  [[cTestResource2]BasicTest2]
VERBOSE: [DESKTOP-DFNN1UM]: LCM:  [ End    Test     ]  [[cTestResource2]BasicTest2]  in 0.0030 seconds.
Could not find the generate schema file C:\WINDOWS\system32\config\systemprofile\AppData\Local\dsc\cTestResource2.1.0.cTestResource2.schema.mof.
    + CategoryInfo          : InvalidData: (:) [], CimException
    + FullyQualifiedErrorId : ProviderSchemaNotFound
    + PSComputerName        : localhost
 
VERBOSE: [DESKTOP-DFNN1UM]: LCM:  [ End    Set      ]
The SendConfigurationApply function did not succeed.
    + CategoryInfo          : ObjectNotFound: (root/Microsoft/...gurationManager:String) [], CimException
    + FullyQualifiedErrorId : MI RESULT 6
    + PSComputerName        : localhost
 
VERBOSE: Operation 'Invoke CimMethod' complete.
VERBOSE: Time taken for configuration job to complete is 0.436 seconds
    [+] Should compile and apply the MOF without throwing 694ms
VERBOSE: An LCM method call arrived from computer DESKTOP-DFNN1UM with user sid S-1-5-21-1411698690-687353840-2363859020-1001.
WARNING: [DESKTOP-DFNN1UM]:                            [] The GET operation will be carried against a pending configuration since the latest configuration has not converged yet.
VERBOSE: [DESKTOP-DFNN1UM]: LCM:  [ Start  Get      ]      
    [-] Should be able to call Get-DscConfiguration without throwing 367ms
      Expected: the expression not to throw an exception. Message was {Could not find the generate schema file C:\WINDOWS\system32\config\systemprofile\AppData\Local\dsc\cTestResource1.1.0.cTestResource1.schema.mof.}
          from C:\Development\cMultipleClassResourcesTest\Tests\Integration\cTestResource1.Integration.Tests.ps1:65 char:19
          + ...             { Get-DscConfiguration -Verbose -ErrorAction Stop } | Sho ...
          +                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      at <ScriptBlock>, C:\Development\cMultipleClassResourcesTest\Tests\Integration\cTestResource1.Integration.Tests.ps1: line 65
      65:                 { Get-DscConfiguration -Verbose -ErrorAction Stop } | Should Not Throw
```

### Error messages for this problem
* Could not find the generate schema file C:\WINDOWS\system32\config\systemprofile\AppData\Local\dsc\cTestResource1.1.0.cTestResource1.schema.mof
* Could not find the generate schema file C:\WINDOWS\system32\config\systemprofile\AppData\Local\dsc\cTestResource2.1.0.cTestResource2.schema.mof

When I open the path C:\Windows\System32\config\systemprofile\AppData\Local\dsc I see the two files :
* cMultipleClassResourcesTest.1.0.cTestResource1.schema.mof
* cMultipleClassResourcesTest.1.0.cTestResource2.schema.mof

When I open the MOF file generated for localhost.mof on the system, all the objects (in abbreviate form) are :

``` 
instance of BasicTest1 as $cTestResource1Ref {
    Module = "cMultipleClassResourcesTest"
}
instance of BasicTest2 as $cTestResource2Ref {
    Module = "cMultipleClassResourcesTest"
}
```

### Thoughts?
I experimented a little this morning with the DSC local configuration manager debug mode to try and force reload modules. I have tried changing this back and have had no positive results.

