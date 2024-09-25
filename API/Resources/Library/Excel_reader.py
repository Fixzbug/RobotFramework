import openpyxl
import pandas
import json
import pandas as pd

def Read_Excel_Sheet(filepath, sheet_name):
    excel_data_df = pd.read_excel(open(filepath,'rb'), sheet_name=sheet_name)

    # Apply the strip method to each cell to remove leading and trailing spaces
    excel_data_df = excel_data_df.apply(lambda col: col.map(lambda x: x.strip() if isinstance(x, str) else x))
    
    # Convert the cleaned DataFrame to JSON
    json_str = excel_data_df.to_json(orient='records')
    json_obj = json.loads(json_str)
    
    # Counting rows
    row_count = len(excel_data_df.index)
    # Counting columns
    column_count = len(excel_data_df.columns)
    print("Data:",json_obj,"ROW:", row_count,"COL:",column_count)
    
    return json_obj

def Read_Excel_Sheet_Count(filepath, sheet_name):
    excel_data_df = pd.read_excel(filepath, sheet_name=sheet_name)
    json_str = excel_data_df.to_json(orient='records')
    json_obj = json.loads(json_str)
    # Counting rows
    row_count = len(excel_data_df.index)
    # Counting columns
    column_count = len(excel_data_df.columns)
    print("Data:",json_obj,"ROW:", row_count,"COL:",column_count)
    return json_obj, row_count, column_count

def Read_Excel_Config_From_Path(filepath):
    sheet_name="Config"
    excel_data_df = pandas.read_excel(open(filepath,'rb'), sheet_name=sheet_name)
    json_str = excel_data_df.to_json(orient='records')
    json_obj = json.loads(json_str)
    row_count = len(excel_data_df.index)  # Counting rows
    return json_obj


if __name__== "__main__" :
    Read_Excel_Sheet("D:/automate/Excel_sync_robot_file/RL_DATA_FILE.xlsx","DATA")
