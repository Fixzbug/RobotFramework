pipeline {
    agent any
    stages {
        stage('Check Python and Robot Framework') {
            steps {
                catchError(buildResult: 'FAILURE', stageResult: 'FAILURE') {
                    bat label: '', script: '''
                        python --version
                    '''
                }
            }
        } 
        // stage('Check Python') {
        //     steps {
        //         bat 'echo %PATH%'
        //         bat 'python --version'
        //     }
        // }
        // stage('Robot Framework') {
        //     steps {
        //         bat 'echo %PATH%'
        //         bat 'robot --version'
        //     }
        // }
        stage('E2E') {
            steps {
                catchError(buildResult: 'FAILURE', stageResult: 'FAILURE') {
                    bat label: '', script: '''
                        echo Running batch file: TC_login.bat
                        call D:\\RobotFramework\\bat_file\\TC_login.bat
                    '''
                }
            }
        }
    }
    // post {
    //     always {
    //         script {
    //             // Execute the external batch script and capture its output
    //             def scriptOutput = bat(script: 'findoutput.bat', returnStdout: true).trim()
    //             echo "Output from external script: ${scriptOutput}"
                
    //             // Determine the length of the script output
    //             def outputLength = scriptOutput.length()
                
    //             // Calculate the start index for the substring to remove the last 10 digits
    //             def startIndex = outputLength - 16
                
    //             // Extract the substring to remove the last 10 digits
    //             def trimmedName = scriptOutput.substring(startIndex)
    //             echo "Trimmed variable name: ${trimmedName}"
                
    //             // Define variables for file names based on scriptOutput
    //             def outputFileName = "output${trimmedName}.xml"
    //             def reportFileName = "report${trimmedName}.html"
    //             def logFileName = "log${trimmedName}.html"
                
    //             // Publish Robot results with dynamic file names
    //             step([
    //                 $class              : 'RobotPublisher',
    //                 outputPath          : 'D:/RobotFramework/Results/TC_login',
    //                 outputFileName      : outputFileName,
    //                 reportFileName      : reportFileName,
    //                 logFileName         : logFileName,
    //                 disableArchiveOutput: true,
    //                 otherFiles          : "*.png,*.jpg"
    //             ])
    //         }
    //     }
    // }
}