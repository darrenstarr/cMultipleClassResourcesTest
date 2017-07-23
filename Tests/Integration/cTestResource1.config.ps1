Configuration cTestResource1_config {
    param(
        [string[]]$ComputerName="localhost"
    )
    
    Import-DscResource -ModuleName cMultipleClassResourcesTest

    node $ComputerName {
        LocalConfigurationManager
        {
            DebugMode = 'None'
        }

        cTestResource1 BasicTest1 {
            Name = 'Bob'
        }

        cTestResource2 BasicTest2 {
            Name = 'Kevin'
        }
    }
}
