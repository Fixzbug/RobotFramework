pipeline {
    agent {
        label 'Automate-Test'
    }
    stages {
        // stage('Map_DriveL') {
        //     steps {
        //         catchError(buildResult: 'FAILURE', stageResult: 'FAILURE') {
        //             echo "Running batch file in MapDriveLUat..."
        //             bat label: '', script: '''
        //                 echo Running batch file: MapDriveLUat.bat
        //                 call D:\\MapDriveLUat.bat
        //             '''
        //         }
        //     }
        // }
        stage('E2E_01') {
            steps {
                catchError(buildResult: 'FAILURE', stageResult: 'FAILURE') {
                    bat label: '', script: '''
                        echo Running batch file: TC_SIT.bat
                        call D:\\Automate\\RobotFramework\\Testcase\\SIT\\bat_file\\TC_login.robot
                    '''
                }
            }
        }
    }
    post {
        always {
            script {
                // Execute the external batch script and capture its output
                def scriptOutput = bat(script: 'findoutput.bat', returnStdout: true).trim()
                echo "Output from external script: ${scriptOutput}"
                
                // Determine the length of the script output
                def outputLength = scriptOutput.length()
                
                // Calculate the start index for the substring to remove the last 10 digits
                def startIndex = outputLength - 16
                
                // Extract the substring to remove the last 10 digits
                def trimmedName = scriptOutput.substring(startIndex)
                echo "Trimmed variable name: ${trimmedName}"
                
                // Define variables for file names based on scriptOutput
                def outputFileName = "output${trimmedName}.xml"
                def reportFileName = "report${trimmedName}.html"
                def logFileName = "log${trimmedName}.html"
                
                // Publish Robot results with dynamic file names
                step([
                    $class              : 'RobotPublisher',
                    outputPath          : 'D:/Automate/RobotFramework/Results/TC_login',
                    outputFileName      : outputFileName,
                    reportFileName      : reportFileName,
                    logFileName         : logFileName,
                    disableArchiveOutput: true,
                    otherFiles          : "*.png,*.jpg"
                ])
            }
        }
    }
}