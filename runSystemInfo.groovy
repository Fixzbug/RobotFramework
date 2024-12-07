import hudson.util.RemotingDiagnostics
import jenkins.model.Jenkins

String groovy_script = '''
// Check the operating system
if (System.getProperty("os.name").toLowerCase().contains("win")) {
    println "Running on Windows"
    // Run Windows-specific command
    println "systeminfo".execute().text
} else {
    println "Running on Unix-like OS"
    // Run Unix-like system command (e.g., 'uname -a' for Linux/macOS)
    println "uname -a".execute().text
}
'''.trim()

// Reference the built-in (master) node
def masterNode = Jenkins.instance // Built-in node is the Jenkins instance itself
def result = RemotingDiagnostics.executeGroovy(groovy_script, masterNode.channel)

println result

// C:\\Program Files\\Jenkins\\groovy_scripts\\runSystemInfo.groovy