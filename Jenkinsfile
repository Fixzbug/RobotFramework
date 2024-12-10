// import jenkins.model.Jenkins
@NonCPS
def resetJobBuilds(String jobName) {
    // ดึงข้อมูล Job
    def job = Jenkins.instance.getItem(jobName)

    if (job == null) {
        println "Job '${jobName}' not found!"
        return
    }

    // ลบเฉพาะบิลด์ที่เสร็จสิ้นแล้ว
    println "Deleting completed builds for job: ${jobName}"
    job.getBuilds().each { build ->
        if (!build.isBuilding()) { // ตรวจสอบว่าไม่ได้กำลังรันอยู่
            try {
                println "Deleting build #${build.number} (Status: ${build.result})"
                build.delete()
            } catch (Exception e) {
                println "Error deleting build #${build.number}: ${e.message}"
            }
        } else {
            println "Skipping build #${build.number} (Currently running)"
        }
    }

    // รีเซ็ตหมายเลขบิลด์ถัดไปเป็น 1
    println "Resetting the next build number for job: ${jobName}"
    try {
        job.nextBuildNumber = 1
        job.save()
        println "Successfully reset the next build number for job: ${jobName}"
    } catch (Exception e) {
        println "Error resetting build number: ${e.message}"
    }
}

def setPropertys() {
    System.setProperty('hudson.model.DirectoryBrowserSupport.CSP', 
    "sandbox allow-scripts; default-src 'none'; 
    img-src 'self' data: ;
    style-src 'self' 'unsafe-inline' data: ; 
    script-src 'self' 'unsafe-inline' 'unsafe-eval' ;")
}

def convertpath(String files) {
    // Load the data file
    def dataFile = load files

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

def logoutput(){

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
        otherFiles          : '*.png,*.jpg'
    ])
}

pipeline {
    agent {
        node {
            label 'built-in'
        }
    }

    environment {
        INITIAL_BATFILE_PATH = 'C:/ProgramData/Jenkins/.jenkins/workspace/Automate/'
        INITIAL_LIBRARY_PATH = 'C:/ProgramData/Jenkins/.jenkins/workspace/Automate/Resources/Library/'
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
                    bat label: 'Check chrome version', script: """
                        echo Running file: AutoupdateChrome.py
                        cd ${env.INITIAL_LIBRARY_PATH}
                        python AutoupdateChrome.py
                    """
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

        stage('Convert Parameter') {
            steps {
                script {
                   convertpath('jenkinsdata')
                }
            }
        }
        stage('RUN E2E') {
            steps {
                catchError(buildResult: 'FAILURE', stageResult: 'FAILURE') {
                    bat label: 'RUN E2E', script: """
                        echo Running batch file ${env.CONVERT_TAG} ${env.INITIAL_RESULT_PATH}${env.CONVERT_RESULT_PATH} ${env.INITIAL_BATFILE_PATH}${env.CONVERT_ROBOT_PATH}
                        call jenkins_batfile.bat ${env.CONVERT_TAG} ${env.INITIAL_RESULT_PATH}${env.CONVERT_RESULT_PATH} ${env.INITIAL_BATFILE_PATH}${env.CONVERT_ROBOT_PATH}
                    """
                }
            }
        }

        stage('Run Groovy Script') {
            steps {
                script {
                    setPropertys()
                    // resetJobBuilds("Automate")
                }
            }
        }
    }
    post {
        always {
            script {
               logoutput()
            }
        }
    }
}
