import psutil

def kill_excel_processes():
    # Iterate over all running processes
    for proc in psutil.process_iter(['pid', 'name']):
        # Check if the process name is 'EXCEL.EXE'
        if proc.info['name'] == 'EXCEL.EXE':
            try:
                # Terminate the process
                proc.terminate()
                print(f"Terminated process {proc.info['name']} with PID {proc.info['pid']}")
            except (psutil.NoSuchProcess, psutil.AccessDenied, psutil.ZombieProcess):
                pass

if __name__ == "__main__":
    kill_excel_processes()
