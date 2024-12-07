pipeline {

    agent {
        node {
            label 'built-in'
        }
    }

    environment {
        INITIAL_BATFILE_PATH = 'C:/ProgramData/Jenkins/.jenkins/workspace/Automate/'
        INITIAL_RESULT_PATH = 'C:\\ProgramData\\Jenkins\\.jenkins\\workspace\\Result\\Automate\\'
    }

    stages {

        stage('Check Python version') {
            steps {
                catchError(buildResult: 'FAILURE', stageResult: 'FAILURE') {
                    bat label: 'Check Python version', script: '''
                        python --version
                       
                    '''
                }
            }
        }

        stage('Check chrome version') {
            steps {
                catchError(buildResult: 'FAILURE', stageResult: 'FAILURE') {
                    bat label: 'Check chrome version', script: '''
                        echo Running file: AutoupdateChrome.py
                        call C:\\ProgramData\\Jenkins\\.jenkins\\workspace\\Automate\\Resources\\AutoupdateChrome.py
                    '''
                }
            }
        }

        //  stage('Check pip list version') {
        //     steps {
        //         catchError(buildResult: 'FAILURE', stageResult: 'FAILURE') {
        //             bat label: 'Check pip version', script: '''
        //                 pip list
        //             '''
        //         }
        //     }
        // }
        
        // stage('Check pip install requirements') {
        //     steps {
        //         catchError(buildResult: 'FAILURE', stageResult: 'FAILURE') {
        //             bat label: 'Install Requirements', script: '''
        //                 pip install -r requirements.txt
        //             '''
        //         }
        //     }
        // }

        // stage('Run Groovy Script') {
        //     steps {
        //         script {

        //             MAX_BUILDS = 5

        //             // Loop over all jobs in Jenkins
        //             for (job in Jenkins.instance.items) {
        //                 println "Job: ${job.name}"

        //                 // Get the list of builds (you may want to sort by build number or date)
        //                 def builds = job.builds.reverse()  // Reverse to get the latest builds first

        //                 // Keep only the most recent 'MAX_BUILDS' builds
        //                 def buildsToDelete = builds.drop(MAX_BUILDS)  // Drop the first 'MAX_BUILDS' items

        //                 // Loop over builds that should be deleted
        //                 for (build in buildsToDelete) {
        //                     println "Preparing to delete build: ${build.number}"
        //                     // Uncomment the next line to delete the build
        //                     // build.delete()
        //                 }
        //             }
        //         }
        //     }
        // }

        stage('Convert Parameter') {
            steps {
                script {
                    // Load the data file
                    def dataFile = load 'jenkinsdata'

                    // Use the parameter as the key
                    def keyToRetrieve = params.BATFILE_NAME

                    // Retrieve the data
                    def convertData = dataFile.getData(keyToRetrieve)

                    // Check if the data was found
                    if (convertData == null) {
                        // Handle missing key
                        echo "Warning: No data found for key '${keyToRetrieve}'"
                        // Optionally set default values here or decide how to handle this case
                        env.CONVERT_TAG = 'DEFAULT_TAG'
                        env.CONVERT_RESULT_PATH = 'DEFAULT_RESULT_PATH'
                        env.CONVERT_ROBOT_PATH = 'DEFAULT_ROBOT_PATH'
                    } else {
                        // Check if the data is valid
                        if (convertData instanceof String) {
                            error "Data retrieval failed: ${convertData}"
                        }
                        // Set environment variables
                        env.CONVERT_TAG = convertData.tag
                        env.CONVERT_RESULT_PATH = convertData.resultpath
                        env.CONVERT_ROBOT_PATH = convertData.robotpath
                        // Output the results
                        echo "Converted result path: ${env.CONVERT_TAG}"
                        echo "Converted result path: ${env.CONVERT_RESULT_PATH}"
                        echo "Converted result path: ${env.CONVERT_ROBOT_PATH}"
                    }
                }
            }
        }
        stage('RUN E2E') {
            steps {
                catchError(buildResult: 'FAILURE', stageResult: 'FAILURE') {
                    bat label: '', script: """
                        echo Running batch file ${env.CONVERT_TAG} ${env.INITIAL_RESULT_PATH}${env.CONVERT_RESULT_PATH} ${env.INITIAL_BATFILE_PATH}${env.CONVERT_ROBOT_PATH}
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

