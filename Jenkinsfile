pipeline {
    agent {
        label 'Automate-Test'
    }
    environment {
        INITIAL_BATFILE_PATH = 'C:/ProgramData/Jenkins/.jenkins/workspace/Automate/'
        INITIAL_RESULT_PATH = 'D:\\ProgramData\\Jenkins\\.jenkins\\workspace\\Automate\\Result\\'
    }
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
        stage('Convert Parameter') {
            steps {
                script {
                    // Load the data file
                    def dataFile = load 'jenkinsdata'

                    // Use the parameter as the key
                    def keyToRetrieve = params.BATFILE_NAME
                    
                    // Retrieve the data
                    def convertData = dataFile.getData(keyToRetrieve)

                    // Check if the data is valid
                    if (convertData instanceof String) {
                        error "Data retrieval failed: ${convertData}"
                    }
                    // Set environment variables
                    env.CONVERT_TAG = convertData.tag
                    env.CONVERT_RESULT_PATH = convertData.resultpath
                    env.CONVERT_ROBOT_PATH = convertData.robotpath
                    // Output the results
                    echo "Converted result path: ${env.CONVERT_RESULT_PATH}"

                }
            }
        }
        stage('E2E') {
            steps {
                catchError(buildResult: 'FAILURE', stageResult: 'FAILURE') {
                    bat label: '', script: """
                        echo Running batch file
                        call jenkins_batfile.bat ${env.CONVERT_TAG} ${env.INITIAL_RESULT_PATH}${env.CONVERT_RESULT_PATH} ${env.INITIAL_BATFILE_PATH}${env.CONVERT_ROBOT_PATH}
                    """
                }
            }
        }
    }
    post {
        always {
            script {
                def scriptOutput = bat(script: "findoutput.bat ${env.INITIAL_RESULT_PATH}${env.CONVERT_RESULT_PATH}", returnStdout: true).trim()
                echo "Output from external script: ${scriptOutput}"
                
                def outputLength = scriptOutput.length()
                def startIndex = outputLength - 16
                def trimmedName = scriptOutput.substring(startIndex)
                echo "Trimmed variable name: ${trimmedName}"
                
                def outputFileName = "output${trimmedName}.xml"
                def reportFileName = "report${trimmedName}.html"
                def logFileName = "log${trimmedName}.html"

                // Publish Robot results with dynamic file names
                step([
                    $class              : 'RobotPublisher',
                    outputPath          : "${env.INITIAL_RESULT_PATH}${env.CONVERT_RESULT_PATH}",
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