import json

def parse_json_file(file_path):
    try:
        with open(file_path, 'r', encoding='utf-8') as file:
            data = json.load(file)
        print(data)
        return data
    except FileNotFoundError:
        print(f"Error: The file at {file_path} was not found.")
        return None
    except json.JSONDecodeError as e:
        print(f"Error decoding JSON: {e}")
        return None
    except UnicodeDecodeError as e:
        print(f"Error decoding file with UTF-8 encoding: {e}")
        # Optionally, handle different encodings here
        return None
    except Exception as e:
        print(f"An unexpected error occurred: {e}")
        return None


def json_to_dict(json_str):
    try:
        # Convert JSON string to dictionary
        data_dict = json.loads(json_str)
        return data_dict
    except json.JSONDecodeError as e:
        print("Error decoding JSON:", e)
        return None

def dict_to_json(data_dict):
    try:
        # Convert dictionary to JSON string
        json_str = json.dumps(data_dict)
        return json_str
    except Exception as e:
        print("Error converting dictionary to JSON:", e)
        return None
    
def main():
    parse_json_file("D:/automate/Excel_sync_robot_file/database.json")

if __name__== "__main__" :
    main()
